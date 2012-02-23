## Introduction

  These are the [vim](http://www.vim.org/) dotfiles used by Michael-Keith
  Bernard. Please feel free to use and modify them as you see fit.

## Installation

*   Clone the repository: `$ git clone git://github.com/SegFaultAX/vim-dotfiles.git ~/.vim`
*   Move into the new .vim directory: `$ cd ~/.vim`
*   Run the provided initialization script: `$ ./init_repo`
*   Symlink your vimrc: `$ ./init_repo --create-symlink`

**Important**: The `--create-symlink` option will automatically backup your
~/.vimrc if one exists.

**Note**: This setup depends on vim being compiled with Ruby and Python support.
If you built vim yourself, be sure to include `--enable-pythoninterp` and
`--enable-rubyinterp` during configuration. If you're not sure if vim was built
with Ruby and Python support, you can use `vim --version` to check.

## The "init_repo" Script

  The `init_repo` script makes staying up to date with this repository a breeze.
  First, check out the output from `init_repo --help`:

```bash
$ ./init_repo --help
Initializing vim-dotfiles, by Michael-Keith Bernard
Usage: init_repo
  --help - this menu
  --update - update project files from maintainer
  --create-symlink - create a symlink of vimrc
  --clean-branches - remove all segfaultax-* branches

  --skip-all - skip all steps
  --skip-snipmate - don't remote snipmate/snippets
  --skip-commandt - don't compile Command-T
  --skip-submodule - don't load submodules
```

  Simply running `./init_repo` from the project root will, by default,
  initialize and update any submodules, build Command-T, and remove the
  snipmate/snippets directory (there is a replacement snippets submodule in the
  root of this project). You can skip any of the above steps with the
  appropriate `--skip-<step>` command.

### Staying up-to-date

  To quickly fetch any changes from this repository, simply run:

```bash
$ ./init_repo --update
Initializing vim-dotfiles, by Michael-Keith Bernard
Fetching maintainer version to segfaultax-22022012
From git://github.com/SegFaultAX/vim-dotfiles
 * [new branch]      master     -> segfaultax-22022012

You can now run 'git merge segfaultax-22022012' from master
You may also want to run 'git submodule init && git submodule update'
You can remove the branch with 'git branch -D segfaultax-22022012'
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
$ ./init_repo --clean-branches
```

## Contributing

  I encourage you to submit patches or modifications to my vimrc or the list of
  submodules provided in this project. As long as they don't break my programmed
  muscle memory, I'd be happy to integrate just about any nifty new feature,
  command, or plugin.

  **Active Contributors**:

  *   [Michael-Keith Bernard](https://github.com/SegFaultAX)
  *   [David Bush](https://github.com/davekcd)

## License
  
  All submodules, fonts, colorschemes and scripts are property of their
  respective owners. Please see their attached licenses for details.
