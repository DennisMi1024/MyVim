" .vimrc - Vim configuration file.
"
" Copyright (c) 2010 Jeffy Du. All Rights Reserved.  
" 
" Maintainer: Jeffy Du <jeffy.du@gmail.com> "    Created: 2010-01-01
" LastChange: 2010-04-22



"CTags 
set tags=~/.vim/ctags/tags,~/path/tags,./tags
set autochdir
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaIS --extra=+q .<CR>

map <C-w> <C-w>w

"Plugin Begin
"taglist Begin
:nmap <silent> <F2> <ESC>:Tlist<RETURN>
let Tlist_Show_One_File = 1 "只显示当前文件的taglist 
let Tlist_WinWidth = 25 "设置taglist窗口的宽度
let Tlist_Exit_OnlyWindow = 1 "tagList窗口是最后的窗口
"let Tlist_Use_Right_Window = 1 "在vim右侧显示taglist窗口
let Tlist_Auto_Open = 1 "在启动Vim以后自动打开TagList窗口
let Tlist_Process_File_Always=1 "同时显示多个文件中的tag时，可使得其他的Tag隐藏起来，只显示当前文件的tag
"taglist End
"Plugin End

"omni-complete
set nocp
filetype plugin on
set completeopt=longest,menu
set completeopt=menuone
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
let OmniCpp_DefaultNamespaces=["std"]



"Auto Complete


" GENERAL SETTINGS: {{{1
" To use VIM settings, out of VI compatible mode.
set nocompatible
" Enable file type detection.
filetype plugin indent on
" Syntax highlighting.
syntax on
" Setting colorscheme
" Other settings.
set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set nobackup
set   cindent
set   cinoptions=:0
set   cursorline
set   completeopt=longest,menuone
set noexpandtab
set   fileencodings=utf-8,gb2312,gbk,gb18030
set   fileformat=unix
set   foldenable
set   foldmethod=marker
set   guioptions-=T
set   guioptions-=m
set   guioptions-=r
set   guioptions-=l
set   helpheight=10
set   helplang=cn
set   hidden
set   history=100
set   hlsearch
set   ignorecase
set   incsearch
set   laststatus=2
set   mouse=a
set   number
set   pumheight=10
set   ruler
set   scrolloff=5
set   shiftwidth=4
set   showcmd
set   smartindent
set   smartcase
set   tabstop=4
set   termencoding=utf-8
set   textwidth=80
set   whichwrap=h,l
set   wildignore=*.bak,*.o,*.e,*~
set   wildmenu
set   wildmode=list:longest,full
set nowrap

autocmd  bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") |q|endif

"Function Plugin Begin

"Auto Pair Funcion Begin
function! AutoPair(open,close)
	let line = getline('.')
	if col('.') >strlen(line) || line[col('.') -1] == ' '
		return a:open.a:close."\<ESC>i"
	else
		return a:open
	endif
endf

function! ClosePair(char)
	if getline('.')[col('.')-1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function! SamePair(char)
	let line =getline('.')
	if col('.') > strlen(line) || line[col('.') -1] == ' '
		return a:char.a:char."\<ESC>i"
	elseif line[col('.')-1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

inoremap ( <c-r>=AutoPair('(',')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>

inoremap { <c-r>=AutoPair('{','}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>

inoremap [ <c-r>=AutoPair('[',']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>


inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>

inoremap ` <c-r>=SamePair('`')<CR>


"VIM 折叠定义
set foldmethod=indent
"Auto Pair Function End
"Function Plugin End

"pathogen Plugin 折叠
call pathogen#infect()


"NERDTree 
map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
let NERDTreeWinPos='right'
"默认开启NERDTree
autocmd VimEnter * NERDTree
"Auto Complete
let g:jedi#goto_command="<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentations_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#completions_enabled = 1


"YouCompleteSetting 
let mapleader=","
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
nnoremap <leader>jd:YcmCompleter GoToDefinitionElseDeclaation<CR>
"when open vim ,don't ask the user if load ycm_extra_conf.py or not
let g:ycm_confirm_extra_conf=0
"use ctagss
let g:ycm_collect_identifies_from_tag_files=1

let g:EchoFuncShowOnStatus =1
