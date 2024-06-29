import data_preferences from '@ohos.data.preferences';
import UIAbility from '@ohos.app.ability.UIAbility';


export class preferencesUtils {
  constructor() {
  }

  async createPreferences(uiAbility: UIAbility, name: string) {
    globalThis.getBasePreferences = (() => {
      // 获取首选项实例
      let preferences: Promise<data_preferences.Preferences> = data_preferences.getPreferences(uiAbility.context, name);
      return preferences;
    });
  }

  async putData(key: string, value: any) {
    globalThis.getBasePreferences().then(async (preferences) => {
      // 保存数据
      await preferences.put(key, value);
      await preferences.flush();
      console.log('Put the value(' + key + ',' + value + ') Successfully')
    }).catch((err) => {
      console.log('Has the value failed with err: ' + err)
    });
  }

  async getData(key: string): Promise<any> {
    var data: Promise<any>
    await globalThis.getBasePreferences().then(async (preferences) => {
      data = await preferences.get(key, 'default')
    })
    return data
  }
}