import { ColorConstants, DarkColor, LightColor } from '../common/constants/ColorConstants'
import { preferencesUtils } from '../common/model/preferencesUtils'
import { baseData } from '../common/constants/CommonConstants'
import { weightToValue, valueToWeight } from '../common/model/Weight_Value_Utils'

let mPreferences: preferencesUtils = new preferencesUtils()

@Entry
@Component
struct Utils {
  @State VISIBILITY: Visibility = Visibility.None
  private scrollController: Scroller = new Scroller();
  @State IS_ON: boolean = baseData.getIsDark()
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight());
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State TEST_FONT_SIZE: number = baseData.getFontSize()
  @State TEST_FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight())

  @Builder mNavigationMenu() {
    Row() {
      Button({ type: ButtonType.Normal }) {
        Text('保存')
          .fontColor(DarkColor.FONT_COLOR)
      }
      .visibility(this.VISIBILITY)
      .height('50%')
      .width('100%')
      .borderRadius(5)
      .onClick(() => {
        this.VISIBILITY = Visibility.None
        this.FONT_SIZE = this.TEST_FONT_SIZE
        this.FONT_WEIGHT = this.TEST_FONT_WEIGHT
        baseData.setFontSize(this.FONT_SIZE)
        baseData.setFontWeight(weightToValue(this.FONT_WEIGHT))
        mPreferences.putData('fontSize', this.FONT_SIZE)
        mPreferences.putData('fontWeight', weightToValue(this.FONT_WEIGHT))
      })
    }
    .height('10%')
    .width('100%')
  }

  @Builder mNavigationTitle(title: string) {
    Text(title).fontColor(this.FONT_COLOR)
  }

  @Builder mNavigation() {
    Navigation()
      .height('10%')
      .width('100%')
      .title(this.mNavigationTitle('通用'))
      .titleMode(NavigationTitleMode.Mini)
      .menus(this.mNavigationMenu())
      .hideBackButton(true)
  }

  @Builder pageMode() {
    Row() {
      Text('深色模式')
        .fontColor(this.FONT_COLOR)
        .fontSize(this.FONT_SIZE)
        .fontWeight(this.FONT_WEIGHT)
        .margin({ left: '5%' })
      Toggle({ type: ToggleType.Switch, isOn: this.IS_ON })
        .selectedColor('#ff0065ff')
        .switchPointColor('#FFFFFF')
        .onChange((isOn: boolean) => {
          this.IS_ON = isOn
          animateTo({ curve: Curve.Smooth, duration: 2000 }, () => {
            baseData.setBackgroundColor(isOn ? DarkColor.BACKGROUND_COLOR : LightColor.BACKGROUND_COLOR)
            baseData.setItemColor(this.IS_ON ? DarkColor.ITEM_COLOR : LightColor.ITEM_COLOR)
            baseData.setFontColor(this.IS_ON ? DarkColor.FONT_COLOR : LightColor.FONT_COLOR)
            baseData.setIsDark(this.IS_ON)
            this.BACKGROUND_COLOR = baseData.getBackgroundColor()
            this.ITEM_COLOR = baseData.getItemColor()
            this.FONT_COLOR = baseData.getFontColor()
            mPreferences.putData('isDark', isOn)
          })
        })
    }
    .height('7%')
    .width('100%')
    .borderRadius(10)
    .backgroundColor(this.ITEM_COLOR)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder fontSize() {
    Column() {
      Text('字体大小')
        .width('100%')
        .height('40%')
        .textAlign(TextAlign.Center)
        .fontColor(this.FONT_COLOR)
        .fontSize(this.FONT_SIZE)
        .fontWeight(this.FONT_WEIGHT)
      Text('这是一段测试文本')
        .margin({ right: '2%' })
        .fontSize(this.TEST_FONT_SIZE)
        .height('10%')
        .fontColor(this.FONT_COLOR)
      Row() {
        Text('A').fontSize(14).margin({ right: '2%' }).fontColor(this.FONT_COLOR)
        Slider({
          min: 14,
          max: 20,
          step: 1,
          style: SliderStyle.InSet,
          value: this.FONT_SIZE
        })
          .width('80%')
          .height('100%')
          .showSteps(true)
          .onChange((value: number) => {
            this.TEST_FONT_SIZE = value
            this.VISIBILITY = Visibility.Visible
          })
        Text('A').fontSize(20).margin({ left: '2%' }).fontColor(this.FONT_COLOR)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('50%')
    }
    .width('100%')
    .height('30%')
    .backgroundColor(this.ITEM_COLOR)
    .borderRadius(10)
    .margin({
      top: '5%'
    })
  }

  @Builder fontWeight() {
    Column() {
      Text('字体粗细')
        .width('100%')
        .height('40%')
        .textAlign(TextAlign.Center)
        .fontColor(this.FONT_COLOR)
        .fontSize(this.FONT_SIZE)
        .fontWeight(this.FONT_WEIGHT)
      Text('这是一段测试文本')
        .margin({ right: '2%' })
        .fontWeight(this.TEST_FONT_WEIGHT)
        .fontSize(20)
        .height('10%')
        .fontColor(this.FONT_COLOR)
      Row() {
        Text('A').margin({ right: '2%' }).fontWeight(FontWeight.Lighter).fontSize(20).fontColor(this.FONT_COLOR)
        Slider({
          min: 1,
          max: 5,
          step: 1,
          style: SliderStyle.InSet,
          value: weightToValue(this.FONT_WEIGHT)
        })
          .width('80%')
          .height('100%')
          .showSteps(true)
          .onChange((value: number) => {
            if (value === 1) {
              this.TEST_FONT_WEIGHT = FontWeight.Lighter
            } else if (value === 2) {
              this.TEST_FONT_WEIGHT = FontWeight.Normal
            } else if (value === 3) {
              this.TEST_FONT_WEIGHT = FontWeight.Medium
            } else if (value === 4) {
              this.TEST_FONT_WEIGHT = FontWeight.Bold
            } else if (value === 5) {
              this.TEST_FONT_WEIGHT = FontWeight.Bolder
            }
            this.VISIBILITY = Visibility.Visible
          })
        Text('A').margin({ left: '2%' }).fontWeight(FontWeight.Bolder).fontSize(20).fontColor(this.FONT_COLOR)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('50%')
    }
    .width('100%')
    .height('30%')
    .backgroundColor(this.ITEM_COLOR)
    .borderRadius(10)
    .margin({
      top: '5%'
    })
  }

  @Builder clearSpace() {
    Button({ type: ButtonType.Normal }) {
      Row() {
        Text('空间清理')
          .margin({ left: '5%' })
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE)
          .fontWeight(this.FONT_WEIGHT)
        Image($rawfile('next.svg'))
          .fillColor(ColorConstants.BACKGROUND)
          .height('70%')
          .width('10%')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height('7%')
    .borderRadius(5)
    .backgroundColor(this.ITEM_COLOR)
    .margin({
      top: '5%'
    })
  }

  build() {
    Column() {
      this.mNavigation()
      Scroll(this.scrollController) {
        Column() {
          this.pageMode()
          this.fontSize()
          this.fontWeight()
          this.clearSpace()
        }
        .width('95%')
        .height('100%')
      }
      .width('100%')
      .height('90%')
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.BACKGROUND_COLOR)
  }

  onPageShow() {
    mPreferences.getData('isDark').then((data) => {
      this.IS_ON = data
      baseData.setItemColor(this.IS_ON ? DarkColor.ITEM_COLOR : LightColor.ITEM_COLOR)
      baseData.setFontColor(this.IS_ON ? DarkColor.FONT_COLOR : LightColor.FONT_COLOR)
    })
    mPreferences.getData('fontSize').then((data) => {
      this.FONT_SIZE = data
    })
    mPreferences.getData('fontWeight').then((data) => {
      this.FONT_WEIGHT = valueToWeight(data)
    })
  }
}

