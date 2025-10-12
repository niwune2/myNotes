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

