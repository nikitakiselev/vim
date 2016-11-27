set nocompatible

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start                          "Make backspace behave like every other editor.
let mapleader = ','					"The default leader os \, but a comma is much better
set number						"Let's activate line numbers
set linespace=5						"Macvim-specific line-height
set noerrorbells visualbell t_vb=

"---------------Visuals----------------"
colorscheme atom-dark-256
set t_CO=256
set guifont=Fira_Code:h14
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e

set foldcolumn=4
hi LineNr ctermfg=darkgray

"---------------Search----------------"
set hlsearch
set incsearch

"---------------Split Management----------------"
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"------------------Mappings----------------"

"Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/

nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <Leader>1 :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"-------------------Plugins----------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <c-R> :CtrlPBufTag<cr>
nmap <c-E> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"-------------------Laravel-Specific---------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>

"-------------------Auto-Commands----------------"

"Automatically source the Vimrc file on save

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
	call PhpExpandClass()
        call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>



