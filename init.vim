"PACKAGE MANAGER vim-plug
"Pluins are placed at ~/.local/share/nvim/plugged/
":PlugInstall to install plugins
":PlugUpdate to install or update plugins

":PlugUpgrade to upgrade vim-plug itself
":PlugStatus to check the status of plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator' "use Ctrl-h,j,k,l,\ to seamlessly move between vim splits and Tmux panes
Plug 'junegunn/fzf.vim' "make fzf inside vim working better; more functions: :Colors
Plug 'vim-airline/vim-airline' "status bar
Plug 'scrooloose/nerdtree' "navigate file by tree
Plug 'scrooloose/nerdcommenter' "comment code
Plug 'airblade/vim-gitgutter' "git support
Plug 'sheerun/vim-polyglot' "many language packs (supports colorful text highlighting, etc.)
Plug 'ervandew/supertab' "use tab key instead of ctrl-p, and shift-tab instead of ctrl-n
Plug 'jiangmiao/auto-pairs' "insert, delete brackets, parentheses, quotes in pairs
Plug 'tpope/vim-endwise' "auto add 'end' for many languages
Plug 'eugen0329/vim-esearch' "text search support
Plug 'google/vim-searchindex' "display number of search matches & index of current match
Plug 'ntpeters/vim-better-whitespace' "whitespace highlighting
"theme plugins:
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
call plug#end()
"comment on why choose supertab plugin: there are many more powerful auto-complete plugins (YouCompleteMe, deoplete)
"but a lightweight, context-based (openning files, etc.), not a language-wide complete machanism, is what I need

filetype plugin indent on
syntax on
syntax enable
set encoding=utf-8
set number "show line number
set relativenumber
set ruler
set wrap linebreak nolist "wrap long lines, only wrap at a characters like space/tab/punctuation
"set showbreak=>\  "string to put at the start of lines that have been wrapped
set breakindent "wrapped lines have same indent as the first line
set ignorecase "case insensitive search
set clipboard=unnamed "yank, delete, change, put operates in system clipboard
set autoindent
set backspace=indent,eol,start
set expandtab
set smarttab
set tabstop=2 "number of VISUAL spaces per TAB when OPENING
set softtabstop=2 "number of spaces in TAB when EDITING
set shiftwidth=2
set termguicolors
set t_Co=256
"set cursorline "highlight current line
set splitbelow
set splitright
"set fillchars+=vert:│
set fillchars+=vert:\ 
"set shell=/usr/local/bin/zsh
set scrolloff=10 "scroll offset
set timeoutlen=1000 ttimeoutlen=0 "eliminate pause when leave insert mode
set complete-=i "not look for matches in included files when auto-complete (ctrl-p,n)
set nrformats-=octal "not increase/decrease numbers by octal notation (numbers start with 0)
set laststatus=2 "always show status line
set wildmenu
set whichwrap+=h,l,<,>,[,] "moving cursor left, right still works when move between lines
set display+=lastline
set sessionoptions-=options "not save options and mappings when :mksession (Session.vim)
set hlsearch "highlight search results
set incsearch "start searching when typing characters
" set lazyredraw don't redraw while executing macros, improve performance when running macros. But this requires pressing enter if a search is not found, which is annoying
set spellfile=$HOME/.vim/spell/en.utf-8.add

set rtp+=/usr/local/opt/fzf

"auto save when lost focus
autocmd FocusLost * wa
"autocmd BufLeave,FocusLost * silent! wall

"THEME
" colorscheme iceberg
colorscheme onedark
" colorscheme dracula
set background=dark

"KEY MAPPINGS
inoremap kj <esc>
tnoremap <esc> <c-\><c-n>
tmap kj <esc>

nnoremap <c-w>m <c-w>_<c-w>\|

"gitgutter
nmap tn <Plug>(GitGutterNextHunk)
nmap tp <Plug>(GitGutterPrevHunk)
nmap td <Plug>(GitGutterPreviewHunk)
nmap tu <Plug>(GitGutterUndoHunk)
nmap ts <Plug>(GitGutterStageHunk)
"not use 'g' as prefix because it conflicts with many other default keys
"not use gu for undo hunk because it conflicts with convert to lowercase

"LEADER SHORTCUTS
let mapleader="\<Space>"
nnoremap <leader>w :w<enter>
nnoremap <leader>q :q<enter>
"comment on <leader>q: if set to :wq then get error when quit unmodifiable split;
"if set to :q then have to :w before quit
"that's why I have <leader>Q:
nnoremap <leader>Q :wq<enter>
nnoremap <leader>x :nohlsearch<enter>
nnoremap <leader>f :FZF<enter>

nnoremap <leader>n :NERDTreeToggle<enter>
nnoremap <leader>m :NERDTreeFind<enter>

nnoremap <leader>d obinding.pry<esc>

call esearch#map('<leader>s', 'esearch') "start esearch prompt
"call esearch#map('<leader>sw', 'esearch-word-under-cursor') "start esearch with the word under the cursor; not need because can be set in g:esearch.use, and it could cause delay after pressing key because of duplicated <leader>s prefix

