syntax enable 
set number 
set fileencodings=utf-8,sjis,euc-jp,latin 
set encoding=utf-8 
set background=dark 
set mouse=a 
set showcmd 
set cmdheight=2 
set expandtab 
set shiftwidth=2
set tabstop=2
let mapleader = " "

call plug#begin('~/.config/nvim/plugins')
"Gruvbox
Plug 'sainnhe/gruvbox-material'
"LSP
Plug 'neovim/nvim-lspconfig'
"Coq
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
"Move Line plug
Plug 'matze/vim-move'
"Auto pairs
Plug 'jiangmiao/auto-pairs'
"Tressitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"JSX syntax
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
"Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
"Icons
Plug 'ryanoasis/vim-devicons'
"CHADTREE
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
"Autoclose tabs
Plug 'alvan/vim-closetag'
"Prettier
" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile--production' }
"Autoclose Tags
Plug 'windwp/nvim-ts-autotag'
"Autorename Tags
Plug 'AndrewRadev/tagalong.vim'
"Emmet
Plug 'mattn/emmet-vim'
call plug#end()
lua<<EOF
vim.g.coq_settings = {
    auto_start = true,
    }
vim.g.coq_settings = {
    auto_start = 'shut-up',
    }
require('nvim-ts-autotag').setup()
EOF
let g:gruvbox_material_background="medium"
colorscheme gruvbox-material
"============================================================ 
"Telescope config
"============================================================ 
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr> 
nnoremap <leader>fb <cmd>Telescope buffers<cr> 
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"============================================================ 
"CHADtree config
"============================================================ 
nnoremap <C-b> <cmd>CHADopen<cr>
"============================================================
""EMMET config
"============================================================
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={
    \ 'javascript':{
     \ 'extends':'jsx'
      \ }
       \ }

"============================================================ 
"Autorename tags config
"============================================================ 
let g:tagalong_additional_filetypes = ['javascript']


"============================================================ 
"Autoclose tags config
"============================================================ 

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a valid region (based on filetype)
"

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
