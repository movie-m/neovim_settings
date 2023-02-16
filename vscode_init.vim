" Note: The installed plugins work well on NVIM v0.7.0!
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

let g:gruvbox_italic=1

" " -- highlight trailing white-space -- "
" " ref: https://vim.fandom.com/wiki/Highlight_unwanted_spaces
" weird red in floaterm
" if (&ft!='qf')
"     autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"     match ExtraWhitespace /\s\+$/
"     autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"     autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"     autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"     autocmd BufWinLeave * call clearmatches()
" endif

" https://unix.stackexchange.com/questions/574764/vim-automatically-clear-the-command-line
" autocmd CursorHold * echo ''

" -- fix the delete key behavior on mac os -- "
" set backspace=eol,start,indent

" -- VIM Plugin Manager -- "
" specify a directory for plugins
" - for neovim: stdpath('data') . '/plugged'
" - avoid using standard vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'kazhala/close-buffers.nvim'

Plug 'preservim/nerdtree'
" Plug 'edluffy/hologram.nvim'
" Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
" Plug 'nvim-tree/nvim-tree.lua'

Plug 'ntpeters/vim-better-whitespace'

Plug 'chipsenkbeil/distant.nvim'
Plug 'azabiong/vim-highlighter'

Plug 'kdheepak/lazygit.nvim'

Plug 'numToStr/Comment.nvim'

" Center the vim view horizontally
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'preservim/vim-pencil'

" Surrounding text objects
Plug 'machakann/vim-sandwich'

" Build integration
" ref: https://codevion.github.io/#!vim/cpp2.md
Plug 'cdelledonne/vim-cmake'
Plug 'antoinemadec/FixCursorHold.nvim'
" neovim terminal in the floating/popup window
Plug 'voldikss/vim-floaterm'

" command line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Allow raw rg commands
Plug 'jesseleite/vim-agriculture'

" make sure you use single quotes
Plug 'junegunn/vim-easy-align'

" syntax highlighting for json with c-style comments
Plug 'neoclide/jsonc.vim'
" Plug 'kevinoid/vim-jsonc'

" URL highlighting tool
Plug 'itchyny/vim-highlighturl'

" open URL under cursor in vim with web browser using vim default cmd gx
" ref: https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser

" python syntax highlighting
Plug 'vim-python/python-syntax'

" highlighting for many languages
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" highlight matching brackets
Plug 'luochen1990/rainbow'

" for git
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'

" new status bar
Plug 'vim-airline/vim-airline'

" displaying thin vertical lines at each indentation level
" Plug 'yggdroot/indentline'
Plug 'lukas-reineke/indent-blankline.nvim'

" file system explorer and search
" Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'
" Plug 'ctrlpvim/ctrlp.vim'

" asyncronously compiling plugin
Plug 'skywind3000/asyncrun.vim'

" Using vim's internal terminal
Plug 'skywind3000/vim-terminal-help'

" Building, Testing, and Deploying Tasks
Plug 'skywind3000/asynctasks.vim'

" Use release branch (recommend)
" Not work in VSCode
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" show a git diff
Plug 'mhinz/vim-signify'

" tell vim to load the theme/plugin
Plug 'morhetz/gruvbox'

" search and replace
" Plug 'brooth/far.vim'

" Easy Motion
Plug 'easymotion/vim-easymotion'

" initialize plugin system
call plug#end()

" -- spell check -- "
set spell spelllang=en_us

" -- disable spell checking in terminal buffers -- "
au TermOpen * setlocal nospell

" -- color theme -- "
" avoid suppressing spelling check
augroup my_colours
  autocmd!
  autocmd colorscheme gruvbox hi spellbad cterm=reverse
augroup end

set background=dark
colorscheme gruvbox

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

" -- vim easy align -- "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Define new delimiters
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }
" Default:
"   If a delimiter is in a highlight group whose name matches
"   any of the followings, it will be ignored.
let g:easy_align_ignore_groups = ['String']

" -- settings for blamer.nvim -- "
let g:blamer_enabled = 0
let g:blamer_delay = 500

" -- setting for nerdtree --"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" -- setting for indentline -- "
" let g:indentline_enabled = 1
" let g:indentline_setconceal = 0
" let g:indentline_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
" let g:indent_blankline_show_first_indent_level = v:false
" lua << EOF
" vim.g.indent_blankline_show_first_indent_level = false

