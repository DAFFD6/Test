@echo off
chcp 65001 >nul
echo ==============================================
echo          Git 仓库一键更新脚本 (main 分支)
echo ==============================================
echo.

echo [1/3] 正在添加所有修改文件...
git add .
if %errorlevel% neq 0 (
    echo ❌ 添加文件失败，请检查仓库状态
    pause
    exit /b 1
)

set /p commit_msg="[2/3] 请输入提交说明（例如：更新README）："
if "%commit_msg%"=="" (
    set commit_msg="日常更新"
)

git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo ❌ 提交失败，可能没有新的修改
    pause
    exit /b 1
)

echo [3/3] 正在推送到 GitHub main 分支...
git push origin main
if %errorlevel% neq 0 (
    echo ❌ 推送失败，请检查网络或权限
    pause
    exit /b 1
)

echo.
echo ==============================================
echo ✅ 推送完成！仓库已同步到 GitHub
echo ==============================================
pause