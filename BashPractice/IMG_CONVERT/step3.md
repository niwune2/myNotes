大丈夫です。`getopts` は最初かなりややこしいので、**不安があるのは普通**です。
今の段階で「値付きオプション」と「フラグ」の違いまで見えているので、十分進めます 👍

## Step 3

【課題】
**入力チェック**を追加してください。今回は次を確認します。

1. `-i` が指定されていること
2. `-o` が指定されていること
3. `-w` が指定されていること
4. `-f` が指定されていること
5. `input_dir` が**存在するディレクトリ**であること
6. `width` が**数値**であること
7. `format` が **jpg / jpeg / png / webp** のいずれかであること

どれか1つでも満たさなければ、

* エラーメッセージを表示
* `usage` も表示
* `exit 1`

にしてください。

---

【条件】

* まだ `mkdir -p` はしない（それは Step 4）
* まだ `magick` は使わない（それは Step 6）
* 必須項目チェックは `if [ -z "$var" ]` を使う方向でOK
* ディレクトリ存在確認は `-d`
* 数値チェックは `case` か `test` 系で行う
* `format` の許可判定は `case` で行う
* 答えはまだ出さないので、**自分で条件分岐を書いてみる**

使ってよいもの：

* `if`
* `case`
* `[ ... ]`
* `echo` または `printf`
* `exit`

---

【テスト例】

### 1. `-i` なし

```bash
./img_convert.sh -o out -w 512 -f webp
```

期待結果：

* エラー表示
* usage表示
* `exit 1`

### 2. 存在しないディレクトリ

```bash
./img_convert.sh -i no_such_dir -o out -w 512 -f webp
```

期待結果：

* `input_dir` が不正だとわかる表示
* usage表示
* `exit 1`

### 3. `width` が数値でない

```bash
./img_convert.sh -i . -o out -w abc -f webp
```

期待結果：

* `width` エラー
* usage表示
* `exit 1`

### 4. `format` が未対応

```bash
./img_convert.sh -i . -o out -w 512 -f gif
```

期待結果：

* `format` エラー
* usage表示
* `exit 1`

### 5. 正常系

```bash
./img_convert.sh -i . -o out -w 512 -f webp -b
```

期待結果：

* エラーにならない
* 今の確認用 `echo` まで進む

---

【最小ヒント】

### 必須チェック

```bash
[ -z "$input_dir" ]
```

### ディレクトリ存在確認

```bash
[ ! -d "$input_dir" ]
```

### 数値チェックの考え方

「数字だけならOK、それ以外を含んだらNG」です。

### `format` 判定

`case "$format" in ... esac` が書きやすいです。

---

✅ この知識が完成スクリプトのどこに使われるか：
**変換を始める前に不正入力を止めて、壊れた出力や意味不明な失敗を防ぐ部分になります。**
