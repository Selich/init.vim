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

"
" PLUG
"

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
Plug 'fatih/vim-go'
Plug 'ryanoasis/vim-devicons'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'jdkanani/vim-material-theme'
Plug 'mattn/emmet-vim'
Plug 'skywind3000/asyncrun.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/csv.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'benmills/vimux'
Plug 'spolu/dwm.vim'
Plug 'liuchengxu/vista.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

Plug 'edkolev/tmuxline.vim'

" Tmux
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-navigator'

" Neoterminal
Plug 'jalvesaq/vimcmdline'
Plug 'vimlab/split-term.vim'

" Formatting
Plug 'ntpeters/vim-better-whitespace'
Plug 'sbdchd/neoformat', {'on': 'Neoformat'}
Plug 'junegunn/vim-easy-align'

Plug 'danro/rename.vim', { 'on': 'Rename' }
Plug 'rakr/vim-one'
Plug 'vimlab/split-term.vim'
" Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'alvan/vim-closetag'
Plug 'jpalardy/vim-slime'

call plug#end()

"
" FUNCTIONS
"

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction


"
" GLOBALS
"


" Split term
let g:split_term_default_shell = "fish"

" Ctrl P
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Airline "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
"let g:airline_theme='monochrome'
let g:airline_theme='minimalist'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '%s [%severity%]'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0

let g:ale_warn_about_trailing_whitespace = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_list_window_size = 5

"
" ALE
"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'javascript': ['eslint', 'prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}

" \   'python': ['flake8', 'pylint'],
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Syntastic "
" Synt
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = { "type": "style" }

let g:used_javascript_libs = 'underscore,backbone,react,rambda'
call neomake#configure#automake('w')


let g:deoplete#enable_at_startup = 1

"
" EMMET
"

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


" Lightline

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }


let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1

" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding the custom source to unite
let g:webdevicons_enable_unite = 1
" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1
" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1
" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1
" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" Adding the custom source to denite
let g:webdevicons_enable_denite = 1



" Ranger
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" Tmuxline

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let g:slime_target = "tmux"
	let g:slime_python_ipython = 1

let g:tmuxline_theme = 'vim_statusline_2'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
	\'a'    : '#S',
	\'cwin' : '#I|#W:#P',
	\'x'    : '%a',
	\'y'    : '#W %R',
	\'z'    : '#H'
}

"
" STATUSLINE
"

set statusline+=%{NearestMethodOrFunction()}
set statusline=%{LinterStatus()}


"
" MAPPING
"

nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gvd :ALEGoToDefinitionInVSplit<CR>
nnoremap <silent> gr :ALEFindReferences<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

map <C-\> :NERDTreeToggle<CR>
map <C-]> :Vista!!<CR>

nnoremap <A-F1> 1gt
nnoremap <A-F2> 2gt
nnoremap <A-F3> 3gt
nnoremap <A-F4> 4gt
nnoremap <A-F5> 5gt
nnoremap <A-F6> 6gt
nnoremap <A-F7> 7gt
nnoremap <A-F8> 8gt
nnoremap <A-F9> 9gt
nnoremap <A-F0> 10gt

nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprev<CR>



