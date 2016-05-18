@echo off&title %~nx0

REM /////////////  设置到导出的数据库名称，用户名以及密码 ///////

set dbname=speedphp
set dbuser=root
set dbpass=root

REM ====================<设置结束>========================
REM ----------------------------------------------------
set pwd=%~dp0
set "bin=D:\Workroot\phpStudy\MySQL\bin\mysqldump.exe"
set %mysqldump%=mysqldump
set /a curnumber=1
set requirePause=%1
REM ----------------------------------------------------

REM (mysqldump --help>nul||call :setbin mysqldump)

@mysqldump --help>nul

if %ERRORLEVEL% EQU 0 (
  set mysqldump=mysqldump
) else (
echo    环境变量中不存在"mysqldump"，设置 mysqldump 为绝对路径 %bin%
  set "mysqldump=%bin%"
)

REM 自动累加数据库SQL文件数目
:getSQLname
set sqlname=%dbname%_%curnumber%
if exist "%pwd%%sqlname%.sql" (set /a curnumber=%curnumber%+1&&goto :getSQLname)


%mysqldump% --add-drop-table --lock-tables --single-transaction %dbname% -u%dbuser% -p%dbpass%>%pwd%%sqlname%.sql
copy %pwd%%sqlname%.sql %dbname%.sql /Y
echo   执行完毕...&title  导出完毕!!
if not "x%requirePause%"=="xcontinue" pause
goto :eof

:setbin
set %1=%bin%
goto :eof

pause