" require("indent_blankline").setup {
" }
" EOF

" -- vim-signify default updatetime 4000ms is not good for async update -- "
set updatetime=100

" Disable the diagnostics in SelectMode
" au ModeChanged *:s :let b:coc_diagnostic_disable = 1 | call CocActionAsync('diagnosticRefresh')
" au ModeChanged s:s :let b:coc_diagnostic_disable = 1 | call CocActionAsync('diagnosticRefresh')
" au ModeChanged n:* :let b:coc_diagnostic_disable = 1 | call CocActionAsync('diagnosticRefresh')
" au ModeChanged *:i :let b:coc_diagnostic_disable = 1 | call CocActionAsync('diagnosticRefresh')
" au ModeChanged *:n :let b:coc_diagnostic_disable = 0 | call CocActionAsync('diagnosticRefresh')
" au ModeChanged n:n :let b:coc_diagnostic_disable = 0 | call CocActionAsync('diagnosticRefresh')

" Make vim treat all json files as jsonc to allow comments
" ref: https://www.codegrepper.com/code-examples/html/coc+allow+comments+in+json
augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc autoread
augroup END

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

" -- Easy Motion -- "
" <Leader>f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" f{char}{char} to move to {char}{char}
nmap <Leader>f <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" -- rainbow for highlighting matching brackets -- "
" https://vi.stackexchange.com/questions/14803/cmake-syntax-highlighting-not-working-as-expected
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       'cmake': 0,
\   }
\ }


" --  python syntax highlighting -- "
let g:python_highlight_all = 1
let g:python_highlight_space_errors	= 0

" -- coc-pyright -- "
" ref: https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#resolve-workspace-folder
autocmd FileType python let b:coc_root_patterns = ['.root']
" -- vim agriculture -- "
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
" nmap <Leader>* <Plug>RgRawWordUnderCursor
nmap <Leader>w <Plug>RgRawWordUnderCursor <cr>
let g:agriculture#disable_smart_quoting = 0

" -- asynctasks -- "
" be sure to creat file .root in where the make.sh resides.
let g:asyncrun_rootmarks = ['.root']
let g:asyncrun_open = 6
" bind the F7 to the uos-build in ~/.config/nvim/tasks.ini
noremap <silent><f9> :AsyncTask uos-build<cr>

" -- fold by syntax --"
" zo to open a fold "
" zc to close a fold"
" za to toggle "
set foldmethod=syntax
" prevent folding when launched
set nofoldenable
" prevent closing all folded regions when first time zc
set foldlevel=99

" resize window ALT+(h|j|k|l)
:nnoremap <silent> <c-Up> :resize -1<CR>
:nnoremap <silent> <c-Down> :resize +1<CR>
:nnoremap <silent> <c-left> :vertical resize -1<CR>
:nnoremap <silent> <c-right> :vertical resize +1<CR>
" noremap <M-j> :resize +1<CR>
" noremap <M-k> :resize -1<CR>
" noremap <M-h> :vertical resize -1<CR>
" noremap <M-l> :vertical resize +1<CR>

" view the expaned full path where the current line resides
" nnoremap <C-p> :echo expand('%:p')<CR>

" Open files by default to the right split
set splitright

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" -- make comments italic in both vim-terminal and vim-GUI-- "
highlight Comment cterm=italic

" -- determine the number of context lines above and below the cursor --"
" -- set it to a large value to cause the cursor to stay in the middle line when possible --"
" set so=10000 this will spoil the following settings!
" We can work around it by using autocommand in normal and insert mode
" set cursorline

" ref: https://stackoverflow.com/questions/50026385/is-it-possible-to-automatically-make-vim-vertically-center-the-line-when-typing
" keep cursorline centered in insert mode automatically
" when its resides within last 1/3 of buffer on typing any character or entering insert mode in this region
" augroup autoCenter
"   autocmd!
"   autocmd InsertCharPre,InsertEnter * if (winline() * 3 >= (winheight(0) * 2))
"                                             \| norm! zz
"                                         \| endif
" augroup END
" The above commands suppress the auto-completeion of coc-vim.

