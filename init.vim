"""  _ __   ___  _____   _(_)_ __ ___  
""" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
""" | | | |  __/ (_) \ V /| | | | | | |
""" |_| |_|\___|\___/ \_/ |_|_| |_| |_|


" Put all the nvim options here
"{{{
set showmode " Enable showmode (show current mode in command line)
set number relativenumber " Enable row numbers
set cursorline " Enable cursorline
set hlsearch " Highlight searches
set ignorecase smartcase " Do case insensitive searches
set incsearch " Show incremental search results as you type
set autoindent expandtab tabstop=4 shiftwidth=4 " Enable autoindent
set splitbelow splitright " Regulate positions of new windows
set hidden " To leave buffers that have changes
set confirm
set tgc " Enable 24bit colors in TUI
set undofile " Save undo trees in files
set undodir=~/.local/share/nvim/undo " undo directory
set undolevels=10000 " Number of undo saved
set completeopt=menuone " specify how popup menu works
" Set grep engine with the Perl -P option
let &grepprg="grep -nP $* /dev/null"
" Set the make command
let &makeprg="autocompile $*"
" settings specific to neovim
set nocompatible
" update time for CursorHold event in milliseconds
set updatetime=250
" set mouse
set mouse=a
set omnifunc=syntaxcomplete#Complete
filetype plugin on
syntax on
"" don't implement dbext stupid keybindings
"let g:omni_sql_no_default_maps = 1
set listchars=eol:↴,lead:⋅,tab:<->
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
"set foldlevelstart=99
" set blinking
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
              \,a:blinkwait400-blinkoff600-blinkon900-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175
"}}}

" Put all the user-defined variables here
" {{{
" Make every .tex file become filetype latex
let g:tex_flavor="latex"
" enable python for virtualenvs
let g:python3_host_prog = '~\.venv\neovim\bin\python'
" }}}

" Put all the plugins here
"{{{
call plug#begin('~/.local.share/nvim/plugged')

Plug 'tpope/vim-surround'                       " easy bracket managing
Plug 'tpope/vim-fugitive'                       " Add integration with Git
Plug 'tpope/vim-commentary'                     " easy comment stuff
Plug 'ervandew/supertab'                        " tab completion
Plug 'dracula/vim', { 'as': 'dracula' }         " colorscheme

call plug#end()
"}}}

" Put all the plugin settings here
"{{{
" NetRw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabCrMapping = 1
let g:SuperTabRetainCompletionDuration = 'completion'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
augroup supertab
    autocmd!
    autocmd FileType tex let b:SuperTabContextTextMemberPatterns = ['\\', '{']
    autocmd FileType html,css,javascript let b:SuperTabContextTextMemberPatterns = ['</', '<']
    autocmd FileType python let b:SuperTabContextTextMemberPatterns = ['\.', '@']
    autocmd FileType sh,bash let b:SuperTabContextTextMemberPatterns = ['\$', '(']
    autocmd FileType r,rmd let b:SuperTabContextTextMemberPatterns = ['\.', '\$', ':', '@']
    autocmd FileType vimwiki let b:SuperTabContextTextMemberPatterns = ['\[', '#', ':']
augroup END
"}}}

" Put all the highlight settings here
"{{{
" launch colorscheme
colorscheme dracula
"}}}

" Put all the global mappings and commands here
"{{{
let mapleader = "\<SPACE>"
let maplocalleader ="\\"

" copy to clipboard
vnoremap <silent> <C-c> "+y
nnoremap <silent> <C-p> "+p
" copy to the end of line
nnoremap <silent> Y y$
" View the current buffers
"nnoremap <silent> <leader>b :ls<CR>:buffer<SPACE>
" Switch to prev/next buffer
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>N :bprevious<CR>
" Remap to go to middle of text line
nnoremap <silent> gm :call cursor(0, virtcol('$')/2)<CR>
" cursorcolumn
nnoremap <silent> <leader>cc :set cursorcolumn!<CR>
" Go quickly to init.vim
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
" Go quickly to ginit.vim
nnoremap <silent> <leader>eg :vsplit ~/.config/nvim/ginit.vim<CR>
" Source init.vim
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
" jump to alternate buffer (also CTRL_^)
nnoremap <silent> - <C-^>
" remap fold/unfold
nnoremap <silent> <BS> za
nnoremap <silent> <S-BS> zA
nnoremap <silent> <C-S-BS> :call ToggleFold()<CR>
" Remap window movements
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l
inoremap <silent> <A-h> <ESC><C-w>h
inoremap <silent> <A-j> <ESC><C-w>j
inoremap <silent> <A-k> <ESC><C-w>k
inoremap <silent> <A-l> <ESC><C-w>l
tnoremap <silent> <A-h> <C-\><C-n><C-w>h
tnoremap <silent> <A-j> <C-\><C-n><C-w>j
tnoremap <silent> <A-k> <C-\><C-n><C-w>k
tnoremap <silent> <A-l> <C-\><C-n><C-w>l
" Remap window resizing
nnoremap <silent> <Up>      :resize +2<CR>
nnoremap <silent> <Down>    :resize -2<CR>
nnoremap <silent> <Right>   :vertical resize +2<CR>
nnoremap <silent> <Left>    :vertical resize -2<CR>
" Stop highlighting from last search
nnoremap <silent> <ESC> <ESC>:nohlsearch<CR>:echo ""<CR>
" Delete trailing whitespaces
nnoremap <silent> <leader>wd :%s#\v\s+$##g<CR>:nohlsearch<CR>
" Toggle spelling check
nnoremap <silent> <leader>i :setlocal spell! spelllang=en_gb<CR>
nnoremap <silent> <leader>I :setlocal spell spelllang=it<CR>
" remap quickfix commands
nnoremap <silent> <leader>qo :copen<CR>
nnoremap <silent> <leader>qq :cclose<CR>
nnoremap <silent> <leader>qn :cnext<CR>
nnoremap <silent> <leader>qp :cprev<CR>
nnoremap <silent> <leader>qf :cfirst<CR>
nnoremap <silent> <leader>ql :clast<CR>
" compile
nnoremap <silent> <leader>x :make %<CR>
" change directory to local file
nnoremap <silent> <leader>cd :echom "Changing directory to ".expand("%:h")<CR>:cd %:h<CR>
" exit from completion without modifying the word with ESC
inoremap <expr> <ESC> pumvisible() ? "\<C-e>" : "\<Esc>"
cnoremap <expr> <ESC> pumvisible() ? "\<C-e>" : "\<C-c>"
" confirm completion with CR
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
cnoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"" commands
" Display infos about current file
command! Infos echo "Informations about file "."'".expand("%:t")."'"."\nFile Type:\t".toupper(&filetype)."\nFile Encoding:\t".toupper(&fenc)."\nFile Format:\t".toupper(&ff)
"}}}

" Put all functions here
" {{{
function! ToggleFold()
    if &foldlevel == 0
        set foldlevel=99
    else
        set foldlevel=0
    endif
endfunction
" }}}
