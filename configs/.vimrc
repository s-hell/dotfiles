" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" set leader key
let mapleader = "\<space>"

syntax on

set ignorecase
set smartindent
set smartcase
set hlsearch
set nobackup
set incsearch
set history=700
set undolevels=700
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set nowritebackup
set noswapfile
set autoindent
set nocursorline
set foldmethod=syntax
set nofoldenable

" enable modeline
set modeline

filetype plugin indent on

" Set working directory to the current file
set autochdir

" Better copy & paste
nnoremap <F2> :call PasteFriendly()<CR>
inoremap <F2> <C-o>:call PasteFriendly()<CR>
cnoremap <F2> <C-c>:call PasteFriendly()<CR>
set clipboard=unnamedplus

" vimwiki specific settings
set nocompatible

" vimwiki setttings
let wiki_1 = {}
let wiki_1.path = '~/git/pcspinnt/wiki/vim_wiki'
nnoremap <leader>wtoc :VimwikiTOC<cr>
" vimwiki
let g:vimwiki_list = [{'path': '~/git/pcspinnt/wiki/vim_wiki', 'template_path': '~/git/pcspinnt/wiki/templates', 'template_default': 'shell', 'template_ext': '.html', 'auto_toc': 1}]

" leader key mappings
nnoremap <leader>w :w<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>W :w !sudo tee %<cr>
nnoremap <leader>n :set nonumber!<cr>
nnoremap <leader>p :set invpaste paste?<cr>
nnoremap <leader>h :call PasteFriendly()<cr>
nnoremap <leader>f :set foldmethod=syntax<cr>
" ModeLine
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" map key to toggle folding
noremap <C-f> za
inoremap <C-f> za
vnoremap <C-f> za

" easier moving between tabs
map <Leader>y <esc>:tabprevious<CR>
map <Leader>x <esc>:tabnext<CR>

" fold xml files
let g:xml_syntax_folding=1
autocmd BufRead *.xml set foldmethod=syntax

" ansible plugin for specifc files
au BufRead,BufNewFile */bxplaybooks/common/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */bxplaybooks/bx/*.yml set filetype=yaml.ansible

" Color scheme
colorscheme darkblue

" Setup Pathogen to manage your plugins
call pathogen#infect()

map <C-d> <plug>NERDCommenterToggle<CR>
imap <C-d> <Esc><plug>NERDCommenterToggle<CR>

" move between panels
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Execute current file
nnoremap <F5> :call ExecuteFile()<CR>

" settings nerdcommenter
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" skeletons
au BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh
au BufNewFile *.py 0r ~/.vim/skeletons/skeleton.py

" File Browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" Will attempt to execute the current file based on the `&filetype`
" You need to manually map the filetypes you use most commonly to the
" correct shell command.
function! ExecuteFile()
  let filetype_to_command = {
  \   'py': 'python',
  \   'html': 'open',
  \   'sh': 'sh',
  \   'bash': 'bash'
  \ }
  let cmd = get(filetype_to_command, &filetype, &filetype)
  call RunShellCommand(cmd." %s")
endfunction

command! -complete=shellcmd -nargs=+ Shell call RunShellCommand(<q-args>)
function! RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d",
        \ &tabstop, &shiftwidth, &textwidth ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

function! PasteFriendly()
    if &list
        setlocal nolist noai
        echom "Whitespace visibility and auto-indent disabled for easier copy/paste."
    else
        setlocal list ai
        echom "Whitespace visibility and auto-indent enabled for easier editing."
    endif
endfunction

" python
let g:pymode_rope = 0
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options_max_line_length = 120
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ["pep8","pyflakes"]
" Auto check on save
let g:pymode_lint_write = 1
" Don't autofold code
let g:pymode_folding = 1
let g:pymode_python = 'python3'

" vim: set ts=4 sw=4 tw=0
