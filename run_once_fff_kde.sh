#!/bin/sh

echo Installing KDE settings
echo Processing shortcuts
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" --group "krunner.desktop" --key "RunClipboard" "none,none,Run command on clipboard contents"
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" --group "krunner.desktop" --key "_launch" "none,none,KRunner"
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" --group "plasmashell" --key "show dashboard" "none,none,Show Desktop" 

# The name 'kglobalaccel' should have '5' only in the second case
kquitapp5 kglobalaccel && sleep 2s && kglobalaccel5 &

echo Done
