#!/usr/bin/env bash
set -euo pipefail

# 在临时仓库中复现：误提交敏感文件 -> 用 git-filter-repo 从整个历史中移除
repo=$(mktemp -d)
cd "$repo"

git init -q
git config user.name demo
git config user.email demo@example.com

printf 'password=hunter2\n' > credentials.txt
printf 'public\n' > public.txt
git add .
git commit -qm "add public.txt and credentials.txt"

git filter-repo --path credentials.txt --invert-paths --force

# 校验：历史中已不存在该文件
! git log --all --oneline -- credentials.txt | grep -q .
