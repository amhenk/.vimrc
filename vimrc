"Make vim nice
execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme elflord

if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

" Draws a line bar across the current line on the current window
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

set background=dark

" Colors for statusline
hi User1 ctermbg=green ctermfg=white guibg=green guifg=red
hi User2 ctermbg=green ctermfg=black guibg=green guifg=red

" Set status line to be visible and show path
set laststatus=2
set statusline=%1*[%n]\ %2*%<%.99f%1*\ %h%w%m%r%y
set statusline+=[ASCII=\\%03.3b/Hex=\\%02.2B] "Adds ASCII / Hex value of current character
set statusline+=%=%-16(\ %l,%c-%v\ %)%p%%

" Add tab in front of line
let @a = '^i	^^€kd^'    

" Remember, "noh" to turn off highlighting (ctrl-* to turn on)

" Quick Load and Save sessions
" Write session with F2
map <leader>sv :mksession! ~/.vim/vim_session <cr>
" Load session with F3
map <leader>op :source ~/.vim/vim_session <cr> 

" set auto indent
set autoindent

" line numbers on by default but let \l toggle them
set number
nnoremap <leader>l :set number!<CR>

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

" Simplify window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
