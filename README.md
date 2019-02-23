## NOTES FOR VIM8

Remove smooth scroll
```
rm -rf comfortable-motion.vim
```

Install base16-vim
```
https://github.com/chriskempson/base16-vim.git
```

### INSTALL YouCompleteMe

Recompile Vim with Python support: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

```
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config \ # pay attention here check directory correct
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.6/config \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-cscope \
	   --prefix=/usr/local

sudo make install
```

And then go to `~/.vim_runtime/my_plugins`:

```
git clone https://github.com/Valloric/YouCompleteMe.git
python3 install.py --all

or 

python3 install.py --ts-completer # for TypeScript only
```

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

Cheers
