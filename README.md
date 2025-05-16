# wisteria\_transfer

このリポジトリは、東京大学のスパコン **wisteria** とローカルのWindows/Mac PC（WSL環境）間で、ファイルを効率よく双方向（push/pull）に転送するためのスクリプトを提供します。

## 利用方法

スクリプトを使用するには、以下のコマンドをWSL上で実行します。

### データをローカルからwisteriaへ送信（push）する場合

```bash
./scripts/transfer_rsync.sh <ユーザー名> push
```

### データをwisteriaからローカルへ取得（pull）する場合

```bash
./scripts/transfer_rsync.sh <ユーザー名> pull
```

### 例

ユーザー名が`n46001`の場合：

```bash
# データをwisteriaへ送信する場合
./scripts/transfer_rsync.sh n46001 push

# データをwisteriaから受信する場合
./scripts/transfer_rsync.sh n46001 pull
```

## 初期設定方法

事前に以下の設定を済ませておく必要があります。

### 1. WSLの導入

Windows/MacにWSLを導入します。

* [WSLインストールガイド（公式）](https://learn.microsoft.com/ja-jp/windows/wsl/install)

### 2. SSH鍵の作成・設定

wisteriaへの鍵登録が住んでいない方は、公式のドキュメントに従って登録を行ってください。

* [wisteria利用支援ポータル](https://wisteria-www.cc.u-tokyo.ac.jp/cgi-bin/hpcportal.ja/index.cgi)

GitHubに公開鍵の登録を行ってください。

* [GitHub Docks](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### 3. ローカルのデータディレクトリ準備

以下のディレクトリを作成しておきます。

* Windows/Macの場所:

  ```
  C:\wisteria_data\push
  C:\wisteria_data\pull
  ```

* WSLからのアクセスパス:

  ```
  /mnt/c/wisteria_data/push
  /mnt/c/wisteria_data/pull
  ```

転送したいファイルを`push`ディレクトリに置きます。

## 注意点

* 毎回パスワード入力が求められるのでめんどくさいですが、wisteriaはパスフレーズありの公開鍵登録を推奨しています。
* スクリプトの実行時に、転送方向（push/pull）を必ず指定してください。

## ライセンス

このプロジェクトはMITライセンスで提供されています。詳細は[LICENSE](LICENSE)を参照してください。
