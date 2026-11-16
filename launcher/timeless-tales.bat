@echo off
rem
rem The Timeless Tales launcher for Windows.
rem
rem The game is only data, so all this launcher has to do is point a Stratagus
rem engine at the directory it is installed in. The installer puts
rem stratagus.exe next to this file.

setlocal
set "DIR=%~dp0"
"%DIR%stratagus.exe" -d "%DIR%." %*
