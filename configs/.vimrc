" plugins needed
" pathogen (https://github.com/tpope/vim-pathogen)
" mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" 
" pymode (https://github.com/python-mode/python-mode)
" cd ~/.vim/bundle && git clone --recurse-submodules https://github.com/python-mode/python-mode
"
" nerd-commenter
" cd ~/.vim/bundle && git clone https://github.com/preservim/nerdcommenter.git
"
" vim-ansible
" git clone https://github.com/pearofducks/ansible-vim ~/.vim/bundle/ansible-vim
"
" colorscheme
"
" mkdir -p ~/.vim/colors && cd ~/.vim/colors && wget https://raw.githubusercontent.com/habamax/vim-colors-defnoche/master/colors/defnoche.vim
"
"
"
" Automatic reloading of .vimrc
"
autocmd! bufwritepost .vimrc source %

"
" colorscheme
"
"colorscheme defnoche
colorscheme industry

"
" plugins
" 
filetype plugin indent on
" Setup Pathogen to manage your plugins
call pathogen#infect()

"
" option
" 
syntax on
" ignore case when search
set ignorecase
" highlight search result set hlsearch
" disable swapfile
set noswapfile
" disable automatic backup
set nobackup
" enable modeline
set modeline
" expand tab in insert mode to spaces
set expandtab
" better copy & paste
set clipboard=unnamedplus
" Set working directory to the current file
set autochdir
" highlight search results
set hlsearch
" set leader key
let mapleader = "\<space>"

"
" autocmd
"
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 cursorcolumn
autocmd FileType py setlocal tabstop=8 shiftwidth=4 softtabstop=4

"
" skeletons
"
au BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh
au BufNewFile *.py 0r ~/.vim/skeletons/skeleton.py
au BufNewFile main.yml 0r ~/.vim/skeletons/ansible.yml

"
" custom key maps 
"
" leader keys
"
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>W :w !sudo tee %<cr>
nnoremap <leader>n :set nonumber!<cr>
nnoremap <leader>p :set invpaste paste?<cr>
nnoremap <leader>h :call PasteFriendly()<cr>
nnoremap <leader>f :set foldmethod=syntax<cr>
" tabs
map <Leader>y <esc>:tabprevious<CR>
map <Leader>x <esc>:tabnext<CR>
"
" other keys
"
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" map key to toggle folding
noremap <C-f> za
inoremap <C-f> za
vnoremap <C-f> za
" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" module specific settings
"
" pymode
"
"let g:pymode_rope = 0
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options_max_line_length = 120
"" Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ["pep8","pyflakes"]
" Auto check on save
let g:pymode_lint_write = 1
" Don't autofold code
let g:pymode_folding = 0
"
" nerdcommenter
"
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
map <C-d> <plug>NERDCommenterToggle<CR>
imap <C-d> <Esc><plug>NERDCommenterToggle<CR>

"
" ansible-vim
"
let g:ansible_unindent_after_newline = 1

"
" autocompletion
"
" Minimalist-TabComplete-Plugin
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun

" Minimalist-TabComplete-Plugin
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun

