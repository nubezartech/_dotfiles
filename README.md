<h1 align="center">
  .dotfiles created using <a href="https://github.com/CodelyTV/dotly">🌚 dotly</a>
</h1>

## 🚀 Installation

Execute the [`installer`](installer) from your terminal in order to avoid even having to manually install git!

```bash
bash <(curl -s https://raw.githubusercontent.com/nubezartech/_dotfiles/main/www/scripts/installer)
```

If you want to check out all the details involved in a migration from a legacy to a new PC, you can checkout the [`installation-guide.md`](doc/installation-guide.md) 

## Restore your Dotfiles manually

* Install git
* Clone your dotfiles repository `git clone [your repository of dotfiles] $HOME/.dotfiles`
* Go to your dotfiles folder `cd $HOME/.dotfiles`
* Install git submodules `git submodule update --init --recursive modules/dotly`
* Install your dotfiles `DOTFILES_PATH="$HOME/.dotfiles" DOTLY_PATH="$DOTFILES_PATH/modules/dotly" "$DOTLY_PATH/bin/dot" self install`
* Restart your terminal
* Import your packages `dot package import`

## Restore your Dotfiles with script

Using wget
```bash
bash <(wget -qO- https://scripts.dev.nubezartech.es/dotfiles/restorer)
```

Using curl
```bash
bash <(curl -s https://scripts.dev.nubezartech.es/dotfiles/restorer)
```

You need to know your GitHub username, repository and install ssh key if your repository is private.

It also supports other git repos, but you need to know your git repository url.
# dotfiles
