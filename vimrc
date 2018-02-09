" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Install vim-plug if it is already not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Syntastic plugin
Plug 'scrooloose/syntastic'

" Editorconfig Plugin
Plug 'editorconfig/editorconfig-vim'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" One colorscheme
Plug 'flazz/vim-colorschemes'

" Easy (un)comments
Plug 'scrooloose/nerdcommenter'

" Nerdtree explorer
Plug 'scrooloose/nerdtree'

" Go Plugin
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Latex plugin
Plug 'lervag/vimtex'

" tagbar plugin
Plug 'majutsushi/tagbar'

" Direnv plugin
Plug 'direnv/direnv.vim'

" All of your Plugins must be added before this line
call plug#end()

" Enable filetype plugin
filetype plugin indent on

" Set colorscheme to github
colorscheme github

" Set line numbers
set nu!

" Set ruler
set ruler

" Search related settings
set smartcase
set ignorecase
set hlsearch
set incsearch

set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set pumheight=10             " Completion window max size

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" Turn on magic for regular expressions
set magic

" Show matching bracket
set showmatch

" Enable syntax highlighting
syntax enable

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif

set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set textwidth=72

" Personal configurations:

" Set quick escape from insert mode.
imap jj <esc>
imap Jj <esc>
imap jJ <esc>
imap JJ <esc>

" Set quick command mode from normal mode.
map ; :

" Set quick save from command mode.
map S ;w<enter>

" Set quick visual folder browsing.
map T ;edit ./<enter>

" Indent a block of code.
map e ;s/^/  /<enter>
map E ;s/^  //<enter>

" Enable the syntax highlighting on enabled terminals.
if &t_Co > 1
   syntax enable
endif

" Set tab settings appropriate for source code editing.
set tabstop=2
set shiftwidth=2
set expandtab

" Enable incremental search.
set incsearch

" Enable fast window switching.
map t ;wincmd 

" Place the cursor in the center of the screen at all times.
"set scrolloff=999

" Force cursor to be 'near' center of the screen after scrolling down.
set scrolljump=15

" Buffer manipulation commands
map H ;tabp<enter>
map L ;tabn<enter>
map F ;tab

" Turn off annoying highlighting.
" set nohlsearch

" Turn on autosave.
set autowrite

" Turn on paren high-lighting.
set showmatch

" Wrap long lines
set wrap

" splitting shortcuts
map B ;vsplit<enter>;wincmd l<enter>;n 
map X ;split<enter>;wincmd j<enter>;n 

" use console mouse
" set mouse=a

" use cursor line highlighting
if version >= 700
	"set cursorline
endif

" map f11/12 keys to forward-back in quick-fix
map <F11> ;cp<enter>
map <F12> ;cn<enter>

" alignment command
map B mzgqap`z

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Manual pages
runtime! ftplugin/man.vim

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Enable goimports to automatically insert import paths
let g:go_fmt_command = "goimports"

" Fix issues with vim-go and syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:deoplete#enable_at_startup = 1
let g:deocomplete#enable_smart_case = 1
let g:deocomplete#sources#syntax#min_keyword_length = 3
if !exists('g:deocomplete#sources')
  let g:deocomplete#sources = {}
endif
let g:deocomplete#sources._ = ['buffer', 'member', 'tag', 'file', 'dictionary']
let g:deocomplete#sources.go = ['omni']
