@echo off
set run=%~dp0steamcmd258550
CD %run%
RustDedicated.exe -batchmode +server.port 28015 +server.tickrate 30 +server.hostname "EDev Rust Dedicated Server" +server.identity "edevrust_default" +server.maxplayers 5 +server.worldsize 4000 +server.saveinterval 600 +rcon.port 28016 +rcon.ip 0.0.0.0 +rcon.password "edevrust123" -logfile "rustlog"