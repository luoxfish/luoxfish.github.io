const fs = require('fs');

const KEY = '07a525d347bb7247';
const file = 'source/js/twikoo.min.js';

let content = fs.readFileSync(file, 'utf-8');

// 精准替换 API 地址
content = content.replace(
  'https://api.qjqq.cn/api/qqinfo?qq=',
  `https://v1.nsuuu.com/api/qqname?key=${KEY}&qq=`
);

// 只替换 API 返回值解析处（紧跟 qqinfo 请求回调的 e.name）
content = content.replace(
  /\.then\(([a-z])=>\{[^}]*?\1\.name/,
  (match, p1) => match.replace(`${p1}.name`, `${p1}.data.nick`)
);

fs.writeFileSync(file, content);
console.log('✅ 替换完成');