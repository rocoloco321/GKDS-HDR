@echo off
del src\backup\arm9.bin /f /q
xcopy src\Base_ARM9\arm9.bin src\backup\
cd tools
call compileasm.bat
cd ..
if %errorlevel% neq 0 goto end
tools\mktb\MarioKartToolbox.exe -b "../../rom/rom.xml" "../../rom/rom.nds"
cd rom
taskkill /IM melonds.exe /T /F
start rom.nds
:end
