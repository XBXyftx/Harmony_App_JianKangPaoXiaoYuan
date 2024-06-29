import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { preferencesUtils } from '../common/model/preferencesUtils';
import { PreferencesConstants } from '../common/constants/PreferencesConstants'
import { baseData } from '../common/constants/CommonConstants';
import { LightColor, DarkColor } from '../common/constants/ColorConstants'
import deviceInfo from '@ohos.deviceInfo';

let mPreferences: preferencesUtils = new preferencesUtils()

async function init(ability: UIAbility, name: string) {
  mPreferences.createPreferences(ability, name)

  mPreferences.getData('isFirst').then((data) => {
    if (data === 'default') {
      mPreferences.putData('isFirst', true)
      mPreferences.putData('isLogin', false)
      mPreferences.putData('isDark', false)
      mPreferences.putData('fontSize', 15)
      mPreferences.putData('fontWeight', 2)
      mPreferences.putData('fontColor', '#ff000000')
      mPreferences.putData('deviceInfo', deviceInfo.productSeries)
      mPreferences.putData('signature', '请输入你的个性签名')
    }
    baseData.setDeviceInfo(deviceInfo.productSeries)
    mPreferences.getData('isDark').then((data) => {
      baseData.setBackgroundColor(data ? DarkColor.BACKGROUND_COLOR : LightColor.BACKGROUND_COLOR)
      baseData.setItemColor(data ? DarkColor.ITEM_COLOR : LightColor.ITEM_COLOR)
      baseData.setFontColor(data ? DarkColor.FONT_COLOR : LightColor.FONT_COLOR)
    })
    mPreferences.getData('fontWeight').then((data) => {
      baseData.setFontWeight(data)
    })
    mPreferences.getData('fontSize').then((data) => {
      baseData.setFontSize(data)
    })
    mPreferences.getData('signature').then((date) => {
      baseData.setSignature(date)
    })
  })
}

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    globalThis.abilityWant = want
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    init(this, PreferencesConstants.PREFERENCES_NAME)
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    })
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
