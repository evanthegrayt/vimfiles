# My Vimfiles
All of my vim runtime files. Here be dragons.

All of the plugins that I use are kept as git submodules. I mostly work with
Ruby on Rails, so a lot of my plugins are geared towards a Rails workflow. You
can view all plugins at the bottom of the [help
documentation](https://github.com/evanthegrayt/vimfiles/blob/master/doc/evanthegrayt.txt#L270).
See the [installation instructions](#installation) to see how to recursively
clone this repository and all of the plugins, and view the help documentation.

I provide [help documentation](doc/evanthegrayt.txt) with this repository. It's
mostly the custom key bindings I use, along with things I want to remember, but
this would be useful to check out if you're going to clone this repository.

Here's what my `vim` setup looks like. In this screenshot, you can see
[Tagbar](https://github.com/majutsushi/tagbar.git),
[Easteregg Colorscheme](https://github.com/evanthegrayt/vim-easteregg.git), and
[Airline](https://github.com/vim-airline/vim-airline.git) with a bunch of integrated plugins.
I'm using [iTerm2](https://www.iterm2.com/) on MacOS, with
[italics enabled](https://github.com/evanthegrayt/dotfiles/blob/master/dotfiles/xterm-256color.terminfo#L3),
and with the [Hack font](https://sourcefoundry.org/hack/).

![](https://user-images.githubusercontent.com/12698076/99425841-0574a480-28c9-11eb-8bcc-8ab03e6413ea.png)

### Installation
The steps below show how to clone the repository, but if you're going to use
this as your personal setup, I recommend forking the repository and maintaining
your own copy.

Clone the repository. Make sure to use `--recursive` if you want to clone the
plugins I use as well.

```bash
git clone --recursive https://github.com/evanthegrayt/vimfiles.git ~/.vim
```

I highly recommend generating the helptags and reading [the
documentation](https://github.com/evanthegrayt/vimfiles/blob/master/doc/evanthegrayt.txt)
to see my custom commands and mappings.

```
:helptags ALL
:help evanthegrayt
```

Be forewarned that I use `vim8` with packages, so plugins are located in
`pack/`, not `bundle/`.

# FAQ
At least, I assume these would be frequently asked...
### Why do colors look weird?
You probably don't have italics enabled in your terminal. Either
[research how to enable
them](https://github.com/evanthegrayt/dotfiles/blob/master/dotfiles/xterm-256color.terminfo#L3),
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
For settings that require more advanced vimscript, check in the `plugin/` and
`autoload/` directories. They contain commands and functions that are like
mini-plugins. Read the help documentation (`:help
evanthegrayt-mappings-and-commands`) to read more about these.

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
You're probably running an older version of `vim`. This setup is now only
compatible with version of vim running 8.0 or higher.

## Reporting Bugs
These are just my config files, so there shouldn't be (m)any bugs, but if you
find any, please [submit an
issue](https://github.com/evanthegrayt/vimfiles/issues/new).

## Self Promotion
I do these projects for fun, and I enjoy knowing that they're helpful to people.
Consider starring [the repository](https://github.com/evanthegrayt/vimfiles) if
you like it! If you love it, follow me [on
github](https://github.com/evanthegrayt)!
