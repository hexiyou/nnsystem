@echo off
set o=%~dp0..\runtime\

cd /d %o%

for /f "usebackq" %%k in (`dir /s /b`) do (
  echo %%k
  del /f /s /q %%k
)
echo\&echo   done...
pause