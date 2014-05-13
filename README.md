dotvim
======

My highly tuned vim distribution

## Introduction

This is my **personal** vim distribution, tweaked and finely tuned over time,
so that it is easy to install into brand new machines and get vim up and
running fast

## Installation

1. Clone this repository into your `~/.vim` directory
1. `git submodule init && git submodule update`
1. `mv ~/.vimrc ~/.vimrc.backup`
1. create the following shim and save it as `~/.vimrc`:
```
   source ~/.vim/vimrc
```
1.  startup vim and neobundle will detect and ask you install any missing plugins.  you can also manually initiate this with `:NeoBundleInstall`
1.  done!

## Plugins

### [unite](https://github.com/Shougo/unite.vim)
* The unite plug-in can search and display information from arbitrary sources
like files, buffers, recently used files or registers. You can run several
pre-defined actions on a target displayed in the unite window.

* Mappings:
   * `<ctrl-f>` (non-recursively) browse files in current directory
   * `<ctrl-y>` browse yank history
   * `<ctrl-b>` browse open buffers


### [tagbar](https://github.com/majutsushi/tagbar)
* Tagbar is a vim plugin for browsing the tags of source code files. It provides
a sidebar that displays the ctags-generated tags of the current file, ordered
by their scope. This means that for example methods in C++ are displayed under
the class they are defined in.

### [vim-airline](https://github.com/bling/vim-airline)
* A status/tabline for vim with lots of useful information

### [indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* Indent Guides is a plugin for visually displaying indent levels in Vim.

### License
[WTFPL](http://sam.zoy.org/wtfpl/)
