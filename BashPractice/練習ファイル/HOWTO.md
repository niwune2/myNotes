# 目的（何のために作るか）

- [目的（何のために作るか）](#目的何のために作るか)
- [全体構成（ディレクトリ例）](#全体構成ディレクトリ例)
- [実行順・フェーズ（短いスプリントで）](#実行順フェーズ短いスプリントで)
- [スクリプト：練習用ファイル一式を作る（`create_practice_files.sh`）](#スクリプト練習用ファイル一式を作るcreate_practice_filessh)
- [追加スクリプト：ImageMagick で多サイズ画像を作る（`gen_images.sh`）](#追加スクリプトimagemagick-で多サイズ画像を作るgen_imagessh)
- [練習課題（作成したファイルで何を練習するか）](#練習課題作成したファイルで何を練習するか)
- [代表的な「やり方」ルール（伝統的・安全）](#代表的なやり方ルール伝統的安全)
- [次の現実的ステップ（すぐやる）](#次の現実的ステップすぐやる)

---

- 日常的に行うファイル操作（リネーム、検索、フィルタ、集計、圧縮、移動）を安全に練習するための「手元データ」を用意する。
- ImageMagick や rsync、git など外部ツールとの連携練習を可能にする。
- ログ解析（`grep`/`awk`/`sed`）や容量操作（大きなファイルの検索）の実践場にする。

# 全体構成（ディレクトリ例）

```txt
practice_workspace/
  ├── images/            # いろいろなサイズの画像サンプル
  ├── sketches/          # 手描きスキャンを想定した画像
  ├── cad_placeholders/  # .skp, .dwg など（実ファイルではなくプレースホルダ）
  ├── docs/              # テキスト・md・csv・json
  ├── logs/              # ログファイル（"error" を含む行あり）
  ├── bin/               # 練習用バイナリ（大きさ違い）
  ├── scripts/           # 作成したスクリプト群（自己復習用）
  └── gitrepo/           # git 練習用リポジトリ
```

# 実行順・フェーズ（短いスプリントで）

1. フェーズA（準備） — ディレクトリ作成とサンプルファイル自動生成
2. フェーズB（基本練習） — `cp mv rm find grep` 等のコマンド練習問題を実行
3. フェーズC（応用） — 画像一括処理、ログ集計、rsync/cron/git 演習
4. フェーズD（発展） — スクリプト化して配布、Docker 化や cron 登録

以下にフェーズAで使える「今すぐ使えるスクリプト」を用意します。Mac / Linux / iSH 環境で動くよう、外部コマンドの有無はチェックします。

---

# スクリプト：練習用ファイル一式を作る（`create_practice_files.sh`）

```bash
#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-practice_workspace}"
echo "作成先: ${ROOT}"

mkdir -p "${ROOT}"/{images,sketches,cad_placeholders,docs,logs,bin,scripts,gitrepo}

# docs: テキスト / CSV / JSON
for i in $(seq 1 5); do
  printf "これはサンプルドキュメント %02d\n作成日: %s\n" "$i" "$(date)" > "${ROOT}/docs/doc_${i}.txt"
done
cat > "${ROOT}/docs/sample.csv" <<'CSV'
id,name,qty,price
1,鉛筆,10,120
2,消しゴム,5,80
3,ノート,3,450
CSV

cat > "${ROOT}/docs/sample.json" <<'JSON'
{"project":"practice","author":"you","items":[{"name":"pencil","qty":10},{"name":"eraser","qty":5}]}
JSON

# logs: エラー行含むログ
for i in $(seq 1 3); do
  for j in $(seq 1 50); do
    if (( j % 17 == 0 )); then
      echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: サンプルエラー行 ${j}" >> "${ROOT}/logs/app_${i}.log"
    else
      echo "$(date '+%Y-%m-%d %H:%M:%S') INFO: 正常処理 ${j}" >> "${ROOT}/logs/app_${i}.log"
    fi
  done
done

# bin: ダミー大きめファイル（容量違い）
# dd が使えるか確認。iSH や Mac でも動作するように head fallback を用意。
create_dummy() {
  local f=$1 size=$2
  if command -v dd >/dev/null 2>&1; then
    dd if=/dev/zero of="${f}" bs=1 count=0 seek="${size}" 2>/dev/null || head -c "${size}" </dev/zero >"${f}"
  else
    head -c "${size}" </dev/zero >"${f}"
  fi
}
create_dummy "${ROOT}/bin/dummy_small.bin" 1024      # 1 KB
create_dummy "${ROOT}/bin/dummy_medium.bin" 1048576  # 1 MB
create_dummy "${ROOT}/bin/dummy_large.bin" 5242880   # 5 MB

# cad_placeholders: 実ファイルは作れないのでプレースホルダにメタ情報
for name in "site_plan" "bridge_section" "entrance_detail"; do
  echo "Placeholder for ${name}.skp - created on $(date)" > "${ROOT}/cad_placeholders/${name}.skp"
  echo "Placeholder for ${name}.dwg - created on $(date)" > "${ROOT}/cad_placeholders/${name}.dwg"
done

# images: ImageMagick があれば画像を自動生成
if command -v convert >/dev/null 2>&1 || command -v magick >/dev/null 2>&1; then
  IMGCMD="${MAGICK:-convert}"
  if command -v magick >/dev/null 2>&1; then
    IMGCMD="magick"
  else
    IMGCMD="convert"
  fi
  echo "ImageMagick を使って画像を作成します（コマンド: ${IMGCMD}）"
  "${IMGCMD}" -size 900x1126 xc:lightgray -gravity center -pointsize 48 -annotate +0+0 "900x1126" "${ROOT}/images/img_900x1126.png"
  "${IMGCMD}" -size 700x700 xc:lightblue  -gravity center -pointsize 48 -annotate +0+0 "700x700" "${ROOT}/images/img_700x700.png"
  "${IMGCMD}" -size 500x626 xc:lightgreen -gravity center -pointsize 36 -annotate +0+0 "500x626" "${ROOT}/images/img_500x626.png"
  "${IMGCMD}" -size 1200x800 xc:salmon -gravity center -pointsize 48 -annotate +0+0 "1200x800" "${ROOT}/images/img_1200x800.png"
else
  echo "ImageMagick が見つかりません。画像ファイルのプレースホルダを作成します。"
  for size in 900x1126 700x700 500x626 1200x800; do
    echo "PNG placeholder ${size}" > "${ROOT}/images/img_${size}.png.txt"
  done
fi

# スクリプト自身を保存（学習用）
cp -- "$0" "${ROOT}/scripts/$(basename "$0")" 2>/dev/null || true

# gitrepo: 初期コミット（git がなければスキップ）
if command -v git >/dev/null 2>&1; then
  (cd "${ROOT}/gitrepo" && git init >/dev/null && echo "README for git practice" > README.md && git add README.md && git commit -m "Initial README" >/dev/null)
  echo "git repo 作成済み: ${ROOT}/gitrepo"
else
  echo "git が見つかりません。gitrepo は作成しませんでした。"
fi

echo "完了: ${ROOT} 内に練習用ファイルを作成しました。"
```

使い方（一例）：

```bash
chmod +x create_practice_files.sh
./create_practice_files.sh my_practice
```

---

# 追加スクリプト：ImageMagick で多サイズ画像を作る（`gen_images.sh`）

```bash
#!/usr/bin/env bash
set -euo pipefail

OUTDIR="${1:-images}"
mkdir -p "$OUTDIR"

IMGCMD="convert"
if command -v magick >/dev/null 2>&1; then
  IMGCMD="magick"
fi

sizes=( "500x626" "700x700" "900x1126" "1200x800" )
for s in "${sizes[@]}"; do
  ${IMGCMD} -size "${s}" xc:white -gravity center -pointsize 40 -annotate +0+0 "${s}" "${OUTDIR}/img_${s}.png"
done
```

---

# 練習課題（作成したファイルで何を練習するか）

レベル別に例を出します。各課題はコマンド一発で終わらせるかスクリプト化して下さい。

初級

- `find practice_workspace -type f -name "*.png"` で画像一覧を出す。
- `grep ERROR practice_workspace/logs/*.log` でエラー行を抽出する。
- `for f in practice_workspace/docs/*.txt; do mv "$f" "${f%.txt}.md"; done` で拡張子変更。

中級

- 画像を幅700pxにリサイズして `thumbnails/` に保存する（ImageMagick + ループ）。
- `find . -size +1M -exec ls -lh {} \;` で 1MB 以上のファイルを探す。
- `awk -F, '{sum += $4} END{print sum}' sample.csv` で CSV の合計金額を出す。

上級

- `find` と `xargs -P` を使って並列で画像を最適化する。
- 日次ログから「エラー件数」「ユニークなエラーメッセージ」を抽出してレポート出力（`awk`/`sort`/`uniq -c`）。
- git リポジトリにある特定拡張子の変更履歴を抽出して差分をまとめる。

# 代表的な「やり方」ルール（伝統的・安全）

- 破壊的操作（`rm`）は常に `--interactive` や `-i`、あるいは最初は `echo` を挟む。
- スクリプト冒頭に `set -euo pipefail` を置き、未定義変数や失敗を早期に検出する。
- 大事なファイルを触るスクリプトはまず `--dry-run` 相当を実装する（`echo` して確認）。
- ファイル名にスペース可能性がある場合は `"$var"` を必ず使う。
- ログや出力は `logs/` にまとめ、ローテーション方法を決める。

# 次の現実的ステップ（すぐやる）

1. 上の `create_practice_files.sh` をこのチャットからコピペして実行する（一番手っ取り早い）。
2. 出来上がったファイル群で、初級の課題を順にこなす。
3. 1週間でフェーズB〜Cを回し、スクリプト化→cron化→git管理へ進める。

---

準備はこれで完了です。ご希望なら、今貼ったスクリプトをあなたの好み（命名規則・ファイル数・画像サイズ・ログ行数など）に合わせて即座に調整したバージョンを作ります。そのまま実行可能な形で用意して渡します。どう変えたいかは指示不要で、こちらで伝統的な命名規則（例：`project_YYYYMMDD_name_v01.ext`）を適用しても構いません。
