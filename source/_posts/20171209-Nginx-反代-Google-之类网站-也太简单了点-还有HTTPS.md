---
title: 'Nginx 反代 Google 之类网站 也太简单了点[还有HTTPS]'
date: 2017-12-09 12:38:53
tags:
---
反代一个网站实在简单：

1. apt install nginx
2. nano /etc/nginx/nginx.conf
3. nano /etc/nginx/google.conf
4. nginx -s reload

本文以 Debian/Ubuntu 为基础, CentOS 系大概同理,请提前准备好HTTPS证书,拿 certbot 申请个 Let's Encrypt 就够了

博主很菜, 请多多指正, 多谢!
<!--more-->

### Apt install nginx

不需多言, `apt install nginx`

### Nano /etc/nginx/nginx.conf

在 http 段中加入 `include /etc/nginx/google.conf;` 这样才便于管理嘛

### Nano /etc/nginx/google.conf

```nginx
server
    {
        listen 80;
        listen 443 ssl;

        access_log /var/log/nginx/google.access.log;
        error_log /var/log/nginx/google.error.log;

        ssl on;
        ssl_certificate $path ;         #证书的绝对路径
        ssl_certificate_key $path ;     #私钥的绝对路径
        ssl_session_cache shared:SSL:10m;
        ssl_session_timeout  10m;
        server_name google.domain.com;  #将 google.domain.com 换为你的域名
        add_header Strict-Transport-Security "max-age=31536000";    #设置长度为一年的 HSTS
        
        if ( $scheme = http ){
            return 301 https://$server_name$request_uri;
        }
        
        if ($http_user_agent ~* (baiduspider|360spider|haosouspider|googlebot|soso|bing|sogou|yahoo|sohu-search|yodao|YoudaoBot|robozilla|msnbot|MJ12bot|NHN|Twiceler)) {
            return  403;
        }
  
        location / {

        subs_filter_types text/css text/xml text/javascript;
                subs_filter www.google.com google.domain.com;       #同样地,将 google.domain.com 换为你的域名
                sub_filter_once off;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Referer https://www.google.com;
        proxy_set_header Host www.google.com;
        proxy_pass https://www.google.com;
        proxy_set_header Accept-Encoding "";
        }
}

```

上面的 Nginx 配置文件是我 Google 出的结果, 能凑合着用, 要是有不对的地方还请告知我喔!

### Nginx -s reload

输入 `nginx -s reload` 不出意外的话, 你的反向代理就会开始工作啦!
