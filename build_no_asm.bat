@echo off
del rom\arm9.bin /f /q
xcopy src\Base_ARM9\arm9.bin rom\
tools\mktb\MarioKartToolbox.exe -b "../../rom/rom.xml" "../../rom/rom.nds"
cd rom
taskkill /IM melonds.exe /T /F
start rom.nds