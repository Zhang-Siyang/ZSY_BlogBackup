#!/bin/bash
echo "Blog 日志编译与部署"
cd /var/www/blog
hexo g && hexo d

echo "Blog 备份"
git add .
git commit -m "自动备份"
git push
