# サッカーコミュニティサイトになります。

# 開発環境

Windows10　×　Cloud9　×　Heroku

# 以下、機能になります。

・Account登録(プロフィール画像はGravatarと連携)  
・Account有効化(メール認証)  
・Log in状態保持(選択可)  
・Password再設定機能  
・Account情報の更新  
・Tweet投稿(添付画像可)  
・Tweet削除  
・自身とFollowerのTweet一覧表示(5件でページネーション)  
・Tweetのイイねボタン(イイねの数をカウント可)  
・Tweet検索  
・特定Tweetへの返信  
　(「@Id-名前」で指定。Idは返信したい対象者AccountページのUrlの数字。  
　名前に空白がある場合は「-」で空白を埋める。例）Id:1,名前：田中 太郎　→　@1-田中-太郎。  
・投稿者のAccountページと受信者のAccountページでのみ表示。)  
・Followボタン(Followしている数をカウント・一覧表示,Followされている数をカウント・一覧表示)  
・Follow解除ボタン  
・Followされた、Followが解除された際の通知機能(選択可)  
・User一覧表示(管理者はUserの削除可)(3件でページネーション)  
・User検索  
・Direct messeage機能  
　(メッセージを送りたい相手のAccountページからDirect messeageボタンをクリック。  
　Talk roomが作成される。Talk room内でメッセージのやり取りが可能。メッセージの削除可能。  
　Talk roomの削除可能(特定条件でエラーとなるため、要修正)。)  

# 以下、Javascript,Jquery使用箇所になります。

・Topページ　スライドショー  
・Topページ　aboutボタン　ポップアップ  
・Create my accountページ　アニメーション  
・Create my リストボックス(「好きなリーグ」に応じて「好きなチーム」リストを動的に変更)  
・Log inページ　スライドショー  
・Tweetページ　スライドショー  
・Update my accountページ　アニメーション  
・Direct MessageのTalk roomページ　アニメーション  

# 以下、テストユーザーになります。

・管理者  
  email: exampleuser10000@gmail.com  
  password: example  

・サンプルユーザー2  
  email: exampleuser20000@gmail.com  
  password: example  