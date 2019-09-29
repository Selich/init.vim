syntax on
set tabstop=4
set softtabstop=0
set shiftwidth=4
set encoding=utf-8
set novisualbell
set noerrorbells
set numberwidth=5
set scrolloff=8
set sidescrolloff=16
set mouse=a
set browsedir=buffer
set noswapfile
set cmdheight=2
set nobackup
set nowritebackup
set shortmess+=c
set updatetime=300
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
set synmaxcol=512
set showtabline=0
set laststatus=2
set noshowcmd
set noshowmode

if has("gui_running")
	    set guifont=Fira Code\ 10
endif

"
" PLUG
"

call plug#begin('~/.nvim/plugged')

"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'neomake/neomake'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" g+a + align by + char
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jspc.vim'
Plug 'othree/yajs.vim'
Plug 'fatih/vim-go'
Plug 'ryanoasis/vim-devicons'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chemzqm/vim-jsx-improve'
Plug 'mattn/emmet-vim'
Plug 'skywind3000/asyncrun.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/csv.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'

Plug 'maxmellon/vim-jsx-pretty'

"C-N Creates a new window and place it in the master pane [M] & stacks all previous windows in the stacked pane [S]
"C-Space Focus the current window, that is, place it in the master pane [M] & stacks all other windows in the stacked pane [S]
Plug 'spolu/dwm.vim'
Plug 'liuchengxu/vista.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'junegunn/rainbow_parentheses.vim'

" Tmux
Plug 'edkolev/tmuxline.vim'
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

" Colorschemes
Plug 'jdkanani/vim-material-theme'
Plug 'nightsense/snow'
Plug 'nightsense/cosmic_latte'
Plug 'sainnhe/vim-color-atlantis'
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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

"
" COLORSCHEME
"
set background=dark

set termguicolors
colo nord
"colo atlantis
"colo snow
"colo material-theme
"colorscheme cosmic_latte
hi Normal guibg=NONE ctermbg=NONE

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

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
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'vue':        ['eslint'],
\   'scss':       ['prettier']
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue':        ['eslint']
\}

let g:used_javascript_libs = 'underscore,backbone,react,rambda'
let g:deoplete#enable_at_startup = 1


let g:jsx_ext_required = 0

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
"
" AUTOCMD
"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" NERDTree

let g:NERDTreeWinSize=30
let g:NERDTreeLimitedSyntax = 1

" Vista

let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1

" WebDevIcons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
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
	\}

"
" STATUSLINE
"
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

nnoremap <C-[> :NERDTreeToggle<CR>
nnoremap <C-]> :Vista!!<CR>

nmap <silent> <buffer> gK <Plug>(kite-docs)

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" COC
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Airline "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme='minimalist'
"let g:airline_theme='snow_dark'
let g:airline_theme='nord'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:vim_jsx_pretty_highlight_close_tag = 1


