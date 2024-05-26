// import preferences from '@ohos.data.preferences';
import  preferences from '@ohos.data.preferences';

class PreferencesUtil {
  prefMap: Map<string, preferences.Preferences> = new Map()

  // 加载preferences实例
  async loadPreference(content, name: string) {
    try {
      let pref = await preferences.getPreferences(content, name)
      this.prefMap.set(name, pref)
      console.log('testTag', `加载Preferences[${name}]成功`)
    } catch (e) {
      console.log('testTag', `加载Preferences[${name}]失败`, JSON.stringify(e))
    }
  }
  // 新增数据
  async putPreferencesValue(name: string, key: string, value:
    preferences.ValueType) {
    if (!this.prefMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化`)
      return
    }
    try {
      let pref = this.prefMap.get(name)
      // 写入数据
      await pref.put(key, value)
      // 刷盘
      await pref.flush()
      console.log('testTag', `保存Preferences[${name}.${key} = ${value}]成功`)
    } catch (e) {
      console.log('testTag', `保存Preferences[${name}.${key} = ${value}]失败`,
        JSON.stringify(e))
    }
  }

  // 读取数据
  async getPreferencesValue(name: string, key: string, defaultValue:
    preferences.ValueType) {
    if (!this.prefMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化`)
    }
    try {
      let pref = this.prefMap.get(name)
      // 读取数据
      let value = await pref.get(key, defaultValue)
      console.log('testTag', `读取Preferences[${name}.${key} = ${value}]成功`)
      return value
    } catch (e) {
      console.log('testTag', `读取Preferences[${name}.${key}]失败`,
        JSON.stringify(e))
    }
  }

  // 删除数据
  async deletePreferencesValue(name: string, key: string) {
    if (!this.prefMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化`)
      return
    }
    try {
      let pref = this.prefMap.get(name)
      // 删除数据
      await pref.delete(key)
      // 刷盘
      await pref.flush()
      console.log('testTag', `删除Preferences[${name}.${key}]成功`)
    } catch (e) {
      console.log('testTag', `删除Preferences[${name}.${key}]失败`,
        JSON.stringify(e))
    }
  }
}

const preferencesUtil = new PreferencesUtil()

export default preferencesUtil as PreferencesUtil