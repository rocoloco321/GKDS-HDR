@echo off

call :setESC

set root=%~dp0
cd %root%

REM ---- Main ASM ----

echo %ESC%[37;1m[%ESC%[31mncpgen%ESC%[37m]%ESC%[0m Generating NCPatcher environment...
ncpatcher\ncpgen.exe 0 ../rom/rom.xml
if %errorlevel% neq 0 exit /b 1
cd ..\src
echo %ESC%[37;1m[%ESC%[31mncpgen%ESC%[37m]%ESC%[0m Running NCPatcher...
..\tools\ncpatcher\ncpatcher.exe
set ncp_retcode=%errorlevel%
cd ..\tools
echo %ESC%[37;1m[%ESC%[31mncpgen%ESC%[37m]%ESC%[0m Cleaning NCPatcher environment...
ncpatcher\ncpgen.exe 1 ../rom/rom.xml
if %ncp_retcode% neq 0 exit /b 2



REM ---- END ----

echo.
echo %ESC%[37;1m------------------------------%ESC%[0m
echo Compilation finished!
cd %root%
exit /b 0

REM ---- FUNCTIONS ----

:buildRCM
echo %ESC%[37;1m[%ESC%[34mInfo%ESC%[37m]%ESC%[0m Building %ESC%[33;1m"%~1"%ESC%[0m
cd %rcmpath%\%~1 && make && cd %root%
copy %rcmpath%\%~1\code.rcm %coursepath%\%~1_arc\code.rcm > NUL
echo %ESC%[37;1m[%ESC%[34mInfo%ESC%[37m]%ESC%[0m Copied %ESC%[33;1m"%~1\code.rcm"%ESC%[0m to %ESC%[33;1m"%~1_arc\code.rcm"%ESC%[0m
exit /b 0

:setESC
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /b 0
)
exit /b 0
