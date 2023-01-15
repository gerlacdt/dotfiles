# My dotfiles

## Instructions

In order to manage my collected dotfiles in git, I use [GNU Stow](https://www.gnu.org/software/stow/).

`stow` creates symlinks in order to make the dotfiles available in the target directory.

Convenience `Makefile` targets are provided for stowing and unstowing all dotfiles at once:

```bash
# create symlinks for all dotfiles in $HOME directory
make

# delete symlinks for all managed dotfiles
make unstow


# direct stow commands

# stow git dotfile, attention use --target option, otherwise stow uses the parent directory as default
stow --verbose --target=${HOME} git

# delete single symlink
stow --verbose --target=${HOME} --delete git
```

The short [GNU Stow
tutorial](https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html) gives
more insights about the details.

Unfortunately, `stow --restow` shows a warning which pollutes STDOUT. The
[issue](https://github.com/aspiers/stow/issues/65) is not resolved yet.
