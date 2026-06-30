@echo off
setlocal EnableExtensions

title Project Zero Server Cleanup
color 04

set "MODS=minecraft\mods"

echo ========================================
echo        Project Zero Server Cleanup
echo ========================================
echo.
echo This will remove client-only files from
echo your Project Zero installation.
echo.
echo The following will be removed:
echo   - Client-only mods
echo   - Resource Packs
echo   - Shader Packs
echo.

choice /C YN /M "Continue?"

if errorlevel 2 (
    echo.
    echo Cleanup cancelled.
    pause
    exit
)

echo.

call :DeleteMod AmbientSounds "AmbientSounds"
call :DeleteMod appleskin "AppleSkin"
call :DeleteMod blur "Blur+"
call :DeleteMod cave_fog_stabilizer "Cave Fog Stabilizer"
call :DeleteMod clientsort "ClientSort"
call :DeleteMod drippy_early_loading_module "Drippy Early Loading Module"
call :DeleteMod drippyloadingscreen "Drippy Loading Screen"
call :DeleteMod entityculling "Entity Culling"
call :DeleteMod fancymenu "FancyMenu"
call :DeleteMod handycam "Handycam"
call :DeleteMod iris "Iris Shaders"
call :DeleteMod lambdynamiclights "LambDynamicLights"
call :DeleteMod melody "Melody"
call :DeleteMod MindfulDarkness "Mindful Darkness"
call :DeleteMod particular "Particular Reforged"
call :DeleteMod ResourcePackOverrides "Resource Pack Overrides"
call :DeleteMod ScalableLux "ScalableLux"
call :DeleteMod sodium "Sodium"
call :DeleteMod sound-physics-remastered "Sound Physics Remastered"
call :DeleteMod sway "SWAY"
call :DeleteMod visualhealth "Visual Health"
call :DeleteMod xaerominimap "Xaero's Minimap"
call :DeleteMod xaeroworldmap "Xaero's World Map"
call :DeleteMod distantthunders "Distant Thunders"

if exist "minecraft\resourcepacks" (
    echo Removing Resource Packs...
    rd /s /q "minecraft\resourcepacks"
)

if exist "minecraft\shaderpacks" (
    echo Removing Shader Packs...
    rd /s /q "minecraft\shaderpacks"
)

echo.
echo ========================================
echo Cleanup complete!
echo ========================================
echo.
echo Press any key to exit...
pause >nul

start "" /b cmd /c "timeout /t 1 /nobreak >nul & del /f /q ""%~f0"""
exit


:DeleteMod
if exist "%MODS%\%~1*.jar" (
    echo Removing %~2...
    del /f /q "%MODS%\%~1*.jar" >nul 2>&1
)