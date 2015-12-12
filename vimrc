"Make vim nice
execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme elflord

set background=dark

" Need to fix, supposed to add C style comments to beginning of line
let @c ='i// ^[^<80>kd^['

" Remember, "noh" to turn off highlighting (ctrl-* to turn on)

" set auto indent
set autoindent
" turn line numbers on
set number
" make tab insert indents instead of tabs at the beginning of a line
set smarttab
" use spaces instead of tab character
set expandtab
" size of indent
set shiftwidth=4
" does something
set softtabstop=4
" How many spaces to show for a literal tab
set tabstop=4

" Always report how many lines were modified
set report=0

" Set folding to occur
set foldmethod=indent
set foldlevelstart=20

" Keep a large undohistory
set undolevels=2000
" WARNING: May need to have it keep undo history in a seperate file

" Sets the vertical split option to split right
" Changes horizontal split to set new window on bottom
if has('windows')
    set splitbelow
    if has('vertsplit')
        set splitright
    endif

    if exists('&showtabline')
        set showtabline=1
    endif
endif

" When wrapping, if a line is too long it adds the @ symbol in the left column
" But this shows as much as possible but gets rid of the @ 
set display=lastline

" Don't allow wrapping by default, but lets \w toggle it on
set nowrap
nnoremap <leader>w :set wrap!<CR>

if has('linebreak')
    set linebreak
    set showbreak=...

    "Bind \b to turn off linebreak and toggle
    if has('eval')
    function! ToggleBreak()
        if &linebreak
            set nolinebreak
            set showbreak=
        else
            set linebreak
            set showbreak=...
        endif
    endfunction
    nnoremap <silent> <leader>b:<C-U>call ToggleBreak()<CR>
    endif
endif
