
Note: This is a rough note on my journey in learning Vim, Vi and NeoVim. Note that they are not in particular order


#### Vim 101
Types of Mode

```bash
- Normal mode
- Insert mode
- Visual mode
- Command mode
```

### Install vim plug for plugin install
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Use
```bash
:PlugInstall or simply type :Plug and tab to see options
```

### BASIC SETUP
```bash
set tabstop=4       " Set tab width to 4 spaces
set shiftwidth=4    " Use 4 spaces for indentation
set expandtab       " Convert tabs to spaces
set autoindent      " Auto-indent new lines
set smartindent     " Smart auto-indentation"

set number          " Show line numbers
set relativenumber  " Show relative line numbers
set cursorline      " Highlight current line

set hlsearch       " Highlight all search results
set incsearch      " Incremental search as you type
set ignorecase     " Ignore case when searching
set smartcase      " Case-sensitive if uppercase letters are used

set clipboard=unnamedplus " Use system clipboard"


set lazyredraw     " Faster scrolling
set ttyfast        " Improve performance
set updatetime=300 " Reduce delay for CursorHold events


set nocompatible      " Disable compatibility with old vi (enables better Vim features)
syntax on             " Enable syntax highlighting
colorscheme pablo
set background=dark   " or set background=light"
set path+=**          " Allow recursive search for files with the :find command
set wildmenu          " Enable a more interactive command-line completion menu. To use, :find <any word> and then tab

"let g:netrw_banner=0        " Disable the annoying banner at the top of the netrw window  
let g:netrw_browse_split=4  " Open files in the prior window instead of creating a new split  
let g:netrw_altv=1          " Open vertical splits to the right instead of the left  
let g:netrw_liststyle=3     " Use tree-style listing instead of a plain list  
let g:netrw_list_hide=netrw_gitignore#Hide()  " Hide files listed in .gitignore  
let g:netrw_list_hide .= ', \(^\/\s\s\) \zs\.\S\+'  " Hide dotfiles (.) except for ".." (parent directory)  
set modifiable
set noreadonly


call plug#begin('~/.vim/plugged')

" Install fzf and fzf.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'

call plug#end()


" COC SETTINGS for FUZZY FIND, Go to Definition, Implementation and Import
" Use :Files to fuzzy search files in the current directory
nnoremap <C-p> :Files<CR>

" Search inside files using Ripgrep (requires `rg`)
nnoremap <Leader>f :Rg<CR>

" " Search for buffers
nnoremap <Leader>b :Buffers<CR>

" Search in command history
nnoremap <Leader>h :History<CR> 


" Toggle NERDTree with Ctrl + n
nnoremap <C-n> :NERDTreeToggle<CR>

" Open NERDTree automatically if no file is opened
"autocmd VimEnter * if argc() == 0 | NERDTree | endif


inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~#
		'\s'
endfunction
"


" Use <c-space> to trigger completion
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif
"
"     " Use `[g` and `]g` to navigate diagnostics
"     " Use `:CocDiagnostics` to get all diagnostics of current buffer in
"     location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"     " GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"ALE SETTINGS FOR PICKING ERRORS
let g:ale_linters = {
			\   'javascript': ['eslint'],
			\   'typescript': ['eslint', 'tsserver'],
			\   'python': ['pylint'],
			\   'java': ['javac'],
			\   'go': ['golangci-lint'],
			\   'c': ['gcc'],
			\   'cpp': ['clang'],
			\}

let g:ale_fixers = {
			\   'javascript': ['prettier'],
			\   'typescript': ['prettier'],
			\   'python': ['black']
			\}

let g:ale_fix_on_save = 1


inoremap jk <Esc>
inoremap jj <Esc>
inoremap kj <Esc>



```

### Install the extension
```bash
:CocInstall coc-json coc-tsserver
```

### Note
```bash
In coc.vim, when the autocomplete suggestions are listed, you can scroll through them using the following key bindings:

<C-n> (Ctrl + n) → Move down in the suggestion list
<C-p> (Ctrl + p) → Move up in the suggestion list
```

### NeoTree commands
```bash
Ctrl n -> open the Explorer
m -> add a new file, then add a node 
m -> type director name with a forward slash e.g src/
```

### Get current file name
```bash
:echo @% 
:echo expand('%:p') -> full path
```

### Quick find
```bash
:find index.js

#get the set path
:set path?
```


### Autocomplete
```bash
- Insert mode with Auto-Completion (Ctrl+n/Ctrl+p): Auto-complete words in the document when in insert mode.
- Ctrl x Ctrl f -- file name quick auto complete (works well in insert mode)
```

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/plvsbxguoeeh355mu0cp.png)



