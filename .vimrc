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

set so=2                " Lines b/w cursor and bottom when scrolling down

set wildignore=*.o,*~,*.pyc

set incsearch           " Match items as you search

set lazyredraw          " perf improvement?

syntax on
colorscheme ThemerVim


"
" Visual mode stuff
"
" Search for current selection # (forward search) * (backwards search)
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>



"
" Lightline settings
"
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified' ] ]
      \ }
      \ }

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"
" jedi-vim options
"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0


"
" Helper functions
"

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"
" FileType
"

autocmd FileType css setlocal shiftwidth=2 tabstop=2


" https://stackoverflow.com/questions/37275567/how-do-i-configure-vim-to-not-indent-the-current-line-upon-hitting-return
"
augroup overrideftplugins
    au!
    au FileType * set cinkeys= indentkeys=
augroup END

