## Introduction

  These are the [vim](http://www.vim.org/) dotfiles used by Michael-Keith
  Bernard. Please feel free to use and modify them as you see fit.

## Installation

*   Clone the repository: `$ git clone git://github.com/SegFaultAX/vim-dotfiles.git ~/.vim`
*   Move into the new .vim directory: `$ cd ~/.vim`
*   Run the provided initialization script: `$ ./manager --init`
*   Symlink your vimrc: `$ ./manager --create-symlink`

**Important**: The `--create-symlink` option will automatically backup your
~/.vimrc if one exists.

**Note**: This setup depends on vim being compiled with Ruby and Python support.
If you built vim yourself, be sure to include `--enable-pythoninterp` and
`--enable-rubyinterp` during configuration. If you're not sure if vim was built
with Ruby and Python support, you can use `vim --version` to check.

**Note**: If you choose to fork this repo, you can fetch my current master
version using the `--fetch-vimrc` command in manager.

### NeoVim Users

This vim configuration should work as is with neovim (for the most part). If
neovim is not correctly loading configuration from `~/.vim`, see this issue:

https://github.com/neovim/neovim/issues/3499

And the documentation:

https://github.com/neovim/neovim/blob/master/runtime/doc/vim_diff.txt#L22

```vim
:help vim_diff
```

## The "manager" Script

  The `manager` script makes staying up to date with this repository a breeze.
  First, check out the output from `manager --help`:

```bash
$ ./manager
Manager by Michael-Keith Bernard
Usage: ./manager
  --help - this help menu
  --fetch-vimrc - download maintainers repo
  --create-symlink - symlink /home/mkbernard/.vim/vimrc to ~/.vimrc
  --update-submodules - fetch newest submodule versions
  --clean-branches - remove all maintainer repo branches

  --init - initialize submodules, build Command-T, and clean Snipmate
  --init-commandt - build Command-T
  --init-snipmate - clean Snipmate
  --init-submodules - initialize submodules
```

  Simply running `./manager --init` from the project root will, by default,
  initialize and update any submodules, build Command-T, and remove the
  snipmate/snippets directory (there is a replacement snippets submodule in the
  root of this project). If you'd like to run any of these commands
  individually, use the available `--init-X` commands.

### Staying up-to-date

  To quickly fetch any changes from this repository, simply run:

```bash
$ ./manager --fetch-vimrc
Manager by Michael-Keith Bernard
Fetching maintainer version to segfaultax-25022012
From git://github.com/SegFaultAX/vim-dotfiles
 * [new branch]      master     -> segfaultax-25022012

You can now run 'git merge segfaultax-25022012' from master
You may also want to run 'git submodule init && git submodule update'
You can remove the branch with 'git branch -D segfaultax-25022012'
```

  As you can see it fetches update from SegFaultAX/vim-dotfiles on GitHub into a
  branch called `segfaultax-` followed by todays date. Now you can merge in my
  changes, add/update any submodules, and destroy the temporary branch:

```bash
$ git checkout master
$ git merge segfaultax-22022012
$ git submodule init && git submodule update
$ git branch -D segfaultax-22022012
```

  There is also a convenient helper method to delete all the `segfaultax-*`
  branches automatically:

```bash
$ ./manager --clean-branches
```

## Contributing

  I encourage you to submit patches or modifications to my vimrc or the list of
  submodules provided in this project. Make sure to rebase your changes onto my
  master branch and squash intermediate commits before issuing a pull request.

  **Active Contributors**:

  *   [Michael-Keith Bernard](https://github.com/SegFaultAX)
  *   [David Bush](https://github.com/davekcd)

## License
  
  All submodules, fonts, colorschemes and scripts are property of their
  respective owners. Please see their attached licenses for details.
