### TMUX

except `~/.tmux.conf`, need to clone this repo to `~/.tmux` for plugins

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


### global dark theme

```
~/.config/gtk-3.0/settings.ini


[Settings]
gtk-application-prefer-dark-theme=1
```


### Natuaral scrolling

Ubuntu Natural scrolling

```
/usr/share/X11/xorg.conf.d/40-libinput.conf
```

Add there Option "NaturalScrolling" "True" like this:

For your mouse
```
# Match on all types of devices but joysticks
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```
https://askubuntu.com/questions/1122513/how-to-add-natural-inverted-mouse-scrolling-in-i3-window-manager


### Change keyrepeat rate


```
 xset r rate 300 40
```
