import { ColorConstants } from '../common/constants/ColorConstants'
import { CommonConstants, baseData } from '../common/constants/CommonConstants'
import router from '@ohos.router'
import { valueToWeight } from '../common/model/Weight_Value_Utils'
import { preferencesUtils } from '../common/model/preferencesUtils'

let mPreferences: preferencesUtils = new preferencesUtils()

@Entry
@Component
struct Setting {
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight())
  @State mItemUri: Array<Object> = [
    {
      text: '安全检测',
      uri: CommonConstants.PATH_SECURITY
    },
    {
      text: '通 用',
      uri: CommonConstants.PATH_UTILS
    },
    {
      text: '隐私政策',
      uri: CommonConstants.PATH_PRIVACY
    },
    {
      text: '关于我们',
      uri: CommonConstants.PATH_ABOUT
    },
    {
      text: '注销账号',
      uri: '5'
    }
  ]

  @Builder mNavigationTitle(title: string) {
    Text(title).fontColor(this.FONT_COLOR)
  }

  @Builder mNavigation() {
    Navigation()
      .height('10%')
      .width('100%')
      .title(this.mNavigationTitle('设置'))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
  }

  @Builder mY() {
    RelativeContainer() {
      Text('Harmony App 开发者')
        .fontColor(this.FONT_COLOR)
        .fontWeight(FontWeight.Bold)
        .fontSize(this.FONT_SIZE + 2)
        .id('message')
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .offset({
          x: '5%'
        })
      Image($rawfile('Harmony.jpeg'))
        .clip(new Circle({ width: '100%', height: '100%' }))
        .height('60%')
        .id('img')
        .alignRules({
          right: { anchor: '__container__', align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .offset({
          x: '-5%'
        })
    }
    .borderRadius(10)
    .height('15%')
    .backgroundColor(this.ITEM_COLOR)
    .width('95%')
    .margin({
      top: '10%'
    })
    .onClick(() => {
      router.pushUrl({
        url: CommonConstants.PATH_PERSONALINFO
      })
    })
  }

  @Builder mItem(text: string, uri: string) {

    RelativeContainer() {
      Text(text)
        .id('text')
        .fontSize(this.FONT_SIZE)
        .fontColor(this.FONT_COLOR)
        .fontWeight(this.FONT_WEIGHT)
        .alignRules({
          left: { anchor: "__container__", align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .offset({
          x: '5%'
        })
      Image($rawfile('next.svg'))
        .fillColor(ColorConstants.BACKGROUND)
        .height('50%')
        .width('10%')
        .id('img')
        .alignRules({
          right: { anchor: "__container__", align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
    }
    .backgroundColor(this.ITEM_COLOR)
    .width('100%')
    .height('20%')
    .borderRadius(5)
    .onClick(() => {
      router.pushUrl({
        url: uri
      })
    })
  }

  @Builder selects() {
    Column() {
      ForEach(this.mItemUri, (item) => {
        this.mItem(item.text, item.uri)
      })
    }
    .borderRadius(5)
    .width('95%')
    .height('40%')
    .backgroundColor(this.ITEM_COLOR)
    .margin({
      top: '10%'
    })
  }

  @Builder mButton() {
    Button() {
      Text('退出登录')
        .width('100%')
        .height('100%')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .fontColor(this.FONT_COLOR)
        .fontSize(this.FONT_SIZE + 1)
    }
    .width('95%')
    .height('7%')
    .type(ButtonType.Normal)
    .borderRadius(5)
    .backgroundColor(this.ITEM_COLOR)
    .margin({
      top: '15%'
    })
    .onClick(() => {
      mPreferences.putData('isLogin', false)
      router.pushUrl({
        url: CommonConstants.PATH_LOGIN
      })
    })
  }

  build() {
    Column() {
      this.mNavigation()
      Scroll() {
        Column() {
          this.mY()
          this.selects()
          this.mButton()
        }
        .width('100%')
        .height('100%')
      }
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .height('90%')
    }
    .backgroundColor(this.BACKGROUND_COLOR)
    .width('100%')
    .height('100%')
  }

  onPageShow() {
    this.BACKGROUND_COLOR = baseData.getBackgroundColor()
    this.FONT_SIZE = baseData.getFontSize()
    this.FONT_COLOR = baseData.getFontColor()
    this.FONT_WEIGHT = valueToWeight(baseData.getFontWeight())
    this.ITEM_COLOR = baseData.getItemColor()
  }
}