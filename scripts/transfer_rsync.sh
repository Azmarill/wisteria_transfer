#!/bin/bash

LOCAL_DIR="/mnt/c/wisteria_data/"
mkdir -p $LOCAL_DIR

if [-z "$1"] || [-z "$2"]; then
   echo "スクリプトの後にユーザー名とモードを入力してください: $0 <ユーザー名> [push|pull]"
   exit 1
fi

REMOTE_USER="$1"
REMOTE_HOST="wisteria.t.u-tokyo.ac.jp"
REMOTE_DIR="/home/${REMOTTE_USER}/data/"
MODE="$2"

if ["$MODE"="push"]; then
   echo "ユーザ ${REMOTE_USER}として${REMOTE_HOST}にデータを転送します~"
   rsync -avzh --progress "$LOCAL_DIR" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"

elif ["$MODE"="pull"]; then
   echo "ユーザ ${REMOTE_USER}として${REMOTE_HOST}からデータを取得します~"
   rsync -avzh --progress "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}" "$LOCAL_DIR"

else
   echo"モードが設定されていません。pushもしくはpullを指定してください。"
   exit 1
fi
