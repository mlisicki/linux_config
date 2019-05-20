" .vimrc configuration by Michal Lisicki

" Hint: Check all the options with ':help options'

" Example of defining a function
function! Hi( name )
    echo "Hello" a:name
endfunc

" Variables. You can create variables using the 'let' command, with a prefix
" specifying their scope. E.g. 'g' means global
let g:name = 'Michal Lisicki' "Set my name in to the name variable
" Then check it out with 'echo name'.
" Check all the variables by typing 'let'

" Example of a basic mapping
" We use noremap instead of just map to prevent mapping a key twice and creating
" an infinite loop
nnoremap <c-m> :call Hi(name)<cr>

" Insert a Python breakpoint
nnoremap <leader>b A<cr>import ipdb; ipdb.set_trace()<esc>

" Colorscheme
colorscheme peachpuff

" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
" filetype plug-in indent on

" Turn off modelines
" Modelines let you to set some settings specific to a file. I don't know why
" would I want that off. Maybe to speed up loading?
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap linebreak nolist " Wrap the lines visually
" Vim's auto indentation feature does not work properly with text copied from
" outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <leader>p :set invpaste paste?<CR>
imap <leader>p <C-O>:set invpaste paste?<CR>
set pastetoggle=<leader>p

set textwidth=80 " Uncomment below to set the max textwidth. Use a value
" corresponding to the width of your screen.
set formatoptions=tcqrn1

" Indentation
set autoindent
" Make tab convert ot 4 spaces
set tabstop=8 " The width of an actual tab character
set shiftwidth=4
set softtabstop=0
set expandtab  " Simulate tab with spaces
set noshiftround
set smarttab

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar. 0 - never; 1 - only if there are at least two windows; 2 - always
set laststatus=2

" Display options (those are on by default for vim and off for vi)
set showmode "print 'Insert' or 'Visual' a the bottom of the screen
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between
" them.  
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[POS=%l,%v][%p%%]\[BUFFER=%n]%=%{strftime('%c')}
set statusline=%F%m%r%h%w\ [TYPE=%Y]\[POS=%l,%v][%p%%]\[BUFFER=%n]%=%{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of
" data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
" Note: this also save all the settings for the file. This means that when
" I change the global settings they are not applied. I'll need to work more on
" that.
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"

" Load plugins from ~/.vim/bundle directory using Pathogen
" To install new plugins just add them to that directory
execute pathogen#infect()

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Syntastic plugin options
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_enable_signs = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Jedi-Vim options
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

