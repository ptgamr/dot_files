## NOTES FOR VIM8

Remove smooth scroll
```
rm -rf comfortable-motion.vim
```

Install base16-vim
```
https://github.com/chriskempson/base16-vim.git
```

Notes: 
because of issue https://github.com/chriskempson/base16-vim/issues/197 , 
use this fork instead until the PR landed on master: https://github.com/danielwe/base16-vim

### INSTALL YouCompleteMe

Recompile Vim with Python support: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

```
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
```

```
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local

sudo make install

or 

sudo checkinstall 
```

And then go to `~/.vim_runtime/my_plugins`:

```
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --all

or 

python3 install.py --ts-completer --rust-completer # for TypeScript & Rust only
```

- JavaScript and TypeScript support: install Node.js and npm, navigate to `YouCompleteMe/third_party/ycmd` and run `npm install -g --prefix third_party/tsserver typescript`.

- Keep an eye on the version of typescript inside `YouCompleteMe/third_party/ycmd/third_party/tsserver`



# My Tmux & Vim configuration

I'm climbing the Vim world. The most frustrated thing until now is to make vim looks nice. However I'm getting there :)

### Tmux must be configured & start differently
- please refer to `.tmux.conf` file to see the `screen-256color` config
- start tmux using : `tmux -2` to force it to run in 256 mode

### Make Tmux bar look nice
Please see my `.tmux.conf` file

### Improve fonts rendering with Infinality
To install on Ubuntu:
```
$ sudo add-apt-repository ppa:no1wantdthisname/ppa
$ sudo apt-get update
$ sudo apt-get install  fontconfig-infinality freetype
```
Run the following commands to choose and apply a font configuration:
```
$ sudo /etc/fonts/infinality/infctl.sh setstyle
```

### Use vimrc
https://github.com/amix/vimrc

### Vim colorscheme must be aligned with your Terminator (iTerm) profile

I used SpaceGray (https://github.com/ajh17/Spacegray.vim)

So, Terminal color profile has to be set to `Spacegray`
And colorscheme in `.vimrc` must be set to `Spacegray`, too

### Plugins:

- https://github.com/wting/autojump
- https://github.com/easymotion/vim-easymotion

### Using Ag/Ack
http://conqueringthecommandline.com/book/ack_ag#cid17

```
# search in folder
ag DHH guides/

# regular expression search
ag readme$

# literal expression search
# -Q flag. This will search for the exact pattern
ag -Q .rb railties/CHANGELOG.md
 
# Listing files
ag DHH -l

# Case Insensitive Searches (-i)
ag readme -l -i

# Scoping to Files (-G)
ag readme -l -i -G ec$

# Ignore Paths
# The –ignore-dir Flag
ag readme -l --ignore-dir=railties/lib

# We can easily chain multiple –ignore-dir calls together to filter our results further
ag readme -l --ignore-dir=railties/lib --ignore-dir=guides/code

# Despite its name, the –ignore-dir flag will also let us filter out particular files, not just directories
ag readme -l --ignore-dir="*.rb"
```

### Python

You might want to comment out bellow lines if you want to have tab switching using `Leader + 1, Leader + 2`  inside a `.py` file:

```
au FileType python inoremap <buffer> $f # --- <esc>a
" au FileType python map <buffer> <leader>1 /class
" au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class

```

### Ubuntu Natural scrolling

`/usr/share/X11/xorg.conf.d/40-libinput.conf`

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

Cheers


### Troubeshootings

#### UBUNTU 20.04 after suspend, Chrome rendering problem

https://askubuntu.com/questions/1273399/problems-with-chrome-browser-after-suspend-the-computer-on-ubuntu-20-04
https://askubuntu.com/questions/1270689/chrome-causing-weird-flickering-since-upgrade-to-85-0-4183-83/1272506#1272506

Enable ignore-gpu-blacklist and enable-vulkan in chrome://flags fixed it.
