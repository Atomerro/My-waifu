@echo off

rem This file is UTF-8 encoded, so we need to update the current code page while executing it
for /f "tokens=2 delims=:." %%a in ('"%SystemRoot%\System32\chcp.com"') do (
    set _OLD_CODEPAGE=%%a
)
if defined _OLD_CODEPAGE (
    "%SystemRoot%\System32\chcp.com" 65001 > nul
)

set VIRTUAL_ENV="%~dp0waifu"

if not defined PROMPT set PROMPT=$P$G

if defined _OLD_VIRTUAL_PROMPT set PROMPT=%_OLD_VIRTUAL_PROMPT%
if defined _OLD_VIRTUAL_PYTHONHOME set PYTHONHOME=%_OLD_VIRTUAL_PYTHONHOME%

set _OLD_VIRTUAL_PROMPT=%PROMPT%
set PROMPT=(waifu) %PROMPT%

if defined PYTHONHOME set _OLD_VIRTUAL_PYTHONHOME=%PYTHONHOME%
set PYTHONHOME=

if defined _OLD_VIRTUAL_PATH set PATH=%_OLD_VIRTUAL_PATH%
if not defined _OLD_VIRTUAL_PATH set _OLD_VIRTUAL_PATH=%PATH%

set PATH=%VIRTUAL_ENV%\Scripts;%PATH%
set VIRTUAL_ENV_PROMPT=(waifu) 

:END
if defined _OLD_CODEPAGE (
    "%SystemRoot%\System32\chcp.com" %_OLD_CODEPAGE% > nul
    set _OLD_CODEPAGE=
)

echo Installing dependencies...

call npm install "%~dp0character_ai"

python -m ensurepip
python -m pip install --upgrade pip
python -m pip install pipwin 
rem we have to use pipwin for installing pyaudio
python -m pipwin install pyaudio 
python -m pip install colorama
python -m pip install openai
python -m pip install humanize
python -m pip install os-sys
python -m pip install python-time
python -m pip install threaded
python -m pip install asyncio
python -m pip install signals
python -m pip install jsons

python -m pip install rich
python -m pip install humanize
python -m pip install requests
python -m pip install py7zr
python -m pip install zipfile36
python -m pip install keyboard
python -m pip install requires.io
python -m pip install pydub
python -m pip install pyvts
python -m pip install pybase64
python -m pip install websockets
python -m pip install websocket-client

python -m pip install googletrans
python -m pip install torch
python -m pip install pybcj

cd /d "%~dp0"
python -m pip install -r "%~dp0requirements.txt"
cls

python "%~dp0waifu\Src\runner.py"

pause
