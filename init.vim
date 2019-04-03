" =============================================================
"     Doug Hooker's Vim config
"     Feel free to use and modify as you like
"
"
"     nvim setup/plugin prep
" =============================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
" Set this way because I don't want to mess with the .vim dir
call vundle#rc('~/.config/nvim/bundle/')
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" =============================================================
"     PLUGINS
" =============================================================

" ================================
"     Visual/Color
" ================================

" Syntax
Plugin 'othree/es.next.syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'ianks/vim-tsx', { 'for': 'typescript.tsx' }

" Themes/Icons
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'ryanoasis/vim-devicons'

" ================================
"     Language specific
" ================================

" Code completion for a TON of stuff
" Plugin 'Valloric/YouCompleteMe' " Requires extra setup - run install.py from bundle dir

" Code completion
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'deoplete-plugins/deoplete-jedi'

" TypeScript - REQUIRES global tsserver
" Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript', { 'for': ['typescript', 'typescript.tsx'], 'do': ':!install.sh \| UpdateRemotePlugins' }
Plugin 'Quramy/tsuquyomi' " Typescript magic

" PHP Stuff
Plugin 'StanAngeloff/php.vim'
Bundle 'stephpy/vim-php-cs-fixer'

" GOlang
"Plugin 'fatih/vim-go'

" Shopify Liquid
" Plugin 'tpope/vim-liquid'

" https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'

" ================================
"     IDE/Code editing
" ================================

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary' " Comments. `gcc` to activate
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'

" ================================
"     Code Quality
" ================================

Plugin 'w0rp/ale'

" Tag completion /string surrounding stuff
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'

" QOL Stuff
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =============================================================
"     END PLUGINS
" =============================================================



" =============================================================
"     Visuals
" =============================================================

syntax on
" Ignore case, Highlight search, Incremental search (follow search)
set ic hls is
set noshowmode
set encoding=UTF-8

" Set tabs to 2 spaces, set tab shift to tabstop
set tabstop=2
set shiftwidth=0
set softtabstop=2

" sets the fold (za) method relative to filetype
set foldmethod=syntax
set foldlevelstart=20

" Set relative numbers when file is active
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set background=dark    " Setting dark mode
colorscheme codedark


" Keep at bottom of visual! This resets the background to be clear
hi Normal ctermbg=none
hi EndOfBuffer ctermbg=none
hi FoldColumn ctermbg=none
hi LineNr ctermbg=none
hi NonText ctermbg=none
hi Directory ctermbg=none
hi Search cterm=NONE ctermfg=black ctermbg=yellow

" =============================================================
"     Plugin Specific Preparation
" =============================================================

" Deoplete
  let g:deoplete#enable_at_startup = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Auto tag
let g:closetag_filenames = '*.html,*.hbs,*.js,*.jsx,*.tsx'

let g:yats_host_keyword = 1

" Devicons config
let g:webdevicons_enable_ctrlp = 1

" CTRLP
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|\.git|build)$',
\}

" ALE
let g:ale_linter_aliases = {
  \'typescript.tsx': 'typescript'
\}


" =============================================================
"     Action(s) on open
" =============================================================

" Comments (Commentary)
autocmd FileType javascript.jsx,typescript.tsx setlocal commentstring={/*\ %s\ */}
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

autocmd BufNew,BufRead,BufEnter *.ts,*.js,*.tsx,*.jsx,*.py :ALEEnableBuffer

" autocmd BufNewFile,BufRead *.php setlocal tabstop=4

" =============================================================
"     Action(s) on save
" =============================================================

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.hbs Prettier
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


" =============================================================
"     Tags
" =============================================================

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \
  \],
  \ 'sort' : 0
  \
  \}

" =============================================================
"     Key Bindings, Commands, General
" =============================================================

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

nnoremap ,f :YcmCompleter GoTo<CR>
nnoremap ,F :YcmCompleter GoToReferences<CR>
" Simulates VS Code's ctrl/cmd + b to toggle sidebar
nnoremap <c-B> :NERDTreeToggle<CR>


cnoreabbrev nt NERDTree<CR>

