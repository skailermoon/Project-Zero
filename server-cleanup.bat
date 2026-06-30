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

for %%M in (
    AmbientSounds
    appleskin
    betterdays
    blur
    cave_fog_stabilizer
    clientsort
    drippy_early_loading_module
    drippyloadingscreen
    entityculling
    fancymenu
    handycam
    iris
    lambdynamiclights
    mc2_interactivefoliage
    melody
    MindfulDarkness
    particular
    ResourcePackOverrides
    ScalableLux
    sodium
    sound-physics-remastered
    sway
    visualhealth
    xaerominimap
    xaeroworldmap
    distantthunders
) do (
    for %%F in ("%MODS%\%%M*.jar") do (
        if exist "%%~fF" (
            echo Removing %%~nxF
            del /f /q "%%~fF"
        )
    )
)

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

start "" /b cmd /c "timeout /t 3 /nobreak >nul & del /f /q ""%~f0"""
exit


