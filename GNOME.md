### Tilings

- Disable "Ubuntu Tiling Assistant" (as it has some annoying Super+Left & Super+Right) feature
- Install https://extensions.gnome.org/extension/7065/tiling-shell/ as it works better

```
$ dconf write /org/gnome/mutter/edge-tiling false
$ gnome-extensions disable tiling-assistant@ubuntu.com

# download extension and copy to
$ cp -r ~/Downloads/tilingshell@ferrarodomenico.com ~/.local/share/gnome-shell/extensions/
$ /usr/bin/gnome-extensions enable tilingshell@ferrarodomenico.com
```

### Launching of Terminator

- Create new custom hotkey `Super + Enter` (Settings > Keyboard > Customised Shortcuts)
- cmd is `teminator`
