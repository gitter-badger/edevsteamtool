@echo off
set run=%~dp0steamcmd258550
CD %run%
RustDedicated.exe -batchmode +server.hostname "EDev Rust Dedicated Server" +server.port 28015 +server.identity "edevrust_small" +server.tickrate 30 +server.maxplayers 6 +server.worldsize 2000 +server.saveinterval 600 +rcon.port 28016 +rcon.ip 0.0.0.0 +rcon.password "edevrust123" -logfile "rustlog_small"