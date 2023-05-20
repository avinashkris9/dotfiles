" .vimrc configuration 
packadd! dracula
syntax enable
colorscheme dracula
syntax on
"When I go to newline keep same indentation
set autoindent              
set expandtab
set shiftwidth=2
set softtabstop=2
" Show the filename in the window titlebar
set title
" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps