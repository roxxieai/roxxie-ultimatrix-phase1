@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

echo.
echo █▀█ █▀█ █▀▀ █▀▀ █ █▀█ █▄░█
echo █▀▀ █▀▄ ██▄ █▄█ █ █▄█ █░▀█ — Eternal Divine Core System Phase 1
echo.

echo 👑 Welcome, King Sujal.
echo 🧠 Initiating Roxxie Eternal Divine Core Phase 1...
echo.

:: Navigate to project
cd /d D:\roxxie-ultimatrix-phase1\backend

:: Activate environment
echo 🔄 Activating virtual environment...
call venv\Scripts\activate

:: Upgrade pip
echo 🔧 Upgrading pip...
venv\Scripts\python.exe -m pip install --upgrade pip

:: Install requirements
echo 📦 Installing Python packages...
if exist requirements.txt (
    pip install -r requirements.txt
) else (
    echo ❌ requirements.txt not found! Skipping package install...
)

:: Mode selection
echo.
echo 🌌 Choose Roxxie System Mode:
echo   [1] Safe Mode
echo   [2] NSFW Mode
echo   [3] God Mode
echo   [4] Developer Mode
set /p mode="Enter your choice (1/2/3/4): "

if "%mode%"=="1" set roxxie_mode=SAFE MODE
if "%mode%"=="2" set roxxie_mode=NSFW MODE
if "%mode%"=="3" set roxxie_mode=GOD MODE
if "%mode%"=="4" set roxxie_mode=DEV MODE

:: Voice greeting
echo 🎤 Speaking greeting...
powershell -Command "Add-Type -AssemblyName System.Speech; $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer; $speak.Speak('Welcome back, King Sujal. Roxxie is now booting into %roxxie_mode%.')"

:: Logging
echo [%date% %time%] Roxxie started in %roxxie_mode% >> D:\roxxie-ultimatrix-phase1\startup_log.txt

:: Git sync
echo 🔁 Syncing with GitHub...
git add .
git add ../startup_log.txt
git commit -m "Auto-start commit from Roxxie Divine Core %roxxie_mode%"
git push origin main

:: Launch backend
echo 🧠 Launching Roxxie API backend on http://127.0.0.1:8000 ...
start cmd /k "cd /d D:\roxxie-ultimatrix-phase1\backend && venv\Scripts\activate && uvicorn main:app --reload"

echo 🌐 To interact with Roxxie, open http://127.0.0.1:8000 in your browser.
pause
