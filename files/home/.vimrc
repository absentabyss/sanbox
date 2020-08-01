set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'DrawIt'
Plugin 'godlygeek/tabular'
Plugin 'pangloss/vim-javascript'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'unblevable/quick-scope'
Plugin 'valloric/youcompleteme'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on

let NERDTreeShowLineNumbers=1

map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>clear&&t $VIM_DIR<CR>
map <F5> :cd %:p:h<CR>
