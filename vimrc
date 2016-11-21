"Make vim nice
execute pathogen#infect()

syntax on
filetype plugin indent on

set background=dark
colorscheme darkblue

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


" PATHOGEN PACKAGES -----------------------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" Open NerdTree when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Open NerdTree on vim enter
autocmd vimenter * NERDTree

" Jump to the main Window instead of NERDTree
autocmd vimenter * wincmd p

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

command NT NERDTree

" -----------------------------------------------------

set backspace=indent,eol,start
" Colors for statusline
hi User1 ctermbg=green ctermfg=white guibg=green guifg=red
hi User2 ctermbg=green ctermfg=black guibg=green guifg=red

" Set status line to be visible and show path
set laststatus=2
set statusline=%1*[%n]\ %2*%<%.99f%1*\ %h%w%m%r%y
set statusline+=[ASCII=\\%03.3b/Hex=\\%02.2B] "Adds ASCII / Hex value of current character
set statusline+=%=%-16(\ %l,%c-%v\ %)%p%%


" Remember, "noh" to turn off highlighting (ctrl-* to turn on)

" Adds new line without entering insert mode
" as well as maintain cursor location on line
nmap <leader>] o<Esc>k
nmap <leader>[ O<Esc>j

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

" Add N newlines with "N\o" or default 3 new lines
function! OpenLines( nrlines, dir )
    let nrlines = a:nrlines < 3 ? 3 : a:nrlines
    let start = line('.') + a:dir
    call append(start, repeat([''], nrlines))
    if a:dir < 0
        normal! 2k
    else
        normal! 2j
    endif
endfunction

"Map to open multiple lines and enter insert mode
nnoremap <leader>o :<C-u>call OpenLines(v:count, 0)<CR>S
nnoremap <leader>O :<C-u>call OpenLines(v:count, -1)<CR>S

