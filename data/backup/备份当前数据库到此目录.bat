@echo off&title %~nx0

REM /////////////  ���õ����������ݿ����ƣ��û����Լ����� ///////

set dbname=speedphp
set dbuser=root
set dbpass=root

REM ====================<���ý���>========================
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
echo    ���������в�����"mysqldump"������ mysqldump Ϊ����·�� %bin%
  set "mysqldump=%bin%"
)

REM �Զ��ۼ����ݿ�SQL�ļ���Ŀ
:getSQLname
set sqlname=%dbname%_%curnumber%
if exist "%pwd%%sqlname%.sql" (set /a curnumber=%curnumber%+1&&goto :getSQLname)


%mysqldump% --add-drop-table --lock-tables --single-transaction %dbname% -u%dbuser% -p%dbpass%>%pwd%%sqlname%.sql
copy %pwd%%sqlname%.sql %dbname%.sql /Y
echo   ִ�����...&title  �������!!
if not "x%requirePause%"=="xcontinue" pause
goto :eof

:setbin
set %1=%bin%
goto :eof

pause