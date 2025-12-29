#!/bin/bash

DEFAULT_MSG="Site updated: $(date '+%Y-%m-%d %H:%M')"

echo "Enter commit message (press Enter to use default):"
read INPUT_MSG

if [ -z "$INPUT_MSG" ]; then
  MSG="$DEFAULT_MSG"
else
  MSG="Site updated: $INPUT_MSG ($(date '+%Y-%m-%d %H:%M'))"
fi

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

echo "Site updated finished!"
