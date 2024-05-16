@echo off

set PLUGIN_NAME=medic
set PLUGINS_PATH=E:\server\steamapps\common\Day of Defeat Source Dedicated Server\dod\addons\sourcemod\plugins

cd scripting
spcomp %PLUGIN_NAME%.sp -i include -o ..\plugins\%PLUGIN_NAME%.smx
copy "..\plugins\%PLUGIN_NAME%.smx" "%PLUGINS_PATH%/%PLUGIN_NAME%.smx"
pause
