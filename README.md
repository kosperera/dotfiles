# dotfiles
> WARNING! Make sure you know what you are doing and use at your own risk!

This repo includes a shell script for executing the bulk of the configuration I follow to set up my Mac's development environment to get me up-to-speed with the tools et al. so I can more quickly get back to coding.

## Contents

| File | Description
| --- | ---
| `install.zsh` | Entry point for dotfiles.
| `macos.zsh` | Configure macOS and the Terminal to be smarter.
| `brew.zsh` | Install some of the core tools I use.
| `.zshrc` | Customizes the default Terminal.app to be smarter.
| `.gh` | Global GitHub configuration to specify shortcuts and helper functions.
| `.gitconfig` | Global Git configuration to specify my name and email, shortcuts, colors, and more.
| `.npmrc` | Global NPM and Yarn configurations.
| `.docker-compose` | Configure Docker to be smarter.
| `.sql-server` | Configure Azure SQL to run locally for my .NET [Database Projects](https://www.youtube.com/watch?v=I6T9OA9YBGg).
| `.gitignore` | The ignores from [@github/gitignore](https://github.com/github/gitignore) that I use everywhere.

## Shell Script

```zsh
curl https://raw.githubusercontent.com/kosalanuwan/dotfiles/main/install.zsh > ~/.dotfiles/install.zsh && \
  cd .dotfiles/ && \
  /bin/zsh install.zsh
```

### Rename `master` to `main`:
```zsh
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## Credit

Many of the customizations are taken from:
- [@mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [@pawelgrzybek/dotfiles](https://github.com/pawelgrzybek/dotfiles), and 
- [@mdo/config](https://github.com/mdo/config)

## WOMM

Yep, it works on my machine and hopefully it does on your's as well but please don't hate me if it doesn't.
