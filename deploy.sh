#!/bin/bash

MSG="deploy: $(date '+%Y-%m-%d %H:%M')"

echo "==============================="
echo "$MSG"
echo "==============================="

if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to commit"
else
  git add .
  git commit -m "$MSG"
  git push
fi

hexo clean
hexo g -d

echo "Deploy finished!"
