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

" support Motorola 68k file syntax with atypical extensions
augroup filetypedetect
    au BufRead,BufNewFile *.X68 setfiletype asm68k
    au BufRead,BufNewFile *.x68 setfiletype asm68k
augroup END

augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|REMOVE)( |:)/ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" vim-airline status line things
let g:airline_powerline_fonts = 1
