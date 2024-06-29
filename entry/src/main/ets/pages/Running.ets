@Entry
@Component
struct Running {
  textTimerController: TextTimerController = new TextTimerController()
  @State readonly FORMAT: string = 'HH:mm:ss.SS'
  @State IMG_LOCK: Resource = $rawfile('unlock.svg')
  @State LOCK_PATH: Resource = $rawfile('lock.svg')
  @State UNLOCK_PATH: Resource = $rawfile('unlock.svg')
  @State SIGNAL_PATH: Resource = $rawfile('storage.svg')
  @State PAUSE_PATH: Resource = $rawfile('pause.svg')
  @State RESTART_PATH: Resource = $rawfile('restart.svg')
  @State START_PATH: Resource = $rawfile('start.svg')
  @State LOCK_BUTTON_IS_LOCK: boolean = false
  @State IS_SHOW: boolean = false
  @State COUNTDOWN_NUMBER: number = 3
  @State COUNTDOWN_OPACITY: number = 1
  @State COUNTDOWN_SIZE: string = '0%'
  @State IMG_SATELLITE_SIZE: number = 17
  @State COUNTDOWN_SCALE: number = 1
  @State IMG_SATELLITE_OPACITY: number = 0
  @State BUTTON_LOCK_SCALE: number = 1
  @State BUTTON_PAUSE_SCALE: number = 1
  @State BUTTON_START_SCALE: number = 0
  @State BUTTON_RESTART_SCALE: number = 0
  @State BUTTON_LOCK_UNLOCK_RULE: AlignRuleOption = {
    right: { anchor: "__container__", align: HorizontalAlign.End },
    center: { anchor: "__container__", align: VerticalAlign.Center }
  }
  @State BUTTON_START_RULE: AlignRuleOption = {
    left: { anchor: "__container__", align: HorizontalAlign.Start },
    center: { anchor: "__container__", align: VerticalAlign.Center }
  }
  @State BUTTON_RESTART_RULE: AlignRuleOption = {
    right: { anchor: "__container__", align: HorizontalAlign.End },
    center: { anchor: "__container__", align: VerticalAlign.Center }
  }
  @State readonly BUTTON_PAUSE_RULE: AlignRuleOption = {
    middle: { anchor: "__container__", align: HorizontalAlign.Center },
    center: { anchor: "__container__", align: VerticalAlign.Center }
  }
  @State readonly PANEL_RULE: AlignRuleOption = {
    bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
  }

  @Builder mSignal() {
    Image(this.SIGNAL_PATH)
      .opacity(this.IMG_SATELLITE_OPACITY)
      .width(40)
      .height(40)
      .padding(10)
      .borderRadius(5)
      .borderWidth(2)
      .borderColor(Color.Orange)
      .id('signal')
      .alignRules({
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        top: { anchor: "__container__", align: VerticalAlign.Top }
      })
      .offset({ x: '5%', y: '5%' })
  }

  @Builder mDate(title: Resource, date: number, unit?: string) {
    Column({ space: 5 }) {
      Text(title)
        .width('50%')
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
      Text(date + unit)
        .width('50%')
        .fontSize(20)
        .textAlign(TextAlign.Center)
    }
  }

