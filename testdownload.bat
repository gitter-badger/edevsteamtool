:: So the answer is: If you want your script to have a console window, use CSCRIPT.EXE. If you want it to NOT have a console window, use WSCRIPT.EXE.

set LocalDir=%~dp0
wscript downloadfiles.vbs
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%LocalDir%unzipfiles.ps1""' -Verb RunAs}";
pause