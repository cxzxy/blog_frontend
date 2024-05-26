import router from '@ohos.router'
@Entry
@Component
struct MessagePage {
  @State title: string = '消息通知'
  build() {
    Column() {
      Row() {
        Button() {
          Image($r("app.media.ArrowLeft"))
            .width(50)
            .height(40)
        }
        .type(ButtonType.Normal)
        .backgroundColor(Color.White)
        .onClick(()=>{
          router.back()
        })
        Text()
          .width("29%")
        Text(this.title)
        Blank()
      }
      .width("100%")
      .backgroundColor(Color.White)
    }
    .backgroundColor("#e6e6e6")
    .width('100%')
    .height('100%')
  }
}