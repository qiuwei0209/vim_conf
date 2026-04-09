#!/bin/bash

echo "====================================="
echo "      开始恢复 Vim 配置..."
echo "====================================="

# 复制配置文件（不移动、不删除原仓库）
cp -rf ./vim ~/.vim
cp -f ./vimrc ~/.vimrc

# 设置权限
chmod 644 ~/.vimrc

echo -e "\n====================================="
echo "      配置复制完成！"
echo "====================================="
echo -e "请手动安装依赖：\n    apt install -y exuberant-ctags\n"
echo -e "然后打开 vim 执行：\n    :PlugInstall\n"

