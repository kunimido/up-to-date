#!/bin/zsh

SRC="$(cd $(dirname "$0") && pwd 2>/dev/null)"
PRODUCT=up-to-date
SERVICE=com.github.kunimido.${PRODUCT}
PLIST=${SERVICE}.plist

install -v -C -m 0700 "$SRC/${PRODUCT}.sh" "$HOME/bin"

cd "$HOME/Library/LaunchAgents/"
sed -E 's=\$INSTALL='"$HOME/bin=" "$SRC/$PLIST" > "$PLIST"
launchctl bootout "gui/$(id -u)/$SERVICE"
launchctl bootstrap gui/$(id -u) $PLIST
