#!/bin/sh

echo Installing KDE settings
echo Processing shortcuts
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" --group "krunner.desktop" --key "RunClipboard" "none,none,Run command on clipboard contents"
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" --group "krunner.desktop" --key "_launch" "none,none,KRunner"
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" --group "plasmashell" --key "show dashboard" "none,none,Show Desktop" 
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" --group "ksmserver" --key "Lock Session" "Meta+L\tScreensaver,Meta+L\tScreensaver,Lock Session" 
# Workaround for kwriteconfig escaping \t as \\t. Without quotes, \t is escaped as only t.
sed -i 's@\\\\t@\\t@g' $HOME/.config/kglobalshortcutsrc

# The name 'kglobalaccel' should have '5' only in the second case
kquitapp5 kglobalaccel && sleep 2s && kglobalaccel5 &

echo Done
