@echo off

call :setESC

set root=%~dp0
cd %~dp0


echo %ESC%[37;1m[%ESC%[34mInfo%ESC%[37m]%ESC%[0m Cleaning the main assembly...
rmdir /s /q src\build 2>NUL


echo %ESC%[37;1m[%ESC%[34mInfo%ESC%[37m]%ESC%[0m Done!
cd %root%
exit /b 0

:cleanRCM
cd %rcmpath%\%~1 && (make clean > NUL) && cd %root%
exit /b 0

:setESC
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /b 0
)
exit /b 0
