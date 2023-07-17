# 概要
だいたいは以下を見ながら、ChatGPTに聞いて作りました
- https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e
- https://qiita.com/MilanistaDev/items/fce3987b02a284f5112a

# 所感
- URLを頼りにChatGPTに助けてもらった
  - [Qiita 1](https://qiita.com/MilanistaDev/items/64dca8c9d5099a19529e)
  - [さらに改良されたver](https://qiita.com/MilanistaDev/items/fce3987b02a284f5112a)
- 最初はモデル定義とモックデータだけを用意して、そこから画面をまずは作っていった
  - トップページと詳細画面を別々に作成
  - 詳細画面にいく時にIDを元にAPIにアクセスする必要があるとあると理解して、そこでfetch処理を追加
- これでSwift Concurrencyを使えているのか？という気持ちはちょっとある
  - WEB出身だからなのか、fetch処理をawait/asyncで書いて「まぁそういうもんなのでは？」みたいになった
  - Combineでビューに伝播させたりするより、この方が記述量が少なく自然に書けそうだなという気はする
- SwiftUIでは.taskを使えば非同期処理が実行できる
  - .onAppearの中でTaskを使う実装が出てくることがあるが、.taskを使えばいい
- actorが難しい
  - 非同期にアクセスされるからActorクラスを作ってみたが、こういうことなのか？となった
- ChatGPTと一緒に作るとだいぶいろいろ作れた
  - こういうコードでこういうことをしたいんだけど、と聞くと、かなり正確に教えてくれることがわかった（汎用部分のみをコピペ）
  - 無料版で使えるGPT-3.5と有料のGPT-4はかなりの知能差があるので、課金おすすめです。
# スクショ
<div style="display: flex; justify-content: space-around;">
  <img src="https://github.com/inakam/cheesy-ios/assets/23179726/0de86362-6955-4430-a508-0593fa2a76b0" style="width: 24%;" />
  <img src="https://github.com/inakam/cheesy-ios/assets/23179726/5896b512-bee8-4338-a65b-ded5bc26dadc" style="width: 24%;" />
  <img src="https://github.com/inakam/cheesy-ios/assets/23179726/795d26ac-591f-4201-8ec7-85c6fdee0c8e" style="width: 24%;" />
  <img src="https://github.com/inakam/cheesy-ios/assets/23179726/c6aa2884-708a-4708-ba5a-c25ff25a3a49" style="width: 24%;" />
</div>

# ビデオ

https://github.com/inakam/cheesy-ios/assets/23179726/e114cc33-0e57-4c90-94d5-9369813e24eb
