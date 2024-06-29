import router from '@ohos.router';
import { ColorConstants } from '../common/constants/ColorConstants';
import { CommonConstants } from '../common/constants/CommonConstants'

@Entry
@Component
struct Register {
  controller: TextInputController = new TextInputController()

  @Builder mInput() {
    Column({
      space: 20
    }) {
      TextInput({
        placeholder: $r('app.string.PhoneNum')
      , controller: this.controller
      })
        .type(InputType.PhoneNumber)
        .backgroundColor(Color.White)
        .borderRadius(5)
        .width('80%')
        .height('30%')

      Row() {
        TextInput({
          controller: this.controller
        })
          .maxLength(6)
          .type(InputType.PhoneNumber)
          .backgroundColor(Color.White)
          .borderRadius(5)
          .width('50%')
          .height('100%')
        Blank().color(Color.Transparent)
        Button($r('app.string.GetCode'))
          .width('40%')
          .height('100%')
          .type(ButtonType.Normal)
          .borderRadius(5)
      }
      .width('80%')
      .height('30%')
    }
    .justifyContent(FlexAlign.Center)
    .id('Inputs')
    .width('100%')
    .height('20%')
    .alignRules({
      top: { anchor: "navigation", align: VerticalAlign.Bottom },
      middle: { anchor: "__container__", align: HorizontalAlign.Center }
    })
    .offset({
      y: "20%"
    })
  }

  build() {
    RelativeContainer() {
      Navigation()
        .width('100%')
        .height('10%')
        .id('navigation')
        .titleMode(NavigationTitleMode.Full)
        .title({ main: '注 册', sub: '' })
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })


      this.mInput()
      Button($r('app.string.Register'))
        .width('60%')
        .height('5%')
        .type(ButtonType.Normal)
        .borderRadius(5)
        .id('register')
        .alignRules({
          top: { anchor: "Inputs", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center },
        })
        .offset({
          y: "45%"
        })
        .onClick(() => {
          router.pushUrl({
            url: CommonConstants.PATH_HOME,
          })
        })
      Button($r('app.string.Back'))
        .width('60%')
        .height('5%')
        .type(ButtonType.Normal)
        .borderRadius(5)
        .id('back')
        .alignRules({
          top: { anchor: "register", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center },
        })
        .offset({
          y: "47%"
        })
        .onClick(() => {
          router.back()
        })
    }
    .backgroundColor(ColorConstants.BACKGROUND)
    .width('100%')
    .height('100%')
  }
}