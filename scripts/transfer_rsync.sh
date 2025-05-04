#!/bin/bash

LOCAL_DIR="/mnt/c/wisteria_data/"
mkdir -p $LOCAL_DIR

# Wisteriaの接続情報（ユーザー名、ホスト名、ディレクトリを適宜修正）
REMOTE_USER="n46001"
REMOTE_HOST="wisteria.t.u-tokyo.ac.jp"
REMOTE_DIR="/home/n46001/data/"

# rsyncコマンド実行（差分を効率的に転送）
rsync -avzh --progress "$LOCAL_DIR" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
