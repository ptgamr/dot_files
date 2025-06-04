### General

```
# programming
sudo apt install tmux i3 terminator

# audio
sudo apt install blueman pulseaudio pavucontrol

# i3 status
sudo apt install pipx
pipx install py3status
```

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

24.04:

```
echo "export GTK_THEME=Adwaita:dark" >> ~/.profile
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


### NVIDIA drivers


https://www.linuxcapable.com/install-nvidia-drivers-on-ubuntu-linux/


```bash
# With new installation, nouveau is often the default:

lsmod | grep nouveau

# List recommended drivers
ubuntu-drivers devices

# select recommended one and install

sudo apt install nvidia-driver-530
```


### If screen does not turn blank after X mins of inactivity

```
 gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'blank'
 gsettings set org.gnome.desktop.session idle-delay 120
 gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 120
```


### Update font size of GTK app (if too small on 4k screen)

```
vim ~/.config/gtk-3.0/settings.ini
gtk-font-name=DejaVu, 14
```
