set nocompatible        " turn off vi compatable mode


filetype off            " for pathogen
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'

Plugin 'fugitive.vim'

call vundle#end()
filetype plugin indent on " for pathogen



set showcmd             " show when I press <leader>
set ignorecase




set tabstop=4           " TAB width
set shiftwidth=4        " Indent width = 4
set expandtab 		    " Expand TABs to spaces

syntax on
colorscheme ThemerVim

"
" Lightline settings
"
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"
" jedi-vim options
"
let g:jedi#use_tabs_not_buffers = 1
