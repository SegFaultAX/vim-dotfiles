" Load pathogen and its submodules
" Filetype has to be off when pathogen is first run
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on

" GUI font
set guifont=Liberation\ Mono\ 10

" Auto read if file is changed externally
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w<cr>

" Filetype plugin
filetype plugin on
filetype indent on

set nocompatible
set bs=2
set number

" Word wrapping - on, col 80
set nowrap
set textwidth=80

" Indenting
set smartindent
set autoindent

set smarttab
set tabstop=2
set expandtab
set shiftwidth=2

" Wildmenu
set wildmenu
set wildmode=longest:full,full
set wildignore+=*~,*.aux,tags

" Tags
set tags+=../tags,../../tags,../../../tags,../../../../tags

set listchars=tab:▸\ ,eol:¬,trail:~

" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch

" Status line and user interface
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]\ %{fugitive#statusline()}
set ruler "Always show current position
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set showmatch

" viminfo and history
" history is used for /,:,@
set history=50
set viminfo='100,f1,<50,!,h,s10

" Colors
set t_Co=256
if has('gui_running')
  colorscheme molokai
else
  set background=dark
  colorscheme desert256
endif
syntax enable

" Space toggle fold and folding options
nnoremap <space> za
set foldmethod=indent
set foldlevel=99

" Hide buffer when not in window
set bufhidden=hide

" 3 lines of buffer offset
set scrolloff=3

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Useful when moving accross long lines
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <silent> <leader><cr> :noh<cr>

" Show invisible characters
map <leader>li :set list!<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Simple underline
map <leader>uu mzyypv$r-`z

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :NERDTreeClose<cr>:1,300 bd!<cr>

" Use the arrows to do something useful
map <right> :bn<cr>
map <left> :bp<cr>

" Remap vim 0
map 0 ^

" Visually select text last edited/pasted
nmap gV `[v`]

" Toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Clipboard yanking/pasting
vmap <leader>yy "+y
vmap <leader>ya "ay
vmap <leader>yz "zy
map <leader>p "+p

" Tab configuration
" map <leader>to :tabnew! %<cr>
" map <leader>te :tabedit 
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove 
" map <leader>tn :tabn<cr>
" map <leader>tp :tabp<cr>

" Tag list
map <leader>lt :TlistToggle<cr>

" Task List (TODO list)
map <leader>ld <Plug>TaskList

" Fuzzy finder
map <leader>fb :FufBuffer<cr>
map <leader>ff :FufFile<cr>
map <leader>fd :FufDir<cr>
map <leader>fl :FufLine<cr>
map <leader>fh :FufHelp<cr>
map <leader>fc :FufChangeList<cr>
map <leader>fj :FufJumpList<cr>
map <leader>ft :FufTag<cr>

" tComment
map <leader>cc :TComment<cr>
map <leader>cb :TCommentBlock<cr>
map <leader>ci :TCommentInline<cr>
map <leader>cr :TCommentRight<cr>

" CamelCaseMotion
map <silent> <S-W> <Plug>CamelCaseMotion_w
map <silent> <S-B> <Plug>CamelCaseMotion_b
map <silent> <S-E> <Plug>CamelCaseMotion_e

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Python stuff
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

" NERDTree
map <F2> :NERDTreeToggle<cr>

" MRU (Most Recently Used)
map <F3> :MRU<cr>

" Pyflakes (.py files only)
let g:pyflakes_use_quickfix = 0

" Tab completion and documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Fixing styling in Gemfiles (not sure why this stopped working)
autocmd BufRead,BufNewFile Gemfile set filetype=ruby
" Ruby completion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif


" Make vertical splits default to the right hand side:
set spr

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Xclip integration:
vmap <F9> :!xclip -f -sel clip<CR> " copy text to xorg server clipboard
map <F10> :-1r !xclip -o -sel clip<CR> " paste text from xserv clip to vim
