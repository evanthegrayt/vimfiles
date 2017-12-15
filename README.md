# My Vimfiles
All of my vim runtime files. Here be dragons.

### Installation
I highly doubt you want to use my exact configuration, so I recommend finding
the files/lines of code you want and copy them into your own `.vim` directory,
but if you do want my exact settings, clone the repository.

```bash
git clone --recursive https://github.com/evanthegrayt/vimfiles.git ~/.vim
```

Be forewarned that I use `vim8` with packages, so if you're using anything less
than version 8, you'll need to install something like
[pathogen](https://github.com/tpope/vim-pathogen), and either set the runtime
path in the `pathogen` config, or recursively copy all of the directories under
`pack/*/{start,opt}` to `~/.vim/bundle`.

### Where are some settings?
I use the `vim8` packages directory, so all my plugins and even some settings
are under the `pack/` directory. Normal options and settings are in my `vimrc`,
but gui settings, autommands, plugin settings, and custom functions are under
`pack/settings/`.

