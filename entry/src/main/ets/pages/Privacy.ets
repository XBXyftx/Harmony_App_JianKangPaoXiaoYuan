import webview from '@ohos.web.webview';

@Entry
@Component
struct Privacy {
  private controller: WebviewController = new webview.WebviewController

  @Builder mNavigation() {
    Navigation()
      .height('10%')
      .width('100%')
      .title('隐私政策')
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
  }

  build() {
    Column() {
      this.mNavigation()
      Web({ src: $rawfile('privacy.html'), controller: this.controller })
        .fileAccess(true)
    }
    .width('100%')
    .height('100%')
  }
}