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

" ================ REPLACE WORD WITH YANKED TEXT ============
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" viw,p

" 1st way
" xnoremap <Leader>p "_dP

" 2nd way
nnoremap <Leader>pw viwpgvy

" ================= Quote ===============================
:nnoremap <Leader>q" ciw""<Esc>P
:nnoremap <Leader>q' ciw''<Esc>P
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P


" =============== Go to tab by number ==================
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 :tablast<cr>

let g:syntastic_check_on_open = 0
let g:syntastic_html_checkers=['']
" For TypeScript http://stackoverflow.com/questions/34102184/use-tsconfig-json-for-tsc-with-syntastic-in-vim
let g:syntastic_typescript_tsc_fname = ''

" ======== Quick switch buffer ========
" does not work due to yankring plugins
" nnoremap <C-n> :bnext<CR>
" nnoremap <C-p> :bprevious<CR>



" ================== Lazy Moving ===============================
" https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard
" Comment out as conflicted with buffer switching

" Normal mode
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==

" Insert mode
" inoremap <C-j> <ESC>:m .+1<CR>==gi
" inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv


" BUFFERS
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>

" REVEAL CURRENT BUFFER IN NERDTREE
nmap <Leader>n :NERDTreeFind<CR>

" Better solarized color
" http://ethanschoonover.com/solarized/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" -- if using Base16-shell & Base16-vim
let base16colorspace=256  " Access colors present in 256 colorspace
" for better highlight of cursor blink when encounter matching tag - which is hard to see
hi MatchParen cterm=none ctermbg=green ctermfg=blue
colorscheme base16-default-dark

" CUSTOM COMMAND
com! FormatJSON %!python -m json.tool
com! ToggleIndentWidth4 :set tabstop=4 shiftwidth=4 expandtab
com! ToggleIndentWidth2 :set tabstop=2 shiftwidth=2 expandtab

" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yp :let @*=expand("%")<cr>:echo "Copied file name to clipboard"<cr>
" Copy current filename to system clipboard
nnoremap <Leader>yd :let @*=expand("%:p")<cr>:echo "Copied file directory to clipboard"<cr>



