@echo off
setlocal EnableDelayedExpansion

:: — Welcome Message —
echo.
echo █▀█ █▀█ █▀▀ █▀▀ █ █▀█ █▄░█
echo █▀▀ █▀▄ ██▄ █▄█ █ █▄█ █░▀█ — Eternal Divine Core System Phase 1
echo.

echo 👑 Welcome, King Sujal.
echo 🧠 Initiating Roxxie Eternal Divine Core Phase 1...
echo.

:: — Set directory —
cd /d D:\roxxie-ultimatrix-phase1\backend

:: — Activate virtual environment —
echo 🔄 Activating virtual environment...
call venv\Scripts\activate

:: — Upgrade pip separately to avoid pip warning —
echo 📦 Upgrading pip...
venv\Scripts\python.exe -m pip install --upgrade pip

:: — Install required packages —
echo 🚀 Installing Python packages...
pip install -r requirements.txt

:: — Ask mode selection —
echo.
echo 🌌 Choose Roxxie System Mode:
echo   [1] Safe Mode
echo   [2] NSFW Mode
echo   [3] God Mode
echo   [4] Developer Mode
set /p mode="Enter your choice (1/2/3/4): "

if "%mode%"=="1" (
    set roxxie_mode=SAFE MODE
)
if "%mode%"=="2" (
    set roxxie_mode=NSFW MODE
)
if "%mode%"=="3" (
    set roxxie_mode=GOD MODE
)
if "%mode%"=="4" (
    set roxxie_mode=DEV MODE
)

:: — Greet with TTS —
echo 🎤 Speaking greeting...
powershell -c "Add-Type –AssemblyName System.Speech;$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer;$speak.Speak('Welcome back, King Sujal. Roxxie is now booting into %roxxie_mode%.')"

:: — Log timestamp —
echo [%date% %time%] Roxxie started in %roxxie_mode% >> D:\roxxie-ultimatrix-phase1\startup_log.txt

:: — GitHub Commit & Push —
echo 🔁 Syncing with GitHub...
git add .
git commit -m "Auto-start commit from Roxxie Divine Core %roxxie_mode%"
git push origin main

:: — Launch backend —
echo 🧠 Launching Roxxie API backend on http://127.0.0.1:8000 ...
start cmd /k "cd /d D:\roxxie-ultimatrix-phase1\backend && venv\Scripts\activate && uvicorn main:app --reload"

echo 🌐 To interact with Roxxie, open http://127.0.0.1:8000 in your browser.
echo.

pause
