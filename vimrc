" NeoVundle Setting------------------------------------------------------- {{{
set nocompatible
filetype off

" Initialize NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet', {
  \ 'depends' : 'Shougo/neocomplcache'
  \ }

NeoBundleLazy 'Shougo/neocomplcache-rsense', {
  \ 'depends'  : 'Shougo/neocomplcache',
  \ 'autoload' : { 'filetypes' : 'ruby' }}


NeoBundle 'Lokaltog/vim-easymotion'
NeoBundleLazy 'pangloss/vim-javascript', {
  \ 'autoload' : { 'filetypes' : 'javascript' }}
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/ftplugin'}

NeoBundle 'tpope/vim-fugitive' 
NeoBundleLazy 'tpope/vim-rails.git', {
  \ 'autoload' : { 'filetypes' : 'ruby' }}
NeoBundleLazy 'kchmck/vim-coffee-script', {
  \ 'autoload' : { 'filetypes' : 'coffee' }}

NeoBundle 'tpope/vim-surround'
" NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'skwp/vim-rspec'

NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree', { 'augroup' : 'NERDTreeHijackNetrw'}
NeoBundle 'vim-scripts/YankRing.vim'

" Color Scheme
NeoBundleLazy 'tomasr/molokai'
NeoBundleLazy 'Solarized'
NeoBundle     'sjl/badwolf'

filetype plugin indent on

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" }}}

" Basic Settings----------------------------------------------------- {{{
set guifont=Ricty\ for\ Powerline
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" Delete Key Problem
set backspace=2 " make backspace work like most other apps

" Apply .vimrc immidiately after saving .vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc



" }}}

" Display Settings----------------------------------------------------- {{{
set autoread
:set number
" :Set relativenumber
filetype plugin indent on
:set hidden
:set autowrite
:set hlsearch
:set ic
" }}}

" Status line ------------------------------------------------------------- {{{
set laststatus=2  "Always display the statusline in all windows
set noshowmode    "Hide the default mode text (e.g. -- INSERT -- below the statusline)"

" set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
" set statusline=%f    " Path.
" set statusline+=%m   " Modified flag.
" set statusline+=%r   " Readonly flag.
" set statusline+=%w   " Preview window flag.

" set statusline+=\    " Space.

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
" set statusline+=%*

" set statusline+=%=   " Right align.

" " File format, encoding and type.  Ex:          " (unix/utf-8/python)"
" set statusline+=(
" set statusline+=%{&ff}                        " Format (unix/DOS).
" set statusline+=/
" set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
" set statusline+=/
" set statusline+=%{&ft}                        " Type (python).
" set statusline+=)

" " Line and column position and counts.
" set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" File format, encoding and type.  Ex: "
" set statusline+=(
" set statusline+=%{&ff)
" set statusline+=/
" set statusline+=%{strlen()
" set statusline+=/
" set statusline+=%{&ft)
" set statusline+=)

" " Line and column position and counts.
" set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" set hidden
" set modelines=0
" set list
" set listchars=tab:>-
" }}}

" {{{ Color Settings
set t_Co=256
syntax on
set background=dark

colorscheme badwolf

" MacVimで動かしたときはSolarizedのdarkを適用
if has("gui_macvim")
  set background=dark
  " NeoBundleSource 'Solarized'
  " colorscheme Solarized
endif
" }}}

" Bell Settings--------------------------------------------------------- {{{
set visualbell
set noerrorbells
" }}}
 
" Key Binding ------------------------------------------------------------- {{{

let mapleader = ","
let g:mapleader = ","
 
" Spliting the Screen
nmap <Space>- :split<cr><cr>
nmap <Space>\| :vsplit<cr><cr>
 
" deleting search highlight
nmap <Esc><Esc> :nohlsearch<CR><Esc>
 
" disable K
nnoremap K <nop>

" escape key remapping
inoremap jk <esc>

" disable save a file named '
autocmd! BufWritePre fuck 
      \ try | echoerr 'Hey thats not nice to call a file ' . expand('<afile>') | endtry
autocmd! BufWritePre ' 
      \ try | echoerr 'This file should not be saved: ' . expand('<afile>') | endtry

nnoremap <Leader>a  :RunSpec<CR>
nnoremap <Leader>l  :RunSpecLine<CR>
nnoremap <Leader>al :RunSpecs<CR>

" }}}

" Indent Setting------------------------------------------------------- {{{
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
" }}}

" Folding--------------------------------------------------------------- {{{
set foldmethod=marker
set foldlevelstart=0
"nnoremap <Space> za
"vnoremap <Space> za
" }}}

" Backup Settings------------------------------------------------------- {{{
set nobackup
set noswapfile
" }}}

" Line Numbering-------------------------------------------------------- {{{
:set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

noremap <C-n><C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" }}}

" Paste / Nopaste ------------------------------------------------------ {{{
autocmd InsertLeave * set nopaste
nmap <F11> :set paste<cr>
" }}}

" ctag setting---------------------------------------------------------- {{{
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <silent> <Leader>m :TagbarToggle<CR>
" }}}

" ctrlP ---------------------------------------------------------------- {{{
let g:ctrlp_map = "<Leader>t"
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0
" }}}

" Tabularize------------------------------------------------------------ {{{
if exists("Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>al :Tabularize /,\zs<CR>
  vmap <Leader>al :Tabularize /,\zs<CR>
endif
" }}}

" NERD-tree------------------------------------------------------------- {{{
let g:NERDTreeWinSize = 40
nmap <silent> <Leader>n :NERDTreeToggle<CR>
" }}}

" WildMenu-------------------------------------------------------------- {{{
set wildignore+=*/.hg,*/.git,*/.svn                       " VCS
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg            " Images
set wildignore+=*/vendor/*,*/log/*,*/tmp/*,*/app/admin/*  " Rails
set wildignore+=*/app/view/admin,*/coverage,*/bin   " Rails
" set wildignore+=*.jar,*.class                             " Java
" set wildignore+=rebar,tags,*.beam,deps/*,rel/*,*/ebin/*   " Erlang
set wildignore+=*.lzo,*.zip,*.gz,*.tgz,*.tar              " Compressed files
set wildignore+=*.log,BLANK,*.log.[0-9]*,*.lock,*.pid     " log, lock, pid files "
set wildignore+=*.DS_Store                                " OS X
" }}}

" YankRing ------------------------------------------------------------- {{{
let g:yankring_paste_v_akey = ''
let g:yankring_paste_v_bkey = ''
" }}}

" QuickRun --------------------------------------------------------- {{{
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runner': 'vimproc'}
" }}}

" Utility Function ----------------------------------------------------- {{{
function! s:warningMsg(msg)
  echohl WarningMsg
  echomsg a:msg
  echohl None
endfunction
" }}}

" Vimgrep     ------------------------------------------------------ {{{
autocmd QuickFixCmdPost *grep* cwindow

nnoremap [q :cprevious<CR>   " To Previous 
nnoremap ]q :cnext<CR>       " To Next 
nnoremap [Q :<C-u>cfirst<CR> " To First
nnoremap ]Q :<C-u>clast<CR>  " To Last 

" }}}

" neocomplcache ----------------------------------------------------- {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'  : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme'   : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
  " return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"

inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" }}}

" neosnippet ------------------------------------------------------- {{{
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}

" vim-rspec--------------------------------------------------------- {{{
let g:RspecKeymap=0
let g:RspecSplitHorizontal=0
" }}}}

" なにこれ？
autocmd QuickfixCmdPost make copen

" Abbreviations
iabbrev parmas params

" More File Types
au BufNewFile,BufRead *.thor set filetype=ruby
