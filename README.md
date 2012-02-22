## Introduction

  These are the [vim](http://www.vim.org/) dotfiles used by Michael-Keith
  Bernard. Please feel free to use and modify them as you see fit.

## Installation

*   Clone the repository: `$ git clone git://github.com/SegFaultAX/vim-dotfiles.git ~/.vim`
*   Move into the new .vim directory: `$ cd ~/.vim`
*   Run the provided initialization script: `$ ./init_repo`
*   Symlink your vimrc: `$ ln -s ~/.vim/vimrc ~/.vimrc`

**Note**: This setup depends on vim being compiled with Ruby and Python support.
If you built vim yourself, be sure to include `--enable-pythoninterp` and
`--enable-rubyinterp` during configuration. If you're not sure if vim was built
with Ruby and Python support, you can use `vim --version` to check.

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
