import router from '@ohos.router';
import { ColorConstants } from '../common/constants/ColorConstants'
import { CommonConstants } from '../common/constants/CommonConstants'
import { preferencesUtils } from '../common/model/preferencesUtils';


let mPreferences: preferencesUtils = new preferencesUtils()

@Entry
@Component
struct Index {
  build() {
    Row()
      .width('100%')
      .height('100%')
      .backgroundColor(ColorConstants.INDEX_COLOR)
      .backgroundImageSize({
        width: '100%',
        height: '100%'
      })
  }

  //  延时跳转
  aboutToAppear() {
    setTimeout(() => {
      mPreferences.getData('isLogin').then((data) => {
        if (!data) {
          router.replaceUrl({ url: CommonConstants.PATH_LOGIN })
          mPreferences.putData('isLogin', true)
        } else {
          router.replaceUrl({ url: CommonConstants.PATH_HOME })
        }
      })
    }, 1000)
  }
}

