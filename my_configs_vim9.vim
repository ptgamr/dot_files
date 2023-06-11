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

set clipboard=unnamedplus

" =================== BACKUP ===================
set backup
set backupdir=~/.vim_backups/
set writebackup
set backupcopy=yes
"Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = substitute(expand('%:p:h'), '/', '%', 'g') . '@' . strftime("%F.%H:%M")

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

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
\ 'python': ['flake8']
\}

let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'html': ['prettier'],
\ 'typescript': ['prettier'],
\ 'handlebars': ['prettier'],
\ 'python': ['black'],
\}

let g:ale_pattern_options = {
\'node_modules': {'ale_fixers': [], 'ale_linters': []},
\'cms': {'ale_fixers': []},
\'ems-app': {'ale_fixers': []},
\'ems-fm-staff': {'ale_fixers': []},
\'ems-fm-vp': {'ale_fixers': []},
\'tracking/ByteTrack': {'ale_fixers': [], 'ale_linters': []},
\'tracking/mots_tools': {'ale_fixers': [], 'ale_linters': []},
\}

let g:ale_open_list = 0
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 200
let g:ale_virtualtext_cursor = 'current'

" let g:ale_python_black_options = '--line-length 140'

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
nnoremap \ :NERDTreeFind<CR>

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

au FileType javascript syn match jsDecorator '@[a-zA-Z_][0-9a-zA-Z_$]*'
au FileType javascript hi link jsDecorator Function

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
" set foldmethod=syntax
" set foldmethod=manual
" set foldmethod=indent
" set foldlevelstart=100
" set foldcolumn=0
set nofoldenable    " disable folding

:noremap A @a

if executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'
endif

" noremap <F6> :w<CR>:!python %<CR>
" nnoremap <F6> :w<CR>:!python %:p<CR>
" autocmd BufWinEnter *.py nnoremap <F5> :w<CR>:!python3 %:p<CR>

hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" hi ALEError guibg=green ctermbg=green cterm=undercurl

" Fix colors of YCM
" highlight YcmErrorLine guibg=Red ctermbg=Red
" highlight YcmWarningLine guibg=LightYellow ctermbg=LightYellow
" highlight YcmWarningSection guibg=LightYellow ctermbg=LightYellow
" highlight YcmErrorSection guibg=Red ctermbg=Red
" highlight YcmErrorLine None
" highlight YcmWarningLine None
highlight YcmWarningSection None
highlight YcmErrorSection None
highlight YcmWarningSign guibg=LightYellow ctermbg=LightYellow
highlight YcmErrorSign guibg=Red ctermbg=Red

"============== TYPESCRIPT - YouCompleteMe ========================
let g:ycm_auto_trigger=1
" keybind : from http://blog.jobbole.com/58978/
set completeopt-=preview " Disable the preview window on completion
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_always_populate_location_list = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gd :YcmShowDetailedDiagnostic<CR>


" " ========================== Coc.Nvim =============================

" " if hidden is not set, TextEdit might fail.
" set hidden

" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" " Better display for messages
" set cmdheight=2

" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" " don't give |ins-completion-menu| messages.
" set shortmess+=c

" " always show signcolumns
" set signcolumn=yes

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <leader>gg <Plug>(coc-definition)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
" nmap <leader>ff  <Plug>(coc-codeaction)

" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" " nmap <silent> <C-d> <Plug>(coc-range-select)
" " xmap <silent> <C-d> <Plug>(coc-range-select)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" " Remap for format selected region
" " xmap <leader>f  <Plug>(coc-format-selected)
" " nmap <leader>f  <Plug>(coc-format-selected)


" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" " inoremap <silent><expr> <TAB>
" "       \ pumvisible() ? "\<C-n>" :
" "       \ <SID>check_back_space() ? "\<TAB>" :
" "       \ coc#refresh()
" " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" " function! s:check_back_space() abort
" "   let col = col('.') - 1
" "   return !col || getline('.')[col - 1]  =~# '\s'
" " endfunction



" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

filetype plugin on
