#!/bin/bash

KEY="07a525d347bb7247"

echo "📥 下载 twikoo.min.js..."
curl -o source/js/twikoo.min.js https://cdn.jsdelivr.net/npm/twikoo@1.7.1/dist/twikoo.min.js

echo "🔧 替换 API 地址..."
sed -i "s|https://api.qjqq.cn/api/qqinfo?qq=|https://v1.nsuuu.com/api/qqname?key=${KEY}\&qq=|g" source/js/twikoo.min.js

echo "🔧 替换 JSON 解析路径..."
sed -i "s|e\.name|e.data.nick|g" source/js/twikoo.min.js

echo "✅ 完成！文件已保存到 source/js/twikoo.min.js"