/*
 * 好友界面
 * */
import router from '@ohos.router';

@Component
export default struct Friend {
  // private items:Array<Item>=[];
  //搜索框的内容
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State selectName: string = '';
  controller: SearchController = new SearchController()

  build() {
    Column({ space: 10 }) {
      Row({ space: 8 }) {
        Image($r("app.media.UserLogo"))
          .width('45')
          .height('45')
          .clip(new Circle({ width: '45', height: '45' }))
          // .borderRadius(45)
          .autoResize(true)
          .onClick(() => {
            router.pushUrl({ url: 'pages/ProfilePage' });
          })
        Text("好友")
          .height("30")
        Blank()
        Image($r('app.media.AddFriend'))
          .width('30')
          .height('30')
          .onClick(() => {
            router.pushUrl({ url: 'pages/FriendAddPage' });
          })
      }.justifyContent(FlexAlign.SpaceBetween)
      .width("90%")
      .height("50")

      Row() {
        Column() {
          Search({ value: this.changeValue, placeholder: '请输入搜索的内容', controller: this.controller })
            .searchButton('搜索')
            .width("95%")
            .height(40)
            .backgroundColor('#F5F5F5')
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .textFont({ size: 14, weight: 400 })
            .onSubmit((value: string) => {
              this.submitValue = value
            })
            .onChange((value: string) => {
              this.changeValue = value
            })
            .margin(15)

          Button("新好友", { type: ButtonType.Normal })
            .fontColor(Color.Black)
            .width("100%")
            .align(Alignment.Start)
            .backgroundColor(Color.White)
            .onClick(() => {
              router.pushUrl({ url: 'pages/FriendNewPage' });
            })

          Button("消息通知", { type: ButtonType.Normal })
            .width("100%")
            .align(Alignment.Start)
            .fontColor(Color.Black)
            .backgroundColor(Color.White)
            .onClick(() => {
              router.pushUrl({ url: 'pages/MessagePage' });
            })
        }

      }.backgroundColor(Color.White)
      .border({
        radius: { topLeft: 15, topRight: 15, bottomLeft: 0, bottomRight: 0 }
      })

      Column() {
        Text("好友列表")
          .width("90%")
          .height(30)
          .align(Alignment.Start)
          .fontColor(Color.Black)
        List() {
          // ForEach()
        }
      }
      .backgroundColor(Color.White)

    }
    .height("100%")
    .justifyContent(FlexAlign.Start)
    .backgroundColor("#e6e6e6")
  }
}