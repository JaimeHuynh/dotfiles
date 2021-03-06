set nocompatible                      "We want the latest vim settings/options, it must be first because it changes other options as a side effect

" Initialisation de pathogen
" call pathogen#infect()
" call pathogen#helptags()

" moving to vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
endif
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'APZelos/blamer.nvim'
Plug 'dense-analysis/ale'

Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chr4/nginx.vim'
Plug 'joshdick/onedark.vim'
Plug 'alunny/pegjs-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ervandew/supertab'
" Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'jidn/vim-dbml'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'johngrib/vim-game-code-break'
Plug 'airblade/vim-gitgutter'
Plug 'thaerkh/vim-indentguides'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/vim-jsx-improve'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars'
Plug 'moll/vim-node'
Plug 'vim-ruby/vim-ruby'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'liuchengxu/vista.vim'
Plug 'pearofducks/ansible-vim'

Plug 'altercation/vim-colors-solarized'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"-------------COMMENTARY-------------"
autocmd FileType apache setlocal commentstring=#\ %s

"-------------COMMON_SETTING-------------"
filetype indent on                    " Detect files type
filetype plugin on                    " Detect files type
set backspace=indent,eol,start        " Make backspace behave like every other editor
set t_Co=256                          " use 256 colors.
syntax on                             " Enable syntax highlighting
syntax enable
set autoread                          " Read open files again when changed outside Vim
set autowrite                         " Write a modified buffer on each :next , ...
set history=200                       " Keep 200 lines of command line history
set incsearch                         " Find the next match as we type the search
set hlsearch                          " Highlight searches by default
set ignorecase                        " Ignore case when searching...
set smartcase                         " ...unless we type a capital
set listchars=""                      " Empty the listchars
set listchars=tab:>.                  " A tab will be displayed as >...
set listchars+=trail:.                " Trailing white spaces will be displayed as .
set nobackup                          " Don't constantly write backup files
set noswapfile                        " Ain't nobody got time for swap files
set noerrorbells                      " Don't beep
" set nowrap                            " Do not wrap lines
set showcmd                           " Display incomplete commands in the bottom line of the screen
set visualbell                        " Visual bell instead of beeping
set laststatus=2                      " Always display the status line
set encoding=UTF-8
set clipboard=unnamed
set splitright
set splitbelow
set autoindent
set si                                "smart indent
set hidden
" set shell=bash
" set conceallevel=0                  "Concealing Characters
" set autowriteall                      " Automatically write the file when switching buffer

"-------------AUTOCOMPLETE-------------"
set omnifunc=syntaxcomplete#Complete
let mapleader=','                   " The default leader is \, but a comma is much better
set number                            " Let's active line number
set relativenumber                    " look to your left screen
set complete=.,w,b,u                  " Set our desired autocompletion matching"

" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType vim setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType sh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType zsh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType pegjs setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
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

au FileType gitconfig setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"-------------VIM_VUE-------------"
let g:vue_pre_processors = ['scss']
let g:vue_pre_processors = 'detect_on_enter'
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
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"Make it easy to edit the vimrc file.

"-------------Mapping-------------"
nnoremap <Leader>ev :tabedit $HOME/.vimrc<cr>
" Add simple hightlight removal
nmap <ESC><ESC> :nohlsearch<cr>
" nnoremap <Leader>qq :bd<CR>
nnoremap <C-o> :tabedit<cr>:NERDTreeToggle<cr>
map <C-n> :NERDTreeToggle<cr>
map <Leader>ww :w!<cr>
nmap <C-x> :quit<cr>

" Mapping for managing tab
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tt :tabnext<cr>
map <leader>tp :tabprevious<cr>

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

" move a line up/down
" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
vnoremap $< <esc>`>a><esc>`<i<<esc>

" Buffer management
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Next/Previous between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

