import { baseData } from '../common/constants/CommonConstants'
import { valueToWeight } from '../common/model/Weight_Value_Utils'
import { CommonConstants } from '../common/constants/CommonConstants'
import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct About {
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight())
  @State mItemUri: Array<Object> = [
    {
      title: '检查更新',
      uri: '',
      text: ''
    },
    {
      title: '更新日志',
      uri: CommonConstants.PATH_UPDATE,
      text: ''
    },
    {
      title: '反馈',
      uri: '',
      text: ''
    },
    {
      title: '联系邮箱',
      uri: '',
      text: 'liuzian896450917@outlook.com'
    },
    {
      title: '官方团队',
      uri: '',
      text: '@Harmony APP 开发者'
    }
  ]

  @Builder mNavigationTitle(title: string) {
    Text(title).fontColor(this.FONT_COLOR)
  }

  @Builder mNavigation() {
    Navigation()
      .height('10%')
      .width('100%')
      .title(this.mNavigationTitle('关于我们'))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
  }

  @Builder mIcon() {
    Column() {
      Image($rawfile('first.png'))
        .width(75)
        .height(75)
        .clip(new Rect({ width: 75, height: 75, radius: 5 }))
      Text('APP NAME').fontSize(this.FONT_SIZE + 2).fontWeight(this.FONT_WEIGHT).fontColor(this.FONT_COLOR).margin({
        top: '5%'
      })
      Row() {
        Text('版本号 ').fontSize(this.FONT_SIZE - 1).fontWeight(this.FONT_WEIGHT).fontColor(this.FONT_COLOR)
        Text('1.0.12.2201').fontSize(this.FONT_SIZE - 1).fontWeight(this.FONT_WEIGHT).fontColor(this.FONT_COLOR)
      }
      .margin({
        top: '1%'
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('25%')
  }

  @Builder mItem(title: string, uri: string, text: string) {
    RelativeContainer() {
      Text(title)
        .id('title')
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
      Text(text)
        .id('text')
        .fontSize(this.FONT_SIZE - 2)
        .fontColor(this.FONT_COLOR)
        .fontWeight(this.FONT_WEIGHT)
        .width('70%')
        .textAlign(TextAlign.End)
        .offset({
          x: '-3%'
        })
        .alignRules({
          right: { anchor: "__container__", align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
    }
    .backgroundColor(this.ITEM_COLOR)
    .width('100%')
    .height('100%')
    .borderRadius(5)
    .height('20%')
    .onClick(() => {
      if (title === '检查更新') {
        try {
          promptAction.showToast({
            message: '应用已升级至最新版本',
            duration: 2000,
          })
        } catch (error) {
          console.error(`showToast args error code is ${error.code}, message is ${error.message}`)
        }
      } else if (title === '反馈') {
        try {
          promptAction.showToast({
            message: '该服务正在测试中，敬请期待',
            duration: 2000,
          });
        } catch (error) {
          console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
        }
        ;
      }
      router.pushUrl({
        url: uri
      })
    })
  }

  @Builder mItemList() {
    Column() {
      ForEach(this.mItemUri, (item) => {
        this.mItem(item.title, item.uri, item.text)
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

  build() {
    Column() {
      this.mNavigation()
      this.mIcon()
      this.mItemList()
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