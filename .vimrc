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

" Shortcuts for navigation between files
nnoremap <C-A-s> :w<CR>:bn<CR>              " Ctrl + Alt + s: go to next buffer
nnoremap <C-A-a> :w<CR>:bp<CR>              " Ctrl + Alt + a: go to previous buffer
nnoremap <C-A-l> :ls
" Ctrl + Alt + l: show buffers
nnoremap <C-A-p> :w<CR>:b
" with number (or #): go to that buffer



set showtabline=2

"         Element     Background  Foreground
highlight TabLine     ctermbg=NONE ctermfg=245    " inactive buffer
highlight TabLineSel  ctermbg=18  ctermfg=255     " current buffer
highlight! TabLineFill ctermbg=NONE ctermfg=NONE  " empty space

" Build the tab
function! MyTabLine()
  let s = ''
  for i in range(1, bufnr('$'))
    if bufexists(i) && buflisted(i)
      let filename = bufname(i)
      if filename == ''
        let filename = '[No Name]'
      else
        let filename = fnamemodify(filename, ':t')
      endif

      if i == bufnr('%')
        let s .= '%#TabLineSel#'
      else
        let s .= '%#TabLine#'
      endif

      let s .= ' ' . i . ':' . filename . ' '
    endif
  endfor
  "let s .= '%#TabLineFill#'
  return s
endfunction

set tabline=%!MyTabLine()
