#!/bin/bash
# Conference Room Display Launcher (Mac)
# Place this file in the same folder as conference-room-standalone.html

echo "Starting Conference Room Display..."

# Start Python web server in background
python3 -m http.server 8080 &
SERVER_PID=$!

# Wait for server to start
sleep 2

# Open in Chrome kiosk mode
open -a "Google Chrome" --args \
  --kiosk \
  --app=http://localhost:8080/conference-room-standalone.html \
  --disable-restore-session-state \
  --disable-infobars

# When Chrome closes, kill the server
wait
kill $SERVER_PID 2>/dev/null
