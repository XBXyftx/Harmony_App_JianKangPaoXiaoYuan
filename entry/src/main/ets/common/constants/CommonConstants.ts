import { ColorConstants } from '../constants/ColorConstants'


// 页面路径
export class CommonConstants {
  static readonly PATH_HOME: string = "pages/Home"
  static readonly PATH_LOGIN: string = "pages/Login"
  static readonly PATH_REGISTER: string = "pages/Register"
  static readonly PATH_RUNNING: string = "pages/Running"
  static readonly PATH_SETTING: string = "pages/Setting"
  static readonly PATH_PRIVACY: string = "pages/Privacy"
  static readonly PATH_UTILS: string = "pages/Utils"
  static readonly PATH_ABOUT: string = "pages/About"
  static readonly PATH_SECURITY: string = "pages/Security"
  static readonly PATH_UPDATE: string = "pages/UpdateLog"
  static readonly PATH_FEEDBACK: string = "pages/Feedback"
  static readonly PATH_PERSONALINFO: string = "pages/PersonalInfo"
}

// 首选项基础数据
export class baseData {

  // 是否深色模式
  private static IS_DARK: boolean = false
  // 背景颜色
  private static BACKGROUND_COLOR: string = ColorConstants.BACKGROUND

  //选项颜色
  private static ITEM_COLOR: string = ColorConstants.ITEM_COLOR

  // 字体大小
  private static FONT_SIZE: number = 15

  // 字体粗细
  private static FONT_WEIGHT: number = 2

  // 字体颜色
  private static FONT_COLOR: string = ColorConstants.FONT_COLOR

  private static DEVICE_INFO: string = ''

  private static SIGNATURE: string = ''

  static setFontColor(color: string) {
    this.FONT_COLOR = color
  }

  static getFontColor(): string {
    return this.FONT_COLOR
  }

  static setBackgroundColor(color: string) {
    this.BACKGROUND_COLOR = color
  }

  static getBackgroundColor(): string {
    return this.BACKGROUND_COLOR
  }

  static setItemColor(color: string) {
    this.ITEM_COLOR = color
  }

  static getItemColor(): string {
    return this.ITEM_COLOR
  }

  static setFontSize(size: number) {
    this.FONT_SIZE = size
  }

  static getFontSize() {
    return this.FONT_SIZE
  }

  static setFontWeight(weight: number) {
    this.FONT_WEIGHT = weight
  }

  static getFontWeight() {
    return this.FONT_WEIGHT
  }

  static setIsDark(isDark: boolean) {
    this.IS_DARK = isDark
  }

  static getIsDark() {
    return this.IS_DARK
  }

  static setDeviceInfo(info: string) {
    this.DEVICE_INFO = info
  }

  static getDeviceInfo() {
    return this.DEVICE_INFO
  }

  static setSignature(signature: string) {
    this.SIGNATURE = signature
  }

  static getSignature(): string {
    return this.SIGNATURE
  }
}