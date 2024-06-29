import { baseData } from '../constants/CommonConstants'
import { valueToWeight } from '../model/Weight_Value_Utils'


@Component
export struct Dynamics {
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight())
  private swiperController: SwiperController = new SwiperController()
  searchController: SearchController = new SearchController()
  @State currentIndex: number = 0
  private scroller: Scroller = new Scroller()
  tabsController: TabsController = new TabsController()
  @State images: Array<Resource> =
    [
    $rawfile('forth.png'),
    $rawfile('first.png'),
    $rawfile('second.png'),
    $rawfile('third.png'),
    $rawfile('forth.png')
    ]
  private data: MyDataSource = new MyDataSource([])
  @State arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

  aboutToAppear(): void {
    let list = []
    for (let i = 0; i < 5; i++) {
      list.push(this.images[i])
    }
    this.data = new MyDataSource(list)
  }

  @Builder mPhotos() {
    Swiper(this.swiperController) {
      LazyForEach(this.data, (item: Resource) => {
        Image(item).width('100%').height('100%')
      })
    }
    .autoPlay(true)
    .index(1)
    .interval(4000)
    .loop(true)
    .borderWidth(2)
    .borderColor(this.ITEM_COLOR)
    .borderRadius(5)
    .width('95%')
    .height('25%')
    .curve(Curve.EaseInOut)
    .margin({
      top: '1%'
    })
  }

  @Builder mSearch() {
    Search({ controller: this.searchController })
      .backgroundColor(this.ITEM_COLOR)
      .textFont({ size: 15 })
      .placeholderFont({ size: 15 })
      .searchButton('搜索')
      .width('95%')
      .margin({
        top: '1%'
      })
      .height('5%')
  }

  @Builder link(url: string) {
    Text(url)
      .fontColor(this.FONT_COLOR)
      .fontSize(13)
      .width('90%')
  }

  @Builder mNoticeList() {
    Column({ space: 5 }) {
      this.link('1、学风建设月即将到来')
      this.link('2、下个月将举办年度校运会')
      this.link('3、大一期中考试即将来临，你准备好了吗')
      this.link('4、暑假出行，你如何安排')
    }
    .borderRadius(5)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.ITEM_COLOR)
    .width('95%')
    .height('15%')
    .margin({
      top: '1%',
      bottom: '1%'
    })
  }

  @Builder TabBuilder(index: number, name: string) {
    Column({
      space: 5
    }) {
      Text(name)
        .fontWeight(this.FONT_WEIGHT)
        .fontColor(this.currentIndex === index - 1 ? '#007DFF' : this.FONT_COLOR)
        .fontSize(this.FONT_SIZE)
        .margin({ top: 10 })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }

  @Builder mTabs() {
    Tabs({ barPosition: BarPosition.Start, controller: this.tabsController }) {
      TabContent() {
        Scroll(this.scroller) {
          Column() {
            List({ initialIndex: 0 }) {
              ForEach(this.arr, (item) => {
                ListItem() {
                  Text('' + item)
                    .width('100%')
                    .height(50)
                    .fontSize(this.FONT_SIZE)
                    .textAlign(TextAlign.Center)
                    .borderRadius(5)
                    .fontColor(this.FONT_COLOR)
                }
              }, item => item)
            }
            .listDirection(Axis.Vertical)
            .edgeEffect(EdgeEffect.Spring)
          }
        }
        .height('100%')
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      }.tabBar(this.TabBuilder(1, '热门活动'))

      TabContent() {
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('#00CB87')
      }.tabBar(this.TabBuilder(2, '要 闻'))

      TabContent() {
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('#ff0044cb')
      }
      .tabBar(this.TabBuilder(3, '学院建设'))
    }
    .backgroundColor(this.ITEM_COLOR)
    .animationDuration(500)
    .tabIndex(0)
    .borderRadius(5)
    .width('95%')
    .height('51%')
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }

  build() {
    Column() {
      this.mSearch()
      this.mPhotos()
      this.mNoticeList()
      this.mTabs()
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

class MyDataSource implements IDataSource {
  private list: Resource[] = []
  private listener: DataChangeListener

  constructor(list: Resource[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}