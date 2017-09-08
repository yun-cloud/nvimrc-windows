" === Plugins === {{{1
call plug#begin()
" Misc {{{2
Plug 'Shougo/echodoc.vim'
Plug 'mhinz/vim-startify'
Plug 'szw/vim-smartclose'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

" Utils {{{2
Plug 'vim-scripts/VisIncr'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-abolish'

" Text Object {{{2
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" File Tree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Denite {{{2
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'chemzqm/unite-location'

" Autocomplete {{{2
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'

" Snippets {{{2
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Git {{{2
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'

" Colorscheme, Highlihgting {{{2
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'

" Highlihgting {{{2
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'

" Programming Language {{{2
" Javascript {{{3
Plug 'pangloss/vim-javascript'

" Rust {{{3
Plug 'rust-lang/rust.vim'

" Statusline {{{2
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" glyph(icon) {{{2
" Need to be loaded after [nerdtree], [startify], [airline], [denite], etc.
Plug 'ryanoasis/vim-devicons'

" ## END }}}2
call plug#end()

" === Configuration === {{{1
" ## Configs {{{2
filetype on
filetype plugin on
filetype indent on

set number
" set relativenumber
set nowrap
set showmatch
set noshowmode
set cursorline
set smartcase
set ignorecase
set splitbelow
set modeline
set modelines=5
set cmdheight=1
set laststatus=2
set clipboard+=unnamedplus
set encoding=utf8
set list
"set listchars=tab:»\ ,trail:·,precedes:<,extends:>
set listchars=tab:»‥,trail:·,precedes:<,extends:>
if executable('rg')
    set grepprg=rg\ --color=never
endif
let g:python_host_prog  = 'C:\Python27\python2.exe'
let g:python3_host_prog = 'C:\Program Files (x86)\Python36-32\python3.exe'

" ## Indentation {{{2
set autoindent
set smartindent
set smarttab
set expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=8
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2

" ## Ignore files, dirs. (See also nerdtree) {{{2
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*\\.git\\*
set wildignore+=*\\node_modules\\*

" ## Colorscheme {{{2
set background=dark
set t_ut=256
" colorscheme desert
" colorscheme base16-google-dark
" colorscheme onedark
colorscheme gruvbox

" }}}

" === Mapping === {{{1
" ## Leader key {{{2
let mapleader = "\<SPACE>"
nnoremap <Space> <Nop>

" ## Habbit {{{2
inoremap jk <ESC>
inoremap kj <ESC>
inoremap j; <ESC>:

" swap keybinding ; :
nnoremap ; :
nnoremap : ;
xnoremap ; :
xnoremap : ;

nnoremap j gj
nnoremap k gk

" enter for reload file and clear hlsearch
"nnoremap <CR> <CR>:e<CR>:noh<CR>

" ## toggle mapping {{{2
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>
function! ToggleMovement(firstOp, thenOp)
    let pos = getpos('.')
    execute "normal! " . a:firstOp
    if pos == getpos('.')
        execute "normal! " . a:thenOp
    endif
endfunction

" ## Quickfix and Location list {{{2
nnoremap <Leader>cc :cc<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
nnoremap <Leader>cw :cw 10<CR>
nnoremap <Leader>cx :cclose<CR>
nmap [q :cp<CR>
nmap ]q :cn<CR>
nmap [Q :cfirst<CR>
nmap ]Q :clast<CR>
nnoremap <Leader>ll :ll<CR>
nnoremap <Leader>ln :lne<CR>
nnoremap <Leader>lp :lp<CR>
nnoremap <Leader>lw :lw 10<CR>
nnoremap <Leader>lx :lclose<CR>

" ## Tab navigation {{{2
nnoremap <A-1>  1gt
nnoremap <A-2>  2gt
nnoremap <A-3>  3gt
nnoremap <A-4>  4gt
nnoremap <A-5>  5gt
nnoremap <A-6>  6gt
nnoremap <A-7>  7gt
nnoremap <A-8>  8gt
nnoremap <A-9>  9gt
nnoremap <A-0> 10gt

" ## Spacemacs style key-bindings {{{2
nnoremap <Leader><TAB> <C-^>
nnoremap <Leader>sc :noh<CR>
" bd by [vim-bufkill]
" nnoremap <Leader>bd :bd<CR>

" vimrc file
nnoremap <Leader>fed :e $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>

" format indent, switch to autoformat
nnoremap <Leader>j= mogg=G`ozz

" window navigation
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wl <C-W>l
nnoremap <Leader>ww <C-W><C-W>
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v
nnoremap <Leader>w= <C-W>=
nnoremap <Leader>wm :only<CR>
" wc

" remove trailing whitespace
nnoremap <silent> <Leader>rtw :%s/\s\+$//e<CR>:noh<CR>''

"}}}

" === Pluggin Settings === {{{1
" ## [vim-easy-align] {{{2
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ## [ale] {{{2
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '×'
"let g:ale_sign_warning = '⚠'
let g:ale_linters = {
            \   'javascript': ['standard'],
            \}
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

" ## [nerdtree] {{{2
" let NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore=[
            \ '\~$',
            \ '^node_modules$[[dir]]'
            \ ]
nnoremap <Leader>ft :NERDTreeToggle<CR>

" ## [vim-commentary] {{{2
nmap <Leader>;  <Plug>Commentary
omap <Leader>;  <Plug>Commentary
vmap <Leader>;  <Plug>Commentary
nmap <Leader>;; <Plug>CommentaryLine

" ## [vim-closetag] {{{2
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" ## [smartclose] {{{2
let g:smartclose_set_default_mapping = 0
let g:smartclose_delay = 1
nnoremap <silent><Leader>wc :SmartClose<cr>

" ## [goyo.vim] {{{2
"let g:goyo_width = '85%'
"let g:goyo_height = '85%'

" ## [limelight] {{{2
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span=0
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ## [denite] {{{2
" denite-options
call denite#custom#option('default', 'prompt', '> ')
call denite#custom#option('default', 'empty', 0)
call denite#custom#option('default', 'auto_resize', 1)
call denite#custom#option('default', 'winheight', 12)
call denite#custom#option('default', 'winminheight', 5)
" denite-interfaceMapping
call denite#custom#map('insert', '<C-a>', '<denite:move_caret_to_head>',           'noremap')
call denite#custom#map('insert', '<C-e>', '<denite:move_caret_to_tail>',           'noremap')
call denite#custom#map('insert', '<C-h>', '<denite:move_caret_to_one_word_left>',  'noremap')
call denite#custom#map('insert', '<C-l>', '<denite:move_caret_to_one_word_right>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>',            'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>',        'noremap')
call denite#custom#map('insert', '<C-b>', '<denite:scroll_page_backwards>',        'noremap')
call denite#custom#map('insert', '<C-f>', '<denite:scroll_page_forwards>',         'noremap')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:vsplit>',             'noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>',            'noremap')
call denite#custom#map('insert', '<C-d>', '<denite:do_action:delete>',             'noremap')
call denite#custom#map('normal', '<Tab>', '<denite:toggle_select_down>',           'noremap')
" interface-coustomization
call denite#custom#var('buffer', 'date_format', '')
call denite#custom#var('file_rec', 'command',
            \ ['pt', '--follow', '--nocolor', '--nogroup',
            \  (has('win32') ? '-g:' : '-g='), ''])
" call denite#custom#var('file_rec', 'command',
"             \ ['rg', '--files', '--glob', '!.git', ''])
" denite-menu
let s:menus={}
" dente-menu-nvim
let s:menus.nvim = {
            \ 'description': 'Edit your nvim config file'
            \ }
let s:menus.nvim.file_candidates = [
            \ ['init.vim', '~/.config/nvim/init.vim'],
            \ ['ginit.vim', '~/.config/nvim/ginit.vim'],
            \ ]
let s:menus.nvim.command_candidates = [
            \ [':PlugSnapshot', 'PlugSnapshot ~/.config/nvim/snapshot.vim'],
            \ ]
" denite-menu-guifont
let s:menus.guifont = {
            \ 'description': 'Apply difference font',
            \}
let s:menus.guifont.command_candidates = [
            \ ['Hasklig',  'Guifont! Hasklug\ NF:h16'],
            \ ['Mononoki', 'Guifont! mononoki\ NF:h16'],
            \ ['Hack',     'Guifont! Knack\ NF:h16'],
            \]
" denite-menu-colorscheme
let s:menus.Colorscheme = {'description': 'Change the colorscheme.'}
let s:menus.Colorscheme.command_candidates = [
            \ ['onedark',               'colorscheme onedark'],
            \ ['gruvbox',               'colorscheme gruvbox'],
            \ ['hybrid',                'colorscheme hybrid'],
            \ ['base16-google-dark',    'colorscheme base16-google-dark'],
            \ ['base16-solarized-dark', 'colorscheme base16-solarized-dark'],
            \ ]
call denite#custom#var('menu', 'menus', s:menus)
" denite-Mapping
nnoremap <silent> <Leader>m :Denite menu<CR>
nnoremap <silent> <Leader>h :Denite help<CR>
nnoremap <silent> <Leader>ub :Denite -mode=normal buffer<CR>
nnoremap <silent> <Leader>uu :Denite -resume<CR>
nnoremap <silent> <Leader>uj :Denite -resume -select=+1 -immediately<CR>
nnoremap <silent> <Leader>uk :Denite -resume -select=-1 -immediately<CR>
nnoremap <silent> <Leader>uq :Denite -mode=normal quickfix<CR>
nnoremap <silent> <Leader>ul :Denite -mode=normal location_list<CR>
nnoremap <silent> <Leader>pf :DeniteProjectDir file_rec<CR>
nnoremap <silent> <Leader>ff :Denite file_rec<CR>
nnoremap <silent> <Leader>fr :Denite file_mru<CR>
nnoremap <silent> <Leader>bb :Denite buffer<CR>
nnoremap <silent> <Leader>sl :Denite line<CR>
nnoremap <silent> <Leader>s* :DeniteCursorWord line<CR>
nnoremap <silent> <Leader>U* :DeniteCursorWord line<CR>

" ## [deoplete] {{{2
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
set completeopt-=noinsert
set completeopt-=preview
autocmd CompleteDone * pclose!
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

" ## [neosnippet] {{{2
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)


" ## [vim-bufkill] {{{2
nnoremap <Leader>bd :BD<CR>

" ## [rainbow_parentheses] {{{2
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ## [vim-airline] {{{2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

" ## [fugitive] {{{2
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>

" ## [gitgutter] {{{2
let g:gitgutter_map_keys = 0
" hunk or change
nmap <Leader>ghs <Plug>GitGutterStageHunk
nmap <Leader>ghu <Plug>GitGutterUndoHunk
nmap <Leader>ghp <Plug>GitGutterPreviewHunk
omap ic <Plug>GhtGutterTextObjectInnerPending
omap ac <Plug>GitGutterTextObjectOuterPending
xmap ic <Plug>GitGutterTextObjectInnerVisual
xmap ac <Plug>GitGutterTextObjectOuterVisual
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

" ## [vim-startify] {{{2
let g:startify_list_order = [
            \ ['   Bookmarks'],
            \ 'bookmarks',
            \ ['   MRU files'],
            \ 'files',
            \ ['   MRU directories'],
            \ 'dir',
            \ ['   sessions:'],
            \ 'sessions',
            \ ['   commands:'],
            \ 'commands',
            \ ]
let g:startify_bookmarks = [
            \ {'c': '~/.config/nvim/init.vim'},
            \ {'b1': '~/OneDrive/Documents/Project/GoShare/back-end'},
            \ {'b2': '~/Documents/Project/NthuStage/back-end'},
            \ {'nvim': '~/.config/nvim'},
            \ ]
let g:startify_custom_header =
            \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')
let g:startify_enable_special = 0
let g:startify_files_number = 5
let g:startify_relative_path = 1
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

hi StartifyBracket ctermfg=240 guifg=#585858
hi StartifyFile    ctermfg=147 guifg=#afafff
hi StartifyFooter  ctermfg=240 guifg=#585858
hi StartifyHeader  ctermfg=114 guifg=#87d787
hi StartifyNumber  ctermfg=215 guifg=#ffaf5f
hi StartifyPath    ctermfg=245 guifg=#8a8a8a
hi StartifySlash   ctermfg=240 guifg=#585858
hi StartifySpecial ctermfg=240 guifg=#585858

" }}}

" vim: set foldmethod=marker foldlevel=1 et sw=4 ts=8 tw=78 :
