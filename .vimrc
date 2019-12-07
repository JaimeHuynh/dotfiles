set nocompatible                      "We want the latest vim settings/options, it must be first because it changes other options as a side effect
" Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()
syntax on                             "Enable syntax highlighting
syntax enable
filetype plugin indent on             "Detech files type

"-------------COMMENTARY-------------"
autocmd FileType apache setlocal commentstring=#\ %s

"-------------AUTOCOMPLETE-------------"
set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start        "Make backspace behave like every other editor
let mapleader = ','                   "The default leader is \, but a comma is much better
set number                            "Let's active line number
set relativenumber                    "look to your left screen
set laststatus=2                      "Always display the status line
set autowriteall                      "Automatically write the file when switching buffer
set complete=.,w,b,u                  "Set our desired autocompletion matching"
" set tabstop=2
" set softtabstop=2
" set shiftwidth=2
" set expandtab
set clipboard=unnamed
set autoindent
set splitright
set splitbelow
set si                                "smart indent
set hidden
set encoding=UTF-8
set conceallevel=1                  "Concealing Characters

" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript.jsx setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType pug setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType html setlocal tabstop=2 shiftwidth=2 expandtab
au FileType vue setlocal tabstop=2 shiftwidth=2 expandtab
au FileType eruby setlocal tabstop=2 shiftwidth=2 expandtab
au FileType scss setlocal tabstop=2 shiftwidth=2 expandtab
au FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
au FileType cs setlocal tabstop=4 shiftwidth=4 expandtab
au FileType html.erb setlocal tabstop=2 shiftwidth=2 expandtab
au FileType html.handlebars setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"-------------VISTA_VIM-------------"
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"-------------INDENTGUIDES-------------"
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
" Ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Make it easy to edit the vimrc file.
"-------------Mapping-------------"
nnoremap <Leader>ev :tabedit ~/.vimrc<cr>
" Add simple hightlight removal
nmap <ESC><ESC> :nohlsearch<cr>
nnoremap <Leader>qq :bd<CR>
nnoremap <C-s> :tabn<cr>
nnoremap <C-a> :tabN<cr>
nnoremap <C-o> :tabedit<cr>:NERDTreeToggle<cr>
map <C-n> :NERDTreeToggle<cr>
map <Leader>ww :w!<cr>
nmap <C-x> :quit<cr>

" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
" nnoremap <C-S-n> :m+<CR>
" nnoremap <C-S-m> :m-2<CR>
"move a line up/down

nnoremap <CR> G     "Go to line G
" Open terminal
nnoremap <Leader>at :call OpenFloatTerm()<CR>
" Open node REPL
nnoremap <Leader>an :call OpenFloatTerm('"node"')<CR>

"--------------FloatingWindows--------------"
if has('nvim')
	function! OpenFloatTerm(...)
		" Configuration
		let height = float2nr((&lines - 2) * 0.6)
		let row = float2nr((&lines - height) / 2)
		let width = float2nr(&columns * 0.6)
		let col = float2nr((&columns - width) / 2)
		" Border Window
		let border_opts = {
					\ 'relative': 'editor',
					\ 'row': row - 1,
					\ 'col': col - 2,
					\ 'width': width + 4,
					\ 'height': height + 2,
					\ 'style': 'minimal'
					\ }
		" Terminal Window
		let opts = {
					\ 'relative': 'editor',
					\ 'row': row,
					\ 'col': col,
					\ 'width': width,
					\ 'height': height,
					\ 'style': 'minimal'
					\ }
		let top = "╭" . repeat("─", width + 2) . "╮"
		let mid = "│" . repeat(" ", width + 2) . "│"
		let bot = "╰" . repeat("─", width + 2) . "╯"
		let lines = [top] + repeat([mid], height) + [bot]
		let bbuf = nvim_create_buf(v:false, v:true)
		call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
		let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
		let buf = nvim_create_buf(v:false, v:true)
		let s:float_term_win = nvim_open_win(buf, v:true, opts)
		" Styling
		call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
		call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
		if a:0 == 0
			terminal
		else
			call termopen(a:1)
		endif
		startinsert
		" Close border window when terminal window close
		autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
	endfunction
