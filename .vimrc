" run pathogen
execute pathogen#infect()

" turn on 256-color terminal where supported 
set t_Co=256

" favorite color scheme seen thus far
" to get, clone this: https://github.com/thayerwilliams/vimbrant.git
colorscheme vimbrant

" get syntax always
syntax on

" replace tabs with 4 spaces
set tabstop=4
set expandtab

" use both to get an absolute num in current line 
" and relative nums elsewhere
set number relativenumber

" highlight search results syntax
set hlsearch

" get visual menu for tabbed options always
set wildmenu

" remap keys for split pane navigation (Chromebook!)
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>

set cc=70

" define a function which returns the syntax highlight groups under the
" current cursor.
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" allow the syntax item call to be made from the status line
" (comment this out if it clutters the line)
set statusline+=%{SyntaxItem()}

" always show 2nd status line (for syntax highlighting groups
set laststatus=2
