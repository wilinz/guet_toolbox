#!/bin/sh
brew install create-dmg
test -f Guet-Toolbox.dmg && rm Guet-Toolbox.dmg
create-dmg \
  --volname "GUET HUB" \
  --volicon "./AppIcon.icns" \
  --window-pos 200 120 \
  --window-size 800 500 \
  --icon-size 100 \
  --icon "guethub.app" 200 190 \
  --hide-extension "guethub.app" \
  --app-drop-link 600 185 \
  "Guet-Toolbox.dmg" \
  "../build/macos/Build/Products/Release/guethub.app"

