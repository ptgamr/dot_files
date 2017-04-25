#!/bin/bash

# install ZSH
sudo apt install zsh
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# update .bashrc to exec zsh
cat <<EOT >> ~/.bashrc
exec /usr/bin/zsh
EOT


# vimrc
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
# my_configs.vim
wget -P ~/.vim_runtime/ https://raw.githubusercontent.com/ptgamr/dot_files/master/my_configs.vim 
# plugins
git clone https://github.com/chriskempson/base16-vim.git ~/.vim_runtime/sources_non_forked


# base16-shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# update .zshrc
cat <<EOT >> ~/.zshrc
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
EOT
# update my_configs.vim
cat <<EOT >> ~/.vim_runtime/my_configs.vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
EOT

# TMUX
sudo apt-get install tmux
wget -P ~/ https://github.com/ptgamr/dot_files/edit/master/.tmux.conf
