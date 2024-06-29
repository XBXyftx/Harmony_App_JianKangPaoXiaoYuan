import { ColorConstants } from '../constants/ColorConstants'
import { baseData, CommonConstants } from '../constants/CommonConstants'
import router from '@ohos.router'
import { valueToWeight } from '../model/Weight_Value_Utils'

@Component
export struct Me {
  @State rating: number = 2
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight());
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State ITEM_COLOR: string = baseData.getItemColor()

  @Builder mTop() {
    RelativeContainer() {
      Button() {
        Row({
          space: 5
        }) {
          Image($rawfile('setting.svg'))
            .width(25)
            .height(25)
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
      }
      .opacity(0.75)
      .backgroundColor(ColorConstants.BACKGROUND)
      .id('setting')
      .width('20%')
      .height(30)
      .alignRules({
        top: { anchor: "__container__", align: VerticalAlign.Top },
        right: { anchor: "__container__", align: HorizontalAlign.End }
      })
      .offset({
        x: "-5%",
        y: '5%'
      })
      .onClick(() => {
        router.pushUrl({
          url: CommonConstants.PATH_SETTING
        })
      })

      Row() {
        Image($rawfile('Harmony.jpeg'))
          .borderColor(Color.White)
          .clip(new Circle({ width: '100%', height: '100%' }))
          .width('30%')
          .height('30%')

        Column({ space: 10 }) {
          Text('HarmonyOS APP 开发者')
            .width('100%')
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start)
            .fontColor(Color.White)
            .fontSize(15)
            .maxLines(1)
          Text('UID：' + '5928102663749')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontColor(Color.White)
            .fontSize(15)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
      }
      .borderRadius(10)
      .id("ID")
      .width('100%')
      .alignRules({
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        left: { anchor: "__container__", align: HorizontalAlign.Start }
      })
      .offset({ y: '-20%' })

      Rating({ rating: this.rating, indicator: true })
        .borderRadius(5)
        .stars(10)
        .stepSize(1)
        .width('80%')
        .height('12%')
        .id('rating')
        .onChange((value: number) => {
          this.rating = value
        })
        .alignRules({
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })
        .offset({
          y: '-3%'
        })
    }
    .width('100%')
    .height('32%')
    .backgroundImage($rawfile('forth.png'))
  }

  @Builder Card() {
    Column() {
      RelativeContainer() {
        Text('校园卡')
          .width('100%')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE + 5)
          .fontWeight(this.FONT_WEIGHT)
          .textAlign(TextAlign.Center)
          .id('card')
          .alignRules({
            middle: { anchor: "__container__", align: HorizontalAlign.Center },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          })
        Image($rawfile('bill.svg'))
          .fillColor(this.FONT_COLOR)
          .width(25)
          .height(25)
          .id('bill')
          .alignRules({
            right: { anchor: "__container__", align: HorizontalAlign.End },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          })
          .offset({
            x: "-5%"
          })
      }
      .height('25%')
      .width('100%')

      Divider()
        .height('5%')
        .strokeWidth(2)
        .color(this.BACKGROUND_COLOR)
        .width('95%')
      Row() {
        Text('120.35')
          .padding(5)
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE + 25)
          .fontWeight(this.FONT_WEIGHT)
          .textAlign(TextAlign.Center)
        Text('元')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE + 5)
          .fontWeight(this.FONT_WEIGHT)
          .textAlign(TextAlign.Center)
          .offset({
            y: '5%'
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('55%')

      Row() {
        Text('最后更新日期')
          .height('100%')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE - 2)
          .fontWeight(this.FONT_WEIGHT)
        Text('2023-4-16 20:40')
          .height('100%')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE - 2)
          .fontWeight(this.FONT_WEIGHT)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .height('15%')
      .width('95%')
    }
    .borderRadius(5)
    .backgroundColor(this.ITEM_COLOR)
    .width('95%')
    .height('24%')
    .margin({
      top: '2%'
    })
  }

  @Builder Net() {
    Column() {
      Text('校园网')
        .width('100%')
        .height('15%')
        .fontColor(this.FONT_COLOR)
        .fontSize(this.FONT_SIZE + 5)
        .fontWeight(this.FONT_WEIGHT)
        .textAlign(TextAlign.Center)
      Divider()
        .height('5%')
        .width('95%')
        .strokeWidth(2)
        .color(this.BACKGROUND_COLOR)
      Row() {
        Text('本月已用流量：')
          .height('100%')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE - 2)
          .fontWeight(this.FONT_WEIGHT)
        Text('2034' + 'MB')
          .height('100%')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE - 2)
          .fontWeight(this.FONT_WEIGHT)
      }
      .height('5%')
      .width('95%')

      RelativeContainer() {
        DataPanel({ values: [55], max: 100, type: DataPanelType.Circle })
          .width('100%')
          .height('100%')
          .id('dataPanel')
          .alignRules({
            center: { anchor: "__container__", align: VerticalAlign.Center },
            middle: { anchor: "__container__", align: HorizontalAlign.Center }
          })
        Row() {
          Text('剩余：')
            .height('100%')
            .fontColor(this.FONT_COLOR)
            .fontSize(this.FONT_SIZE)
            .fontWeight(this.FONT_WEIGHT)
          Text('20' + '元')
            .height('100%')
            .fontColor(this.FONT_COLOR)
            .fontSize(this.FONT_SIZE)
            .fontWeight(this.FONT_WEIGHT)
        }
        .id('data')
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })
      }
      .width('100%')
      .height('65%')

      Row() {
        Text('最后更新日期')
          .height('100%')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE - 2)
          .fontWeight(this.FONT_WEIGHT)
        Text('2023-4-16 20:40')
          .height('100%')
          .fontColor(this.FONT_COLOR)
          .fontSize(this.FONT_SIZE - 2)
          .fontWeight(this.FONT_WEIGHT)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .height('10%')
      .width('95%')
    }
    .borderRadius(5)
    .backgroundColor(this.ITEM_COLOR)
    .width('95%')
    .height('41%')
    .margin({
      top: '1%'
    })
  }

  build() {
    Column() {
      this.mTop()
      this.Card()
      this.Net()
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