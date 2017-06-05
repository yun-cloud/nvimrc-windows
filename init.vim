call plug#begin()
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/vimgrep.vim'

" highlight the paragraph that cursor on
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" base16 colorscheme
Plug 'chriskempson/base16-vim'
" status line
Plug 'itchyny/lightline.vim'
" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" auto closing
Plug 'cohama/lexima.vim'
" quickly find, substitute, abbreviate
Plug 'tpope/vim-abolish'

"""""""""""""
"  snippet  "
"""""""""""""
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"""""""""""""""""
"  text object  "
"""""""""""""""""
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'


"""""""""
"  Git  "
"""""""""
"Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

filetype on
filetype plugin on
filetype indent on

set autoindent
" manually setting this on certain filetype if the default indentation is bad
"set smartindent
set smarttab
"set noexpandtab
"set shiftwidth=4
"set tabstop=4
set expandtab shiftwidth=4 softtabstop=4

autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=8
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=4 softtabstop=4

set number
set relativenumber
set showmatch
set cursorline
set smartcase
set ignorecase
set splitbelow
set cmdheight=1
set clipboard+=unnamedplus
set background=dark
set t_ut=256

" ignore files, dirs. (Also see nerdtree, ctrlp)
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*\\.git\\*
set wildignore+=*\\node_modules\\*


" show invisible characters by special symbol
set list
"set listchars=tab:»\ ,trail:·,precedes:<,extends:>
set listchars=tab:»‥,trail:·,precedes:<,extends:>

colo desert
colo base16-google-dark
set background=dark

let g:python_host_prog  = 'C:\Python27\python2.exe'
let g:python3_host_prog = 'C:\Program Files (x86)\Python36-32\python3.exe'

" leader key
let mapleader = "\<SPACE>"
nnoremap <Space> <Nop>

" exit insert mode by spamming jk
inoremap jk <ESC>

" swap keybinding ; :
nnoremap ; :
nnoremap : ;
xnoremap ; :
xnoremap : ;

" enter for reload file and clear hlsearch
"nnoremap <CR> <CR>:e<CR>:noh<CR>

" quickfix list
nnoremap <Leader>cc :cc<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
nnoremap <Leader>cw :cw 10<CR>
nnoremap <Leader>cx :cclose<CR>
" location list
nnoremap <Leader>ll :ll<CR>
nnoremap <Leader>ln :lne<CR>
nnoremap <Leader>lp :lp<CR>
nnoremap <Leader>lw :lw 10<CR>
nnoremap <Leader>lx :lclose<CR>

" tab navigation
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

" === spacemacs style key-bindings ===
nnoremap <Leader><TAB> <C-^>
nnoremap <Leader>sc :noh<CR>
" vimrc file
nnoremap <Leader>fed :e $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>
" format indent
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
nnoremap <Leader>wm :only<cr>
nnoremap <Leader>wc :bd<cr>

" remove trailing whitespace
nnoremap <silent> <Leader>rtw :%s/\s\+$//e<CR>:noh<CR>''

nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

function! ToggleMovement(firstOp, thenOp)
    let pos = getpos('.')
    execute "normal! " . a:firstOp
    if pos == getpos('.')
        execute "normal! " . a:thenOp
    endif
endfunction

" ==============================
" ==============================
" ===                        ===
" ===  Plugin Configuration  ===
" ===                        ===
" ==============================
" ==============================

" === vim-easy-align ===
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" === nerdtree ===
let NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore=['\~$', 'vendor', 'node_modules']
nnoremap <Leader>x :NERDTreeToggle<CR>

" === vim-commentary ===
nmap <Leader>;  <Plug>Commentary
omap <Leader>;  <Plug>Commentary
vmap <Leader>;  <Plug>Commentary
nmap <Leader>;; <Plug>CommentaryLine

" === vim-closetag ===
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" === Goyo ===
let g:goyo_width = '85%'
let g:goyo_height = '85%'

" === limelight ===
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span=0
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" === deoplete ===
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
set completeopt-=noinsert
set completeopt-=preview
autocmd CompleteDone * pclose!

" === ultisnips ===
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" === ctrlp ===
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'node': 'node_modules',
            \ }
nnoremap <Leader>bb :CtrlPBuffer<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>pf :CtrlPRoot<CR>

" === fugitive ===
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

" === gitgutter ===
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
nmap <silent> ]c :call NextHunkAllBuffers()<CR>
nmap <silent> [c :call PrevHunkAllBuffers()<CR>
" Cycle through hunks in all buffers
function! NextHunkAllBuffers()
    let line = line('.')
    GitGutterNextHunk
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
            return
        endif
    endwhile
endfunction

function! PrevHunkAllBuffers()
    let line = line('.')
    GitGutterPrevHunk
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
            return
        endif
    endwhile
endfunction


" === lightline ===
let g:lightline = {
            \ 'colorscheme': 'solarized',
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

"vim:set et sw=4 ts=8 tw=78:
