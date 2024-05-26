import router from '@ohos.router'
@Entry
@Component
struct FriendAddPage {
  @State title: string = '添加好友'
  @State title2: string = '可能想认识的人';
  //搜索框的内容
  @State changeValue: string = ''
  @State submitValue: string = ''
  controller: SearchController = new SearchController()
  build() {
    Column() {
      //顶部导航
      Row() {
        Button() {
          Image($r("app.media.ArrowLeft"))
            .width(50)
            .height(40)
        }
        .type(ButtonType.Normal)
        .backgroundColor(Color.White)
        .onClick(()=>{
          // router.back({url:'pages/MainPage'})
          router.back()
        })
        Text()
          .width("29%")
        Text(this.title)
        Blank()
      }
      .width("100%")
      .backgroundColor(Color.White)

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

      Text(this.title2)
        .align(Alignment.Start)
        .width("90%")
        .height(35)
      Line()
        .width("100%")
        .height("1vp")
        .backgroundColor("#33182431")



    }
    .width('100%')
    .height('100%')
  }
}