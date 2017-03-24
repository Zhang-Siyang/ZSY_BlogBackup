#!/bin/sh
cd /var/www/blog
hexo clean && hexo g && hexo d
