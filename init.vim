" # Pluggins (managed by vim-plug) {{{1
call plug#begin()

Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/VisIncr'
Plug 'szw/vim-smartclose'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'chemzqm/unite-location'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'qpkorr/vim-bufkill'
Plug 'xolox/vim-session'

" Autocomplete {{{2
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
" Snippets {{{2
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Git {{{2
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'

" Colorscheme, Highlihgting {{{2
Plug 'chriskempson/base16-vim'
Plug 'ajmwagar/vim-deus'
Plug 'joshdick/onedark.vim'

" Highlihgting {{{2
Plug 'sheerun/vim-polyglot'

" Statusline {{{2
Plug 'itchyny/lightline.vim'

" End Plug Settings {{{2
" }}}
call plug#end()

" # Configuration {{{1
" ## Indentation {{{2
set autoindent
set smarttab
set expandtab shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=8
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript,json setlocal expandtab shiftwidth=2 softtabstop=2

" Configs {{{2
filetype on
filetype plugin on
filetype indent on
set number
set relativenumber
set nowrap
set showmatch
set cursorline
set smartcase
set ignorecase
set splitbelow
set modeline
set modelines=5
set cmdheight=1
set clipboard+=unnamedplus
set list
"set listchars=tab:»\ ,trail:·,precedes:<,extends:>
set listchars=tab:»‥,trail:·,precedes:<,extends:>
let g:python_host_prog  = 'C:\Python27\python2.exe'
let g:python3_host_prog = 'C:\Program Files (x86)\Python36-32\python3.exe'

" Ignore files, dirs. (See also nerdtree, ctrlp) {{{2
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*\\.git\\*
set wildignore+=*\\node_modules\\*

" Colorscheme {{{2
set background=dark
set t_ut=256
colorscheme desert
colorscheme base16-google-dark
colorscheme deus
colorscheme onedark

" # Mapping {{{1
" Leader key {{{2
let mapleader = "\<SPACE>"
nnoremap <Space> <Nop>

" Habbit {{{2
inoremap jk <ESC>
inoremap kj <ESC>

" swap keybinding ; :
nnoremap ; :
nnoremap : ;
xnoremap ; :
xnoremap : ;

nnoremap j gj
nnoremap k gk

" enter for reload file and clear hlsearch
"nnoremap <CR> <CR>:e<CR>:noh<CR>

" toggle mapping {{{2
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>
function! ToggleMovement(firstOp, thenOp)
    let pos = getpos('.')
    execute "normal! " . a:firstOp
    if pos == getpos('.')
        execute "normal! " . a:thenOp
    endif
endfunction

" Quickfix and Location list {{{2
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

" Tab navigation {{{2
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

" Spacemacs style key-bindings {{{2
nnoremap <Leader><TAB> <C-^>
nnoremap <Leader>sc :noh<CR>
" bd by [vim-bufkill]
" nnoremap <Leader>bd :bd<CR>

" vimrc file
nnoremap <Leader>fed :e $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>

" format indent, switch to autoformat
"nnoremap <Leader>j= mogg=G`ozz

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


" # Pluggin Settings {{{1
" ## [vim-easy-align] {{{2
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ## [vim-autoformat] {{{2
nnoremap <Leader>j= :Autoformat<CR>

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
let NERDTreeShowBookmarks=1
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
" options {{{3
call denite#custom#option('default', 'prompt', '> ')
call denite#custom#option('default', 'empty', 0)
call denite#custom#option('default', 'auto_resize', 1)
call denite#custom#option('default', 'winheight', 12)
call denite#custom#option('default', 'winminheight', 5)
" mapping in denite {{{3
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
call denite#custom#map('normal', '<Tab>', '<denite:toggle_select_down>',             'noremap')
" coustomization {{{3
call denite#custom#var('buffer', 'date_format', '')
call denite#custom#var('file_rec', 'command',
            \ ['pt', '--follow', '--nocolor', '--nogroup',
            \  (has('win32') ? '-g:' : '-g='), ''])
" menu {{{3
let s:menus={}
" nvim {{{4
let s:menus.nvim = {
            \ 'description': 'Edit your nvim config file'
            \ }
let s:menus.nvim.file_candidates = [
            \ ['init.vim', '~/.config/nvim/init.vim'],
            \ ['ginit.vim', '~/.config/nvim/ginit.vim'],
            \ ]
" jshint {{{4
let s:menus.jshint = {'description': 'Configuration the jshint rules.'}
let s:menus.jshint.file_candidates = [
            \ ['jshintrc', '~/.jshintrc']
            \]
" colorscheme {{{4
let s:menus.Colorscheme = {'description': 'Change the colorscheme.'}
let s:menus.Colorscheme.command_candidates = [
            \ ['deus',                  'colorscheme deus'],
            \ ['onedark',               'colorscheme onedark'],
            \ ['base16-google-dark',    'colorscheme base16-google-dark'],
            \ ['base16-solarized-dark', 'colorscheme base16-solarized-dark'],
            \ ['base16-spacemacs',      'colorscheme base16-spacemacs'],
            \ ]
call denite#custom#var('menu', 'menus', s:menus)
" mapping {{{3
nnoremap <silent> <Leader>um :Denite -mode=normal menu<CR>
nnoremap <silent> <Leader>uh :Denite help<CR>
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

" ## [deoplete-ternjs] {{{2
" Use deoplete.
let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]
" ## [ctrlp] {{{2
let g:ctrlp_max_files = 500
let g:ctrlp_max_depth = 5
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'node': 'node_modules',
            \ }
