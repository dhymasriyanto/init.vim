"Basic Settings
"==============================================================

"set swapfile
set noswapfile
set mouse=

set scrolloff=10

set encoding=UTF-8

"set nowrap
"set nohlsearch
set nocompatible

set t_Co=256
set termguicolors

set timeoutlen=1000
set ttimeoutlen=0

set regexpengine=2
set lazyredraw
set ttyfast
syntax off

set synmaxcol=200

set foldmethod=manual
"set foldmethod=indent
"set foldcolumn=1

set number
set relativenumber
"set cursorline

set updatetime=50
set laststatus=2
set shortmess+=c
set cmdheight=2

" Initiate Plugins
"==============================================================

call plug#begin('~/.vim/plugged')

"==============================================================
"Github Copilot
Plug 'github/copilot.vim'

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
"Plug 'wakatime/vim-wakatime'
"==============================================================

"==============================================================
"Auto adjust all I need :')
Plug 'tpope/vim-sleuth'
"Syntax Indentation (Bit Slowly on Big File)
"Plug 'sheerun/vim-polyglot'
"Indentation
Plug 'lukas-reineke/indent-blankline.nvim' "Default
"Plug 'Yggdroot/indentLine'
"==============================================================

"==============================================================
"TREESitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"==============================================================

"==============================================================
"Autoclose and Autorename HTML Tag
Plug 'windwp/nvim-ts-autotag', {'branch': 'main'}
"==============================================================

"==============================================================
"CSS Color in VIm
"Plug 'ap/vim-css-color'
"==============================================================

"==============================================================
"Discord Presence
 " Plug 'andweeb/presence.nvim', {'branch': 'main'}
"==============================================================

"==============================================================
"Plug 'tpope/vim-repeat'
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
Plug 'itchyny/lightline.vim' "Default
"==============================================================

"==============================================================
"Vi File Manager (File Manager in Terminal)
Plug 'vifm/vifm.vim'
"==============================================================

"==============================================================
"Theme
" Plug 'joshdick/onedark.vim', {'branch': 'main'} "Default
Plug 'navarasu/onedark.nvim'
"Plug 'olimorris/onedarkpro.nvim', {'branch': 'main'}
"Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
"Plug 'lukas-reineke/onedark.nvim'
" Plug 'sheerun/vim-wombat-scheme'
"==============================================================

"==============================================================
"NERDTree
Plug 'scrooloose/nerdtree'
"==============================================================

" vim-blade
Plug 'jwalton512/vim-blade'

"==============================================================
"Show Diff in Sign Column
Plug 'airblade/vim-gitgutter'
"Git Plugin for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
"==============================================================

"==============================================================
"Syntax Highlight for NERDTree
"No longer support on NeoVim v0.8.0
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'johnstef99/vim-nerdtree-syntax-highlight'
"Icon Folder
Plug 'ryanoasis/vim-devicons'
"==============================================================

"==============================================================
"Fuzzy Find Ctrl-P
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
"==============================================================

"==============================================================
"Commenter
"Plug 'scrooloose/nerdcommenter'
"Plug 'posva/vim-vue'
Plug 'numToStr/Comment.nvim'

"==============================================================

"==============================================================
"Debugger
Plug 'puremourning/vimspector'
"Maximizer for debugger
Plug 'szw/vim-maximizer'
"==============================================================

"==============================================================
"Harpoon
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
"==============================================================

"OmniSharp
"==============================================================
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'


call plug#end()

"OmniSharp
"==============================================================
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim


" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" Enable snippet completion, using the ultisnips plugin
" let g:OmniSharp_want_snippet=1

" let g:OmniSharp_server_use_net6 = 1


" Theme
"==============================================================

"lua require('onedark').setup()
colorscheme onedark
"colorscheme onedarkpro
"colorscheme onenord
" source $HOME/.config/nvim/themes/onedark.vim "Default
" colorscheme slate
" colorscheme evening
" colorscheme wombat

" Indentation Color
"==============================================================

"Default
lua require('indent-blankline') 

" Lightline (Statusline)
"==============================================================

let g:lightline = {
      \   'colorscheme': 'wombat',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified', 'currentfunction' ]]
      \   },
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead',
      \     'cocstatus': 'coc#status',
      \     'currentfunction': 'CocCurrentFunction'
      \   },
      \ }

