#!/usr/bin/bash

# 配置变量
GARDEN_DIR="$HOME/niwa"                                 # 项目根目录
NOTES_DIR="$GARDEN_DIR/notes"                           # 每篇笔记的目录
SCRIPTS_DIR="$GARDEN_DIR/scripts"                       # 脚本文件目录
PUBLIC_DIR="$GARDEN_DIR/public"                         # html文件目录
TEMPLATE_FILE="$GARDEN_DIR/template/template.org"       # 模板文件目录

# 命令
COMMAND_NEW="new"       # 新建笔记
COMMAND_BUILD="build"

new_note() {
    file_name=$1
    cp $TEMPLATE_FILE "$NOTES_DIR/${file_name}.org" && echo "创建笔记成功：$NOTES_DIR/${file_name}.org"
    echo "#+EXPORT_FILE_NAME: $PUBLIC_DIR/${file_name}.html" >> "$NOTES_DIR/${file_name}.org"
}

build() {
    emacs --batch \
        --no-init-file \
        --no-site-file \
        -l "${SCRIPTS_DIR}/publish.el" \
        --eval "(setq package-archives '((\"gnu\" . \"https://elpa.gnu.org/packages/\") (\"melpa\" . \"https://melpa.org/packages/\")))" \
        --eval "(package-initialize)" \
        --eval "(unless (package-installed-p 'org) (package-refresh-contents) (package-install 'org))" \
        --eval "(unless (package-installed-p 'htmlize) (package-refresh-contents) (package-install 'htmlize))" \
        --eval "(org-publish-project \"niwa\" t)"
}

if test $1 = $COMMAND_NEW; then
    new_note $2
fi

if test $1 = $COMMAND_BUILD; then
    build
fi
