import { baseData } from '../constants/CommonConstants'
import { valueToWeight } from '../model/Weight_Value_Utils'

@Component
export struct Education {
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight());
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State ITEM_COLOR: string = baseData.getItemColor()
  private searchController: SearchController = new SearchController()
  private scrollController: Scroller = new Scroller()
  @State isLoop: boolean = false
  @State arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

  @Builder mSearch() {
    Search({ controller: this.searchController })
      .textFont({ size: this.FONT_SIZE })
      .searchButton('搜索')
      .width('95%')
      .backgroundColor(this.ITEM_COLOR)
      .margin({
        top: '1%'
      })
      .height('5%')
  }

  @Builder mTools() {
    Grid() {
      GridItem() {
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Pink)

      GridItem() {
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Yellow)

      GridItem() {
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Green)

      GridItem() {
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Blue)
    }
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .width('95%')
    .height('10%')
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
      .borderRadius(20)
      .backgroundColor(this.BACKGROUND_COLOR)
      .fontSize(this.FONT_SIZE)
      .fontColor(this.FONT_COLOR)
      .fontWeight(this.FONT_WEIGHT)
      .width('95%')
      .height('5%')
      .margin({
        top: '1%'
      })
  }

  @Builder mInf() {
    Scroll(this.scrollController) {
      Column() {
        List({ initialIndex: 0 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height(50)
                .fontSize(this.FONT_SIZE)
                .fontColor(this.FONT_COLOR)
                .fontWeight(this.FONT_WEIGHT)
                .textAlign(TextAlign.Center)
                .borderRadius(5)
            }
            .backgroundColor(this.ITEM_COLOR)
            .margin({
              top: '2%'
            })
          }, item => item)
        }
        .listDirection(Axis.Vertical)
        .edgeEffect(EdgeEffect.Spring)
      }
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
    .width('95%')
    .height('76%')
    .margin({
      top: '1%'
    })
  }

  build() {
    Column() {
      this.mSearch()
      this.mNotice()
      this.mTools()
      this.mInf()
    }
    .onAppear(() => {
      this.isLoop = true
    })
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