" ref: https://vi.stackexchange.com/questions/26039/how-to-keep-cursor-vertically-aligned-to-center-even-at-the-end-of-buffer
" Remapping few keystrokes that can cause the cursor to change lines
" inoremap <CR> <C-\><C-O><C-E><CR>
" inoremap <BS> <BS><C-O>zz
" nnoremap o <C-E>o

" -- keep cursorline centered in normal mode -- "
augroup KeepCentered
  autocmd!
  autocmd CursorMoved * normal! zz
  autocmd CursorMoved * :set cul
augroup END

set cursorline

" To map <Esc> to exit terminal-mode:
" tnoremap <Esc> <C-\><C-n>:q<CR>
" You need type bd! to kill the terminal buf
" tnoremap <Esc> <C-\><C-n>
" use bd! to close the terminal since it is special type of buffer

let g:floaterm_position = 'bottom'
let g:floaterm_width = 1.0
let g:floaterm_height = 0.4
let g:floaterm_autoclose = 2
let g:floaterm_autoinsert = 1
let g:floaterm_keymap_new = '<Leader>t'
let g:floaterm_keymap_prev = '<Leader>pt'
let g:floaterm_keymap_next = '<Leader>nt'
let g:floaterm_keymap_first = '<Leader>ft'
let g:floaterm_keymap_last = '<Leader>lt'
let g:floaterm_keymap_hide = '<Leader>ht'
let g:floaterm_keymap_show = '<Leader>gt'
let g:floaterm_keymap_kill = '<Leader>kt'
" let g:floaterm_keymap_toggle = '<Leader>st'


nnoremap <Leader>ka :FloatermKill!<CR>
tnoremap <Leader>f+ <cmd>FloatermUpdate --height=1.0<cr>
tnoremap <Leader>f- <cmd>FloatermUpdate --height=g:floaterm_height<cr>
nnoremap <Leader>f+ <cmd>FloatermUpdate --height=1.0<cr>
nnoremap <Leader>f- <cmd>FloatermUpdate --height=g:floaterm_height<cr>

" https://vi.stackexchange.com/questions/21260/how-to-clear-neovim-terminal-buffer
nmap <c-p><c-l> :set scrollback=1 \| sleep 100m \| set scrollback=10000 \| :echo ''<CR>
tmap <c-p><c-l> <c-\><c-n><c-p><c-l>i<c-l>

" enable goyo when start vim
" autocmd vimenter * Goyo

" Goyo
let g:goyo_width = 100
let g:goyo_height = '98%'
let g:goyo_linenr = 1

function! s:goyo_enter()
    " :AirlineToggle
    " Limelight
    " ...
endfunction

function! s:goyo_leave()
    " set eventignore=
    " if executable('tmux') && strlen($TMUX)
    "   silent !tmux set status on
    "   silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    " endif
    " set showmode
    " set showcmd
    " set scrolloff=5
    Limelight!
    " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" -- for vim-cmake -- "
nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nmap <leader>ci :CMakeInstall<cr>
nmap <leader>cq :CMakeClose<cr>
let g:cmake_link_compile_commands = 1
let g:cmake_root_markers = ['CMakeLists.txt']
let g:cmake_default_config	= ''
let g:cmake_build_dir_location = 'build'

hi SpellLocal cterm=none
hi SpellRare cterm=none
" hi SpellBad cterm=none
hi SpellCap cterm=none


" unmap :W for fzf-vim
" https://github.com/junegunn/fzf.vim/issues/1084
" https://vi.stackexchange.com/questions/27785/disable-command-but-allow-to-write-in-command-mode
command! -nargs=* W w
set nospell

" Disable built-in cc (delete and then insert)
map cc <Nop>

" Enable lua syntax highlighing
let g:vimsyn_embed = 'l'

" Plug 'numToStr/Comment.nvim'
lua << EOF
require('Comment').setup()
local ft = require('Comment.ft')
ft.set('cpp', {'/* %s */'})
ft.set('jsonc', {'/* %s */'})
EOF

lua << EOF
require('distant').setup {
    ['my.server.address'] = {
        distant = {
            bin = '/home/uisee/.cargo/bin/distant',
        },
    },
   ['*'] = require('distant.settings').chip_default(),
}
EOF

let g:netrw_browser_viewer='open'

" nmap <C-t> :NvimTreeToggle<CR>
