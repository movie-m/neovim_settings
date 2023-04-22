set cursorline
" -- disable auto-comment in line continuation -- "
au bufenter * set fo-=c fo-=r fo-=o
" -- limit the text width -- "
autocmd VimEnter * set textwidth=100 formatoptions+=t
set cinkeys-=:

" -- set a line width marker -- "
set colorcolumn=100

" -- remove color column in quickfix window --"
au FileType qf setlocal colorcolumn=

set shell=zsh
" -- display row and column number on the status bar -- "
set ruler

" ref: https://superuser.com/questions/238362/enable-mouse-for-scrolling-only-in-vim-in-iterm-macosx
set mouse=nicr
" -- highlight trailing white-space -- "
" ref: https://vim.fandom.com/wiki/Highlight_unwanted_spaces
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

" -- fix the delete key behavior on mac os -- "
" set backspace=eol,start,indent

" -- spell check -- "
" set spell spelllang=en_us
set nospell

" -- disable spell checking in terminal buffers -- "
au TermOpen * setlocal nospell

" -- color theme -- "
" avoid suppressing spelling check
" augroup my_colours
"   autocmd!
"   autocmd colorscheme gruvbox hi spellbad cterm=reverse
" augroup end
"
" set background=dark
" colorscheme gruvbox

" -- show line number -- "
set number

" -- key binding -- "
" set leader key
let mapleader = ","

" leader+w to save
" inoremap <leader>w <esc>:w<cr>
" noremap <leader>w :w<cr>

" mapping delay
set timeoutlen=500
set ttimeoutlen=50

" -- detect the file type, load file type specific plugins, and indent --"
filetype plugin indent on

" -- syntax highlighting -- "
syntax on

" -- tab, space, etc. --"
" tabstop:          width of tab character
" softtabstop:      fine tunes the amount of white space to be added
" shiftwidth        determines the amount of whitespace to add in normal mode
" expandtab:        when this option is enabled, vi will use spaces instead of tabs
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>>', use 4 spaces width
" when in visual mode, `5>` indent the current line 5 times
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

" -- required for operations modifying multiple buffers like rename -- "
set hidden

" Hightlight Trailing Whitespaces
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

call plug#begin()
    Plug 'asvetliakov/vim-easymotion'
call plug#end()

" <Leader>f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)dd
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
