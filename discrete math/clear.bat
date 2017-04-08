@echo off
del *.aux
del *.nav
del *.out
del *.snm
del *.toc
del *.log
del *.vscodeLog
:0
taskkill /f /t /im pdflatex.exe>nul
if %errorlevel% == 128 (goto 1) else (goto 0)
:1
tasklist |findstr /i pdflatex.exe>nul
if
%errorlevel% == 1 (goto 2) else (goto error)
:2
taskkill /f /t /im pdflatex.exe>nul
if
%errorlevel% == 128 (goto 3) else (goto 2)
:3
tasklist |findstr /i pdflatex.exe>nul
if
%errorlevel% == 1 (goto end) else (goto error)
:error
echo 权限不足,请以管理员身份运行
exit
:end
exit