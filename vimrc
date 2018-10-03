call plug#begin('/Users/thomashaddad/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'rhysd/vim-crystal'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

set encoding=utf-8

" Initialize plugin system
call plug#end()

" fzf options
set rtp+=/usr/local/opt/fzf
nmap <Leader>b :Buffers<CR>
nmap <c-p> :GFiles<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>c :Commits<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find
 \ call fzf#vim#grep(
 \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
 \ <bang>0)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
 \ 'bg':      ['bg', 'Normal'],
 \ 'hl':      ['fg', 'Comment'],
 \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
 \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
 \ 'hl+':     ['fg', 'Statement'],
 \ 'info':    ['fg', 'PreProc'],
 \ 'border':  ['fg', 'Ignore'],
 \ 'prompt':  ['fg', 'Conditional'],
 \ 'pointer': ['fg', 'Exception'],
 \ 'marker':  ['fg', 'Keyword'],
 \ 'spinner': ['fg', 'Label'],
 \ 'header':  ['fg', 'Comment'] }

"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" keep the current selection when indenting (thanks cbus)
vnoremap < <gv
vnoremap > >gv

" you can change buffer without saving
set hidden

" Tabs
noremap <C-Right> :tabnext<CR>
noremap <C-Left> :tabprevious<CR>

" Remove scrollbars
set guioptions-=r
set guioptions-=L

" Nerdtree

" NERDtree toggle
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" shift+R on paragraph resets textwidth on selection
nnoremap R gq}

" Show tabs
set list

" Define characters for 'tabs' and 'end of line'
set listchars=tab:▸\ ,eol:¬

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

set nocompatible

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

if !exists("g:syntax_on")
  syntax enable
endif
set number
set hlsearch
set showmatch
set autoindent
set history=1000
" set cursorline

if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

let base16colorspace=256
" colorscheme base16-gruvbox-dark-medium
colorscheme base16-solarized-dark
 " colorscheme solarized

" powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set guifont=Monaco\ for\ Powerline

" creates the swapfiles in /tmp
set dir=/tmp

" Auto-reload modified files (with no local changes)
set autoread

" set gitcommit commentstring to '#'
autocmd FileType gitcommit set commentstring=#%s

" reset timeout on esc key (ttimeoutlength) but keep timeout on '\' leader key (timeoutlen)
set timeoutlen=1000 ttimeoutlen=0

" go-vim syntax highlighting
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
"
" ALE config
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
set re=1

