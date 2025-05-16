#!/bin/bash

LOCAL_DIR="/mnt/c/wisteria_data/"
mkdir -p $LOCAL_DIR

if [-z "$1"]; then
   echo "スクリプトの後にユーザー名を入力してください: $0 <ユーザー名>"
   exit 1
fi

REMOTE_USER="$1"
REMOTE_HOST="wisteria.t.u-tokyo.ac.jp"
REMOTE_DIR="/home/${REMOTTE_USER}/data/"

echo "ユーザ ${REMOTE_USER}として${REMOTE_HOST}にデータを転送します~"
rsync -avzh --progress "$LOCAL_DIR" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
