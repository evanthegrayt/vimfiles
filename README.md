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

# FAQ
At least, I assume these would be frequently asked...
### Why do colors look weird?
You probably don't have italics enabled in your terminal. Either research how to
enable them, or turn off italics by changing this line in `vimrc`:

```vim
let g:easteregg_use_italics = 1
```

...to this:

```vim
let g:easteregg_use_italics = 0
```

### Why am getting an error when I try to save a file?
I just haven't bothered to fix it yet, but you need to add some directories:

```bash
mkdir ~/.vim/backup
mkdir ~/.vim/tmp
```

### Where are some settings?
Functions, autocommands, and gui settings are under `pack/settings/start` to
make my `vimrc` cleaner, as I rarely edit these.

### Why do I have no plugins?
You probably didn't clone with the `--recursive` option

### Why isn't my vimrc being loaded?
You're probably running an older version of `vim`, which doesn't know to check
the `.vim` directory for a `vimrc` file. You need to link it to your home
directory, as said above.

