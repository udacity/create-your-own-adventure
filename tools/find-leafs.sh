#!/bin/bash
# Simple script to assist in finding leafs - that is, pages of the story with
# no options yet.
#
# Usage: 
#	find-leafs.sh language
# to find leafs in that particular language (though technically, just the directory),
# and print a URL to read the story part online. Assumes your branch has at least bean
# created over at github

REMOTE=$(git remote -v | grep git@ | head -1 | awk -F'[ :.]' '{print $3}')
BRANCH=$(git rev-parse --abbrev-ref HEAD)

DIR=${1:-./} 

for file in $(find "$DIR" -name '*.md' | xargs grep -L -E '\[[a-zA-Z]+.*]\(.*\)')
do
	echo https://github.com/$REMOTE/blob/$BRANCH/${file:2}
done