#### Change vim color
```bash
Temporarily
:colorscheme desert

Other options:
elflord
murphy
evening
morning
blue
darkblue
peachpuff
```

### ls
```bash
The :ls command in Vim lists all open buffers along with their details.
:ls 
```

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/9wc2od4emotwqa0toelj.png)



### copy with clip.exe
```bash
:w !clip.exe
```

### Ctags
_Using ctags in Vim (Without Plugins)
ctags helps you jump to function, class, and variable definitions in large projects. Here’s how to set it up and use it effectively_
```bash
# windows - choco install universal-ctags
# wsl -  sudo apt install exuberant-ctags
# linux - sudo apt install universal-ctags

### Generate ctags for your project
!ctags -R . or ctags -R . (In normal terminal)

-R → Recursively scan all files.
. → Start from the current directory.

Ctrl-] - Go to a function
g Ctrl-] -> Shows a list of matching tags and lets you choose
Ctrl-o - Go back to previous location
Ctrl-i - Go next  location (forward)
```


### Make cursor thick
```bash
echo -e "\e[2 q"

other options
\e[2 q → Sets the cursor to block (thick)
\e[6 q → Sets the cursor to thicker underline
\e[4 q → Sets the cursor to thin underline
\e[5 q → Sets the cursor to blinking bar
\e[1 q → Sets the cursor to blinking block

Note: This change lasts until you close the terminal.

```

### Set permanently
In vimrc
```bash
if &term =~ 'xterm'
  let &t_SI = "\e[2 q"   " Thick cursor in Insert mode
  let &t_SR = "\e[2 q"   " Thick cursor in Replace mode
  let &t_EI = "\e[2 q"   " Thick cursor in Normal mode
endif
```

### Set permanently
Create ~/.vimrc file
```bash
" Toggle NERDTree with Ctrl + n
nnoremap <C-n> :NERDTreeToggle<CR>

" Open NERDTree automatically if no file is opened
autocmd VimEnter * if argc() == 0 | NERDTree | endif


```

### Install with
```bash
:PlugInstall -> this is coming from vim-plugin or this inside terminal vim +PlugInstall +qall	
```

### File browser

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/loar3ekct018nf9w2msh.png)


---

#### Motions
```bash
- [x] `k` - Upward
- [x] `j` - Downward
- [x] `l` - Right
- [x] `h` - Left
- [x] `w` - Hop forward between words
- [x] `b` - Hop backward between words
- [x] `e` - Move to the end of line
- [x] `~` - swap to upper or lower case
- [x] `g~w` - apply Uppercase to a world
- [x] `g~it` - it is inner tag, applies uppercase to everything inside a tag
- [x] `%` - jump between matching curly braces, square brackets or ()
-[x] `*` search for words under cursor and use Shift N or n to toggle between words
```

### Open file under cursor
```bash
gf → Open the file under the cursor
Ctrl + o → Jump back
Ctrl + 1 -> go forward
gd or gD → commands to jump to the definition of a symbol
```

###  Search net occurence
```bash
* → Search for the word under the cursor (next occurrence)
# → Search for the word under the cursor (previous occurrence)
% → Jump between matching brackets ((), {}, [])
```

---

Additional Modes and Concepts:
```bash
- Replace mode (R): Replace characters as you type.
- Visual Block mode (Ctrl+v): Select text as a block (useful for editing columns).


Additional Motions:
- 0 (zero): Move to the beginning of the line.
- $: Move to the end of the line.
- gg: Move to the beginning of the file.
- G: Move to the end of the file.
- H: Move to the top of the screen.
- M: Move to the middle of the screen.
- L: Move to the bottom of the screen.
Editing:
- J: Join the current line with the next one.
r + <char>: Replace the current character with <char>.
- R : Edit continuosly
- yw: Yank (copy) a word.
- Y: Yank (copy) a whole line.
- p: Paste after the cursor.
- P: Paste before the cursor.
```


```vim
Visual Mode Enhancements:
- vip: Select the paragraph around the cursor.
- vi{: Select everything inside {}.
- **vi[orvi]`: Select everything inside brackets.

Search and Replace:
- /old/new/g: Substitute all occurrences of "old" with "new" in the current line.
- :%s/old/new/g Substitute all occurrences of "old" with "new" in the entire file.
- :%s/old/new/gc: Same as above but with confirmation before replacing.

- :%s/old/new/g → Replace all occurrences of "old" with "new"
:s/old/new/g → Replace all occurrences in the current line