"nnoremap <Leader>bb :CtrlPBuffer<CR>
"nnoremap <Leader>fr :CtrlPMRU<CR>
"nnoremap <Leader>pf :CtrlPRoot<CR>

" ## [ultisnips] {{{2
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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

" ## [fugitive] {{{2
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
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
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
omap ic <Plug>GhtGutterTextObjectInnerPending
omap ac <Plug>GitGutterTextObjectOuterPending
xmap ic <Plug>GitGutterTextObjectInnerVisual
xmap ac <Plug>GitGutterTextObjectOuterVisual
" nmap <silent> ]c :call NextHunkAllBuffers()<CR>
" nmap <silent> [c :call PrevHunkAllBuffers()<CR>
" Cycle through hunks in all buffers {{{3
function! NextHunkAllBuffers()
    let line = line('.')
    GitGutterNextHunk
    GitGutterPreviewHunk
    if line('.') != line
        return
    endif

    let bufnr = bufnr('')
    while 1
        bnext
        if bufnr('') == bufnr
            return
        endif
        if !empty(GitGutterGetHunks())
            normal! 1G
            GitGutterNextHunk
            GitGutterPreviewHunk
            return
        endif
    endwhile
endfunction

function! PrevHunkAllBuffers()
    let line = line('.')
    GitGutterPrevHunk
    GitGutterPreviewHunk
    if line('.') != line
        return
    endif

    let bufnr = bufnr('')
    while 1
        bprevious
        if bufnr('') == bufnr
            return
        endif
        if !empty(GitGutterGetHunks())
            normal! G
            GitGutterPrevHunk
            GitGutterPreviewHunk
            return
        endif
    endwhile
endfunction

" ## [lightline] {{{2
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'mode_map': { 'c': 'NORMAL' },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'modified': 'LightlineModified',
            \   'readonly': 'LightlineReadonly',
            \   'fugitive': 'LightlineFugitive',
            \   'filename': 'LightlineFilename',
            \   'fileformat': 'LightlineFileformat',
            \   'filetype': 'LightlineFiletype',
            \   'fileencoding': 'LightlineFileencoding',
            \   'mode': 'lightline#mode',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" # Modeline {{{1
" vim: set foldmethod=marker foldlevel=1 et sw=4 ts=8 tw=78 :
