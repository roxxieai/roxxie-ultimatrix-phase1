@echo off
title 🌸 Roxxie Divine Core System - Phase 1 Setup + Launch

echo.
echo 🔮 Welcome, King Sujal.
echo 🌌 Initiating Roxxie Eternal Divine Core Phase 1...
echo.

REM Change to project directory
cd /d D:\roxxie-ultimatrix-phase1\backend

REM Create virtual environment if not exists
if not exist venv (
    echo 🧪 Creating virtual environment...
    python -m venv venv
)

REM Activate virtual environment
echo 🔄 Activating environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo 📦 Installing/updating Python packages...
pip install --upgrade pip
pip install fastapi uvicorn openai python-dotenv

REM Create .env file if not exists
if not exist .env (
    echo 🔐 OPENAI_API_KEY=your_openai_api_key_here> .env
    echo ⚠️ NOTE: Replace your_openai_api_key_here in the .env file!
)

REM Start FastAPI server
echo 🚀 Launching Roxxie on http://127.0.0.1:8000 ...
uvicorn main:app --reload

pause