nnoremap <CR> G
" Open terminal
nnoremap <Leader>at :call OpenFloatTerm()<CR>
" Open node REPL
nnoremap <Leader>an :call OpenFloatTerm('"node"')<CR>
" Open tig, yes TIG, A FLOATING TIGGGG!!!!!!
nnoremap <Leader>ag :call OpenFloatTerm('"tig"')<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
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
let g:blamer_prefix = ' '

"joshdick/onedark.vim
" set background=dark
colorscheme onedark
if has("nvim")
  set termguicolors
endif
" hi Comment guifg=#808080
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set cursorline                                  "highlight current line
set title
autocmd BufWritePre * %s/\s\+$//e               "Auto remove trailing space

" Don't redraw while executing macros (good performance config)
set lazyredraw

"--------------vim_airline/vim_airline_themes--------------"
let g:airline_theme='night_owl' " onedark
let g:airline_powerline_fonts = 1

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
" You must define the dictionary first before setting values.
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.dirty='⚡'

"--------------vim_airline/vim_airline--------------"
let g:airline#extensions#tabline#enabled = 1

" airline-ale
" ale error_symbol
let airline#extensions#ale#error_symbol = 'E:'

" ale warning
let airline#extensions#ale#warning_symbol = 'W:'

" ale show_line_numbers
let airline#extensions#ale#show_line_numbers = 1

" ale open_lnum_symbol
let airline#extensions#ale#open_lnum_symbol = '(L'

" ale close_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ')'

"--------------Mouse--------------"
if has('mouse')
  set mouse=a
endif

" mhinz/vim-startify

let g:startify_custom_header = startify#center([
      \ '$$\   $$\ $$\   $$\  $$$$$$\   $$$$$$\        $$\   $$\ $$\   $$\ $$\     $$\ $$\   $$\ $$\   $$\',
      \ '$$ | $$  |$$ |  $$ |$$  __$$\ $$  __$$\       $$ |  $$ |$$ |  $$ |\$$\   $$  |$$$\  $$ |$$ |  $$ |',
      \ '$$ |$$  / $$ |  $$ |$$ /  $$ |$$ /  $$ |      $$ |  $$ |$$ |  $$ | \$$\ $$  / $$$$\ $$ |$$ |  $$ |',
      \ '$$$$$  /  $$$$$$$$ |$$ |  $$ |$$$$$$$$ |      $$$$$$$$ |$$ |  $$ |  \$$$$  /  $$ $$\$$ |$$$$$$$$ |',
      \ '$$  $$<   $$  __$$ |$$ |  $$ |$$  __$$ |      $$  __$$ |$$ |  $$ |   \$$  /   $$ \$$$$ |$$  __$$ |',
      \ '$$ |\$$\  $$ |  $$ |$$ |  $$ |$$ |  $$ |      $$ |  $$ |$$ |  $$ |    $$ |    $$ |\$$$ |$$ |  $$ |',
      \ '$$ | \$$\ $$ |  $$ | $$$$$$  |$$ |  $$ |      $$ |  $$ |\$$$$$$  |    $$ |    $$ | \$$ |$$ |  $$ |',
      \ '\__|  \__|\__|  \__| \______/ \__|  \__|      \__|  \__| \______/     \__|    \__|  \__|\__|  \__|',
      \ '                                                                                                  ',
      \ ])
      " \  '__    __',
      " \ '/  |  /  |',
      " \ '$$ |  $$ |  ______    ______    ______   __    __',
      " \ '$$ |__$$ | /      \  /      \  /      \ /  |  /  |',
      " \ '$$    $$ | $$$$$$  |/$$$$$$  |/$$$$$$  |$$ |  $$ |',
      " \ '$$$$$$$$ | /    $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |',
      " \ '$$ |  $$ |/$$$$$$$ |$$ |__$$ |$$ |__$$ |$$ \__$$ |',
      " \ '$$ |  $$ |$$    $$ |$$    $$/ $$    $$/ $$    $$ |',
      " \ '$$/   $$/  $$$$$$$/ $$$$$$$/  $$$$$$$/   $$$$$$$ |',
      " \ '                    $$ |      $$ |      /  \__$$ |',
      " \ '                    $$ |      $$ |      $$    $$/',
      " \ '                    $$/       $$/        $$$$$$/',
      " \  '__    __                                __      __',
      " \ '/  \  /  |                              /  \    /  |',
      " \ '$$  \ $$ |  ______   __   __   __       $$  \  /$$/   ______    ______    ______',
      " \ '$$$  \$$ | /      \ /  | /  | /  |       $$  \/$$/   /      \  /      \  /      \',
      " \ '$$$$  $$ |/$$$$$$  |$$ | $$ | $$ |        $$  $$/   /$$$$$$  | $$$$$$  |/$$$$$$  |',
      " \ '$$ $$ $$ |$$    $$ |$$ | $$ | $$ |         $$$$/    $$    $$ | /    $$ |$$ |  $$/',
      " \ '$$ |$$$$ |$$$$$$$$/ $$ \_$$ \_$$ |          $$ |    $$$$$$$$/ /$$$$$$$ |$$ |',
      " \ '$$ | $$$ |$$       |$$   $$   $$/           $$ |    $$       |$$    $$ |$$ |',
      " \ '$$/   $$/  $$$$$$$/  $$$$$/$$$$/            $$/      $$$$$$$/  $$$$$$$/ $$/',
      " \ ])

