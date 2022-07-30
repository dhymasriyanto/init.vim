"Basic Settings
"==============================================================

"set swapfile
set noswapfile

"set nowrap
"set nohlsearch
set nocompatible

set t_Co=256
set termguicolors

set timeoutlen=1000
set ttimeoutlen=0

set regexpengine=1
set lazyredraw
set ttyfast
syntax off
set synmaxcol=200

set foldmethod=manual
set foldmethod=indent

set number
"set relativenumber
"set cursorline

set updatetime=1000
set laststatus=2
set shortmess+=c
set cmdheight=2

" Initiate Plugins
"==============================================================

call plug#begin('~/.vim/plugged')

"==============================================================
"PlantUML
Plug 'aklt/plantuml-syntax'
"Open Browser When Use PlantUML
Plug 'tyru/open-browser.vim'
"PlantUML Previewer
Plug 'weirongxu/plantuml-previewer.vim'
"==============================================================

"==============================================================
"WakaTime
Plug 'wakatime/vim-wakatime'
"==============================================================

"==============================================================
"Auto adjust all I need :')
Plug 'tpope/vim-sleuth'
"Syntax Indentation (Bit Slowly on Big File)
"Plug 'sheerun/vim-polyglot'
"Indentation
Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'Yggdroot/indentLine'
"==============================================================

"==============================================================
"TREESitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"==============================================================

"==============================================================
"Autoclose and Autorename HTML Tag
Plug 'windwp/nvim-ts-autotag', {'branch': 'main'}
"==============================================================

"==============================================================
"CSS Color in VIm
Plug 'ap/vim-css-color'
"==============================================================

"==============================================================
"Discord Presence
"Plug 'andweeb/presence.nvim', {'branch': 'main'}
"==============================================================

"==============================================================
Plug 'tpope/vim-repeat'
"==============================================================

"==============================================================
"Git in VIm
Plug 'tpope/vim-fugitive'
"==============================================================

"==============================================================
"Auto Fast Folding
"Plug 'Konfekt/FastFold'
"==============================================================

"==============================================================
"COC Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"For coc-snippets
"Plug 'honza/vim-snippets'
"==============================================================

"==============================================================
"Statusline Theme
Plug 'itchyny/lightline.vim'
"==============================================================

"==============================================================
"Vi File Manager (File Manager in Terminal)
Plug 'vifm/vifm.vim'
"==============================================================

"==============================================================
"Theme
Plug 'joshdick/onedark.vim', {'branch': 'main'}
"Plug 'olimorris/onedarkpro.nvim', {'branch': 'main'}
"Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
"Plug 'lukas-reineke/onedark.nvim'
"==============================================================

"==============================================================
"NERDTree
Plug 'scrooloose/nerdtree'
"==============================================================

"==============================================================
"Show Diff in Sign Column
Plug 'airblade/vim-gitgutter'
"Git Plugin for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
"==============================================================

"==============================================================
"Syntax Highlight for NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Icon Folder
Plug 'ryanoasis/vim-devicons'
"==============================================================

"==============================================================
"Fuzzy Find Ctrl-P
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
"==============================================================

"==============================================================
"Commenter
Plug 'scrooloose/nerdcommenter'
"==============================================================

"==============================================================
"Debugger
Plug 'puremourning/vimspector'
"Maximizer for debugger
Plug 'szw/vim-maximizer'
"==============================================================

call plug#end()

" Theme
"==============================================================

"lua require('onedark').setup()
"colorscheme onedark
"colorscheme onedarkpro
"colorscheme onenord
source $HOME/.config/nvim/themes/onedark.vim

" Indentation Color
"==============================================================

lua require('indent-blankline')

" Lightline (Statusline)
"==============================================================

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
          \   'gitbranch': 'FugitiveHead'
          \ },
          \ }

" TREESitter Config
"==============================================================

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      -- ["foo.bar"] = "Identifier",
      },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
      },
    },
  indent = {
    enable = false
    }
  }
EOF

