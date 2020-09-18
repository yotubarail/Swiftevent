# Swiftevent

connpassからイベントのデータを持ってくるアプリです。  
SwiftUI中心に作っていくことを目標にしています。

## 問題点

### iOS14上での問題
① NavigationBarItemがある状態ではRowをタップした時のページ遷移がうまくいかない（引数がうまく渡されない）  

② NavigationBarItemがある状態では.listRowInsets(EdgeInsets())が効かない  

③ ActionSheetを用いてページの遷移先を切り替えるときに遷移がうまくいかない（引数がうまく渡されない）  

現在①,②はXcode 12を使ってiOS14のシミュレーターや実機でビルドした場合のみ起こり、③はiOS14全体で起こることが確認できている  

### SwiftUIでの問題点
・Listだとseparatorが消えないためScrollViewを取り入れてみたところ、Rowにそれぞれのデータを表示することは可能だがページの遷移がうまくいかなかった（現在はListを使用している）  

・ScrollViewの際にタイトルが一部しか表示されない  

・地図画面を開いた後画面の向きを変えると、別のイベントの場所も表示されてしまう（実機のみで確認できるバグ、現在は横向き対応していない）  

・地図画面を開いた後画面の向きを変えると、たまに完了ボタンが効かなくなる（実機のみで確認できるバグ、現在は横向き対応していない）  

・SFSafariViewはNavigationLinkだとBarが2つ表示されてしまうため、sheetでの画面遷移としている。Modalとして表示されるが、下スワイプではなく左からのスワイプで閉じてしまう。  

・シミュレーター（iPhone)ではおそらく横がRegularの時にListがiPadと同じ動きになる（現在は横向き対応していない）  

・UITableView.appearance()でセパレーターを消すことにしたが、動作の様子はあまり良くない


## 参考リンク
<a href="https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e">【SwiftUI】外部APIを叩いて取得した結果をListに表示する</a>  

<a href="https://www.it-swarm.dev/ja/swift/複数のシート（ispresented-がswiftuiで機能しない/813529631/">複数のシート（isPresented :)がSwiftUIで機能しない</a>  

<a href="https://qiita.com/chino_tweet/items/73e6df230ab77a2f5887">【SwiftUI】MapKitを導入して地図を表示する</a>  

<a href="https://developer.apple.com/jp/xcode/swiftui/">Apple公式</a>  

 <a href="https://connpass.com/about/api/">connpass API</a>
