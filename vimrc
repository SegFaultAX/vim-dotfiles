" Load pathogen and its submodules
" Filetype has to be off when pathogen is first run

filetype off
call pathogen#infect()
" call pathogen#helptags()
filetype on

" Filetype plugin
filetype plugin on
filetype indent on

syntax enable
highlight Pmenu ctermbg=238 gui=bold

"""""""""""""
" Variables "
"""""""""""""

" (see :help ft-python-indent)
" Indent after an open paren: >
let g:pyindent_open_paren = '&sw'
" Indent after a nested paren: >
let g:pyindent_nested_paren = '&sw'
" Indent for a continuation line: >
let g:pyindent_continue = '&sw'

" Syntastic
let g:syntastic_python_checkers = ['pyflakes']

" Enable neocomplete
let g:neocomplete#enable_at_startup = 1
" neocomplete overwrite completefunc
let g:neocomplete#force_overwrite_completefunc = 1

" Disable paredit by default
let g:paredit_mode = 0

" Python stuff
let python_highlight_all = 1

" Pyflakes (.py files only)
let g:pyflakes_use_quickfix = 0

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['yellow',      'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

""""""""""""
" Settings "
""""""""""""

" Auto read if file is changed externally
set autoread

set nocompatible
set bs=2
set number

set spr

set completeopt=menuone,longest,preview

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

set foldmethod=indent
set foldlevel=99

" Hide buffer when not in window
set bufhidden=hide

" 3 lines of buffer offset
set scrolloff=3

""""""""""""
" Mappings "
""""""""""""

" Fast saving
nmap <leader>w :w<CR>

" Space toggle fold and folding options
nnoremap <space> za

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
map <silent> <leader><CR> :noh<CR>

" Show invisible characters
map <leader>li :set list!<CR>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Simple underline
map <leader>uu mzyypv$r-`z

" Close the current buffer
map <leader>bd :bd<CR>

" Close all the buffers
map <leader>ba :NERDTreeClose<CR>:1,300 bd!<CR>

" Use the arrows to do something useful
map <right> :bn<CR>
map <left> :bp<CR>

" Remap vim 0
map 0 ^

" Visually select text last edited/pasted
nmap gV `[v`]

" Toggle spell checking
map <leader>ss :setlocal spell!<CR>

" Clipboard yanking/pasting
vmap <leader>yy "+y
vmap <leader>ya "ay
vmap <leader>yz "zy
map <leader>p "+p

" Tab configuration
map <leader>to :tabnew! %<CR>
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>

" Tag list
map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F4> :TlistToggle<CR>

" Task List (TODO list)
map <leader>ld <Plug>TaskList

" Fuzzy finder
map <leader>fb :FufBuffer<CR>
map <leader>ff :FufFile<CR>
map <leader>fd :FufDir<CR>
map <leader>fl :FufLine<CR>
map <leader>fh :FufHelp<CR>
map <leader>fc :FufChangeList<CR>
map <leader>fj :FufJumpList<CR>
map <leader>ft :FufTag<CR>

" tComment
map <leader>cc :TComment<CR>
map <leader>cb :TCommentBlock<CR>
map <leader>ci :TCommentInline<CR>
map <leader>cr :TCommentRight<CR>

" CamelCaseMotion
map <silent> <S-W> <Plug>CamelCaseMotion_w
map <silent> <S-B> <Plug>CamelCaseMotion_b
map <silent> <S-E> <Plug>CamelCaseMotion_e

" Rainbow Parens
map <leader>rt :RainbowParenthesesToggle<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" NERDTree
map <F2> :NERDTreeToggle<CR>

nnoremap <silent> <Leader>cl :call DeleteTrailingWS()<CR>
nnoremap <silent> <leader>n :call g:ToggleNuMode()<CR>
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Xclip integration:
vmap <F9> :!xclip -f -sel clip<CR> " copy text to xorg server clipboard
map <F10> :-1r !xclip -o -sel clip<CR> " paste text from xserv clip to vim

nnoremap <silent> <leader>ev :vs $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

""""""""""""""
" GUI Config "
""""""""""""""

set background=dark
colorscheme molokai

if exists("&guifont")
  if has("mac")
    set guifont=Andale\ Mono:h12
  elseif has("unix")
    if &guifont == ""
      set guifont=Liberation\ Mono\ 10
    endif
  elseif has("win32")
    set guifont=Consolas:h11,Courier\ New:h10
  endif
endif

"""""""""""""""""
" Auto Commands "
"""""""""""""""""

au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

" Rainbow Parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Tab completion and documentation
au FileType python set omnifunc=pythoncomplete#Complete

" Fixing styling in Gemfiles (not sure why this stopped working)
autocmd BufRead,BufNewFile Gemfile set filetype=ruby
" Ruby completion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Ruby make program
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
      \ else |
      \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
      \ endif
autocmd User Bundler
      \ if &makeprg !~# 'bundle' | setl makeprg^=bundle\ exec\  | endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

""""""""""""""""""
" Misc Functions "
""""""""""""""""""

" Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.lua :call DeleteTrailingWS()

function! g:ToggleNuMode()
  if (&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

if has("mac")
  set clipboard=unnamed
endif
