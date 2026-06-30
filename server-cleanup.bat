@echo off
setlocal EnableExtensions

title Project Zero Server Cleanup
color 0A

echo ========================================
echo        Project Zero Server Cleanup
echo ========================================
echo.
echo This will:
echo.
echo   - Remove client-only mods
echo   - Delete the resourcepacks folder
echo   - Delete the shaderpacks folder
echo.
choice /C YN /M "Continue?"

if errorlevel 2 (
    echo.
    echo Cleanup cancelled.
    pause
    exit
)

echo.
echo Removing client-only mods...

set "MODS=minecraft\mods"

for %%F in (
    "*AmbientSounds*.jar"
    "*AppleSkin*.jar"
    "*Blur*.jar"
    "*Cave*Fog*.jar"
    "*ClientSort*.jar"
    "*distantthunders*.jar"
    "*DrippyLoadingScreen*.jar"
    "*EntityCulling*.jar"
    "*FancyMenu*.jar"
    "*Handycam*.jar"
    "*Iris*.jar"
    "*LambDynamicLights*.jar"
    "*Melody*.jar"
    "*MindfulDarkness*.jar"
    "*Particular*.jar"
    "*ScalableLux*.jar"
    "*Sodium*.jar"
    "*Sound*Physics*.jar"
    "*SWAY*.jar"
    "*VisualHealth*.jar"
    "*Xaero*.jar"
) do (
    del /F /Q "%MODS%\%%~F" >nul 2>&1
)

echo Removing resourcepacks...
if exist "minecraft\resourcepacks" rd /S /Q "minecraft\resourcepacks"

echo Removing shaderpacks...
if exist "minecraft\shaderpacks" rd /S /Q "minecraft\shaderpacks"

echo.
echo ========================================
echo Cleanup complete!
echo ========================================
echo.
pause

start "" cmd /c "timeout /t 1 /nobreak >nul & del /f /q ""%~f0"""
exit