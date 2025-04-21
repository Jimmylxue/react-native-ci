#!/bin/bash

# 检查是否提供了项目地址
if [ -z "$REPO_URL" ]; then
    echo "错误: 请设置 REPO_URL 环境变量"
    exit 1
fi

mkdir smart-pos

cd smart-pos

# 使用环境变量中的项目地址进行克隆
git clone $REPO_URL

# 获取项目名称（从URL中提取）
REPO_NAME=$(basename $REPO_URL .git)

# 进入项目目录
cd $REPO_NAME

# 安装依赖
$INSTALL_DEPENDENCIES

yarn

cd ./packages/lion

$BUILD_COMMAND

exit
