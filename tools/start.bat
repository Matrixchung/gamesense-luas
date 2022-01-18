for /r "." %%a in (*.exe) do start "" "%%~fa"
SLEEP
cd C:\Program Files (x86)\Steam
START steam.exe -applaunch 730
cls