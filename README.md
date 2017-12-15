# My Vimfiles
All of my vim runtime files. Here be dragons.

### Installation
I highly doubt you want to use my exact configuration, so I recommend finding
the files/lines of code you want and copy them into your own `.vim` directory,
but if you do want my exact settings, clone the repository. Make sure to use
`--recursive` if you want to clone the plugins I use as well.

```bash
git clone --recursive https://github.com/evanthegrayt/vimfiles.git ~/.vim
```

Once cloned, if your vim version is less than 7.4, you'll need to link the
`vimrc` file to your home directory, as a dotfile.

```bash
ln -s ~/.vim/vimrc ~/.vimrc
```

Be forewarned that I use `vim8` with packages, but I've configured this
repository to work with older versions, using
[pathogen](https://github.com/tpope/vim-pathogen). Because of this, plugins will
be located in `pack/plugins/{start,opt}`, NOT `bundle/`.

### Where are some settings?
Be aware that functions, autocommands, and gui settings are under
`pack/settings/start` to make my `vimrc` cleaner, as I rarely edit these.

