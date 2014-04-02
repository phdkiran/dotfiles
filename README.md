# Roman’s dotfiles

## Install

Clone the repository (e.g. to `~/Projects/romanzolotarev/dotfiles`)
and run `install` script (installs `brew`, then upgrades `bash` and `git`).

```bash
git clone https://github.com/romanzolotarev/dotfiles.git && dotfiles/install
```

## OS X Defaults

Tweaks for Terminal, Dock, Finder, Menu bar, Trackpad and Keyboard, Safari,
Time Machine, Activity Monitor, Messages, etc.

```bash
source configure-osx
```

## Git

Copy `.gitconfig` and `.gitignore` to your home directory.

```bash
source configure-git
```

## Bash

Copy `.aliases`, `.completions`, `.path`, `.prompt` to your home directory.

```bash
source configure-bash
```

## Cask applications

Install cask applications like `alfred`, `dropbox`, `flux`, `github`,
`google-chrome`, `google-hangouts`, `imageoptim`, `licecap`, `sublime-text3`,
`virtualbox`, `appcleaner`, etc.

```bash
source install-cask
```

## Sublime Text 3

Copy `Preferences.sublime-text` and the package list to Sublime Text directory.

```bash
source configure-sublime-text3
```

## Web development environment

Install Meteor, Node.js, MongoDB, Ruby, and Python.

```bash
source install-webdev
```

## Private

```bash
source configure-private
```

Your better [fork this repo](https://github.com/romanzolotarev/dotfiles/fork).
:)

## Thanks to…

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
* [Edward Shaw](https://github.com/ntkme)

## Contribute

Please open an issue or a pull request to suggest changes or additions.

[MIT licensed](https://github.com/romanzolotarev/dotfiles/blob/master/LICENSE.md).
Copyright 2014 [Roman Zolotarev](http://romanzolotarev.com).