- : Turn off search highlighting.
```


Working with Indentation:
```bash
format your  code M gg=G for the entire file).
```

Other Useful Commands:
```
- :!{command}: Run an external command.
```

#### Command + Count + Motion 
```bash
- 8k - Jump up 8 lines
- 16j - Jump down 16 lines
- d$ - delete to the end of the line
- de - delete to the end of the word
- dG - delete  to the end of the file
```


---

#### Explorer
```bash
- :Ex or :Explore: Opens the file explorer in the current directory.
- :Sex: Opens the file explorer in a horizontal split.
- :Vex: Opens the file explorer in a vertical split.
- SHIFT + % - Create a new file in :Ex mode

#### Navigation within Netrw:
- Enter: Opens a file or navigates into a directory.
- - (hyphen): Goes up one directory level.
- r: Refreshes the directory view.
- i: Toggles between different views (tree view, detailed view, etc.).
- q: Closes the explorer.
```

---

#### Skip code block
```bash
- } - skip code block
- { - skip code block
- ctrl+e / ctrl+y - Scroll down/up one line
- Ctrl+d - Move down half a page
- Ctrl+u - Move up half a page
```

---

##### Delete and Change text in command mode
```bash
- dd - delete a single line
- x - delete while in command mode
- r - change a text while in command mode
- u - undo
- Ctrl + r - Redo
- d3j - delete 2 words down
- d2w - delete 2 words forwars
- db - delete backward
- d2j - delete 2 words doward
- c - Delete, then start insert mode
- cc - Delete line, then start insert mode
- cw - Change words
```

---
##### INDENT
```bash
- `>>` Indent forward
- `<<` Indent backward
```

---

#### Quit and Save
```bash
 - :qa - Quit all open buffers
 - :wa - Write all open buffers
 - :wqa - Write and quit all open buffers
 - :q - Quit current buffer
- :w - Write current buffer
- :wq - Write and quit current buffer
- :ZZ - quit vim (quit with saving)
- :ZQ - quit without saving
```


##### Select content inside () and {}
```bash
- :vib - select content inside ()
- :viB - select content inside {}
- :cib - change everything inside ()
- :ciB - change everything inside {}
```

---


#### Combinations
```bash
vaw - Selects a word under the cursor.

    v enters Visual mode, and aw selects a word (including trailing whitespace).

va) - Selects text within parentheses, including the parentheses themselves.

    v enters Visual mode, a selects "around" (inclusive), and ) specifies the target.

ciw - Changes the entire word under the cursor.

    c enters Insert mode after deleting the selected text, and iw selects the inner word.

diw - Delete inner words

caw - Change around words

di( - Deletes text within parentheses, excluding the parentheses.

    d deletes the selected text, i specifies the "inner" target, and ( selects the parentheses.

ci" - Changes text within double quotes, excluding the quotes.

    c enters Insert mode after deleting the selected text, i specifies the "inner" target, and " selects the quotes.
```

---

#### File Tabs
```bash
- :e filename - Find and open a file in a new buffer
- :w filename → Save as a new file
- :tabe - Make a new tab
- :vsp - Vertically split windows and open a file
- ctrl+ws - Split windows horizontally
- ctrl+wv - Split windows vertically
- ctrl+ww - Switch between windows in normal mode
- ctrl+wc - Close the tree
- ctrl+w+ - zoom terminal
- ctrl+w- - Zoom out terminal
- ctrl+w= - Balance the terminal
- ctrl + w + h/j/k/l → Move between windows
```


---


#### Insert mode
```bash
- I - insert to the beginning of the line
- i - insert to the left of the word
- a - insert to the right after the word
- A - insert to the end of the line
- esc - Leave insert mode
- Ctrl + c - leave insert mode method 2
- a - insert to the other side
- o - insert a new line and enter into insert mode
- O - insert a new line above
- c - change mode
- . - repeat an action multiple times
- / - search for something in the file
    e.g /console.log
    Then use `n` to jump to the desired match, Shift N to jump back
- : - run a command
- n - Repeat search in same direction
- N - Repeat search in opposite direction
```

---

##### Visual mode
```bash
- v - visual mode
- vw - highlight the word forward
- y - yank (copy)
- p - paste below
- P - paste above a line
- shift + p - Paste the copied line(s) above the current line.
- shift + v - Visual line mode
- y5j - copy 5 lines down from where you are
- d5j - delete 5 lines downward
- viw - copy single word
```

---

###### Set number 
```bash
> :set number
```


#### Run command from vim
```bash
> :!ls
> :!node app.js
```


---
##### Quit and saving
```bash
- :q - quit without saving changes
- :q! - quit and save changes
- :wq - write and quit with changes changed
- :qa - Quit all tabs and terminal
```


---

##### Jump to line
```bash
- :2 - go to line 2
- :3 - go to line 3
```

---

#### Resize terminal
```bash
- :resize {number_of_lines} for vertical resize
- :vertical resize 50
- :vertical resize {number_of_columns}
- :resize 10
```




