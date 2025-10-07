#!/bin/sh

GTK3CONF="$HOME/.config/gtk-3.0/settings.ini"
GTK2CONF="$HOME/.gtkrc-2.0"

theme=$(grep 'gtk-theme-name' "$GTK3CONF" | cut -d= -f2)
icon=$(grep 'gtk-icon-theme-name' "$GTK3CONF" | cut -d= -f2)
font=$(grep 'gtk-font-name' "$GTK3CONF" | cut -d= -f2)

cat > "$GTK2CONF" <<EOF
gtk-theme-name="$theme"
gtk-icon-theme-name="$icon"
gtk-font-name="$font"
EOF
