
:: ███████╗██████╗ ███████╗██╗   ██╗    ███████╗████████╗███████╗ █████╗ ███╗   ███╗████████╗ ██████╗  ██████╗ ██╗     
:: ██╔════╝██╔══██╗██╔════╝██║   ██║    ██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║╚══██╔══╝██╔═══██╗██╔═══██╗██║     
:: █████╗  ██║  ██║█████╗  ██║   ██║    ███████╗   ██║   █████╗  ███████║██╔████╔██║   ██║   ██║   ██║██║   ██║██║     
:: ██╔══╝  ██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚════██║   ██║   ██╔══╝  ██╔══██║██║╚██╔╝██║   ██║   ██║   ██║██║   ██║██║     
:: ███████╗██████╔╝███████╗ ╚████╔╝     ███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║   ██║   ╚██████╔╝╚██████╔╝███████╗
:: ╚══════╝╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
                                                                                                                    
set programname=EDev Steam Tool v0.1
:: SET INFO BELOW THIS
set servername=
set username=myaccount
set password=mypw
set cred=%username% %password%
set runcmd=%~dp0etc\steamcmd
:: SET INFO ABOVE THIS

:: This will keep the window clean and easy to read
@ECHO off

:: Sets the title of the window
title %programname% - %servername%

:: Clears the window incase there is anything there
cls
COLOR 1f
CD %runcmd%

:: Prints to the window what we are doing
ECHO %programname% has been started! by EDev. Thanks to: "SteamCMD Guardian 1.1"
:start
ECHO.
ECHO.
ECHO   ##############################################################
ECHO   #                    Dedicated Server                        #
ECHO   # 1 - Half-Life: Deathmatch and Counter-Strike               #
ECHO   # 2 - Counter-Strike: Global Offensive                       #
ECHO   # 3 - Nuclear Dawn Dedicated Server                          #
ECHO   # 4 - Red Orchestra Dedicated Server                         #
ECHO   # 5 - Red Orchestra 2: Heroes of Stalingrad Dedicated Server #
ECHO   # 6 - Killing Floor Dedicated Server                         #
ECHO   # 7 - Team Fortress 2 Dedicated Server Beta                  #
ECHO   # 8 - Rust                                                   #
ECHO   # 9 - HELP!                                                  #
ECHO   # 10 - Exit                                                  #
ECHO   ##############################################################
ECHO.
ECHO.

:: Delete variable %A%
SET "A="
SET /P A=Set Your Choice And Press Enter:
ECHO Loading .........
IF "%A%"=="1" set app=90
IF "%A%"=="2" set app=740
IF "%A%"=="3" set app=111710
IF "%A%"=="4" set app=223240
IF "%A%"=="5" set app=212542
IF "%A%"=="6" set app=215350
IF "%A%"=="7" set app=229830
IF "%A%"=="8" set app=258550 & set cred=anonymous
IF "%A%"=="9" ECHO.
IF "%A%"=="9" ECHO https://developer.valvesoftware.com/wiki/SteamCMD
IF "%A%"=="9" ECHO.
IF "%A%"=="9" PAUSE
IF "%A%"=="9" goto start
IF "%A%"=="10" EXIT

:: This is a return point in case the server crashes or is closed
:restart
ECHO.
ECHO (%date%)(%time%) %servername% is now ONLINE
ECHO Watching %servername% for crashes...
>> "%servername%.log" ECHO.
>> "%servername%.log" ECHO (%date%)(%time%) %servername% is now ONLINE
>> "%servername%.log" ECHO (%date%)(%time%) Watching %servername% for crashes...

::Start the actual update window
start /wait steamcmd.exe +login %cred% +force_install_dir %runcmd%%app%Server\ +app_update %app% validate
ECHO (%time%) WARNING: srcds closed or crashed, restarting.
ECHO.
ECHO (%date%)(%time%) Crash or Close detected!
ECHO %servername% is now restarting...
>> "%servername%.log" ECHO.
>> "%servername%.log" ECHO (%date%)(%time%) Crash or Close detected!
>> "%servername%.log" ECHO (%date%)(%time%) %servername% is now restarting...

::Server crashed or closed, so we point it to the return point to start the server again
GOTO restart
