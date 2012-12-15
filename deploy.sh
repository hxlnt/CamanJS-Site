#!/bin/bash

git submodule init && git submodule update
rake jekyll:compile
git checkout gh-pages
ls | grep -v (_site|CNAME) | xargs rm -rf
cp -R _site/* .
rm -rf _site
git commit -a -m $1
git push origin gh-pages
git checkout master