" let g:startify_custom_header = startify#center([
"       \ ' #    #                      ',
"       \ ' #   #  #    #  ####    ##    ',
"       \ ' #  #   #    # #    #  #  #   ',
"       \ ' ###    ###### #    # #    #  ',
"       \ ' #  #   #    # #    # ######  ',
"       \ ' #   #  #    # #    # #    #  ',
"       \ ' #    # #    #  ####  #    #  ',
"       \ '                              ',
"       \ ' #     #                             ',
"       \ ' #     # #    # #   # #    # #    #  ',
"       \ ' #     # #    #  # #  ##   # #    #  ',
"       \ ' ####### #    #   #   # #  # ######  ',
"       \ ' #     # #    #   #   #  # # #    #  ',
"       \ ' #     # #    #   #   #   ## #    #  ',
"       \ ' #     #  ####    #   #    # #    # ',
"       \ ])

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

" let g:startify_custom_header=[
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0kkOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKkdlc:::ldkKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0xoc::::::::::cox0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKkdlc::::::cllc:::::::ldOKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0xoc:::::::ldkKXXKkdl:::::::cox0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKOdlc::::::coxOXWMMMMMMWXOxoc::::::cldOKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMWX0koc:::::::ldkKNWMMMMMMMMMMMMWNKkdl:::::::cok0XWMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMNKOdlc::::::coxOXWMMMMMMMMMMMMMMMMMMMWNXOxoc::::::cldOKNMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMWN0koc:::::::ldk0NWMMMMMMMMMMMMMMMMMMMMMMMMMMWN0kdl:::::::cd0WMMWWNNNWMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMWNXOxlc::::::clxOXWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOxlc:::lkXWX0kdooodx0XWMMMMMMMM ',
" 			\ ' MMMMMMMMMMMWN0kdl:::::::cok0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWN0kod0WNOoc::::::::oONMMMMMMM ',
" 			\ ' MMMMMMMMWXOxoc::::::clxOKNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNWNkc::cokOkdc::ckNMMMMMM ',
" 			\ ' MMMMMMMMXd:::::::cok0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKo:::dXWMMXd:::oKMMMMMM ',
" 			\ ' MMMMMMMMKo::::cdOKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXd:::o0WWWKo:::oXMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNxc:::ldxdl:::lOWMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0dc::::::::::lxKWMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0dc:::lxOkxxxk0XWMMMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNOoc::clkXWMMWWWWNKKNMMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkoc::cokXWMMMMKdlc:;c0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkoc::coONWMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxl:::cd0NMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKxl:::cd0NMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0dc:::lxKWMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKKKKKXWWWNOdc:::lxKWMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMMWNOdlcccccldkkoc:::lkXWMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMMW0oc:::cccc::::::coOXWMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::lKMMMMMMMMMMMMMMMMMMMMMMMMMMMKo:::oO0KK0dc:::lONWMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::l0MMMMMMMMMMMMMMMMMMMMMMMMMMWOc::cOWMMMMKo:::xNMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMKo::::oKMMMMMMMMMMMMMMMMMMMMWNXKOkxl::::o0KXXKxc::ckWMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMXxxkO0KNMMMMMMMMMMMMMWNXK0Oxdolc:::::::::ccllc:::cxNMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMWWWNXXKXNWMMMMMWNX0Okxolcc:::::ccodxkOkolc::::cox0NMMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMMNKkdlcccldk00kxdocc::::::cloxkO0XNWWMMMNX00000KNWMMMMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMMXxc::::cc::::::::::clodxO0KXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0:,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMNxc::cx0K0xc:::coxkOKXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXx;,,,,:0MMMMMMMM ',
" 			\ ' MMMMMMKo:::xNMMMXd:::oKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKko:,,,,,::0MMMMMMMM ',
" 			\ ' MMMMMMXd:::oOXNXOl:::dXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWN0xl;,,,,,,,,:xXMMMMMMMM ',
" 			\ ' MMMMMMWKo:::clolc::coKWWXOKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKko:,,,,,,,,;lx0NWMMMMMMMMM ',
" 			\ ' MMMMMMMWXkol:::::coOXWW0c,;lx0NWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWN0xl;,,,,,,,,:okKWMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMNX0OOO0XNWMXd;,,,,,,:okKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkd:,,,,,,,,;lx0NWMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMXko:,,,,,,,,;lx0NWMMMMMMMMMMMMMMMMMMMMMMWN0xl;,,,,,,,,:okKWMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMWX0dc;,,,,,,,,:dOXWMMMMMMMMMMMMMMMMWXOdc,,,,,,,,;cd0XWMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMNKko:,,,,,,,,;lx0NWMMMMMMMMMNKxl;,,,,,,,,:okKWMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOdc,,,,,,,,,cdOXWMMWXOdc,,,,,,,,,cdOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKko:,,,,,,,,;lddl;,,,,,,,,;lkKNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOdc,,,,,,,,,,,,,,,,cdOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKkl;,,,,,,,,;lx0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOdc;;cdOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNXXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ' MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ',
" 			\ ]

