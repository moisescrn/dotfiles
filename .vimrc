" Vim configuration file

set nocompatible       " Compatible with Vi or not -> for some plug-ins
"filetype off           " Do not detect the file type that I am working with
set number             " Sets the line numbers
highlight LineNr ctermfg=26   " Change color of the numbers 

" Enable indentation
filetype plugin indent on
set autoindent
set smartindent

set tabstop=2
set shiftwidth=4
set expandtab          " convert tabs to spaces

set hlsearch           " highlight my searches
set t_Co=256           " use 256 Colors

set wildmenu           " comand line completion

syntax on

set ignorecase
set splitbelow         " New window after split comes up below

" Change comment and string colors
        " Too see how the comments are called, put the cursor on a comment and run
        " :echo synIDattr(synID(line("."), col("."), 1), "name")"
" C/C++:
highlight cCommentL ctermfg=245    " Line comments
highlight cComment ctermfg=65      " Normal comments
highligh cppString ctermfg=161
highlight cppNumber ctermfg=51
highligh cCppString ctermfg=161
highlight cNumber ctermfg=51

" Python:
highlight pythonComment ctermfg=109


" Open terminal at botom, full width, 4 lines tall
function! OpenSmallTerm()
    execute 'terminal'
    call feedkeys("\<C-\>\<C-n>", 'n')    " go to normal mode
    execute 'resize 4'
    call feedkeys('i')                    " go back to insertion mode
endfunction

command! Cp call OpenSmallTerm()      " open little terminal to compile
