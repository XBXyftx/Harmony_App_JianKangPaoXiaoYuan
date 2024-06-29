import router from '@ohos.router';
import { baseData, CommonConstants } from '../constants/CommonConstants'
import { ColorConstants } from '../constants/ColorConstants'
import { valueToWeight } from '../model/Weight_Value_Utils';

@Component
export struct Sport {
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight());
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State isLoop: boolean = false;
  @State days: number = 32
  @State count: number = 112
  @State distance: number = 2250

  @Builder mProgress(total: number, value: number, color: Color | string) {
    Stack() {
      Progress({
        total: total,
        value: value,
        type: ProgressType.Ring
      })
        .style({
          scaleCount: 3000,
          strokeWidth: 15
        })
        .width(100)
        .color(color)
      Text((value / total * 100).toFixed(2).toString() + '%')
        .fontColor(color)
        .fontSize(15)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.None })
    }
  }

  @Builder mDateAnalyze() {
    Column() {
      this.mProgress(10, this.distance, '#ff00c4ff')
      Row() {
        this.mProgress(10, this.days, '#ff67be02')
        this.mProgress(10, this.count, Color.Orange)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('70%')
    }
    .width('95%')
    .justifyContent(FlexAlign.Center)
    .height('35%')
    .borderRadius(5)
    .backgroundColor(this.ITEM_COLOR)
    .margin({
      top: '2%'
    })
  }

  @Builder mData() {
    Column() {
      Row() {
        Column({ space: 5 }) {
          Text('跑步天数')
            .fontSize(this.FONT_SIZE - 2)
            .fontColor(this.FONT_COLOR)
            .fontWeight(this.FONT_WEIGHT)
          Text(this.days + '天')
            .fontSize(this.FONT_SIZE)
            .fontColor(this.FONT_COLOR)
            .fontWeight(this.FONT_WEIGHT)
        }
        .justifyContent(FlexAlign.Center)
        .width('50%')

        Column({ space: 5 }) {
          Text('总里程')
            .fontSize(this.FONT_SIZE - 2)
            .fontColor(this.FONT_COLOR)
            .fontWeight(this.FONT_WEIGHT)
          Text(this.count + 'Km')
            .fontSize(this.FONT_SIZE)
            .fontColor(this.FONT_COLOR)
            .fontWeight(this.FONT_WEIGHT)
        }
        .justifyContent(FlexAlign.Center)
        .width('50%')
      }
      .width('100%')
    }
    .backgroundColor(this.BACKGROUND_COLOR)
    .justifyContent(FlexAlign.Center)
    .borderRadius(5)
    .width('95%')
    .height('7%')
    .margin({
      top: '1%'
    })
  }

  @Builder mNotice() {
    Marquee({
      start: this.isLoop,
      loop: Infinity,
      fromStart: true,
      src: '公告：本学期健康跑时间为3月12日-6月20日，请大家合理安排时间，在有效时间内完成健康跑任务'
    })
      .backgroundColor(this.BACKGROUND_COLOR)
      .fontSize(this.FONT_SIZE)
      .fontColor(this.FONT_COLOR)
      .fontWeight(this.FONT_WEIGHT)
      .width('100%')
      .height('5%')
  }

  @Builder mGridItem(path: Resource, text: Resource) {
    Column({ space: 5 }) {
      Image(path)
        .width(50)
        .height(50)
        .size({
          width: 50,
          height: 50
        })
        .padding(10)
        .borderRadius(10)
        .backgroundColor(this.ITEM_COLOR)

      Text(text)
        .fontSize(this.FONT_SIZE - 3)
        .fontColor(this.FONT_COLOR)
        .fontWeight(this.FONT_WEIGHT)
    }
    .justifyContent(FlexAlign.Center)
    .width('60%')
    .height('100%')
  }

  @Builder mGrid() {
    Column() {
      Grid() {
        GridItem() {
          this.mGridItem($rawfile('record.svg'), $r('app.string.Record'))
        }
        .width('100%')
        .height('100%')

        GridItem() {
          this.mGridItem($rawfile('rank.svg'), $r('app.string.Rank'))
        }
        .width('100%')
        .height('100%')

        GridItem() {
          this.mGridItem($rawfile('runningGoal.svg'), $r('app.string.Goal'))
        }
        .width('100%')
        .height('100%')
      }
      .columnsTemplate('1fr 1fr 1fr')
      .width('100%')
    }
    .backgroundColor(this.ITEM_COLOR)
    .borderRadius(5)
    .width('95%')
    .height('10%')
    .margin({
      top: '1%'
    })
  }

  @Builder entryRunning() {
    RelativeContainer() {
      Text($r('app.string.Running'))
        .fontSize(50)
        .fontColor(Color.White)
        .width('100%')
        .fontWeight(FontWeight.Bold)
        .id('HealthRunning')
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top }
        })
        .offset({
          x: "5%",
          y: "15%"
        })

      Text('未来的你一定会感谢今天的汗水与付出')
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .fontSize(15)
        .width('100%')
        .id('tip')
        .alignRules({
          top: { anchor: "HealthRunning", align: VerticalAlign.Bottom }
        })
        .offset({
          x: "5%",
          y: '17%'
        })

      Button($r('app.string.Start'))
        .backgroundColor(Color.Orange)
        .width(120)
        .height(50)
        .fontSize(15)
        .id('start')
        .onClick(() => {
          router.pushUrl({ url: CommonConstants.PATH_RUNNING })
        })
        .alignRules({
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })
        .offset({
          y: "-5%",
          x: '20%'
        })
    }
    .backgroundImageSize({
      width: '100%',
      height: '100%'
    })
    .backgroundImage($rawfile('RunningBackground.jpg'))
    .width('100%')
    .height('40%')
  }

  build() {
    Column() {
      this.entryRunning()
      this.mNotice()
      this.mData()
      this.mGrid()
      this.mDateAnalyze()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.BACKGROUND_COLOR)
    .onAppear(() => {
      this.isLoop = true
    })
  }

  pageTransition() {
    PageTransitionExit({ curve: Curve.EaseInOut, duration: 1000 }).slide(SlideEffect.Top)
  }

  onPageShow() {
    this.BACKGROUND_COLOR = baseData.getBackgroundColor()
    this.FONT_SIZE = baseData.getFontSize()
    this.FONT_COLOR = baseData.getFontColor()
    this.FONT_WEIGHT = valueToWeight(baseData.getFontWeight())
    this.ITEM_COLOR = baseData.getItemColor()
  }
}