endif
"--------------visuals--------------"
"Git blamer
" nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
let g:blamer_enabled = 1
let g:blamer_delay = 1000
let g:blamer_prefix = '💻 '

"joshdick/onedark.vim
colorscheme onedark
hi Comment guifg=#808080
set t_Co=256                                    "use 256 colors.
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set cursorline                                  "highlight current line
set title
autocmd BufWritePre * %s/\s\+$//e               "Auto remove trailing space

"--------------vim_airline/vim_airline_themes--------------"
let g:airline_theme='ayu_mirage'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"--------------vim_airline/vim_airline--------------"
let g:airline#extensions#tabline#enabled = 1

"--------------Mouse--------------"
if has('mouse')
	set mouse=a
endif
" mhinz/vim-startify

" let g:startify_custom_header=[
"       \ ' *********************************************************************///((((##((((((((////////****, ',
"       \ ' *****.,,,..***********************************************************///(((((((((((//////////***** ',
"       \ ' ******.,,,,.%%./////**************************************************/////(((((//////////////***** ',
"       \ ' *****...,,,.%%%%%%.///**************************************************///////////////////////**** ',
"       \ ' ********.,,.%%%%%%%%%/.************************************************************************..,, ',
"       \ ' ****/////*,.%%%%%%%%%%%%%.*********************************************,,,,,,,,,,,,,,,,,,.*%%%%%.,, ',
"       \ ' ***////////,%%%%%%%%%%%%%%%.******************************************,,,,,,,,,,,,,.#%%%%%%%%%%.,, ',
"       \ ' ***/////////.%%%%%%%%%%%%%%%%%%.****************************************,,,,,,,.,%%%%%%%%%%%%%%%,,, ',
"       \ ' **//////////*.%%%%%%%%%%%%%%%%%%%%**************************************,,,.%%%%%%%%%%%%%%%%%%%.,., ',
"       \ ' */////////****.%%%%%%%%%%%%%%%%%%%%%.**********************************.%%%%%%%%%%%%%%%%%%%%%%%,.,, ',
"       \ ' */////////*****.%%%%%%%%%%%%%%%%%%%%%%,*************,........,*****.%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,, ',
"       \ ' /////////*****,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,,, ',
"       \ ' /////////****,,,,,.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%,*,,,,, ',
"       \ ' *************,,,,,,,(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.*******, ',
"       \ ' *********,,,,,,,,,,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//////***** ',
"       \ ' ,,,,,,,,,,,,,,,,,,,,,,,,#%%.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.////////**** ',
"       \ ' ,,,,,,,,,,,,,,,,,,,,,,,,,.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.%%%%./////////***** ',
"       \ ' ,,,,,,,,,,,,,,,,,,,,,,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%,***////////****** ',
"       \ ' ,,,,...,,,,,,,,,,,,,,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.***************, ',
"       \ ' .........,,,,,,,,,,,,,,(%%%%%%%%%%*%,,.%%%%%%%%%%%%%%%%%%%%%%%%%*%,,.%%%%%%%%%%%%%%.**************, ',
"       \ ' .........,,,,,,,,,,***.%%%%%%%%%%,&@%,,.%%%%%%%%%%%%%%%%%%%%%%%,&@%,,.%%%%%%%%%%%%%%*************,, ',
"       \ ' ..........,,,,,,,,***,%%%%%%%%%%%.,,,,,.%%%%%%%%%%%%%%%%%%%%%%%.,,,,,.%%%%%%%%%%%%%%.**********,,,, ',
"       \ ' ..........,,,,,,,,***#%%%%%%%%%%%%.,,,.%%%%%%%%%%%%%%%%%%%%%%%%%.,,,.%%%%%%%%%%%%%%%%,,,,,,,,,,,,,, ',
"       \ ' ...........,,,,,,,**.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,,,,,,,,,,, ',
"       \ ' ..........,,,,,,,***%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,,,,,,,,,, ',
"       \ ' .........,,,,,,,***.%%%//////(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(///////%%%%%%%#,,,,,,,,,,,, ',
"       \ ' ,,,,,,,,,,,,,,*****,%//////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//////////(%%%%%%.********,,, ',
"       \ ' ,,,,,,,,,**********%%//////////%%%%%%%%%%%%%%%%%%%###%%%%%%%%%%%%%%%%////////////%%%%%%%**********, ',
"       \ ' *******************%%%////////%%%%%%%%%%%%%%%(,#########*%%%%%%%%%%%%%//////////%%%%%%%%.*********, ',
"       \ ' ***********////////*%%%%%%%%%%%%%%%%%%%%%%%%%,##########,%%%%%%%%%%%%%%%//////%%%%%%%%%%#///******* ',
"       \ ' ///////////////////*%%%%%%%%%%%%%%%%%%%%%%%%%,##########(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.////***** ',
"       \ ' ////////////////////.%%%%%%%%%%%%%%%%%%%%%%%%%,/########,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%,/////**** ',
"       \ ' /////////////////////.%%%%%%%%%%%%%%%%%%%%%%%%%%%%,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/////**** ',
"       \ ' /////////////////////*.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.///***** ',
"       \ ' ////////////////////***.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(//*****, ',
"       \ ' **////////////////******.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*******, ',
"       \ ' ************************.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.*****,, ',
"       \ ' ************************(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.****,,, ',
"       \ ]


