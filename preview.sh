#!/bin/bash

echo "==============================="
echo " Hexo Local Preview (Clean)"
echo "==============================="

# 确保在脚本所在目录执行
cd "$(dirname "$0")" || exit 1

hexo clean || exit 1

hexo g || exit 1

hexo s
