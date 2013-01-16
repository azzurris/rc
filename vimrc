syntax enable
syntax on
"let mapleader = " "
set t_Co=256
colorscheme Mustang
"mustang's color milkwhite:230 orange_red:208
""colorscheme molokai
""colorscheme wombat256mod
""colorscheme sorcerer
""hi StatusLine ctermfg=white	ctermbg=blue
""hi Function ctermfg=blue
"set showtabline=2
"hi TabLineFill ctermfg=blue
"hi TabLineSel ctermfg=blue ctermbg=white
"hi TabLine ctermfg=white ctermbg=blue

hi Search  ctermfg=253 ctermbg=66	"molokai's highlight search
hi VisualNOS                  ctermbg=32
hi Visual                     ctermbg=32
set ruler  
set linebreak
set number
set showmatch
set is
set mouse=a
set showcmd
set cursorline 
hi CursorLine cterm=underline 
""ctermbg=black,brown,blue,green,cyan,magenta,grey,yellow,white
set hidden
""winpos 100 100
set hlsearch 
set cmdheight=1
set textwidth=80
set tabstop=4
set smarttab
set shiftwidth=4
set wrap
set autoread
set cindent
set autoindent
set smartindent
set noswapfile
set nobackup
set title                       " change the terminal's title
set novisualbell                " don't beep
set noerrorbells                " don't beep
" Thanks to Steve Losh for this liberating tip
" " See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v
" " Speed up scrolling of the viewport slightly
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
""remember the last place of file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal g`\"" |
     \ endif


"======================================
"tab	
"======================================
"switch to existing tab page if it contains a window displaying the target
"buffer, instead of duplicating it in a new tab.
set switchbuf+=usetab,newtab


"======================================
"pathogen
"======================================
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on


"======================================
"MRU most recently used files
"======================================
"" only show linux-3.0 project files in MRU window
""let MRU_Include_Files = '\.c$\|\.h$'
let MRU_Include_Files = '^/home/hutj/MRVL/linux-3.0/.*'
let MRU_Window_Height = 8 


"======================================
"cscope
"======================================
set cscopequickfix=s-,c-,d-,i-,t-,e-
set csto=1
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
    cs add cscope.out
endif
set csverb
""map the next/previous location to ctrl-n/p
map <C-n> :lne<CR>
map <C-p> :lp<CR>
map <leader>q :lclose<CR>
map <leader>o :lop 6<CR>
""find functions calling this function
map <leader>c :lcs find c <cword><CR> :lop 6<CR>
""find this C symbol
map <leader>s :lcs find s <cword><CR> :lop 6<CR>


"======================================
"taglist
"======================================
if &diff
    let Tlist_Auto_Open=0 "don't auto pen when compare two files
else
    let Tlist_Auto_Open=1 "auto pen Tlist when open a file
endif

let Tlist_Use_Right_Window=1
let Tlist_Auto_Update=1 
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1 
let Tlist_WinWidth=45
map <F11> :TlistToggle<CR>


"======================================
"tagbar
"======================================
nmap <silent> <F12> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 38


"======================================
"NERDTree
"======================================
""auto open the NERDTree
""autocmd VimEnter * NERDTree    
map <F10> :NERDTreeToggle<CR>


"======================================
"powerline
"======================================
set nocompatible   " Disable vi-compatibility 
set laststatus=2
set encoding=utf-8
""let g:Powerline_symbols = 'unicode'
""let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_dividers_override = ['|', '|', '|', '|']
""let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_stl_path_style = 'relative'
call Pl#Theme#InsertSegment('currenttag','before','mode_indicator')


""""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 3
let g:LookupFile_PreserveLastPattern = 0       
let g:LookupFile_PreservePatternHistory = 1   
let g:LookupFile_AlwaysAcceptFirst = 1       
let g:LookupFile_AllowNewFiles = 0          
if filereadable("./filenametags")                
""let g:myLookupFileTagExpr = './filenametags'
""let g:LookupFile_TagExpr = 'g:myLookupFileTagExpr'
let g:LookupFile_TagExpr = '"./filenametags"'
endif

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
let _tags = &tags
try
		let &tags = eval(g:LookupFile_TagExpr)
	let newpattern = '\c' . a:pattern
	let tags = taglist(newpattern)
catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
	return ""
finally
		let &tags = _tags
endtry
"show the matches for what is typed so far.
let files = map(tags, 'v:val["filename"]')
return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

nmap <silent> <leader>f :LUTags<cr>
""nmap <silent> <leader>b :LUBufs<cr>
""nmap <silent> <leader>w :LUWalk<cr>
	

"======================================
"function key mapping
"======================================
"find next and previous 
"    <F2>   is for mouse toggle in plugin folder
nmap <F3>	#
nmap <F4> 	*
"   <F5> is the shortcut to lookupfile LUTAGs
map <F6> :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr> 
map <F7> <Plug>MarkClear
map <F8> <Plug>MarkSet
map <F9> :set invhlsearch<CR>
"   <F10> is for nerdtree toggle
"   <F11> is for Tlist toggle
"   <F12> is for tagbar toggle
"map <leader>m to highlight the current words
"map <leader>n to clear highlight the current words or all highlight


" bind the ctrl+3 to ctrl+o ,ctrl+4 to ctrl+i 
nmap <C-B> <C-O>
nmap <C-F> <C-I>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
""	use jj to simulate <ESC> 
imap jj <ESC>
""	user \d to see what's unsaved change
nmap <leader>d :w !diff -u % -<CR>
" visual-mark
" mm to mark/unmark a line
" mn to switch next marked line
" mp to switch prev marked line
" mc to clear all marked line
"
"
" vi has default mark function
" use `a to jump to the line&coloum marked with ma

"======================================
"auto complete the C comment 
"======================================
inoremap  <buffer>  /*       /*<Space><Space>*/<Left><Left><Left>
vnoremap  <buffer>  /*      s/*<Space><Space>*/<Left><Left><Left><Esc>p
"-------------------------------------------------------------------------------
" additional mapping : complete a classical C multi-line comment: 
"                      '/*<CR>' =>  /*
"                                    * |
"                                    */
"-------------------------------------------------------------------------------
inoremap  <buffer>  /*<CR>  /*<CR><CR>/<Esc>kA<Space>
"
"-------------------------------------------------------------------------------
" additional mapping : {<CR> always opens a block
"-------------------------------------------------------------------------------
inoremap  <buffer>  {<CR>  {<CR>}<Esc>O
vnoremap  <buffer>  {<CR> s{<CR>}<Esc>P=iB

"======================================
"mask all arrow key .foce newbie use hjkl ^.^
"======================================
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
