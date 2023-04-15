" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nowrap

let g:bufExplorerSortBy='mru'
map <leader>o :BufExplorerVerticalSplit<cr>


" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set showcmd
set showmode                    "Show current mode down the bottom
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set autoread                    "Reload files changed outside vim

set clipboard=unnamed

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
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --recurse-submodules', 'find %s -type f']
" let g:ctrlp_custom_ignore = 'build\|bower_components\|node_modules\|DS_Store\|git'
let g:NERDTreeWinPos = "left"

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'python': []
\}

let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\}

let g:ale_pattern_options = {
\'backend-application': {'ale_fixers': [], 'ale_linters': ['eslint']},
\'.js$': {'ale_fixers': [], 'ale_linters': ['eslint']},
\'node_modules': {'ale_fixers': [], 'ale_linters': ['eslint']},
\}

let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 200

command! ALEDisableFixers       let g:ale_fix_on_save=0
command! ALEEnableFixers        let g:ale_fix_on_save=1
command! ALEDisableFixersBuffer let b:ale_fix_on_save=0
command! ALEEnableFixersBuffer  let b:ale_fix_on_save=0
command! ALEToggleFixers call functions#fckALEToggle('global')
command! ALEToggleFixersBuffer call functions#fckALEToggle('buffer')

" nmap <silent> <C-[> <Plug>(ale_previous_wrap)
" nmap <silent> <C-]> <Plug>(ale_next_wrap)

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

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

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

" autocmd FileType typescript call s:typescript_filetype_settings()
" function! s:typescript_filetype_settings()
"   set makeprg=tsc
" endfunction

let g:user_emmet_leader_key='<C-Z>'

set rnu

"map <Leader> <Plug>(easymotion-prefix)
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap <Leader>s <Plug>(easymotion-overwin-f)
" fix conflict with spellcheck
"nmap <Leader>ss <Plug>(easymotion-overwin-f)s
" o
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:jsx_ext_required = 0
set foldlevelstart=5
set foldcolumn=0

:noremap A @a

if executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'
endif

" noremap <F6> :w<CR>:!python %<CR>
" nnoremap <F6> :w<CR>:!python %:p<CR>
" autocmd BufWinEnter *.py nnoremap <F5> :w<CR>:!python3 %:p<CR>

hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" ALE & YouCompleteMe highlighting
" hi ALEError guibg=green ctermbg=green cterm=undercurl
" hi YcmErrorSection ctermbg=none cterm=underline

" Fix colors of YCM
highlight YcmWarningSign guibg=LightYellow ctermbg=LightYellow
highlight YcmErrorSign guibg=Red ctermbg=Red
" highlight YcmErrorLine guibg=Red ctermbg=Red
" highlight YcmWarningLine guibg=LightYellow ctermbg=LightYellow
" highlight YcmWarningSection guibg=LightYellow ctermbg=LightYellow
" highlight YcmErrorSection guibg=Red ctermbg=Red
highlight YcmErrorLine None
highlight YcmWarningLine None
highlight YcmWarningSection None
highlight YcmErrorSection None


" TYPESCRIPT - YouCompleteMe
"let g:ycm_auto_trigger=1
" keybind : from http://blog.jobbole.com/58978/
set completeopt-=preview " Disable the preview window on completion
" let g:ycm_add_preview_to_completeopt = 0

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>

" =================== BACKUP ===================
set backup
set backupdir=~/.vim_backups/
set writebackup
set backupcopy=yes

" Meaningful backup name, ex: filename@2015-04-05.14:59
" support full path of the file to avoid name collision
au BufWritePre * let &bex = substitute(expand('%:p:h'), '/', '%', 'g') . '@' . strftime("%F.%H:%M")

