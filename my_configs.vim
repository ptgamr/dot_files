" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nowrap

let g:bufExplorerSortBy='mru'
map <leader>o :BufExplorerVerticalSplit<cr>


" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
autocmd BufWritePre * :%s/\s\+$//e

set showcmd
set showmode                    "Show current mode down the bottom
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set autoread                    "Reload files changed outside vim


" ============ Yank to clipboard on MAC =======
" set clipboard=unnamedplus


set number "Line numbers are good
set nowrap

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

"let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|git'
let g:NERDTreeWinPos = "left"
"let g:syntastic_javascript_checkers = ['standard']
"autocmd FileType javascript let b:syntastic_checkers = (findfile('.eslintrc', '.;') != '' || findfile('.eslintrc.json', '.;') != '') ? ['eslint'] : ['jshint']

" =============== ESLint ============================
" Use the locally installed eslint first, fallback to global one
" https://github.com/airbnb/javascript/issues/465
function! SyntasticESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
      let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:syntastic_javascript_eslint_exec = l:eslint
endfunction


let g:syntastic_javascript_checkers = ["eslint"]

autocmd FileType javascript :call SyntasticESlintChecker()

" ================ Replace with yanked text ============
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" viw,p

" xnoremap <leader>p "_dP
" REPLACE WORD WITH YANKED TEXT
nnoremap <Leader>pw viwpgvy

" BUFFERS
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>

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
let g:syntastic_typescript_tsc_fname = ''

" ======== Quick switch buffer ========
" does not work due to yankring plugins
" nnoremap <C-n> :bnext<CR>
" nnoremap <C-p> :bprevious<CR>



" ================== Lazy Moving ===============================
" https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard

" Normal mode
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==

" Insert mode
"inoremap <C-j> <ESC>:m .+1<CR>==gi
"inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv


" REVEAL CURRENT BUFFER IN NERDTREE
nnoremap <Leader>n :NERDTreeFind<CR>

" Yank fullpath to the + register
nnoremap <Leader>yfp :let @+=expand("%:p")<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
:imap jk <Esc>

" Better solarized color
" http://ethanschoonover.com/solarized/vim-colors-solarized
" syntax enable
" set background=dark
" colorscheme solarized


syntax on
"let g:solarized_termcolors=16
"let base16colorspace=256
"set t_Co=256
set background=dark
colorscheme solarized

" CUSTOM COMMAND
com! FormatJSON %!python -m json.tool
com! ToggleIndentWidth4 :set tabstop=4 shiftwidth=4 expandtab
com! ToggleIndentWidth2 :set tabstop=2 shiftwidth=2 expandtab

function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')

autocmd FileType typescript call s:typescript_filetype_settings()
function! s:typescript_filetype_settings()
  set makeprg=tsc
endfunction

let g:user_emmet_leader_key='<C-Z>'

set rnu

set foldlevel=99
set foldcolumn=0
nnoremap <Space> za
vnoremap <Space> za