" let g:startify_lists = [
"       \ { 'type': 'sessions',  'header': ['   Sessions']       },
"       \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"       \ { 'type': 'commands',  'header': ['   Commands']       },
"       \ ]

" highlight StartifyBracket ctermfg=240
" highlight StartifyFooter  ctermfg=240
" highlight StartifyHeader  ctermfg=114
" highlight StartifyNumber  ctermfg=215
" highlight StartifyPath    ctermfg=245
" highlight StartifySlash   ctermfg=240
" highlight StartifySpecial ctermfg=240

"--------------Searching--------------"

" set rtp+=/usr/local/opt/fzf

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
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1
if has('macunix')
  let g:WebDevIconsOS = 'Darwin'
endif
"--------------coc-prettier--------------"

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"--------------autopairs--------------"
"let g:AutoPairsFlyMode = 1

"--------------Vim_Javascript--------------"
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1

"--------------ALE--------------"
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '🤧'
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \}

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Ansible
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'b'
" let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_with_keywords_highlight = 'Constant'
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

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

"-------------editor_config-------------
" play nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"-------------Auto-Commands-------------
"Automatically source the Vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

" Folding cheat sheet
" zR    open all folds
" zM    close all folds
" za    toggle folds at cursor position
" zj    move down to start of next fold
" zk    move up to end of previous fold