" TREESitter Config
"==============================================================

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "help", "gleam", "wgsl", "wgsl_bevy", "smali" },
  highlight = {
    enable = true,
    -- disable = { "php"},
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
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ['aa'] = '@parameter.outer',
  --       ['ia'] = '@parameter.inner',
  --       ['af'] = '@function.outer',
  --       ['if'] = '@function.inner',
  --       ['ac'] = '@class.outer',
  --       ['ic'] = '@class.inner',
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       [']m'] = '@function.outer',
  --       [']]'] = '@class.outer',
  --     },
  --     goto_next_end = {
  --       [']M'] = '@function.outer',
  --       [']['] = '@class.outer',
  --     },
  --     goto_previous_start = {
  --       ['[m'] = '@function.outer',
  --       ['[['] = '@class.outer',
  --     },
  --     goto_previous_end = {
  --       ['[M'] = '@function.outer',
  --       ['[]'] = '@class.outer',
  --     },
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {
  --       ['<leader>a'] = '@parameter.inner',
  --     },
  --     swap_previous = {
  --       ['<leader>A'] = '@parameter.inner',
  --     },
  --   },
  -- },
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

" Use CocCurrentFunction
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent><nowait> <space>o  :call ToggleOutline()<CR>
  function! ToggleOutline() abort
    let winid = coc#window#find('cocViewId', 'OUTLINE')
    if winid == -1
      call CocActionAsync('showOutline', 1)
    else
      call coc#window#close(winid)
    endif
  endfunction

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

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

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

"To make <CR> to confirm selection of selected complete item or notify coc.nvim to format on enter, use:
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint', 
      \ 'coc-json', 
      \ 'coc-java',
      \ 'coc-svelte',
      \ '@yaegassy/coc-volar',
      \ 'coc-svelte-kit',
      \ 'coc-css',
      \ 'coc-html-css-support',
      \ '@yaegassy/coc-intelephense',
      \ '@yaegassy/coc-tailwindcss3',
      \ ]
      " \ 'coc-vetur',
      " \ 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
      " \ 'coc-vetur',
      " \ 'coc-snippets',
      " \ 'coc-prettier',
      " \ 'coc-phpls'

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"coc-snippets Configurations
"inoremap <silent><expr> <TAB>
      " \ pumvisible() ? coc#_select_confirm() :
      " \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" Harpoon
"==============================================================

nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-i> :lua require("harpoon.ui").nav_file(5)<CR>


" NERDTree
"==============================================================

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
"let g:NERDTreeIgnore = ['^node_modules$']

" Shorcut NERDTreeToggle
nnoremap <C-b> :NERDTreeToggle<CR>

" Sync open file with NERDTree
" Check if NERDTree is open or active
"function! IsNERDTreeOpen()
"return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

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
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
"let g:gitgutter_async=0

" NERDCommenter
"==============================================================

"nmap <C-_> <plug>NERDCommenterToggle<CR>

lua require('Comment').setup()

"let g:NERDCustomDelimiters = { 'vue': { 'left': '<!--','right': '-->' } }

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
 " let g:presence_auto_update         = 1
 " let g:presence_neovim_image_text   = "The One True Text Editor"
 " let g:presence_main_image          = "neovim"
 " let g:presence_client_id           = "793271441293967371"
 " let g:presence_log_level           = "debug"
 " let g:presence_debounce_timeout    = 10
 " let g:presence_enable_line_number  = 1
 " let g:presence_blacklist           = []
 " let g:presence_buttons             = 1

"Rich Presence text options
 " let g:presence_editing_text        = "Editing %s"
 " let g:presence_file_explorer_text  = "Browsing %s"
 " let g:presence_git_commit_text     = "Committing changes"
 " let g:presence_plugin_manager_text = "Managing plugins"
 " let g:presence_reading_text        = "Reading %s"
 " let g:presence_workspace_text      = "Working on %s"
 " let g:presence_line_number_text    = "Line %s out of %s"

" CTRL-P
"==============================================================
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ultisnips
"==============================================================
"let g:ultisnips_javascript = {
      " \ 'keyword-spacing': 'always',
      " \ 'semi': 'never',
      " \ 'space-before-function-paren': 'always',
      " \ }

" Manual Config
"==============================================================

" vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" remap CTRL-L to do delete in insert mode
" inoremap <C-l> <C-o>dl
inoremap <C-l> <Del>
" remap CTRL-I to do delete until end of line in insert mode
inoremap <C-o> <C-o>d$
inoremap <C-s> <C-o>dw

" Jump to the previous function
" nnoremap <silent> [f :call
" \ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" Jump to the next function
" nnoremap <silent> ]f :call
" \ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>

" CTRL-D but use zz for centering the cursor
nnoremap <silent> <C-d> <C-d>zz
" CTRL-U but use zz for centering the cursor
nnoremap <silent> <C-u> <C-u>zz

" n but use zz for centering the cursor
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" nnoremap <silent> j jzz
" nnoremap <silent> k kzz

" Mencari kata yang di seleksi dengan //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" No Highlight (No) Mematikan highlight setelah ketemu dengan menekan ESC
map <esc> :noh <CR>

" Shorcut untuk terminal di dalam NVim(zsh)
map <C-t> :bot sp term://zsh<CR>

" Mematikan Ruby dan PERL provider
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0

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
