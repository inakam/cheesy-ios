# Module

A description of this package.

- プロジェクトを作ったらまずはWorkspaceを作ってそこにプロジェクトを入れる
  - よくわからんけどこれは定石らしい
- New -> packageからモジュールを作成
- Package.swiftを書いて、依存関係などを解消する
- アプリの設定から「Frameworks, Libraries, and Embedded Content」を探し、作成したモジュールを入れる
  - モジュールは神殿のようなアイコンのもの
  - この操作を行わないと内部のリンカがうまく動かず、クラッシュする
- MultiModuleのフォルダの方にある「ContentView.swift」は削除してしまい、import Moduleしてモジュール側のView（HomeView()とか）を呼ぶ
- とりあえずモジュール化完成！
