# `/.dotfiles`

This repo include shell scripts for executing the bulk of the configuration I follow to set up my Mac's development environment to get me up-to-speed with the tools et al. so I can more quickly get back to *Chillin like Billin*.

### What's included:

| File                 | Description                                                  |
| -------------------- | ------------------------------------------------------------ |
| `/terminals`         | Terminal.app themes (or profiles) I use.                     |
| `install`            | Install cli tools, sdks, and apps I use.                     |
| `update-os-settings` | Configure macOS and the Terminal to be smarter.              |
| `.zshrc`             | Customizes Zsh and the prompt to be smarter.                 |
| `.omz-yolo.zsh`      | Familiar environment variables, aliases, helper functions, et al. |
| `.gh`                | GitHub CLI (or `gh`) configurations to specify shortcuts and helper functions. |
| `.gitconfig`         | Git CLI (or `git`) configurations to specify my name and email, shortcuts, colors, and more. |
| `.gitignore`         | Ignore macOS-specific and editor-specifics, taken from [@github/gitignore](https://github.com/github/gitignore). |

## Install

> **WARNING :bangbang:** Make sure you know what you are doing and use at your own risk!

1. First, run `xcode-select --install` to enable Command Line Tools.

2. Next, run `softwareupdate --install-rosetta` enable Rosetta 2.

3. Download and install [Homebrew](https://github.com/Homebrew/brew/releases) and follow the post-installation instructions.

4. Next, clone this repo. Command Line Tools should install `git`, so we should be fine.

   ```bash
   git clone --recursive-submodules \
             --depth=1 \
             https://github.com/kosperera/dotfiles \
             ~/.dotfiles
   ```

5. Setup macOS and Terminal.app to be smarter.

   ```bash
   source ~/.dotfiles/update-os-settings
   ```

6. Next, install nerd fonts, dev tools, cli tools, sdks, apps and the like.

   ```bash
   source ~/.dotfiles/install
   ```
   
   > SDKMAN install script tweaks our `.zshrc` file but those `export` commands are already done in the `.zshrc`, so we can disregard those changes.

7. Import Terminal.app theme from [/terminals](/terminals) folder, then change font to *JetBrains Mono Nerd Font 12pt*.

9. Restart the Terminal.app to [install and setup cli tools](.zshrc). Some of these changes require a logout/restart to take effect.

10. Download Microsoft 365 with OneDrive from Microsoft site, then sign into activate license.

11. Download Typora.app Tokyo Night theme from [@Aemiii91/typora-theme-tokyo-night](https://github.com/Aemiii91/typora-theme-tokyo-night).

12. Sign into VS Code and sync settings, profiles, extensions et al.

13. Sign into IntelliJ IDEA and sync settings, profiles, et al.

14. Sign into Docker Desktop and install Docker Extensions.

15. Sing into `gh`.
    ```bash
    gh auth login
    # What account do you want to log into? GitHub.com
    # What is your preferred protocol for Git operations on this host? HTTPS
    # Authenticate Git with your GitHub credentials? Yes
    # How would you like to authenticate GitHub CLI? Login with a web browser
    ```

16. Create an `admin` profile and sign into `aws`.

## Useful Commands / Aliases

- `yolo` is to update and upgrade *Every Thuckin' Thing!*
- `dsprune` is to clean up unused containers, images, and volumes.
- `aws_login <profile>` to authenticate AWS.
- aws_refresh to export AWS credentials and refresh tokens.
- `serve <port>` to spin up a dead simple HTTP server.

## WOMM

Yep, it works on my machine and hopefully it does on your's as well but please don't hate me if it doesn't.

## Credit

Many of the customizations are taken from:

- [@elliottminns/dotfiles](https://github.com/elliottminns/dotfiles)
- [@kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [@mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles), and
- [@pawelgrzybek/dotfiles](https://github.com/pawelgrzybek/dotfiles)

## License

Copyright (c)​ 2025 It's actually me (@kosperera). All rights reserved.

The source code is licensed under the [MIT license](#MIT-1-ov-file).
