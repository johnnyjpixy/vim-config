" File: .vimrc
" Author: Johnny P Jing <johnny@jpixy.com>
"
" How I configure Vim :P
"

" Gotta be first
" set nocompatible

" filetype off

call plug#begin('~/.vim/vimplugged')

" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" ----- Making Vim look good ------------------------------------------
" Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'

" ----- Vim as a programmer's text editor -----------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/a.vim'

" ----- Go for VIM ---------------------------------------------------
Plug 'fatih/vim-go'

Plug 'unite.vim'
Plug 'ctags.vim'
Plug 'taglist-plus'

" ----- Working with Git ----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plug 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plug 'jez/vim-superman'
Plug 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'

" ----- Ohters --------------------------------------------------------
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'


" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

" Add plugins to &runtimepath
call plug#end()



" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
" set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
" colorscheme solarized
colorscheme murphy
" colorscheme torte
" colorscheme slate


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click 
"Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1


" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>nt :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
" nmap <silent> <leader>l :TagbarToggle<CR>
nmap <F9> :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --------neocomplete -----------
let g:neocomplete#enable_at_startup = 1



"---------- Tag list -------------
"let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close = 1 
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Use_Right_Window = 1 "let taglist show on right side"


"------------for vim-go------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofmt"
let g:go_fmt_fail_silently = 1
"let g:go_fmt_autosave = 0


au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>in <Plug>(go-install)

au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>s <Plug>(go-implements)