let g:startify_custom_header=[
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0kkOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKkdlc:::ldkKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0xoc::::::::::cox0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKkdlc::::::cllc:::::::ldOKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0xoc:::::::ldkKXXKkdl:::::::cox0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKOdlc::::::coxOXWMMMMMMWXOxoc::::::cldOKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMWX0koc:::::::ldkKNWMMMMMMMMMMMMWNKkdl:::::::cok0XWMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMNKOdlc::::::coxOXWMMMMMMMMMMMMMMMMMMMWNXOxoc::::::cldOKNMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMWN0koc:::::::ldk0NWMMMMMMMMMMMMMMMMMMMMMMMMMMWN0kdl:::::::cd0WMMWWNNNWMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMWNXOxlc::::::clxOXWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOxlc:::lkXWX0kdooodx0XWMMMMMMMM ',
			\ ' MMMMMMMMMMMWN0kdl:::::::cok0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWN0kod0WNOoc::::::::oONMMMMMMM ',
			\ ' MMMMMMMMWXOxoc::::::clxOKNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNWNkc::cokOkdc::ckNMMMMMM ',
			\ ' MMMMMMMMXd:::::::cok0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKo:::dXWMMXd:::oKMMMMMM ',
			\ ' MMMMMMMMKo::::cdOKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXd:::o0WWWKo:::oXMMMMMM ',
			\ ' MMMMMMMMKo::::l0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNxc:::ldxdl:::lOWMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0dc::::::::::lxKWMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0dc:::lxOkxxxk0XWMMMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNOoc::clkXWMMWWWWNKKNMMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkoc::cokXWMMMMKdlc:;c0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkoc::coONWMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxl:::cd0NMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKxl:::cd0NMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0dc:::lxKWMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKKKKKXWWWNOdc:::lxKWMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMWNOdlcccccldkkoc:::lkXWMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMW0oc:::cccc::::::coOXWMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::lKMMMMMMMMMMMMMMMMMMMMMMMMMMMKo:::oO0KK0dc:::lONWMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMWOc::cOWMMMMKo:::xNMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMKo::::oKMMMMMMMMMMMMMMMMMMMMWNXKOkxl::::o0KXXKxc::ckWMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMXxxkO0KNMMMMMMMMMMMMMWNXK0Oxdolc:::::::::ccllc:::cxNMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMWWWNXXKXNWMMMMMWNX0Okxolcc:::::ccodxkOkolc::::cox0NMMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMMNKkdlcccldk00kxdocc::::::cloxkO0XNWWMMMNX00000KNWMMMMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMMXxc::::cc::::::::::clodxO0KXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
			\ ' MMMMMMNxc::cx0K0xc:::coxkOKXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXx;,,,,:0MMMMMMMM ',
			\ ' MMMMMMKo:::xNMMMXd:::oKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKko:,,,,,::0MMMMMMMM ',
			\ ' MMMMMMXd:::oOXNXOl:::dXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWN0xl;,,,,,,,,:xXMMMMMMMM ',
			\ ' MMMMMMWKo:::clolc::coKWWXOKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKko:,,,,,,,,;lx0NWMMMMMMMMM ',
			\ ' MMMMMMMWXkol:::::coOXWW0c,;lx0NWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWN0xl;,,,,,,,,:okKWMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMNX0OOO0XNWMXd;,,,,,,:okKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkd:,,,,,,,,;lx0NWMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMXko:,,,,,,,,;lx0NWMMMMMMMMMMMMMMMMMMMMMMWN0xl;,,,,,,,,:okKWMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMWX0dc;,,,,,,,,:dOXWMMMMMMMMMMMMMMMMWXOdc,,,,,,,,;cd0XWMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMNKko:,,,,,,,,;lx0NWMMMMMMMMMNKxl;,,,,,,,,:okKWMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOdc,,,,,,,,,cdOXWMMWXOdc,,,,,,,,,cdOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKko:,,,,,,,,;lddl;,,,,,,,,;lkKNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOdc,,,,,,,,,,,,,,,,cdOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKkl;,,,,,,,,;lx0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOdc;;cdOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNXXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
			\ ]

