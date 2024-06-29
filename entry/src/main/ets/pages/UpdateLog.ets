import { baseData } from '../common/constants/CommonConstants';
import { valueToWeight } from '../common/model/Weight_Value_Utils';

@Entry
@Component
struct UpdateLog {
  private controller: Scroller = new Scroller()
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight())

  @Builder mSize() {
    Row() {
      Text('【安装包大小】：100.25 MB')
        .width('100%')
        .fontSize(this.FONT_SIZE - 1)
        .fontColor(this.FONT_COLOR)
        .fontWeight(this.FONT_WEIGHT)
    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
    .margin({
      top: '10%'
    })
  }

  @Builder mLog() {
    Column({ space: 20 }) {
      Column({ space: 10 }) {
        Text('【应用介绍】')
          .width('100%')
          .fontSize(this.FONT_SIZE)
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
        Text('【一】动态')
          .fontSize(this.FONT_SIZE - 1)
          .width('100%')
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
        Text('【二】运动健康')
          .fontSize(this.FONT_SIZE - 1)
          .width('100%')
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
        Text('【三】教务系统')
          .fontSize(this.FONT_SIZE - 1)
          .width('100%')
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
        Text('【四】个人信息管理')
          .fontSize(this.FONT_SIZE - 1)
          .width('100%')
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({
        top: '5%'
      })

      Column() {
        Text('【新增】').width('100%').fontSize(this.FONT_SIZE).fontColor(this.FONT_COLOR).fontWeight(this.FONT_WEIGHT)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({
        top: '5%'
      })

      Column() {
        Text('【深色模式】')
          .width('100%')
          .fontSize(this.FONT_SIZE)
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
        Text('通过本次更新，应用将支持深色模式，模式变换，由你控制')
          .fontSize(this.FONT_SIZE - 1)
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Column() {
        Text('【字体大小、粗细可控】')
          .width('100%')
          .fontSize(this.FONT_SIZE)
          .fontColor(this.FONT_COLOR)
          .fontWeight(this.FONT_WEIGHT)
        Text('通过本次更新，应用将支持字体大小、粗细自由调控，随心控制，爱不释手')
          .fontWeight(this.FONT_WEIGHT)
          .fontSize(this.FONT_SIZE - 1)
          .fontColor(this.FONT_COLOR)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Column() {
        Text('【优化】').width('100%').fontSize(this.FONT_SIZE).fontColor(this.FONT_COLOR).fontWeight(this.FONT_WEIGHT)
        Text('通过本次更新，优化了应用部分功能逻辑，应用更加流畅、安全、可靠')
          .fontWeight(this.FONT_WEIGHT)
          .fontSize(this.FONT_SIZE - 1)
          .fontColor(this.FONT_COLOR)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({
        top: '2%',
        bottom: '5%'
      })
    }
    .margin({
      top: '5%'
    })
    .borderRadius(5)
    .width('95%')
    .backgroundColor(this.ITEM_COLOR)
    .justifyContent(FlexAlign.Start)
  }

  build() {
    Column() {
      Scroll(this.controller) {
        Column() {
          this.mSize()
          this.mLog()
        }
        .height('100%')
        .width('100%')
      }
      .height('100%')
      .width('100%')
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.BACKGROUND_COLOR)
  }

  onPageShow() {
    this.BACKGROUND_COLOR = baseData.getBackgroundColor()
    this.FONT_SIZE = baseData.getFontSize()
    this.FONT_COLOR = baseData.getFontColor()
    this.FONT_WEIGHT = valueToWeight(baseData.getFontWeight())
    this.ITEM_COLOR = baseData.getItemColor()
  }
}