" TREESitter Auto Tag 
"==============================================================

lua require('nvim-ts-autotag').setup()


" Vimspector Config
"==============================================================

let g:vimspector_enable_mappings = 'HUMAN'

nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :call vimspector#Reset()<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

" COC Config
"==============================================================

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>ql  <Plug>(coc-codelens-action)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" COC Rename
nmap <F2> <Plug>(coc-rename)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-vetur',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint', 
      \ 'coc-json', 
      \ 'coc-java',
      \ '@yaegassy/coc-intelephense'
      \ ]
      "\ 'coc-vetur',
      "\ 'coc-snippets',
      "\ 'coc-prettier',
      "\ 'coc-phpls'

"coc-snippets Configurations
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" NERDTree
"==============================================================

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']

" Shorcut NERDTreeToggle
nnoremap <C-b> :NERDTreeToggle<CR>

" Sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
"nnoremap <C-b> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

"Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" NERDTreeGit 
"==============================================================

let g:NERDTreeGitStatusWithFlags = 1
let g:gitgutter_max_signs = -1
"let g:gitgutter_async=0

" NERDCommenter
"==============================================================

nmap <C-_> <plug>NERDCommenterToggle<CR>

let g:NERDCustomDelimiters = { 'vue': { 'left': '<!--','right': '-->' } }

" FastFold Config
"==============================================================

"nmap zuz <Plug>(FastFoldUpdate)

"let g:fastfold_savehook = 1
"let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
"let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

"let g:markdown_folding = 1
"let g:tex_fold_enabled = 1
"let g:vimsyn_folding = 'af'
"let g:xml_syntax_folding = 1
"let g:javaScript_fold = 1
"let g:sh_fold_enabled= 7
"let g:ruby_fold = 1
"let g:perl_fold = 1
"let g:perl_fold_blocks = 1
"let g:r_syntax_folding = 1
"let g:rust_fold = 1
"let g:php_folding = 1

"Discord Presence
"==============================================================

" General options
"let g:presence_auto_update         = 1
"let g:presence_neovim_image_text   = "The One True Text Editor"
"let g:presence_main_image          = "neovim"
"let g:presence_client_id           = "793271441293967371"
"let g:presence_log_level           = "debug"
"let g:presence_debounce_timeout    = 10
"let g:presence_enable_line_number  = 1
"let g:presence_blacklist           = []
"let g:presence_buttons             = 1

" Rich Presence text options
"let g:presence_editing_text        = "Editing %s"
"let g:presence_file_explorer_text  = "Browsing %s"
"let g:presence_git_commit_text     = "Committing changes"
"let g:presence_plugin_manager_text = "Managing plugins"
"let g:presence_reading_text        = "Reading %s"
"let g:presence_workspace_text      = "Working on %s"
"let g:presence_line_number_text    = "Line %s out of %s"

" CTRL-P
"==============================================================
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ultisnips
"==============================================================
"let g:ultisnips_javascript = {
      "\ 'keyword-spacing': 'always',
      "\ 'semi': 'never',
      "\ 'space-before-function-paren': 'always',
      "\ }

" Manual Config
"==============================================================

" Mencari kata yang di seleksi dengan //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" No Highlight (No) Mematikan highlight setelah ketemu dengan menekan ESC
map <esc> :noh <CR>

" Shorcut untuk terminal di dalam NVim(zsh)
map <C-t> :bot sp term://zsh<CR>

" Mematikan Ruby dan PERL provider
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Templating ketika membuat file baru dan membuka nya, maka akan membuat format  new document seperti di IDEA
"augroup templates
  "autocmd!
  "autocmd BufRead *.py,*.h,*.html,*.java call s:ApplyTemplate()

  "function! s:ApplyTemplate()
    "if getfsize(expand('%')) == 0
      "execute "0r ~/.config/nvim/templates/skeleton." . expand('%:e')
      "execute "%s/__CLASS_NAME__/" . expand('%:t:r') . "/e"
    "endif
  "endfun
"augroup END
