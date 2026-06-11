# 本地执行
powershell -ExecutionPolicy Bypass -File .\install_apps.ps1

# 执行远程脚本
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/HaBeauty/pic/main/powershell/install_apps.ps1 | iex"

powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/HaBeauty/pic/main/powershell/install_test.ps1 | iex"

git config --global user.name "你的用户名"
git config --global user.email "你的邮箱地址"