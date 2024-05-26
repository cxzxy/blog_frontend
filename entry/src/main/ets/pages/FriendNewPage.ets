import router from '@ohos.router'

@Entry
@Component
struct FriendNewPage {
  @State title: string = '新朋友'
  @State add: string = '添加'
  @State message: string = '好友通知'

  build() {
    Column({ space: 10 }) {
      Row() {
        Button() {
          Image($r("app.media.ArrowLeft"))
            .width(40)
            .height(40)
        }
        .type(ButtonType.Normal)
        .backgroundColor(Color.White)
        .onClick(() => {
          router.back({ url: 'pages/MainPage' })
        })

        Blank()
        Text(this.title)
        Blank()
        Button() {
          Text(this.add)
        }
        .backgroundColor(Color.White)
        .type(ButtonType.Normal)
        .width(40)
        .height(40)
        .onClick(() => {
          //跳转添加界面
          router.pushUrl({ url: 'pages/FriendAddPage' });

        })
      }
      .width("100%")
      .backgroundColor(Color.White)

      Column() {
        Text(this.message)
          .width("90%")
          .height(30)
          .fontColor(Color.Black)

      }
      .backgroundColor(Color.White)
      .width("100%")

    }
    .backgroundColor("#e6e6e6")
    .width('100%')
    .height('100%')
  }
}