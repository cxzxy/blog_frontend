import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import apiClient from '../api/HttpClient';
import axios from '@ohos/axios'
import PreferencesUtil from '../common/util/PreferencesUtil'

@Entry
@Component
struct LoginPage {
  @State account: string = '';
  @State password: string = '';
  @State isShowProgress: boolean = false;

  login(): void {
    console.log('测试数据1', JSON.stringify(this.password))
    if (this.account === '' || this.password === '') {
      promptAction.showToast({
        message: ('输入不能为空')
      })
    } else {
      this.isShowProgress = true;
      apiClient({
        url: '/login',
        method: 'post',
        data: {
          'account': this.account,
          'password': this.password
        }
      })
        .then(response => {
          // 请求成功，处理响应数据
          console.log('状态码:', response.data.code);
          console.log('状态码:', response.data.data.token);
          if (response.data.code === 200) {
            console.log("登录成功")
            PreferencesUtil.putPreferencesValue('MyPreferences', 'token', response.data.data.token)
            //跳转方法，跳到对应位置的页面，这里是跳转主页
            router.replaceUrl({ url: 'pages/MainPage' });
          }
          if (response.data.code === 201) {
            //应该加个提示框，还未加
            console.log("登录失败,该用户没有注册")
          }
          // 可以在这里设置token等认证信息
        })
        .catch(error => {
          // 请求失败，处理错误
          console.error('登录失败:', error);
        });

    }
  }

  build() {
    Column({ space: 10 }) {
      Row() {
        //一个空的文本框，让注册到右上角
        Text()
          .width("80%")
        Button("注册")
          .backgroundColor(Color.White)
          .fontColor("#29bdff")
          .onClick(() => {
            // 点击注册按键发生事件
          })
      }
      .justifyContent(FlexAlign.End)

      Row() {
        Column({ space: 15 }) {
          Image($r("app.media.LoginLogo"))
            .height(150)
            .width(150)
            .objectFit(ImageFit.Fill)
              // .border({ radius: 100 })
            .borderRadius(100)
          Text("登录界面")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .justifyContent(FlexAlign.Center)
      }
      .height(350)

      Row() {
        Text("账号:")
          .fontSize(20)
        TextInput({ placeholder: "请输入账号" })
          // .fontColor("#33182431")
          .type(InputType.Number)
          .backgroundColor(Color.White)
          .width("70%")
          .onChange((value: string) => {
            this.account = value;
            console.log('测试数据2', JSON.stringify(this.account))
          })
      }

      Line()
        .width("80%")
        .height("1vp")
        .backgroundColor("#33182431")

      Row() {
        Text("密码:")
          .fontSize(20)
        TextInput({ placeholder: "请输入密码" })
          // .fontColor("#33182431")
          .type(InputType.Password)
          .width("70%")
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            this.password = value;
            console.log('测试数据2', JSON.stringify(this.password))
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      //灰色下划线
      Line()
        .width("80%")
        .height("1vp")
        .backgroundColor("#33182431")
      Row({ space: 100 }) {
        Button("邮箱验证登录")
          .fontColor("#29bdff")
          .backgroundColor(Color.White)
          .onClick(() => {
            // 点击邮箱验证登录按键发生事件

          })
        Button("忘记密码")
          .fontColor("#29bdff")
          .backgroundColor(Color.White)
          .onClick(() => {
            // 点击忘记密码按键发生事件

          })
      }

      Button("登录")
        .width("80%")
        .onClick(() => {
          //调用登录方法，进行登录校验等操作
          this.login()
        })

    }
    //调整高度
    .height('100%')
    //调整背景颜色
    .backgroundColor(Color.White)
  }
}