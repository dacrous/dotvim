" Use vim settings rather than vi settings
set nocompatible

filetype indent on " enable detection, plugins and indenting in one step

" highlight any text beyond column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Editing behaviour {{{
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                " case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                " shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
"set virtualedit=all             " allow the cursor to go in to "invalid" places
set virtualedit=block
set hlsearch                    " highlight search terms
map <F2> :set hlsearch!<Enter>
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
set pastetoggle=<F4>            " when in insert mode, press <F4> to go to
                                " paste mode, where you can paste mass data
                                " that won't be autoindented
"set mouse=a                     " enable using the mouse if terminal emulator
                                " supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                " with 1-letter words (looks stupid)
" }}}

" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                " if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high
" }}}

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
"set wildmenu                    " make tab completion for files/buffers act like bash
"set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
"set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
"set ttyfast                     " always use a fast terminal
set cursorline                  " underline the current line, for quick orientation
set splitbelow
set splitright
set ruler
" }}}

" Highlighting {{{
"if &t_Co >= 256 || has("gui_running")
"   colorscheme molokai
"endif

if &t_Co > 2 || has("gui_running")
   syntax on                    " switch syntax highlighting on, when the terminal has colors
endif

au BufNewFile,BufRead *.less set filetype=less

" }}}

"This is for setting Makefiles with tabs not spaces
autocmd FileType make setlocal noexpandtab


ab #d #define
ab #i #include

set clipboard=unnamed



""" syntax on
""" set smartindent
""" set background=dark
""" set nu
""" set tabstop=4
""" set shiftwidth=4
""" set ruler
""" set virtualedit=block
""" set backspace=start,eol,indent
""" set textwidth=80
""" set incsearch
""" ab #d #define
""" ab #i #include
""" set fo=croq
""" set path+=./**
""" set splitbelow
""" set splitright
""" set expandtab
""" "au BufRead,BufNewFile TODO set filetype=mytodo
""" "au! Syntax mytodo source $HOME/mytodo.vim
""" 
""" " printing commands
""" "set printdevice=HPLaserJet2420_C6
""" "set printdevice=bsc_hp2420_7
""" set printdevice=hp3015_5
""" set printoptions=paper:a4,duplex:long,number:y,left:5mm
""" set printfont=:h8
""" 
""" " folding commands
""" au FileType changelog set foldenable foldmethod=indent
""" "colorscheme koehler
""" map <F2> :set hlsearch!<Enter>
""" map <Up> gk
""" map <Down> gj
""" map <Home> g^
""" map <End> g$
""" map <F3> :NERDTreeToggle<Enter>
""" let NERDTreeIgnore=['\.o$']
""" 
""" " remember cursor position
""" :au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""" 
""" "To use gc to swap the current character with the next, without changing the cursor position:
""" 
""" :nnoremap <silent> gc xph
""" 
""" "To use gw to swap the current word with the next, without changing cursor position: (See note.)
""" 
""" :nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
""" " This version will work across newlines:
""" :nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
""" 
""" " This will look in the current directory for "tags", and work up the tree 
""" " towards root until one is found. IOW, you can be anywhere in your source 
""" " tree instead of just the root of it.
""" set tags=./tags;/
""" nnoremap CTRL+] :exe 'tj' expand('<cword>')<CR>
""" 
""" 
""" 
""" "To use gl to swap the current word with the previous, keeping cursor on current word: (This feels like "pushing" the word to the left.) (See note.)
""" 
""" ":nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
""" 
""" "To use gr to swap the current word with the next, keeping cursor on current word: (This feels like "pushing" the word to the right.) (See note.)
""" 
""" ":nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
""" 
""" "To use g{ to swap the current paragraph with the next:
""" 
""" ":nnoremap g{ {dap}p{
""" 
""" "Note: Mappings above which perform a search-and-replace (ones containing :s/) will operate incorrectly on words with accented characters. To adjust the mappings above to work with your locale, replace all \w with [alphabet] and \W with [^alphabet], where alphabet is the set of characters in your alphabet. :help /\w

au BufNewFile,BufRead *.tikz set filetype=tex

""" Enable pathogen plugin:  In practical terms, pathogen.vim makes it super
""" easy to install plugins and runtime files in their own private directories.
call pathogen#infect()

""" Mapping to enable Tagbar
nmap <F8> :TagbarToggle<CR>
