#!/bin/bash

DEFAULT_MSG="Site updated: $(date '+%Y-%m-%d %H:%M')"

echo "请输入提交信息（直接回车使用默认）："
read INPUT_MSG

if [ -z "$INPUT_MSG" ]; then
  MSG="$DEFAULT_MSG"
else
  MSG="$INPUT_MSG"
fi

echo ""
echo "📦 提交信息：$MSG"
echo "==============================="

# 检查是否有变更
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "✅ 没有需要提交的变更"
  exit 0
fi

git add .
git commit -m "$MSG"

echo ""
echo "🚀 正在推送到 origin source..."
git push origin source

echo ""
echo "✅ 推送完成！GitHub Actions 将自动构建部署。"