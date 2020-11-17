# My Vimfiles
All of my vim runtime files. Here be dragons.

All of the plugins that I use are kept as git submodules. I mostly work with
Ruby on Rails, so a lot of my plugins are geared towards a Rails workflow. You
can view all plugins in the [pack
directory](https://github.com/evanthegrayt/vimfiles/tree/master/pack). See the
[installation instructions](#installation) to see how to recursively clone this
repository and all of the plugins.

Here's what my `vim` setup looks like. In this screenshot, you can see
[Tagbar](https://github.com/majutsushi/tagbar.git),
[Easteregg Colorscheme](https://github.com/evanthegrayt/vim-easteregg.git), and
[Airline with a bunch of integrated plugins](https://github.com/vim-airline/vim-airline.git).
I'm using [iTerm2](https://www.iterm2.com/) on MacOS, with
[italics enabled](https://github.com/evanthegrayt/dotfiles/blob/master/dotfiles/xterm-256color.terminfo#L3),
and with the [Hack font](https://sourcefoundry.org/hack/).

![](https://user-images.githubusercontent.com/12698076/99425841-0574a480-28c9-11eb-8bcc-8ab03e6413ea.png)

### Installation
Clone the repository. Make sure to use `--recursive` if you want to clone the
plugins I use as well.

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
You probably don't have italics enabled in your terminal. Either
[research how to enable them](https://github.com/evanthegrayt/dotfiles/blob/master/dotfiles/xterm-256color.terminfo#L3),
or turn off italics by changing this line in `vimrc`:

```vim
let g:easteregg_use_italics = 1
```

...to this:

```vim
let g:easteregg_use_italics = 0
```

...or just delete the line entirely.

### Not all configurations are in your vimrc; where are they?
Functions, autocommands, and GUI settings are under `plugin/` to
make my `vimrc` cleaner, as I rarely edit these.

Also, a lot of people put file-type related settings -- such as autocommands --
in their `vimrc` files, but `vim` provides directories for these types of
situations, getting rid of ugly conditionals cluttering your
`vimrc`. I utilize [these
directories](http://www.panozzaj.com/blog/2011/09/09/vim-directory-structure/),
so [file type plugins](./ftplugin), etc., are located in the appropriate
directories.

### Why do I have no plugins?
You probably didn't clone with the `--recursive` option, as stated above.

### Why isn't my vimrc being loaded?
You're probably running an older version of `vim`, which doesn't know to check
the `.vim` directory for a `vimrc` file. As stated above, you need to link it to
your home directory.

## Reporting Bugs
These are just my config files, so there shouldn't be (m)any bugs, but if you
find any, please [submit an
issue](https://github.com/evanthegrayt/vimfiles/issues/new).

## Self Promotion
I do these projects for fun, and I enjoy knowing that they're helpful to people.
Consider starring [the repository](https://github.com/evanthegrayt/vimfiles) if
you like it! If you love it, follow me [on
github](https://github.com/evanthegrayt)!
