" -- disable auto-comment in line continuation -- "
au bufenter * set fo-=c fo-=r fo-=o

" -- limit the text width -- "
autocmd VimEnter * set textwidth=100 formatoptions+=t
set cinkeys-=:

" -- set a line width marker -- "
" set colorcolumn=100

set shell=zsh

" -- display row and column number on the status bar -- "
set ruler

" -- fix the delete key behavior on mac os -- "
" set backspace=eol,start,indent

" -- VIM Plugin Manager -- "
" specify a directory for plugins
" - for neovim: stdpath('data') . '/plugged'
" - avoid using standard vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
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

" commenting plugin 
Plug 'tpope/vim-commentary'

" cpp syntax highlighting
" Plug 'bfrg/vim-cpp-modern'
" 
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
" set spell spelllang=en_us

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
inoremap <leader>w <esc>:w<cr>
noremap <leader>w :w<cr>

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



" -- settings for blamer.nvim -- "
let g:blamer_enabled = 0
let g:blamer_delay = 500

" -- setting for nerdtree --"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
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
            \'coc-git', 
            \'coc-clangd',
            \'coc-marketplace',
            \'coc-sh',
            \'coc-dash-complete',
            \'coc-jedi',
            \'coc-cmake']
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=UTF-8

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" shortcut to switch between header and source using clangd
nmap <silent> <C-h> :call CocAction('runCommand', 'clangd.switchSourceHeader')<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh <Plug>(coc-declaration)
" show definition in a new split
" nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
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
" nnoremap <A-f> :CocSearch 
nnoremap <silent> <Leader>cf :exe 'CocSearch '.expand('<cword>')<CR>
nmap <silent> <C-a> :call CocAction('runCommand', 'document.searchCurrentWord')<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
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
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

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
nmap <silent> <C-c> <Plug>(coc-cursors-position)
" add current word range to cursors.
nmap <silent> <C-d> <Plug>(coc-cursors-word)
" add current visual selected range to cursors.
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

" root pattern for python project, especially for coc-pright to work properly
" https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#resolve-workspace-folder
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', '.root']

" " -- vim-cpp-modern for c/c++ syntax highlighting -- "
" " Disable function highlighting (affects both C and C++ files)
" let g:cpp_function_highlight = 1

" " Enable highlighting of C++11 attributes
" let g:cpp_attributes_highlight = 1

" " Highlight struct/class member variables (affects both C and C++ files)
" let g:cpp_member_highlight = 1

" " Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" " (affects both C and C++ files)
" let g:cpp_simple_highlight = 

" -- lsp_cxx_hl -- "
" let g:lsp_cxx_hl_use_text_props = 1
let g:coc_default_semantic_highlight_groups = 1
let g:lsp_cxx_hl_use_nvim_text_props = 1
" https://github.com/jackguo380/vim-lsp-cxx-highlight/issues/58
" to avoid broken cursorline
" hi link LspCxxHlSymParameter LspCxxHlSymField
" hi link LspCxxHlSymVariable LspCxxHlSymField

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
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

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

" -- vim agriculture -- "
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
" nmap <Leader>* <Plug>RgRawWordUnderCursor
nmap <Leader>c <Plug>RgRawWordUnderCursor <cr>
let g:agriculture#disable_smart_quoting = 0

" -- asynctasks -- "
" let g:asyncrun_rootmarks = ['.root']
let g:asyncrun_open = 6
" bind the F7 to the uos-build in ~/.config/nvim/tasks.ini
" noremap <silent><f7> :AsyncTask uos-build<cr>

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
nnoremap <C-p> :echo expand('%:p')<CR>   

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
set cursorline

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
augroup END
