" All system-wide defaults (/etc/vim/vimrc)

set nocompatible
filetype off
filetype plugin indent on
filetype plugin on

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"Bundles
Bundle 'honza/vim-snippets'
Bundle 'UltiSnips'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'WebAPI.vim'
Bundle 'Gist.vim'
Bundle 'plantuml-syntax'
Bundle 'Shougo/vimproc.git'
Bundle 'dhruvasagar/vim-markify.git'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'jshint.vim'
"Bundle 'vividchalk.vim'
Bundle 'Distinguished'
Bundle 'Solarized'
Bundle 'sheerun/vim-polyglot.git'

Bundle 'Tabular'
Bundle 'vim-pad'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'gmarik/vundle'
Bundle 'a.vim'
Bundle 'calendar.vim'
"Bundle 'clang-complete'
Bundle 'closetag.vim'
Bundle 'pyflakes.vim'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'
"Bundle 'klen/python-mode'


Bundle 'Valloric/YouCompleteMe.git'
"Bundle 'SuperTab'
"Bundle 'UltiSnips'
Bundle 'vim-scripts/taglist.vim'
Bundle 'utl.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'xolox/vim-notes'
Bundle 'xolox/vim-misc'
Bundle 'tpope/vim-rails'
Bundle 'ruby.vim'
Bundle 'surround.vim'
Bundle 'templates.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"Bundle 'xolox/vim-easytags'
"Bundle 'easytags.vim'
Bundle 'DrawIt'
"
if has("syntax")
  syntax on
endif

set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"load indentation rules and plugins according to the detected filetype.
if has("autocmd")
	filetype plugin indent on
endif

set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set pastetoggle=<F2>
set relativenumber
set nowrap
set foldmethod=indent
set wildmenu
"set wildmenu=list:longest
set timeoutlen=250 "Time to wait after ESC
set showcmd

set splitright
set splitbelow

set tags=tags=./tags,./TAGS,tags,TAGS,~/.vimtags,~/.tags/python.tags

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"key mappings

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! Update_python_tags()
	let py_dir = "/usr/lib/python2.7/dist-packages/"
	call system('ctags -R --tag-relative=yes -f ~/.py_tags '.py_dir)
	"call system('echo "hello"')
endfunction



"save if lost focus
au FocusLost * :wa


"notes
let g:notes_directories=['~/vimwiki']
let g:notes_suffix = '.txt'
let g:pad_dir = "~/notes/"

" keep status line visible
set laststatus=2

"don't break lines in middle of words
set linebreak

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap H ^
nnoremap L $
"nnoremap : q:i
"nnoremap :q <leader>q<cr>
nnoremap <leader>c :cnext<cr>
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>m :make -j<cr>
nnoremap <leader>cm :!cmake ..<cr>
inoremap <C-n> <C-k>

nnoremap <F8> c-wgf
nnoremap ,d :Gdiff<cr>
nnoremap ,s :Gstatus<cr>
nnoremap ,a :!git add %<cr>


"let g:easytags_updatetime_autodisable=1
set tags=./tags,./TAGS,tags,TAGS,~/.vimtags,~/.tags,~/.py_tags
set laststatus=2
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]


" Git mappings
nnoremap ,d :Gdiff<cr>
nnoremap ,a :!git add %<cr>
nnoremap ,s :Gstatus<cr>


" store swap files in fixed location
set dir=~/.vimswap//


let pymode_rope_guess_project=0
let pymode_lint=0

set modeline

" shortcut to open vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Remap go to first and last characters
nnoremap L $
nnoremap H ^


"Shortcut to show spaces
nnoremap <leader>l :set list!<cr>
let g:vundle_default_git_proto = 'git'


nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr><cr>
nnoremap <leader>f :e <c-r>=expand("%:p:h")<cr>/
nnoremap ,b :ls<CR>:buffer<Space>

" command to open File explorer to current dir
command! CurDir :30vsplit %:p:h


let g:ragtag_global_maps=1
"to let ragtag keybindings to have a chance
set timeoutlen=500


"netrw settings
"let g:netrw_preview   = 1
"let g:netrw_liststyle = 3
let g:netrw_winsize=30
"let g:netrw_alto=1
let g:netrw_browse_split=4


"shortcut to open netrw as vertical split
nnoremap <leader>v :Vexplore<cr>

"remap window switches
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" open file in new window
nnoremap <f8> <c-w>gf
"nnoremap  <silent> <C-j> :wincmd j<cr>
"nnoremap <silent> <c>k :TmuxNavigateUp<cr>
"nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-a> :TmuxNavigatePrevious<cr>
"nnoremap <c-l> <c-w>l
"nnoremap <c-h> <c-w>h
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k

set relativenumber


"colors
set t_Co=256


"tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set background=dark
set expandtab
set ts=2
set smarttab
set cindent
set ignorecase
set backspace=indent,eol,start

"if isdirectory('/home/kmcclean/src/Main/cpp/ipr')
    set path+=/home/kmcclean/src/Main/cpp/**
"endif
"
set ff=unix



colorscheme distinguished
 "vimdiff color scheme
"highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen gui=none guifg=bg guibg=LightGreen
"highlight DiffText cterm=none ctermfg=black ctermbg=Red gui=none guifg=bg guibg=Red
"
"
set history=1000

"cscope
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("/home/kmcclean/src/Main/cpp/cscope.out")
        cs add /home/kmcclean/src/Main/cpp/cscope.out /home/kmcclean/src/Main/cpp
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif


 "These commands open folds
 set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
let g:gist_detect_filetype = 1


inoremap <F7> <C-R>=strftime("%Y %b %d")<CR>
let g:UltiSnipsSnippetDirectories=["UltiSnips", 'vim-snippets']
inoremap <leader>e <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
"inoremap <tab> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
"let g:UltiSnipsListSnippets="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"inoremap <leader>e <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>
let g:ycm_register_as_syntastic_checker = 0
