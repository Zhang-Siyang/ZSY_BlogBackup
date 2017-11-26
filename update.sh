#!/bin/sh
cd /var/www/blog
hexo clean && hexo g && hexo d
git add .
git commit -m "自动备份"
git push
