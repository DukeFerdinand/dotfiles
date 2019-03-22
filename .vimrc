" =============================================================
"     Doug Hooker's vimrc
"     Feel free to use and modify as you like
"
"
"     Vim setup/plugin prep
" =============================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'morhetz/gruvbox'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'ryanoasis/vim-devicons'

" ================================
"     Language specific
" ================================

" Code completion for a TON of stuff
Plugin 'Valloric/YouCompleteMe' " Requires extra setup

" TypeScript - REQUIRES global tsserver
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Quramy/tsuquyomi' " Typescript magic

" PHP Stuff
Plugin 'StanAngeloff/php.vim'
Bundle 'stephpy/vim-php-cs-fixer'

" GOlang
"Plugin 'fatih/vim-go'

" Shopify Liquid
Plugin 'tpope/vim-liquid'

" ================================
"     IDE/Code editing
" ================================

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary' " Comments. `gcc` to activate
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'

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
set encoding=UTF-8
set tabstop=2

" Set relative numbers when file is active
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" vim-jsx-typescript
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" let g:gruvbox_italic=1
"colorscheme gruvbox
set background=dark    " Setting dark mode
colorscheme codedark


" Keep at bottom of visual! This resets the background to be clear
hi Normal ctermbg=none
hi EndOfBuffer ctermbg=none
hi FoldColumn ctermbg=none
hi LineNr ctermbg=none
hi NonText ctermbg=none
hi Directory ctermbg=none

" =============================================================
"     Plugin Specific Preparation
" =============================================================

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Auto tag
let g:closetag_filenames = '*.html,*.hbs,*.js,*.jsx,*.tsx'

let g:yats_host_keyword = 1

" =============================================================
"     Action(s) on open
" =============================================================

" Comments (Commentary)
autocmd FileType javascript.jsx,typescript.tsx setlocal commentstring={/*\ %s\ */}
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

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
"     Key Bindings
" =============================================================


nnoremap <C-p> :FZF<CR>
nnoremap ,f :YcmCompleter GoTo<CR>
nnoremap ,F :YcmCompleter GoToReferences<CR>