  @Builder mPanel() {
    Panel(this.IS_SHOW) {
      Column() {
        Column() {
          Text($r('app.string.Time'))
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .width('100%')
          TextTimer({ controller: this.textTimerController, isCountDown: false })
            .format(this.FORMAT)
            .fontSize(20)
            .fontColor(Color.Black)
        }
        .justifyContent(FlexAlign.Center)
        .height(50)
        .displayPriority(3)


        Row() {
          this.mDate($r('app.string.Speed'), 7.25, 'm/s')
          this.mDate($r('app.string.Mileage'), 1244.25, 'm')
        }
        .height(75)
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .displayPriority(3)

        Row() {
          this.mDate($r('app.string.AvgSpeed'), 9.75, 'm/s')
          this.mDate($r('app.string.StepFrequency'), 125, ' ')
        }
        .height(50)
        .width('100%')
        .displayPriority(1)

        RelativeContainer() {
          Button({ type: ButtonType.Circle }) {
            Image(this.START_PATH).padding(15)
          }
          .scale({ x: this.BUTTON_START_SCALE, y: this.BUTTON_START_SCALE })
          .backgroundColor(Color.Green)
          .width(75)
          .height(75)
          .onClick(() => {
            this.textTimerController.start()
            animateTo({ duration: 1000 }, () => {
              this.BUTTON_RESTART_RULE = {
                middle: { anchor: "__container__", align: HorizontalAlign.Center },
                center: { anchor: "__container__", align: VerticalAlign.Center }
              }
              this.BUTTON_START_RULE = {
                middle: { anchor: "__container__", align: HorizontalAlign.Center },
                center: { anchor: "__container__", align: VerticalAlign.Center }
              }
              this.BUTTON_START_SCALE = 0
              this.BUTTON_RESTART_SCALE = 0
              this.BUTTON_LOCK_SCALE = 1
              this.BUTTON_PAUSE_SCALE = 1
            })
          })
          .id('start')
          .alignRules(this.BUTTON_START_RULE)

          Button({ type: ButtonType.Circle }) {
            Image(this.RESTART_PATH).padding(15)
          }
          .scale({ x: this.BUTTON_RESTART_SCALE, y: this.BUTTON_RESTART_SCALE })
          .backgroundColor(Color.Red)
          .width(75)
          .height(75)
          .onClick(() => {
            this.textTimerController.reset()
          })
          .id('restart')
          .alignRules(this.BUTTON_RESTART_RULE)

          Button({ type: ButtonType.Circle }) {
            Image(this.PAUSE_PATH).padding(15)
          }
          .scale({ x: this.BUTTON_PAUSE_SCALE, y: this.BUTTON_PAUSE_SCALE })
          .backgroundColor(Color.Orange)
          .width(75)
          .height(75)
          .onClick(() => {
            this.textTimerController.pause()
            animateTo({ duration: 1000 }, () => {
              this.BUTTON_LOCK_SCALE = 0
              this.BUTTON_PAUSE_SCALE = 0
              this.BUTTON_START_SCALE = 1
              this.BUTTON_RESTART_SCALE = 1
              animateTo({ duration: 1000 }, () => {
                this.BUTTON_RESTART_RULE = {
                  right: { anchor: "__container__", align: HorizontalAlign.End },
                  center: { anchor: "__container__", align: VerticalAlign.Center }
                }
                this.BUTTON_START_RULE = {
                  left: { anchor: "__container__", align: HorizontalAlign.Start },
                  center: { anchor: "__container__", align: VerticalAlign.Center }
                }
              })
            })
          })
          .id('pause')
          .alignRules(this.BUTTON_PAUSE_RULE)

          Button({ type: ButtonType.Circle }) {
            Image(this.IMG_LOCK).padding(15)
          }
          .scale({ x: this.BUTTON_LOCK_SCALE, y: this.BUTTON_LOCK_SCALE })
          .width(50)
          .height(50)
          .id('lock')
          .alignRules(this.BUTTON_LOCK_UNLOCK_RULE)
          .onClick(() => {
            this.LOCK_BUTTON_IS_LOCK = !this.LOCK_BUTTON_IS_LOCK
            animateTo({
              duration: 1000
            }, () => {
              this.BUTTON_PAUSE_SCALE = this.LOCK_BUTTON_IS_LOCK ? 0 : 1
              this.IMG_LOCK = this.LOCK_BUTTON_IS_LOCK ? this.LOCK_PATH : this.UNLOCK_PATH
              this.BUTTON_LOCK_UNLOCK_RULE = this.LOCK_BUTTON_IS_LOCK ? {
                                                                          left: {
                                                                            anchor: "__container__",
                                                                            align: HorizontalAlign.Start
                                                                          },
                                                                          center: {
                                                                            anchor: "__container__",
                                                                            align: VerticalAlign.Center
                                                                          }
                                                                        } : {
                                                                              right: {
                                                                                anchor: "__container__",
                                                                                align: HorizontalAlign.End
                                                                              },
                                                                              center: {
                                                                                anchor: "__container__",
                                                                                align: VerticalAlign.Center
                                                                              }
                                                                            }

            })
          })
        }
        .displayPriority(3)
        .width('60%')
        .height(100)
      }
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .dragBar(true)
    .height(350)
    .id('mDate')
    .halfHeight(350)
    .miniHeight(250)
    .alignRules({
      bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
    })
  }

  @Builder mCountDown() {
    Column() {
      Text(this.COUNTDOWN_NUMBER.toString())
        .textAlign(TextAlign.Center)
        .fontSize(150)
        .fontColor(Color.White)
        .width(this.COUNTDOWN_SIZE)
        .height(this.COUNTDOWN_SIZE)
        .borderRadius(10)
        .scale({ x: this.COUNTDOWN_SCALE, y: this.COUNTDOWN_SCALE })
        .opacity(this.COUNTDOWN_OPACITY)
        .fontWeight(FontWeight.Bold)
        .onAppear(() => {
          setTimeout(() => {
            this.COUNTDOWN_SIZE = '100%'
            animateTo({ duration: 1000, iterations: 1, playMode: PlayMode.Normal }, () => {
              this.COUNTDOWN_SCALE = 5
              this.COUNTDOWN_OPACITY = 0
            })
          }, 1000)
          setTimeout(() => {
            this.COUNTDOWN_NUMBER -= 1
            this.COUNTDOWN_SCALE = 1
            this.COUNTDOWN_OPACITY = 1
            animateTo({ duration: 1000, iterations: 1, playMode: PlayMode.Normal }, () => {
              this.COUNTDOWN_SCALE = 5
              this.COUNTDOWN_OPACITY = 0
            })
          }, 2000)
          setTimeout(() => {
            this.COUNTDOWN_NUMBER -= 1
            this.COUNTDOWN_SCALE = 1
            this.COUNTDOWN_OPACITY = 1.5
            animateTo({ duration: 1000, iterations: 1, playMode: PlayMode.Normal }, () => {
              this.COUNTDOWN_SCALE = 5
              this.COUNTDOWN_OPACITY = 0
            })
          }, 3000)
        })
    }
    .id('tip')
    .onAppear(() => {
      setTimeout(() => {
        animateTo({ duration: 1000, playMode: PlayMode.Normal, iterations: 1, curve: Curve.EaseInOut }, () => {
          this.COUNTDOWN_SIZE = '0%'
          this.IMG_SATELLITE_OPACITY = 1
          this.IS_SHOW = true
        })
        this.textTimerController.start()
      }, 4000)
    })
    .backgroundColor(Color.Orange)
    .width(this.COUNTDOWN_SIZE)
    .height(this.COUNTDOWN_SIZE)
  }

  build() {
    RelativeContainer() {
      this.mCountDown()
      this.mSignal()
      this.mPanel()
    }
    .width('100%')
    .height('100%')
  }

  pageTransition() {
    PageTransitionEnter({ duration: 1000, curve: Curve.EaseInOut })
      .slide(SlideEffect.Bottom)
  }
}