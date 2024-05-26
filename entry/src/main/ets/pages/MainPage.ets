import First from '../view/First';
import Friend from '../view/Friend'
import Me from '../view/Me';
import PreferencesUtil from  '../common/util/PreferencesUtil';

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  // async aboutToAppear(){
  //   // let pref = PreferencesUtil.
  // }
  @Builder
  TabBuilder(title: string, targetIndex: number, selectedImg: Resource,
             normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg :normalImg )
        .size({ width: 30, height: 30 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1296db' : '#8a8a8a')
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent() {
          First()
        }
        .tabBar(this.TabBuilder('首页',0,$r('app.media.MainSelect'),$r('app.media.MainNormal')))

        TabContent() {
            Friend()
        }
        .tabBar(this.TabBuilder('好友',1,$r('app.media.FriendSelect'),$r('app.media.FriendNormal')))

        TabContent() {
            Me()
        }
        .tabBar(this.TabBuilder('我的',2,$r('app.media.MeSelect'),$r('app.media.MeNormal')))
      }.onChange( index =>{
        console.log('当前选择选项改变：'+index)
        this.currentIndex=index
      })
    }
  }
}
