# iSH_memo

- [iSH\_memo](#ish_memo)
  - [目的と全体像](#目的と全体像)
  - [前提（必要なもの）](#前提必要なもの)
  - [1. iSHの初期セットアップ](#1-ishの初期セットアップ)
  - [2. Gitの基本設定（最初に一度だけ）](#2-gitの基本設定最初に一度だけ)
  - [3. 認証方式の選択（実用順）](#3-認証方式の選択実用順)
  - [4-A. 「HTTPS＋PAT」手順（基本ルート）](#4-a-httpspat手順基本ルート)
  - [4-B. 「SSH鍵」手順（入力ゼロ運用）](#4-b-ssh鍵手順入力ゼロ運用)
  - [5. リポジトリ操作の基本フロー](#5-リポジトリ操作の基本フロー)
  - [6. つまずき対処（原因→対策が直結する一覧）](#6-つまずき対処原因対策が直結する一覧)
  - [7. 運用のコツ（安全・快適）](#7-運用のコツ安全快適)
  - [次の一手（実行チェック）](#次の一手実行チェック)
  - [結論](#結論)
  - [まず現状確認（安全）](#まず現状確認安全)
  - [どこにリポジトリがあるか探す](#どこにリポジトリがあるか探す)
  - [状況別の復旧手順](#状況別の復旧手順)
    - [１）既にリポジトリがある（.gitが見つかった）場合](#１既にリポジトリがあるgitが見つかった場合)
    - [２）まだ作っていない（.gitがどこにも無い）場合](#２まだ作っていないgitがどこにも無い場合)
    - [３）GitHubから取り直したい場合（clone）](#３githubから取り直したい場合clone)
  - [ありがちなハマり所チェック](#ありがちなハマり所チェック)
  - [ここまでの最短復旧コマンド（多くのケースで有効）](#ここまでの最短復旧コマンド多くのケースで有効)
  - [結論](#結論-1)
  - [１．今いる場所とブランチ](#１今いる場所とブランチ)
  - [２．最新状態かどうか（メッセージで判定）](#２最新状態かどうかメッセージで判定)
  - [３．直近の取得履歴を可視化](#３直近の取得履歴を可視化)
  - [４．「pull で何が入ったか」だけ見たい](#４pull-で何が入ったかだけ見たい)
  - [５．衝突が起きていないか](#５衝突が起きていないか)
  - [６．上流設定がまだなら付けておく（便利化）](#６上流設定がまだなら付けておく便利化)
  - [７．書き込み権限の最終チェック（小テスト）](#７書き込み権限の最終チェック小テスト)
  - [８．次に困ったら見る早見表](#８次に困ったら見る早見表)
  - [補足（表示を見やすく）](#補足表示を見やすく)
  - [つぎの一歩](#つぎの一歩)

## 目的と全体像

- iPhone上のiSHでGitHubに接続し、clone・commit・push・pullを安定して行うまでを、ゼロから手順化します
- 認証は「HTTPS＋個人用アクセストークン（PAT）」を基本に、代替として「SSH鍵」も用意します

---

## 前提（必要なもの）

- App Storeから iSH（無料）をインストール済み
- GitHub個人アカウント（ログイン可能）
- iPhoneのコピー＆ペーストが使えること（PAT貼り付けで必須）

---

## 1. iSHの初期セットアップ

iSHを開いて、最低限のパッケージを入れます。Alpine Linuxベースなので `apk` を使います。

```sh
apk update
apk add git ca-certificates openssh vim nano
update-ca-certificates
```

補足

- git…本体
- ca-certificates…HTTPSでGitHubへ接続するための証明書束
- openssh…SSH方式を使う可能性に備える（後述）
- vim / nano…エディタ（好みで）

必要ならBash化（必須ではありません）

```sh
apk add bash
chsh -s /bin/bash
```

---

## 2. Gitの基本設定（最初に一度だけ）

```sh
git config --global user.name  "あなたのGitHubユーザー名"
git config --global user.email "あなたのメールアドレス"
git config --global init.defaultBranch main
git config --global color.ui auto
```

確認

```sh
git config -l
```

---

## 3. 認証方式の選択（実用順）

- まずは「HTTPS＋PAT」がおすすめ（最短・確実）
- 慣れてきたら「SSH鍵」で毎回の入力ゼロに

---

## 4-A. 「HTTPS＋PAT」手順（基本ルート）

手順A：GitHubでトークン（PAT）を作成

- GitHubにブラウザでログイン
- 右上のアイコン → Settings → Developer settings → Personal access tokens
- Fine-grained token を新規作成

  - Repository access：Only select repositories → 対象リポジトリ（例：`myNotes`）を選択
  - Repository permissions：Contents → Read and write を有効化
  - 有効期限を設定 → Generate → 表示されたトークンを必ずコピー（後で再表示不可）

メモ

- どうしても権限でつまずく場合は、切り分け用に「Tokens (classic)」で `repo` scope のPATを一時的に使うと確実に通ります（後でFine-grainedに置換を推奨）

手順B：iSHでpush（初回だけPAT入力）

1. 既存リポジトリならリモートURLをHTTPSで統一

```sh
git remote set-url origin https://github.com/<ユーザー名>/<リポジトリ>.git
git remote -v
```

2. push（初回のみ「Username / Password」入力が出る）

```sh
git push origin main
# Username: あなたのGitHubユーザー名
# Password: さきほどコピーしたPATをペースト
```

便利オプション（再入力を減らす）

- 一時キャッシュ（安全寄り、例：6時間）

```sh
git config --global credential.helper 'cache --timeout=21600'
```

- 永続保存（平文、自己責任）

```sh
git config --global credential.helper store
# 初回入力後、~/.git-credentials に平文保存される
```

---

## 4-B. 「SSH鍵」手順（入力ゼロ運用）

手順A：鍵作成（ed25519推奨）

```sh
ssh-keygen -t ed25519 -C "iSH on iPhone" -f ~/.ssh/id_ed25519
# パスフレーズは任意（推奨）
```

手順B：公開鍵をGitHubへ登録

```sh
cat ~/.ssh/id_ed25519.pub
```

- 表示された内容をコピー
- GitHub → Settings → SSH and GPG keys → New SSH key → 貼り付け → Save

手順C：リモートURLをSSHに変更してテスト

```sh
git remote set-url origin git@github.com:<ユーザー名>/<リポジトリ>.git
ssh -T git@github.com    # "Hi <ユーザー名>!" が出れば成功
git push origin main
```

---

## 5. リポジトリ操作の基本フロー

新規に空のリポジトリを作ってpushする例

```sh
mkdir myNotes && cd myNotes
git init
echo "# myNotes" > README.md
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/<ユーザー名>/myNotes.git  # またはSSH版
git push -u origin main
```

既存リポジトリをcloneして作業する例

```sh
git clone https://github.com/<ユーザー名>/<リポジトリ>.git
cd <リポジトリ>
# 変更して
git add .
git commit -m "update"
git push origin main
```

pullして最新化

```sh
git pull origin main
```

---

## 6. つまずき対処（原因→対策が直結する一覧）

403（access denied / permission）

- 原因：PAT権限不足、対象リポジトリ未選択、ブランチ保護
- 対策：Fine-grainedなら Contents: Read and write をON、対象Repoを明示。保護ルールがあれば確認

401（invalid username or token）

- 原因：PAT貼り間違い・期限切れ・古い資格情報が残っている
- 対策：資格情報のクリア後、正しいPATで再入力

```sh
git credential-cache exit
rm -f ~/.git-credentials
git config --global --unset credential.helper 2>/dev/null || true
```

「Support for password authentication was removed」

- 原因：GitHubはアカウントパスワードでのGit操作を廃止済み
- 対策：必ずPATかSSHを使う

URLタイプ混在（HTTPSとSSHがごちゃ）

- 原因：remoteが混ざっている
- 対策：どちらかに統一（`git remote -v` で確認、`git remote set-url` で修正）

ブランチ名相違（mainかmasterか）

- 原因：push先名の誤り
- 対策：現在ブランチを確認し、それをpush

```sh
git branch --show-current
git push origin <上の結果>
```

SSL証明書問題

- 原因：証明書束不足
- 対策：`apk add ca-certificates && update-ca-certificates`

iOSのペースト癖

- 原因：PAT貼り付け時に末尾の空白や改行が入ることがある
- 対策：貼り付け直前後で不要な改行が入っていないか確認

---

## 7. 運用のコツ（安全・快適）

- PATは用途ごと（iSH用など）に分けて最小権限で発行、期限も短めにして定期ローテーション
- 二段階認証（2FA）は有効化しておく
- iSH側では `credential.helper cache` を使い、平文保存は避けるのが無難
- リモートURL・ブランチ名・ユーザー設定の3点をREADMEにメモしておくと復旧が速い

---

## 次の一手（実行チェック）

- いま使いたいリポジトリで、上から順に「4-A → 5」のコマンドをそのまま実行し、`git push` まで通しておく
- 毎回の入力が面倒に感じたら「4-B SSH鍵」に移行
- 画像整理スクリプト等は `scripts/` ディレクトリを切って小さく積み上げると、復習と実用がシームレスになります

実行中に新しいエラーが出たら、そのメッセージを丸ごと貼ってください。原因を最短手数で切り分けます。

## 結論

そのメッセージは「ここはGitリポジトリじゃない（.gitが無い）」という意味です。
場所（カレントディレクトリ）が外れているか、まだ `git init` していません。

---

## まず現状確認（安全）

```sh
pwd
ls -a
git status
```

出力に `.git/` が無ければ、そこはリポジトリではありません。

---

## どこにリポジトリがあるか探す

```sh
# ホーム配下をざっくり検索
find ~ -name ".git" -type d 2>/dev/null
```

例えば `~/myNotes/.git` が見つかったら、

```sh
cd ~/myNotes
git status
```

でリポジトリに入れているか確認します。

---

## 状況別の復旧手順

### １）既にリポジトリがある（.gitが見つかった）場合

```sh
cd ~/myNotes                # 見つかった場所へ移動
git remote -v               # origin があるか確認
```

* `origin` がある → URLだけ直したい

  ```sh
  git remote set-url origin https://github.com/niwune2/myNotes.git
  ```
* `origin` が無い → 新規に追加

  ```sh
  git remote add origin https://github.com/niwune2/myNotes.git
  ```

### ２）まだ作っていない（.gitがどこにも無い）場合

新規で初期化して最初のpushまで通します。

```sh
mkdir -p ~/myNotes
cd ~/myNotes
git init
git branch -M main

echo "# myNotes" > README.md
git add .
git commit -m "first commit"

git remote add origin https://github.com/niwune2/myNotes.git
git push -u origin main    # パスワード欄はPAT
```

### ３）GitHubから取り直したい場合（clone）

```sh
cd ~
git clone https://github.com/niwune2/myNotes.git
cd myNotes
git status
```

---

## ありがちなハマり所チェック

* URLの改行・スペース混入
  あなたのコマンドは途中で改行されています。URLは **1行で** 入れてください。
  例：`https://github.com/niwune2/myNotes.git`
* ブランチ名の食い違い

  ```sh
  git branch --show-current
  ```

  で `main` か `master` か確認して、push先を合わせる。
* 資格情報の取り違い
  403や401が続く場合はキャッシュを一度クリア。

  ```sh
  git credential-cache exit
  git config --global --unset credential.helper 2>/dev/null || true
  ```

---

## ここまでの最短復旧コマンド（多くのケースで有効）

```sh
cd ~/myNotes            # あれば。無ければ「２）新規」か「３）clone」を実施
git status
git remote -v
git remote set-url origin https://github.com/niwune2/myNotes.git
git push origin main
```

この順で「場所を正す → originを整える → push」の三段で直ります。
道に迷ったら `pwd` と `ls -a`、Gitで迷ったら `git status`。これで迷子の9割は帰宅できます。

## 結論

`git pull origin main` が通ったなら、ほぼ成功です。あとは「本当に最新を取れているか」を確認しましょう。下のチェックを上から順に実行すれば判定できます。

---

## １．今いる場所とブランチ

```bash
pwd
git branch --show-current
git remote -v
```

* `pwd` が `~/myNotes`
* ブランチが `main`
* `origin` のURLが `https://github.com/niwune2/myNotes.git`（またはSSH）
  ならOK。

---

## ２．最新状態かどうか（メッセージで判定）

```bash
git status
```

* `Your branch is up to date with 'origin/main'.` と出れば最新。
* それ以外でも赤字なしでクリーンなら、とりあえず整っています。

---

## ３．直近の取得履歴を可視化

```bash
git log --oneline --graph --decorate -n 10
```

* 左の枝線（graph）とコミットIDが見えます。
* 先頭に `(HEAD -> main, origin/main)` のように **HEAD と origin/main が同じ**なら同期済み。

---

## ４．「pull で何が入ったか」だけ見たい

```bash
git reflog -n 5
```

* 直近操作の履歴が出ます。`pull: Fast-forward` 等があれば、取得で先へ進んだことが確認できます。

---

## ５．衝突が起きていないか

```bash
git diff --name-only --diff-filter=U
```

* 何も出なければコンフリクトなし。
* 出たらそのファイルで衝突中です（今回は出ない想定）。

---

## ６．上流設定がまだなら付けておく（便利化）

初回だけやれば、次回から `git pull` だけでOKになります。

```bash
git branch -u origin/main
git branch -vv
```

* `main 1234abc [origin/main]` のように見えれば設定完了。

---

## ７．書き込み権限の最終チェック（小テスト）

「pull はOK、push もOK」を一度確認しておくと安心です。

```bash
echo "ok $(date)" >> ish_check.txt
git add ish_check.txt
git commit -m "iSH check: add marker"
git push origin main
```

* これでGitHub上の `myNotes` に `ish_check.txt` が増えれば、往復できています。
* いらなければ後で削除コミットすればOK。

---

## ８．次に困ったら見る早見表

```bash
# 迷子対策
pwd && ls -a && git status

# 取得だけ先に
git fetch --prune
git log --oneline --decorate -n 5 origin/main

# 早めに失敗させて安全（余計なマージを避けたいとき）
git pull --ff-only
```

---

## 補足（表示を見やすく）

```bash
git config --global color.ui auto
git config --global pager.log less
```

ログが色付き・読みやすくなります。

---

## つぎの一歩

画像整理スクリプトの置き場を `scripts/` に決めて、`README.md` に「使い方ワンライナー」を1行だけ書いておくと未来の自分が助かります。必要ならテンプレを用意します。
