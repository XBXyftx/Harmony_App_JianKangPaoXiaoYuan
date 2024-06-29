import router from '@ohos.router';
import { ColorConstants } from '../common/constants/ColorConstants';
import { CommonConstants } from '../common/constants/CommonConstants';
import { preferencesUtils } from '../common/model/preferencesUtils'

let mPreferences: preferencesUtils = new preferencesUtils()

@Entry
@Component
struct Login {
  @State studentNum: string = ''
  @State passwd: string = ''
  @State studentNumTip: string = ''
  controller: TextInputController = new TextInputController()

  @Builder mInput() {
    Column({
      space: 20
    }) {
      TextInput({
        placeholder: $r('app.string.User'),
        controller: this.controller
      })
        .borderRadius(5)
        .backgroundColor(Color.White)
        .id('studentNum')
        .type(InputType.Number)
        .width('80%')
        .height('30%')
        .onChange((value: string) => {
          this.studentNum = value
        })

      TextInput({
        placeholder: $r('app.string.Password'),
        controller: this.controller })
        .borderRadius(5)
        .copyOption(CopyOptions.None)
        .backgroundColor(Color.White)
        .type(InputType.Password)
        .id("passwd")
        .maxLength(18)
        .width('80%')
        .height('30%')
    }
    .id('Inputs')
    .width('100%')
    .height('20%')
    .justifyContent(FlexAlign.Center)
    .alignRules({
      top: { anchor: "navigation", align: VerticalAlign.Bottom },
      middle: { anchor: "__container__", align: HorizontalAlign.Center }
    })
    .offset({
      y: "20%"
    })
  }

  @Builder mBut() {
    Row({
      space: 60
    }) {
      Text($r('app.string.Service'))
        .textAlign(TextAlign.Center)
        .fontColor(Color.Gray)
        .fontSize(15)
        .onClick(() => {
          router.pushUrl({ url: CommonConstants.PATH_HOME })
        })
      Text($r('app.string.ForgetPassword'))
        .textAlign(TextAlign.Center)
        .fontColor(Color.Gray)
        .fontSize(15)
    }
    .id('but')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .alignRules({
      top: { anchor: 'divider', align: VerticalAlign.Bottom }
    })
    .offset({
      y: '53%'
    })
  }

  build() {
    RelativeContainer() {
      Navigation()
        .title({ main: '登 录', sub: '' })
        .titleMode(NavigationTitleMode.Full)
        .height('10%')
        .id('navigation')
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top }
        })

      this.mInput()
      Button($r('app.string.Login_action'), {
        type: ButtonType.Normal
      })
        .id('login')
        .fontSize(20)
        .borderRadius(5)
        .height('5%')
        .width('60%')
        .alignRules({
          top: { anchor: "Inputs", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })
        .offset({
          y: '40%'
        })
        .onClick(() => {
          router.pushUrl({ url: CommonConstants.PATH_HOME })
        })

      Button($r('app.string.Register'), {
        type: ButtonType.Normal
      })
        .id('register')
        .fontSize(20)
        .borderRadius(5)
        .width('60%')
        .height('5%')
        .alignRules({
          top: { anchor: "login", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })
        .offset({
          y: '42%'
        })
        .onClick(() => {
          router.pushUrl({ url: CommonConstants.PATH_REGISTER })
        })

      Divider()
        .width('75%')
        .strokeWidth(1)
        .color(Color.Gray)
        .id('divider')
        .alignRules({
          top: { anchor: "register", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })
        .offset({
          y: '50%'
        })

      this.mBut()
    }
    .height('100%')
    .width('100%')
    .backgroundColor(ColorConstants.BACKGROUND)
    .onAppear(() => {
      router.clear()
    })
  }

  onPageShow() {

  }
}