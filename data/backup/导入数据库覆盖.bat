@echo off
REM /////////////  设置到导入的数据库名称，用户名以及密码 ///////

set dbname=speedphp
set dbuser=root
set dbpass=root

REM ====================<设置结束>========================
REM ----------------------------------------------------
set pwd=%~dp0
set "bin=D:\Workroot\phpStudy\MySQL\bin\mysql.exe"
set %mysql%=mysql

REM ----------------------------------------------------

REM (mysql --help>nul||call :setbin mysql)

@mysql --help>nul

if %ERRORLEVEL% EQU 0 (
  set mysql=mysql
) else (
echo    环境变量中不存在"mysql"，设置 mysql 为绝对路径 %bin%
  set "mysql=%bin%"
)

%mysql% -u%dbuser% -p%dbpass% -D %dbname%<"%1"
echo   执行完毕...&title  导入完毕!!
if not "x%requirePause%"=="xcontinue" pause
goto :eof

:setbin
set %1=%bin%
goto :eof

pause
