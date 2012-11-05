



































"**************************************************************************************
"                       MAINTAINED WITH PUPPET
"                       DO NOT EDIT LOCALLY
"**************************************************************************************

























































" Run pathogen for plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()


" Common keypresses that I want to be fast to hit

" Don't bind the leader because other things bind it
" let mapleader = ","

" Open a new split
nnoremap <Space>s :split<CR>

" Move around between splits
nnoremap <Space>h <C-W>h
nnoremap <Space>l <C-W>l
nnoremap <Space>j <C-W>j
nnoremap <Space>k <C-W>k

" Open various panels or whatever
nnoremap <Space>t :TagbarToggle<CR>
nnoremap <Space>a :tabnew<CR>:Ack<Space>
nnoremap <Space>n :tabnew<CR>

" Close all but the current window in the current tab (for dropping stuff like Ack)
nnoremap <Space>q :cclose<CR>:only<CR>
" Close the currrent tab
nnoremap <Space>Q :tabclose<CR>
" Attempt to close the current buffer                                                                                                                                                                                                                                             nnoremap <Space>d :bdelete<CR>
nnoremap <Space>d :bdelete<CR>

" Aligning things in columns on commas (doesn't hit return so we can
" edit the params)
nnoremap <Space>T :Tabularize /,
vnoremap <Space>T :Tabularize /,

" FuzzyFinder
nnoremap <Space>ff :FufCoverageFile<CR>
nnoremap <Space>fb :FufBuffer<CR>
nnoremap <Space>fl :FufLine<CR>
let g:fuf_keyOpen = '<C-o>'
let g:fuf_keyOpenTabpage = '<CR>'

" tab configuration
nnoremap < gT
nnoremap > gt

nnoremap <Space>1 1gt
nnoremap <Space>2 2gt
nnoremap <Space>3 3gt
nnoremap <Space>4 4gt
nnoremap <Space>5 5gt
nnoremap <Space>6 6gt
nnoremap <Space>7 7gt
nnoremap <Space>8 8gt
nnoremap <Space>9 9gt
nnoremap <Space>0 0gt

" Switch to last active tab; from
" http://stackoverflow.com/questions/2119754/switch-to-last-active-tab-in-vim
let g:lasttab = 1
nmap <Space><Space> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Should learn to use this better
nnoremap <Space>u :GundoToggle<CR>

" Mostly unused packages, might want to retry them some day
nnoremap <Space>N :NERDTreeToggle<CR>
nnoremap <Space>r :NERDTreeToggle<CR>

"The important bits:

:filetype indent on
:filetype plugin on
:set autoindent
:set nobackup
"This is the option that allows undo levels.
:set nocompatible
:set noedcompatible
:set expandtab
:set shiftwidth=2
:set smarttab
:syntax on
:set textauto
:set notextmode
:set textwidth=68

" pretty
set t_Co=256
colorscheme desert256
set background=dark

" Makes # style comments do the right thing for some languages.
autocmd FileType sh set comments=:#
autocmd FileType sh set formatoptions=tcroq2

" Quickfix/search (aka Ack results) were unreadable, so:
highlight Search cterm=NONE ctermfg=grey ctermbg=blue

" Tabline customization; more in the MyTabLine function below
highlight TabLine cterm=NONE
highlight TabLineSel ctermfg=Red
highlight TabLineFill cterm=NONE ctermfg=Cyan

" Do or do not break at whitespace
:map <F5> :setlocal linebreak<CR>
:map <F6> :setlocal nolinebreak<CR>

" Spell Check
:map <F7> :setlocal spell spelllang=en_us<CR>
:map <F8> :setlocal nospell<CR>

"Set up a key to toggle paste.
:map <F1> :setl paste<CR>
:map <F2> :setl nopaste<CR>
:imap <F1> <C-O>:setl paste<CR>
:imap <F2> <nop>
:setl pastetoggle=<F2>
:map <F3> :setl wrap<CR>
:map <F4> :setl nowrap<CR>

" Center search results.  This can also be done with a let for
" scrolloff; see http://vim.wikia.com/wiki/VimTip182
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

" Per-language special stuff
autocmd BufReadPost,FileReadPost *.pp setl filetype=puppet
autocmd BufReadPost,FileReadPost *.scm.stx setl syntax=scheme
autocmd BufReadPost,FileReadPost *.scm.stx setl filetype=scheme
autocmd BufReadPost,FileReadPost *.lisp setl lisp
autocmd BufReadPost,FileReadPost *.cl setl lisp

" " Make tab do indentation of the whole line, even in insert mode
" " (and shift-tab unindent)
" vnoremap <C-T> >
" vnoremap <C-D> <LT>
" vmap <Tab> <C-T>
" vmap <S-Tab> <C-D>
" inoremap <Tab> <C-T>
" inoremap <S-Tab> <C-D>

" Stuff that I've reviewed but do not have specific comments about

:set backspace=2
:set history=1024
:set ruler
:set hidden             " very important with NERDTree
:set hlsearch
:set undolevels=10000
:set undodir=/home/tmp/rlpowell/vimundo
:set undofile

" Everything below here has probably not been properly reviewed

:set nodigraph
:set directory=.,~/tmp,/var/tmp,/tmp
:set endofline
:set equalalways
:set equalprg=
:set errorbells
:set errorfile=errors
:set errorformat=\"%f\",%*[^0-9]%l\ %m
:set esckeys
:set exrc
:set nogdefault
:set nographic
:set noicon
:set noignorecase
:set noinsertmode
:set nojoinspaces
:set keywordprg=ref
:set laststatus=1
:set nolist
:set magic
:set makeprg=make
:set maxmem=1024
:set maxmemtot=4096
:set modeline
:set modelines=5
:set more
:set nonumber
:set paragraphs=IPLPPPQPP\ LIpplpipbp
:set nopaste
:set patchmode=
:set noreadonly
:set remap
:set report=5
:set scroll=0
:set scrolljump=1
:set sections=SHNHH\ HUnhsh
:set secure
:set shell=$SHELL
:set shellpipe=2>&1\|tee
:set shelltype=0
:set shiftround
:set noshortname
:set showcmd
:set showmode
:set sidescroll=1
:set nosmartindent
:set nosplitbelow
:set suffixes=
:set tabstop=8
:set noterse
:set notildeop
:set notimeout
:set ttimeout
":set timeoutlen=200
:set notitle
:set nottyfast
:set updatecount=200
:set updatetime=4000
:set novisualbell
:set warn
:set noweirdinvert
:set whichwrap=3
:set nowrap
:set wrapmargin=0
:set wrapscan
:set nowriteany
:set writebackup

"******************
" Large Functions Go Here
"******************

" Make diffopt iwhite actually ignore whitespace, and set it on
set diffexpr=MyDiff()
function! MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w "
   endif
   silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
        \  " > " . v:fname_out
endfunction
set diffopt=filler,iwhite

" tabline customization function; started with the JonSkanes example
" from http://vim.wikia.com/wiki/Show_tab_number_in_your_tab_line
" and customized further
set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " " set highlight for tab number and &modified
    let s .= '%#TabLineFill#'
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0  " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        " Enforce file name maxlen
        let n .= bufname(b)[-50:-1]
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " set page number string
    let s .= 't'
    let s .= t + 1
    " add modified label
    if m > 0
      let s .= '+'
    endif
    let s .= ':'
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " add buffer names
    let s .= n
    " switch to no underlining and add final space to buffer list
    let s .= '%#TabLineSel#' . ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction
