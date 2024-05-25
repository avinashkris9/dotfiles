" .vimrc configuration 
packadd! dracula
syntax enable
syntax on
colorscheme dracula
set clipboard=unnamed
set autoindent					" When I go to newline keep same indentation         
set expandtab
set shiftwidth=2
set softtabstop=2
set title						" Show the filename in the window titlebar
if has("autocmd")				" Automatic commands
	
	filetype on					" Enable file type detection
	filetype indent on
	filetype plugin on
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript " Treat .json files as .js
	
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown " Treat .md files as Markdown
endif

set showmode					
set hlsearch					" Highlight Search"
:set ignorecase
:set smartcase
set showmatch					" show matching barket"

