syntax on 
set number
set tabstop=4
set softtabstop=0
set shiftwidth=4
set encoding=utf-8
set novisualbell
set noerrorbells

" set colorscheme="industry"
set number
set numberwidth=5
set scrolloff=8
set sidescrolloff=16
set mouse=a
set browsedir=buffer                  " browse files in same dir as open file

set noswapfile

set nowritebackup
set nobackup
set backupcopy=yes
set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set backupskip+=/private/tmp/*"
set backupskip+=~/.secret/*
set undofile
set undolevels=1000
set undoreload=10000
set splitbelow
set splitright
set hidden                        
set nostartofline                
set synmaxcol=512                     " don't syntax highlight long lines
set showtabline=0                     " start OFF, toggle =2 to show tabline
set laststatus=2                      " always show all statuslines
" This is slow on some terminals and often gets hidden by msgs so leave it off
set noshowcmd
set noshowmode    

if has("gui_running")
	    set guifont=Fira Code\ 10
endif

call plug#begin('~/.nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'neomake/neomake'
Plug 'sonph/onehalf'
Plug 'ap/vim-css-color'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jspc.vim'
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'jdkanani/vim-material-theme'
Plug 'mattn/emmet-vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/csv.vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'benmills/vimux'
Plug 'spolu/dwm.vim'
Plug 'liuchengxu/vista.vim'





call plug#end()

let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Airline "
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic "
" Synt
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:used_javascript_libs = 'underscore,backbone,react,rambda'
call neomake#configure#automake('w')


let g:deoplete#enable_at_startup = 1
" ALE
let g:ale_fixers = {
\    'javascript': ['eslint', 'prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}

" \   'python': ['flake8', 'pylint'],
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_sign_warning = '.'
let g:ale_completion_enabled = 1


"
" EMMET 

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
"
"
"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


map <C-\> :NERDTreeToggle<CR>
map <C-]> :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }



let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
