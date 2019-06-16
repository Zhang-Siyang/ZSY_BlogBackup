---
title: "如何加速龟速的Homebrew"
date: 2019-03-11T22:44:07+08:00
draft: false
---
简而言之，快使用中科大全家桶！！！
```shell
# Homebrew 源代码仓库替换为USTC镜像
cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git

# Homebrew Bottles (二进制)源[针对bash用户的，zsh同理]
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile

# Homebrew Cask 源替换为 USTC 镜像
cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
```
