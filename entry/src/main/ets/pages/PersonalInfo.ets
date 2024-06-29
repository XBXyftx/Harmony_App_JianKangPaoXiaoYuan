import { baseData } from '../common/constants/CommonConstants';
import { valueToWeight } from '../common/model/Weight_Value_Utils';
import promptAction from '@ohos.promptAction';
import { preferencesUtils } from '../common/model/preferencesUtils';
import router from '@ohos.router';

let mPreferences: preferencesUtils = new preferencesUtils()

@Entry
@Component
struct PersonalInfo {
  @State textValue: string = ''
  dialogController: CustomDialogController = new CustomDialogController({
    builder: InputTextDialog({
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      FONT_COLOR: $FONT_COLOR,
      FONT_SIZE: $FONT_SIZE,
      FONT_WEIGHT: $FONT_WEIGHT,
      ITEM_COLOR: $ITEM_COLOR,
      BACKGROUND_COLOR: $BACKGROUND_COLOR
    }),
    cancel: this.existApp,
    autoCancel: true,
    alignment: DialogAlignment.Default,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight())
  @State mItemUri: Array<user> = [
    new user('姓名', 'Harmony APP 开发者'),
    new user('性别', '男'),
    new user('手机号码', '14777771177'),
    new user('学校', '北京信息科技大学'),
    new user('学院', '计算机学院'),
    new user('专业', '软件工程'),
    new user('班级', '软工2102班'),
    new user('学号', '2021011111'),
    new user('个性签名', baseData.getSignature())
  ]

  @Builder mNavigationTitle(title: string) {
    Text(title).fontColor(this.FONT_COLOR)
  }

  @Builder mNavigation() {
    Navigation()
      .height('10%')
      .width('100%')
      .title(this.mNavigationTitle('账户资料'))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
  }

  @Builder mIcon() {
    Column() {
      Image($rawfile('Harmony.jpeg'))
        .width(100)
        .height(100)
        .clip(new Circle({ width: 100, height: 100 }))
    }
    .onClick(() => {
      promptAction.showToast({
        message: '头像暂不支持更换',
        duration: 2000
      })
    })
  }

  @Builder mItem(title: string, text: string) {
    RelativeContainer() {
      Text(title)
        .id('title')
        .fontSize(this.FONT_SIZE + 1)
        .fontColor(this.FONT_COLOR)
        .fontWeight(this.FONT_WEIGHT)
        .alignRules({
          left: { anchor: "__container__", align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .offset({
          x: '5%'
        })
      Text(text)
        .fontWeight(this.FONT_WEIGHT)
        .fontSize(this.FONT_SIZE)
        .fontColor(this.FONT_COLOR)
        .textAlign(TextAlign.End)
        .width('65%')
        .id('text')
        .alignRules({
          right: { anchor: "__container__", align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .offset({
          x: '-5%'
        })
    }
    .backgroundColor(this.ITEM_COLOR)
    .width('100%')
    .height('7%')
    .borderRadius(5)
    .onClick(() => {
      if (title === '个性签名') {
        this.dialogController.open()
      }
    })
  }

  @Builder selects() {
    Column() {
      ForEach(this.mItemUri, (item) => {
        this.mItem(item.title, item.text)
      })
    }
    .backgroundColor(this.ITEM_COLOR)
    .borderRadius(5)
    .width('95%')
    .margin({
      top: '10%'
    })
  }

  build() {
    Column() {
      this.mNavigation()
      Scroll() {
        Column() {
          this.mIcon()
          this.selects()
        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .height('90%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .backgroundColor(this.BACKGROUND_COLOR)
    .width('100%')
    .height('100%')
  }

  async onPageShow() {
    this.BACKGROUND_COLOR = baseData.getBackgroundColor()
    this.FONT_SIZE = baseData.getFontSize()
    this.FONT_COLOR = baseData.getFontColor()
    this.FONT_WEIGHT = valueToWeight(baseData.getFontWeight())
    this.ITEM_COLOR = baseData.getItemColor()
    this.textValue = baseData.getSignature()
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }

  aboutToDisappear() {
    delete this.dialogController,
    this.dialogController = undefined
  }
}

@CustomDialog
export struct InputTextDialog {
  @Link BACKGROUND_COLOR: string
  @Link ITEM_COLOR: string
  @Link FONT_COLOR: string
  @Link FONT_SIZE: string
  @Link FONT_WEIGHT: FontWeight
  @Link textValue: string
  inputValue: string
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text('个性签名')
        .fontSize(this.FONT_SIZE)
        .margin({ top: '5%', bottom: '5%' })
        .fontWeight(this.FONT_WEIGHT)
        .fontColor(this.FONT_COLOR)
      TextInput({ placeholder: '', text: this.textValue })
        .backgroundColor(this.ITEM_COLOR)
        .type(InputType.Normal)
        .height(60)
        .width('90%')
        .onChange((value: string) => {
          this.textValue = value
        })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .fontSize(this.FONT_SIZE)
          .fontWeight(this.FONT_WEIGHT)
          .fontColor(this.FONT_COLOR)
          .width('40%')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })
          .backgroundColor(this.BACKGROUND_COLOR)
        Button('确认')
          .fontSize(this.FONT_SIZE)
          .fontWeight(this.FONT_WEIGHT)
          .fontColor(this.FONT_COLOR)
          .width('40%')
          .onClick(() => {
            this.inputValue = this.textValue
            this.controller.close()
            this.confirm()
            mPreferences.putData('signature', this.textValue)
            baseData.setSignature(this.textValue)
            promptAction.showToast({
              message: '修改个性签名成功',
              duration: 2000
            })
            router.back()
          })
          .backgroundColor(this.BACKGROUND_COLOR)
      }
      .margin({
        top: '5%',
        bottom: '5%' })
    }
    .backgroundColor(this.BACKGROUND_COLOR)
  }
}

class user {
  private title: string
  private text: string

  constructor(title: string, text: string) {
    this.text = text
    this.title = title
  }

  setTitle(title: string) {
    this.title = title
  }

  getTitle(): string {
    return this.title
  }

  setText(text: string) {
    this.text = text
  }

  getText(): string {
    return this.text
  }
}