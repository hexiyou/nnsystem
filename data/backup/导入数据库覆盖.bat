@echo off
REM /////////////  ���õ���������ݿ����ƣ��û����Լ����� ///////

set dbname=speedphp
set dbuser=root
set dbpass=root

REM ====================<���ý���>========================
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
echo    ���������в�����"mysql"������ mysql Ϊ����·�� %bin%
  set "mysql=%bin%"
)

%mysql% -u%dbuser% -p%dbpass% -D %dbname%<"%1"
echo   ִ�����...&title  �������!!
if not "x%requirePause%"=="xcontinue" pause
goto :eof

:setbin
set %1=%bin%
goto :eof

pause
