# Vim setting

> Special thanks [Chu-Siang Lai](http://note.drx.tw). <br>
> I fork from his [work (https://github.com/chusiang/vimrc)](https://github.com/chusiang/vimrc) and changed to my version.

This verison use `dein.vim` that can get the newest vim script use eazy way.

## Requirements

- Vim 7.4 or above.
- Curl
- Git
- make (Unix/Linux Only)

## Installation

### Linux & Mac OSX

1. Get my vimrc settings with Git.

```bash
git clone https://github.com/mikimoto/vimrc.git --depth=1
```

2. Install.

```bash
cd vimrc && make install
```
## Usage

### Update Plugins

- Run command at Vim (command mode).

```bash
:call dein#update()
```

- Run `make update` at Shell.

```bash
make update
```

### Backup

This version can auto backup orginal config before install.

Backup directory: `${HOME}/.vim_back-${data}`

```bash
make backup
```

### Clean backup

```bash
make clean-backup-file
```

## Include plugins

### Plugins Management

- [X] [dein.vim](https://github.com/Shougo/dein.vim) - Dark powered Vim/Neovim plugin manager.

### Library

- [x] [Shougo/vimproc.vim](https://github.com/Shougo/vimproc.vim) - A great asynchronous execution library for Vim.
- [x] [junegunn/fzf](https://github.com/junegunn/fzf) - A general-purpose command-line fuzzy finder.

### Files

- [X] [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim) - A fzf Vim plugin.

### Shell

- [X] [Shougo/vimshell.vim](https://github.com/Shougo/vimshell.vim) - 