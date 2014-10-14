" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

" setup & neobundle {{{
    """ In practical terms, neobundle.vim makes it super
    """ easy to install plugins and runtime files in their 
    """ own private directories, as well as fetch the plugins
    """ from the web (github default).
    set nocompatible                                " Use vim settings rather than vi settings
    set rtp+=~/.vim/bundle/neobundle.vim/           "Required for NeoBundle
    call neobundle#rc(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
" }}}

" bundles {{{

    " bundles: core {{{
        NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
    "}}}

    " bundles: plugins {{{

        NeoBundle 'bling/vim-airline'
        NeoBundle 'nathanaelkane/vim-indent-guides'

        if executable('ctags')
            NeoBundle 'majutsushi/tagbar'
        endif

        NeoBundle 'Shougo/unite.vim'
        NeoBundle 'lilydjwg/colorizer'

        
    " }}}

    " bundles: colorschemes {{{

        NeoBundle 'dacrous/vim-desertink'
        NeoBundle 'tomasr/molokai'
        NeoBundle 'sickill/vim-monokai'
        NeoBundle 'nanotech/jellybeans.vim'
        NeoBundle 'altercation/vim-colors-solarized'
        NeoBundle 'csexton/spacemanspiff.vim'

    " }}}

    NeoBundleCheck
" }}}

" Set augroup
augroup MyAutoCmd
    autocmd!
augroup END

filetype indent on " enable detection, plugins and indenting in one step
colorscheme desertink

"" highlight any text beyond column 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v/

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
    "set virtualedit=all             " allow the cursor to go in to 'invalid' places
    set virtualedit=block
    set hlsearch                    " highlight search terms
    set incsearch                   " show search matches as you type
    set gdefault                    " search/replace 'globally' (on a line) by default
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

" Folding rules {{{
    set foldenable " enable folding
    set foldcolumn=2 " add a fold column
    set foldmethod=marker " detect triple-{ style fold markers
    set foldlevelstart=99 " start out with everything unfolded
    set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
    " which commands trigger auto-unfold
    function! MyFoldText()
        let line = getline(v:foldstart)

        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart

        " expand tabs into spaces
        let onetab = strpart(' ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')

        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
        return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
    endfunction
    set foldtext=MyFoldText()

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
    set history=10000               " remember more commands and search history
    set undolevels=10000            " use many muchos levels of undo
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
    "set visualbell                  " don't beep
    set noerrorbells                " don't beep
    set showcmd                     " show (partial) command in the last line of the screen
                                    "    this also shows visual selection info
    set nomodeline                  " disable mode lines (security measure)
    "set ttyfast                     " always use a fast terminal
    set cursorline                  " underline the current line, for quick orientation
    set nosplitbelow                " put new splits to the right and above
    set splitright

    set ruler

    set magic                       " Make regex easier to type
    set colorcolumn=81
    set nobackup                    " don't create backup files
    set noswapfile                  " don't create swap files
" }}}

"" Highlighting {{{
"    if &t_Co >= 256 || has("gui_running")
"       colorscheme molokai
"    endif
"
"    if &t_Co > 2 || has("gui_running")
"        syntax on                    " switch syntax highlighting on, when the terminal has colors
        set guioptions+=t            " add tear off menu items
        set guioptions-=T            " remove toolbar icons
        set cursorline               " Highlight the screen line of the cursor
"    endif
"
"    au BufNewFile,BufRead *.less set filetype=less
"" }}}


" 256 bit terminal
set t_Co=256

" Font
" for some reason, Monaco sometimes leaves rendering artifacts when deleting 
" characters, so I'm disabling it for now
" set guifont=Monaco\ 12  
set guifont=Deja\ Vu\ Sans\ Mono\ 12

"This is for setting Makefiles with tabs not spaces
autocmd FileType make setlocal noexpandtab


ab #d #define
ab #i #include

" writes to the unnamed register and also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif


au BufNewFile,BufRead *.tikz set filetype=tex


" Reload vimrc when edited
autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif

"" Mappings {{{

    " Unite {{{
        let g:unite_source_history_yank_enable = 1
        call unite#filters#matcher_default#use(['matcher_fuzzy'])

        " browse/search files recursively with <C-f>
        " nnoremap <C-f> :<C-u>Unite -toggle -buffer-name=files -start-insert file_rec/async:!<cr>

        " browse/search files with <C-f>
        nnoremap <C-f> :<C-u>Unite -toggle -buffer-name=files -start-insert file<cr>

        " browse yank history with <C-y>
        nnoremap <C-y> :<C-u>Unite -toggle -buffer-name=yank history/yank<cr>

        " browse open buffers with <C-b>
        nnoremap <C-b> :<C-u>Unite -toggle -buffer-name=buffer  buffer<cr>


        " Custom mappings for the unite buffer
        autocmd FileType unite call s:unite_settings()
        function! s:unite_settings()
            " Enable <C-f>, <C-y>, <C-b> in insert mode to close the unite buffer
            imap <buffer> <C-f>   <Plug>(unite_exit)
            imap <buffer> <C-y>   <Plug>(unite_exit)
            imap <buffer> <C-b>   <Plug>(unite_exit)
            "imap <buffer> <Esc>   <Plug>(unite_exit)
        endfunction
    " }}}

    " Tagbar {{{
        " Mapping to enable Tagbar
        nnoremap <F8> :TagbarToggle<CR>
    " }}}

    " General {{{

        " turn highlighting on/off 
        nnoremap <F2> :set hlsearch!<Enter>


        " Mappings to easily toggle fold levels
        nnoremap z0 :set foldlevel=0<cr>
        nnoremap z1 :set foldlevel=1<cr>
        nnoremap z2 :set foldlevel=2<cr>
        nnoremap z3 :set foldlevel=3<cr>
        nnoremap z4 :set foldlevel=4<cr>
        nnoremap z5 :set foldlevel=5<cr>

    " }}}
"" }}}
