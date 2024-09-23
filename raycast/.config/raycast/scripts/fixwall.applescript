#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Fix Wallpaper
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🖼️

# Documentation:
# @raycast.packageName Environment

tell application "Finder"
  set desktop picture to POSIX file "/Users/jtewing/Pictures/wallpapers/splash.jpg"
end tell
