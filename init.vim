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

" -- highlight trailing white-space -- "
" ref: https://vim.fandom.com/wiki/Highlight_unwanted_spaces
if (&ft!='qf')
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
endif

" -- fix the delete key behavior on mac os -- "
" set backspace=eol,start,indent

" -- VIM Plugin Manager -- "
" specify a directory for plugins
" - for neovim: stdpath('data') . '/plugged'
" - avoid using standard vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'azabiong/vim-highlighter'

" commenter
Plug 'preservim/nerdcommenter'

" nvim v0.5.0
Plug 'kdheepak/lazygit.nvim'

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
" Plug 'neoclide/jsonc.vim'
Plug 'kevinoid/vim-jsonc'

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
Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'
" Plug 'ctrlpvim/ctrlp.vim'

" asyncronously compiling plugin
Plug 'skywind3000/asyncrun.vim'

" Using vim's internal terminal
Plug 'skywind3000/vim-terminal-help'

" Building, Testing, and Deploying Tasks
Plug 'skywind3000/asynctasks.vim'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" show a git diff
Plug 'mhinz/vim-signify'

Plug 'jackguo380/vim-lsp-cxx-highlight'

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


" let g:asyncrun_open = 6
let g:asyncrun_open = 6

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


" -- setting from coc.vim github  --"
" Note you can add extension names to the g:coc_global_extensions variable,
" and coc will install the missing extensions after coc.nvim service started.
let g:coc_global_extensions = ['coc-json',
            \'coc-snippets',
            \'coc-git',
            \'coc-clangd',
            \'coc-marketplace',
            \'coc-sh',
            \'coc-pyright',
            \'coc-cmake',
            \'coc-webview',
            \'coc-markdownlint',
            \'coc-markdown-preview-enhanced',
            \'coc-clangd']
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=UTF-8

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Show both line numbers and git status
" https://stackoverflow.com/questions/67975383/is-there-a-way-to-show-both-line-numbers-and-git-status-in-vim-when-using-the-ai
set signcolumn=yes

" Use <tab> and <S-tab> to navigate completion list: >
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, use:
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use:
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion:
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" shortcut to switch between header and source using clangd
nmap <silent> <C-h> :call CocActionAsync('runCommand', 'clangd.switchSourceHeader')<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-declaration)
" show definition in a new split
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)n
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" let wordUnderCursor=expand("<cword>")
nnoremap <leader>crn :CocCommand workspace.inspectEdit<CR>
nnoremap <A-f> :CocSearch
nnoremap <silent> <Leader>cf :exe 'CocSearch '.expand('<cword>')<CR>
" let wordUnderCursor=expand("<cword>")
" nnoremap <A-f> :CocSearch
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Start multiple cursor sessions
" add current character range to cursors
" nmap <silent> <C-c> <Plug>(coc-cursors-position)
" add current word range to cursors.
" nmap <silent> <C-d> <Plug>(coc-cursors-word)
" add current visual selected range to cursors.
" xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
" nmap <leader>x  <Plug>(coc-cursors-operator)
nmap <silent> <C-d> <Plug>(coc-cursors-word)*
xmap <silent> <C-d> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

" root pattern for python project, especially for coc-pright to work properly
" https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#resolve-workspace-folder
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', '.root']


" " -- vim-cpp-modern for c/c++ syntax highlighting -- " " Disable function highlighting (affects both C and C++ files) let g:cpp_function_highlight = 1


let g:coc_default_semantic_highlight_groups = 1

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
" nmap <Leader>* <Plug>RgRawWordUnderCursor <cr>
nmap <Leader>w <Plug>RgRawWordUnderCursor <cr>
let g:agriculture#disable_smart_quoting = 0

" -- asynctasks -- "
let g:asyncrun_rootmarks = ['.root']
let g:asyncrun_open = 6
noremap <silent><f9> :AsyncTask build<cr>

" -- fold by syntax --"
" zo to open a fold "
" zc to close a fold"
" za to toggle "
set foldmethod=syntax
" prevent folding when launched
set nofoldenable
" prevent closing all folded regions when first time zc
set foldlevel=99

" Not working on macos
" resize window Alt+(h|j|k|l)
" noremap <A-j> :resize +1<CR>
" noremap <A-k> :resize -1<CR>
" noremap <A-h> :vertical resize -1<CR>
" noremap <A-l> :vertical resize +1<CR>
" ctrl + arrow keys to reize the split windows
" Turn off the same shortcut in MacOS Preferences -> Keyboard -> Mission Control
" nnoremap <silent> <C-Up> :resize -1<CR>
" nnoremap <silent> <C-Down> :resize +1<CR>
" nnoremap <silent> <C-Left> :vertical resize -1<CR>
" nnoremap <silent> <C-Right> :vertical resize +1<CR>

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

" https://stackoverflow.com/questions/67975383/is-there-a-way-to-show-both-line-numbers-and-git-status-in-vim-when-using-the-ai
" show both git status and line number
set signcolumn=yes

" NERDCommenter
" https://stackoverflow.com/questions/40833296/how-to-disable-internal-key-bindings-in-vim
" Disable built-in cc (delete and then insert)
map cc <Nop>
" Create default mappings

let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'cpp': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
