set nocompatible        " turn off vi compatable mode


filetype off            " for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'

Plugin 'fugitive.vim'

call vundle#end()
filetype plugin indent on " for vundle

set noswapfile          " turn off disk cache for vim

set showcmd             " show when I press <leader>
set ignorecase          " aint nobody got time for shift key

set tabstop=4           " TAB width
set shiftwidth=4        " Indent width = 4
set expandtab 		    " Expand TABs to spaces

set so=2                " Lines b/w cursor and bottom when scrolling down

set wildignore=*.o,*~,*.pyc

set incsearch           " Match items as you search
set nohlsearch          " Default - don't highlight search
noremap <Leader>\ :set hlsearch!<CR> " toggle hlsearch

set nomodeline          " Turn off modelines

let g:netrw_dirhistmax = 0     " Turn off netrw history

set lazyredraw          " Limit screen redraws

syntax on
colorscheme ThemerVim

" possible fix for slow vimdiff
let g:diff_translations = 0

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
" vimwiki
"

" wrapping url links 
let g:vimwiki_url_maxsave = 10

function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
      let link = link[1:]
    else
      return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
    else
      exe 'tabnew ' . fnameescape(link_infos.filename)
      return 1
    endif
endfunction


"
" FileType
"

autocmd FileType css setlocal shiftwidth=2 tabstop=2
" leader+c comment in py and sh files
autocmd FileType python,sh,conf nnoremap <buffer> <localleader>c I#<esc>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

