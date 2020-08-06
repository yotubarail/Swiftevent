# Swiftevent

connpassからSwift関連のイベントのデータを持ってくるアプリです。  
Swift UI中心に作っていくことを目標にしています。

## 問題点
・connpassのユーザー名を入れた後、アプリを再起動しないとListに自分が参加したイベントが表示できない（issueに記述）  

・Listだとseparatorが消えないためScrollViewを取り入れてみたところ、Rowにそれぞれのデータを表示することは可能だがページの遷移がうまくいかなかった（現在はListを使用している）  

・ScrollViewの際にタイトルが一部しか表示されない  

・地図画面を開いた後画面の向きを変えると、別のイベントの場所も表示されてしまう（実機のみで確認できるバグ）  

・地図画面を開いた後画面の向きを変えると、たまに完了ボタンが効かなくなる（実機のみで確認できるバグ）  

・SFSafariViewはNavigationLinkだとBarが2つ表示されてしまうため、sheetでの画面遷移としている。Modalとして表示されるが、下スワイプではなく左からのスワイプで閉じてしまう。  

・シミュレーター（iPhone)ではおそらく横がRegularの時にListがiPadと同じ動きになる（手元のiPhone Xsではこの挙動は確認できない）  


## 参考リンク
<a href="https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e">【SwiftUI】外部APIを叩いて取得した結果をListに表示する</a>  

<a href="https://www.it-swarm.dev/ja/swift/複数のシート（ispresented-がswiftuiで機能しない/813529631/">複数のシート（isPresented :)がSwiftUIで機能しない</a>  

<a href="https://qiita.com/chino_tweet/items/73e6df230ab77a2f5887">【SwiftUI】MapKitを導入して地図を表示する</a>  

<a href="https://developer.apple.com/jp/xcode/swiftui/">Apple公式</a>  

 <a href="https://connpass.com/about/api/">connpass API</a>
