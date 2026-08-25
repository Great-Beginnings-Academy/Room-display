@echo off
:: Conference Room Display Launcher
:: Starts a local web server and opens the display in Chrome kiosk mode.
:: Place this file in the same folder as conference-room-standalone.html

echo Starting Conference Room Display...

:: Start Python web server in background
start "" /B python -m http.server 8080

:: Wait for server to start
timeout /t 2 /nobreak >nul

:: Open in Chrome kiosk mode (full screen, no address bar)
:: If Chrome isn't at this path, update it below
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --kiosk --app=http://localhost:8080/conference-room-standalone.html

:: If you'd prefer Edge, comment out the Chrome line above and uncomment this:
:: start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --kiosk http://localhost:8080/conference-room-standalone.html --edge-kiosk-type=fullscreen
