xset s off -dpms
xsetroot -solid "#000000"
setxkbmap -option caps:escape
warpd
picom &
exec i3
