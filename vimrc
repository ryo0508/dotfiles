" NeoVundle Setting------------------------------------------------------- {{{
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

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

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'Shougo/neocomplcache.vim.git'
NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

" vim-scripts repos
NeoBundle 'Command-T'
NeoBundle 'EasyMotion'
NeoBundle 'L9'
NeoBundle 'quickrun.vim'
NeoBundle 'surround.vim'
NeoBundle 'Tabular'
NeoBundle 'taglist.vim'
NeoBundle 'tComment'
NeoBundle 'The-NERD-tree'
NeoBundle 'YankRing.vim'

" Color Scheme
NeoBundle 'tomasr/molokai'
NeoBundle 'Solarized'
NeoBundle 'sjl/badwolf'


" Non github repos

" Non git repos

"...
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
  colorscheme solarized
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

nnoremap <Leader>a :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

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
" }}}

" Command-T------------------------------------------------------------- {{{
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1
nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>b :CommandTBuffer<CR>
nmap <silent> <Leader>f :CommandTFlush<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>m :TagbarToggle<CR>
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
" }}}

" WildMenu-------------------------------------------------------------- {{{
set wildignore+=.hg,.git,.svn                           " VCS
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg          " Images
set wildignore+=vendor/*,log/*,tmp/*,*app/admin/*       " Rails
set wildignore+=*app/view/admin/*,coverage/*,bin/*      " Rails
set wildignore+=*.jar,*.class                           " Java
set wildignore+=rebar,tags,*.beam,deps/*,rel/*,*/ebin/* " Erlang
set wildignore+=*.lzo,*.zip,*.gz,*.tgz,*.tar            " Compressed files
set wildignore+=*.log,BLANK,*.log.[0-9]*,*.lock,*.pid   " log, lock, pid files "
set wildignore+=*.DS_Store                              " OS X
" }}}

" YankRing ------------------------------------------------------------- {{{
let g:yankring_paste_v_akey = ''
let g:yankring_paste_v_bkey = ''
" }}}

" Surround.vim --------------------------------------------------------- {{{
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

" vimgrep     ------------------------------------------------------ {{{
autocmd QuickFixCmdPost *grep* cwindow

nnoremap [q :cprevious<CR>   " To Previous 
nnoremap ]q :cnext<CR>       " To Next 
nnoremap [Q :<C-u>cfirst<CR> " To First
nnoremap ]Q :<C-u>clast<CR>  " To Last 

" }}}

"neocomplcache ----------------------------------------------------- {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
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
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
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
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}

" なにこれ？
autocmd QuickfixCmdPost make copen

" Abbreviations
iabbrev parmas params

" More File Types
au BufNewFile,BufRead *.thor set filetype=ruby

" Quickrunx x vimproc x rspec
let g:quickrun_config = {}

augroup QrunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config._ = {'runner' : 'vimproc'}

let g:quickrun_config['rspec/normal'] = {
  \ 'type':       'rspec/normal',
  \ 'command':    'rspec',
  \ 'exec':       'rspec',
  \ 'outputter/buffer/filetype': 'rspec-result',
  \ 'vsplit': ''
  \ }

let g:quickrun_config['rspec/spring'] = {
  \ 'type':        'rspec/spring',
  \ 'command':     'rspec',
  \ 'exec':        './bin/rspec %s',
  \ 'outputter/buffer/filetype': 'rspec-result',
  \ 'vsplit': ''
  \ }

let g:quickrun_config['rspec/bundle'] = {
  \ 'type':        'rspec/bundle',
  \ 'command':     'rspec',
  \ 'exec':        'bundle exec %c %s',
  \ 'outputter/buffer/filetype': 'rspec-result',
  \ 'vsplit': ''
  \}

function! RspecQuickrun()
  " let b:quickrun_config = { 'type' : 'rspec/bundle' }
  " let b:quickrun_config = { 'type' : 'rspec/normal' }
  let b:quickrun_config = { 'type' : 'rspec/spring' }
endfunction

autocmd BufReadPost *_spec.rb call RspecQuickrun()
