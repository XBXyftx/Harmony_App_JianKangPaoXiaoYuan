import { baseData } from '../common/constants/CommonConstants'
import { valueToWeight } from '../common/model/Weight_Value_Utils'
import deviceInfo from '@ohos.deviceInfo'


@Entry
@Component
struct Security {
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight())
  @State DEVICE_INFO: string = baseData.getDeviceInfo()

  @Builder mNavigationTitle(title: string) {
    Text(title).fontColor(this.FONT_COLOR)
  }

  @Builder mNavigation() {
    Navigation()
      .height('10%')
      .width('100%')
      .title(this.mNavigationTitle('安全检测'))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
  }

  @Builder mLoginDevice() {
    Row({ space: 10 }) {
      Image($rawfile('device.svg'))
        .width(25)
        .height(25)
        .fillColor(this.FONT_COLOR)
      Text('设备管理')
        .fontSize(this.FONT_SIZE)
        .fontWeight(this.FONT_WEIGHT)
        .fontColor(this.FONT_COLOR)
        .width('20%')
      Text(deviceInfo.productModel)
        .fontSize(this.FONT_SIZE)
        .fontWeight(this.FONT_WEIGHT)
        .fontColor(this.FONT_COLOR)
        .width('65%')
        .textAlign(TextAlign.End)
    }
    .borderRadius(5)
    .backgroundColor(this.ITEM_COLOR)
    .width('95%')
    .height('7%')
    .padding(5)
    .onClick(() => {
      console.log(deviceInfo.productModel)
    })
  }

  build() {
    Column() {
      this.mNavigation()
      this.mLoginDevice()
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