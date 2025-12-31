#!/bin/bash

# エラーログの比率を確認するために、app.log の中から文字列 ERROR を含む行数と、ログ全体の行数をそれぞれ grep と wc を組み合わせて調べ、その結果をもとに、エラー比率が 50% 以上なら HIGH ERROR、50% 未満なら NORMAL と表示するスクリプト check_error_rate.sh を作