let g:startify_lists = [
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ ]
hi StartifyHeader guifg=#FFD700

"--------------Searching--------------"
set hlsearch
set incsearch
set rtp+=/usr/local/opt/fzf

"--------------NERDTree--------------"
let NERDTreeShowHidden = 1
let NERDTReeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" Auto close NERDTree if it is the last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

"--------------Split Management--------------"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------------vim_devicons--------------"
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '

"--------------coc-prettier--------------"
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"--------------autopairs--------------"
"let g:AutoPairsFlyMode = 1

"--------------Vim_Javascript--------------"
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1

"--------------Syntastic--------------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
"let g:syntastic_vue_eslint_exec = './node_modules/.bin/eslint'

let g:syntastic_error_symbol = '😡'
let g:syntastic_style_error_symbol = '🤬'
let g:syntastic_warning_symbol = '🤧'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Disable inherited syntastic
let g:syntastic_mode_map = {
			\ "mode": "passive",
			\ "active_filetypes": [],
			\ "passive_filetypes": [] }

"--------------ALE--------------"
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '🤧'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow


"Shamelessly copy from author with credit ^_^
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftdetect file
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Whether the .jsx extension is required.
if !exists('g:jsx_ext_required')
  let g:jsx_ext_required = 0
endif

" Whether the @jsx pragma is required.
if !exists('g:jsx_pragma_required')
  let g:jsx_pragma_required = 0
endif

let s:jsx_pragma_pattern = '\%^\_s*\/\*\*\%(\_.\%(\*\/\)\@!\)*@jsx\_.\{-}\*\/'

" Whether to set the JSX filetype on *.js files.
fu! <SID>EnableJSX()
  if g:jsx_pragma_required && !exists('b:jsx_ext_found')
    " Look for the @jsx pragma.  It must be included in a docblock comment
    " before anything else in the file (except whitespace).
    let b:jsx_pragma_found = search(s:jsx_pragma_pattern, 'npw')
  endif

  if g:jsx_pragma_required && !b:jsx_pragma_found | return 0 | endif
  if g:jsx_ext_required && !exists('b:jsx_ext_found') | return 0 | endif
  return 1
endfu

autocmd BufNewFile,BufRead *.jsx let b:jsx_ext_found = 1
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.js
  \ if <SID>EnableJSX() | set filetype=javascript.jsx | endif

"-------------Auto-Commands-------------
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
