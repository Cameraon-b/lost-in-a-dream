@echo off
cd /d "%~dp0"
set PATH=%~dp0ruby\bin;%PATH%
ruby main.rb
pause
