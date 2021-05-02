"Plugins
"automatic installation of vimpkug if it isnt there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' "Color for the lower line thingy
Plug 'junegunn/rainbow_parentheses.vim' "Rainbow parenthesis match
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdcommenter' "Multi-line commenting
Plug 'lervag/vimtex' "Compiling latex and stuff
Plug 'jiangmiao/auto-pairs' "Auto-pair brackets
Plug 'sjl/badwolf'  "Color scheme Bad Wolf
Plug 'Valloric/YouCompleteMe' "Autocomplete
Plug 'tpope/vim-surround' "For surrounding stuff with stuff
call plug#end()
filetype plugin on "Needed for Vim-plug to work 

""""""""""""""""""""""""""""""""""""""""""""""""

let g:python_highlight_all = 1


"General initial settings
"syntax on
syntax on
set encoding=utf-8
" leader is comma
let mapleader=","       
"This shit makes å work normally
let g:AutoPairsShortcutFastWrap = "<C-f>"
syntax on
set nu
colorscheme badwolf
set cursorline 
set laststatus=2 "Needed for lightline

"RainbowParentheses match (plus customization)
au VimEnter * RainbowParentheses 
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]



"A prettier cursor line
"hi CursorLine term=bold cterm=bold guibg=Grey40 
hi Cursorline guibg=Grey40



""""""""""""""""""""""""""""""""""""""""""""""""""
"Kepmapppings

" map ,. to insert : at end of line and start new line
inoremap ,. <ESC><S-a>:<CR> 

"Map jk to escape, much nicer
inoremap jk <esc>
vnoremap jk <esc> 
" move vertically by visual line
nnoremap j gj
nnoremap k gk
"remove a word in insert mode with ctrl backspace
inoremap <c-BS> <c-w>
"Changing windows easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"jkj to jump to the next line
"inoremap jkj <ESC> o
"Key mappings for compiling and running different scripts
""""""""""""""""""""""""""""""
"Shell script, change privileges and run 
map <F2> :w ! chmod 755 % ;./%<CR>
"Compile c++
map <F3> :w ! g++ ./% -o %:r<CR>
"Compile c 
map <F4> :w ! gcc ./% -o %:r 
"Run python 
map <F5> : !python3 ./%<CR>

"Run current executable 
map <F6> : ! ./%:r<CR>
""""""""""""""""""""""""""""


"Comment out with cm
map cm <leader>c<space> 
"Write with <leader> w 
nnoremap <leader>w :w <CR> 
"Write and quit with <leader> x
nnoremap <leader>x :x <CR>
nnoremap <leader>q :q <CR>



""""""""""""""""""""""""""""""""""""
"Abbreviations
":ab cleantex ! rm {*.aux,*.gz,*.log}


ab vrc $HOME/.vimrc





""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""
"Pythonic standards

au BufNewFile,BufRead *.py
	\set tabstop=4
	\set softtabstop=4
	\set shiftwidth=4
	\set textwidth=79
	\set expandtab
	\set autoindent
	\set fileformat=unix
	\match BadWhitespace /\s\+$/	

"""""""""""""""""""""""""""
""""""""""""""""""""""""""""
"""""""""""""""""""""""""""
"tex standards
"
autocmd BufNewFile,BufRead *.tex inoremap <buffer> .- \
autocmd BufNewFile,BufRead *.tex inoremap <buffer> beq<space> \begin{equation}<CR><CR>\end{equation}<UP><TAB>
autocmd BufNewFile,BufRead *.tex inoremap <buffer> /= {}<LEFT>
autocmd BufNewFile,BufRead *.tex inoremap <buffer> bef<space> \begin{figure}<CR><CR>\end{figure}<UP><TAB>

autocmd BufNewFile,BufRead *.tex inoremap <buffer> fr<space> \frac{}{}<LEFT><LEFT><LEFT>
autocmd BufNewFile,BufRead *.tex inoremap <buffer> /= {}<LEFT>
autocmd BufNewFile *.tex so /home/henrik/Documents/umu/tex_template_vimheader.txt
autocmd BufNewFile *.tex execute "normal kk"
autocmd BufNewFile *.tex exe "1," . 10 . "g/title{.*/s//title{" .expand("%") "}"
