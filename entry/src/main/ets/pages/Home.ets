import router from '@ohos.router';
import { Me } from '../common/tabContents/Me'
import { Sport } from '../common/tabContents/Sport'
import { Dynamics } from '../common/tabContents/Dynamics'
import { ColorConstants } from '../common/constants/ColorConstants'
import { Education } from '../common/tabContents/Education'
import { baseData } from '../common/constants/CommonConstants';
import { valueToWeight } from '../common/model/Weight_Value_Utils';

@Entry
@Component
struct Main {
  @State FONT_COLOR: string = baseData.getFontColor()
  @State FONT_SIZE: number = baseData.getFontSize();
  @State FONT_WEIGHT: FontWeight = valueToWeight(baseData.getFontWeight());
  @State BACKGROUND_COLOR: string = baseData.getBackgroundColor()
  @State ITEM_COLOR: string = baseData.getItemColor()
  @State currentIndex: number = 0
  @State Build: Array<Object> = [
    {
      text: $r('app.string.Dynamics'),
      img: $rawfile('notice.svg'),
      num: 0
    },
    {
      text: $r('app.string.Running'),
      img: $rawfile('running.svg'),
      num: 1
    },
    {
      text: $r('app.string.Educational'),
      img: $rawfile('education.svg'),
      num: 2
    },
    {
      text: $r('app.string.Me'),
      img: $rawfile('me.svg'),
      num: 3
    }
  ]

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.Build, item => {
        Column({ space: 5 }) {
          Image(item.img)
            .fillColor(this.currentIndex == item.num ? '#007DFF' : this.FONT_COLOR)
            .width(24)
            .height(24)
          Text(item.text)
            .fontColor(this.currentIndex == item.num ? '#007DFF' : this.FONT_COLOR)
        }
        .justifyContent(FlexAlign.Center)
        .width('25%')
        .height('100%')
        .onClick(() => {
          this.currentIndex = item.num
        })
      })
    }
    .height('100%')
    .width('100%')
  }

  build() {
    Column() {
      Navigation() {
        if (this.currentIndex == 0) {
          Dynamics().width('100%').height('100%')
        } else if (this.currentIndex == 1) {
          Sport().height('100%').width('100%')
        } else if (this.currentIndex == 2) {
          Education().height('100%').width('100%')
        } else if (this.currentIndex == 3) {
          Me().height('100%').width('100%')
        }
      }
      .mode(NavigationMode.Stack)
      .toolBar(this.NavigationToolbar())
      .hideTitleBar(true)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.BACKGROUND_COLOR)
    .onAppear(() => {
      router.clear()
    })
  }

  onPageShow() {
    this.BACKGROUND_COLOR = baseData.getBackgroundColor()
    this.FONT_SIZE = baseData.getFontSize()
    this.FONT_COLOR = baseData.getFontColor()
    this.FONT_WEIGHT = valueToWeight(baseData.getFontWeight())
    this.ITEM_COLOR = baseData.getItemColor()
  }
}