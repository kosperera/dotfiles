# .dotfiles
> **WARNING :bangbang:** Make sure you know what you are doing and use at your own risk!

This repo includes a shell script for executing the bulk of the configuration I follow to set up my Mac's development environment to get me up-to-speed with the tools et al. so I can more quickly get back to coding.

## Intall Locally

1. First, download and install [Homebrew](https://github.com/Homebrew/brew/releases) (or `brew`) and follow the post-installation instructions.
2. Next, clone this repo into the hidden `.dotfiles` directory. Homebrew should install `git`, so we should be fine.
   ```bash
   git clone https://github.com/kosalanuwan/dotfiles ~/.dotfiles
   ```
3. Then, update, upgrade, and install core tools and the stuff via `brew`.
   ```bash
   source ~/.dotfiles/setup-brew.zsh
   ```
4. Download the rest of the apps from Apple App Store or otherwise.
   - [Typora](https://typora.io) for Markdown.
   - Microsoft OneDrive.
   - [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or [Rancher Desktop](https://docs.rancherdesktop.io/getting-started/installation/#macos)) for Devcontainers.
5. Configure macOS and the Terminal.app to be smarter.
   ```bash
   source ~/.dotfiles/setup-macos.zsh
   ```
6. Create (or recreate) symlinks for .dotfiles.
   ```bash
   source ~/.dotfiles/setup-symlinks.zsh
   ```
7. Configure VS Code default settings, profiles, extensions et al.

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

## Credit

Many of the customizations are taken from:
- [@mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [@pawelgrzybek/dotfiles](https://github.com/pawelgrzybek/dotfiles), and 
- [@mdo/config](https://github.com/mdo/config)

## WOMM

Yep, it works on my machine and hopefully it does on your's as well but please don't hate me if it doesn't.
