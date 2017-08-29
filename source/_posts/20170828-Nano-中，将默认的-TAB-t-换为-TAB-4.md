---
title: "Nano 中，将默认的 [TAB] -> \t 换为 [TAB] -> ' '*4"
date: 2017-08-29 12:15:19
tags: [小记]
---
If you use nano with a language like python (as in your example) it's also a good idea to convert tabs to spaces.

Edit your ~/.nanorc file (or create it) and add:

    set tabsize 4
    set tabstospaces

If you already got a file with tabs and want to convert them to spaces i recommend the expandcommand (shell):

    expand -4 input.py > output.py

From: [How to make the tab character 4 spaces instead of 8 spaces in nano?@Sven Rojek](https://stackoverflow.com/a/15364505)
