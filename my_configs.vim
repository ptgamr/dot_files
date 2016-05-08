" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
autocmd BufWritePre * :%s/\s\+$//e

set showcmd
set showmode                    "Show current mode down the bottom
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set autoread                    "Reload files changed outside vim


" ============ Yank to clipboard on MAC =======
set clipboard=unnamed


set number "Line numbers are good

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" =========== Scrolling by mouse on Mac =======
set mouse=a

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|git'
let g:NERDTreeWinPos = "left"

" ================ Replace with yanked text ============
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" viw,p

xnoremap <leader>p "_dP

" ================= Quote ===============================
:nnoremap <Leader>q" ciw""<Esc>P
:nnoremap <Leader>q' ciw''<Esc>P
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P


" =============== Go to tab by number ==================
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

let g:syntastic_check_on_open = 0
let g:syntastic_html_checkers=['']

" ======== Quick switch buffer ========
" does not work due to yankring plugins
" nnoremap <C-n> :bnext<CR>
" nnoremap <C-p> :bprevious<CR>



" ================== Lazy Moving ===============================
" https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard

" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