"spell check
"turn on spell check
nnoremap <leader>pc :set spell spelllang=en_us<enter>
"turn off spell check
nnoremap <leader>px :set nospell<enter>
"move to next misspelled word
nnoremap <leader>pn ]s
"move to previous misspelled word
nnoremap <leader>pp [s
"add word to dictionary
nnoremap <leader>pa zg
"show word suggestion
nnoremap <leader>ps z=

"edit and load dotfiles
nnoremap <leader>ez :vsp ~/.zshrc<enter>
nnoremap <leader>et :vsp ~/.tmux.conf<enter>
nnoremap <leader>ev :vsp $MYVIMRC<enter>
nnoremap <leader>lv :source $MYVIMRC<enter>
"not use <leader>sv (source vim) because prefix conflicts with search, which causes delay

"TMUX-NAVIGATOR
let g:tmux_navigator_save_on_switch=2 "write ALL buffers before navigating from vim to tmux

"FZF
let g:fzf_action={
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir='~/.local/share/fzf-history' "enable fzf history. Ctrl-N,P will bound to next/previous history instead of down/up

"AIRLINE (STATUS BAR)
let g:airline#extensions#whitespace#checks=[ 'indent', 'mixed-indent-file' ] " remove 'trailing', 'long' checks
let g:airline_skip_empty_sections=1
let g:airline_mode_map={
  \ '__' : '-',
  \ 'c'  : 'C',
  \ 'i'  : 'I',
  \ 'ic' : 'I',
  \ 'ix' : 'I',
  \ 'n'  : 'N',
  \ 'ni' : 'N',
  \ 'no' : 'N',
  \ 'R'  : 'R',
  \ 'Rv' : 'R',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ ''   : 'S',
  \ 't'  : 'T',
  \ 'v'  : 'V',
  \ 'V'  : 'V' }
call airline#parts#define_accent('mode', 'none') "remove bold format of mode (NORMAL, INSERT...) in status bar from existing theme
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.branch=''
let g:airline_symbols.whitespace=''
"g:airline_section_a keeps as default, because it doesn't only display 'mode', but also many other useful indicators
let g:airline_section_b=''
let g:airline_section_c=airline#section#create(['%f'])
let g:airline_section_x=airline#section#create(['%L'])
let g:airline_section_y=airline#section#create(['%3c'])
let g:airline_section_z=airline#section#create(['%3p%%'])
"let g:airline_section_b=airline#section#create(['hunks']) "git changes
"let g:airline_section_c=airline#section#create(['%t'])
"let g:airline_section_c=airline#section#create(['file'])
"let g:airline_section_y=airline#section#create(['%l','/','%L',':','%c'])
"let g:airline_section_y=airline#section#create(['%L',' |','%3c',' |','%3p%%'])
let g:airline#extensions#tabline#enabled=1 "enable enhanced tab bar, show all buffers when there's only one tab open
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#tab_nr_type=1 "show tab index
let g:airline#extensions#tabline#show_tab_type=0 "hide [buffers]/[tabs] texts
let g:airline#extensions#tabline#show_close_button=0

"GITGUTTER
set updatetime=100 "miliseconds
let g:gitgutter_max_signs=1000 "suppress signs when file has more than 1000 changes

"NERDTREE
let NERDTreeMinimalUI=1 "hides 'Bookmarks' label & 'Press ? for help' text
let NERDTreeAutoDeleteBuffer=1 "auto remove a buffer when file is deleted or renamed via a context menu command
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40
let NERDTreeMapOpenSplit='h'
let NERDTreeMapPreviewSplit='H'
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapPreviewVSplit='V'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "close if the only window left open is a NERDTree

"AUTO-PAIRS
let g:AutoPairsCenterLine=0 "disable: centering current line after <enter> if that line is at bottom 1/3 of window
let g:AutoPairsMultilineClose=0 "only jump to a closing pair on the same line: avoid unintended jump after type close bracket

"NERDCOMMENTER
let g:NERDSpaceDelims=1 "add extra spaces around delimiters when commenting, and remove them when uncommenting
let g:NERDDefaultAlign='left' "left alignment instead of follow code indentation

"VIM-ESEARCH
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'word_under_cursor'],
  \ 'default_mappings': 0 }
"explains:
"'out': results output target: 'win' - esearch window, or 'qflist' - quickfix window
"'use': default value to suggest, prioritized:
"  - text under visual mode (selected)
"  - word under cursor
"'default_mappings'=0: disable default_mappings, re-define them to avoid unknown key mapping conflicts
call esearch#out#win#map('t', 'tab')
call esearch#out#win#map('h', 'split')
call esearch#out#win#map('v', 'vsplit')
call esearch#out#win#map('o', 'open')
"call esearch#out#win#map('<Enter>', 'open')
"open silently (keep focus on the results window)
call esearch#out#win#map('T', 'tab-silent')
call esearch#out#win#map('H', 'split-silent')
call esearch#out#win#map('V', 'vsplit-silent')
"move cursor in search result view
call esearch#out#win#map('<C-j>', 'next')
call esearch#out#win#map('<C-n>', 'next-file')
call esearch#out#win#map('<C-k>', 'prev')
call esearch#out#win#map('<C-p>', 'prev-file')
"options when typing search pattern
call esearch#cmdline#map('<C-r>', 'toggle-regex')
call esearch#cmdline#map('<C-c>', 'toggle-case')
call esearch#cmdline#map('<C-w>', 'toggle-word')
call esearch#cmdline#map('<C-h>', 'cmdline-help')

"VIM-BETTER-WHITESPACE
let g:better_whitespace_guicolor='#005f5f'
let g:better_whitespace_operator='' "disable clean extra whitespace operator (default <leader>s)
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help'] "override filetype list which whitespace highlighting is disabled

"VIM-STARTIFY

