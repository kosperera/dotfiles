# .dotfiles

This repo includes a shell script for executing the bulk of the configuration I follow to set up my Mac's development environment to get me up-to-speed with the tools et al. so I can more quickly get back to coding.



### What's included:

| File                | Description                                                  |
| ------------------- | ------------------------------------------------------------ |
| `setup-brew.zsh`    | Install some of the core tools I use.                        |
| `setup-sdk.zsh`     | Install core tools for Java I use.                           |
| `setup-macos.zsh`   | Configure macOS and the Terminal to be smarter.              |
| `setup-symlink.zsh` | Create sim links for `~/.dotfiles/*`.                        |
| `.zshrc`            | Customizes the default shell to be smarter.                  |
| `.gh`               | Global GitHub CLI configuration to specify shortcuts and helper functions. |
| `.gitconfig`        | Global Git configuration to specify my name and email, shortcuts, colors, and more. |
| `.gitignore`        | Global ignores from [@github/gitignore](https://github.com/github/gitignore) that I use everywhere. |
| `.npmrc`            | Default configurations for Node Package Management tools like `npm`, `yarn`, `pnpm` etc. |
| `.nvmrc`            | Default configurations for Node Version Manager.             |
| `.sql-server`       | Configure Azure SQL to run locally for my .NET [Database Projects](https://www.youtube.com/watch?v=I6T9OA9YBGg). |



## Install

> **WARNING :bangbang:** Make sure you know what you are doing and use at your own risk!

1. First, run `xcode-select --install` to enable Command Line Tools.

2. Next, run `softwareupdate --install-rosetta` enable Rosetta 2.

3. Then, install [Oh My Zsh](https://ohmyz.sh/#install).

4. And, download and install [Homebrew](https://github.com/Homebrew/brew/releases) (or `brew`) and follow the post-installation instructions.

5. Next, clone this repo into the hidden `.dotfiles` directory. Homebrew should install `git`, so we should be fine.

   ```bash
   git clone https://github.com/kosperera/dotfiles ~/.dotfiles
   ```

6. Configure macOS and the Terminal.app to be smarter.

   ```bash
   source ~/.dotfiles/setup-macos.zsh
   ```

7. Create (or recreate) symlinks for .dotfiles.

   ```bash
   source ~/.dotfiles/setup-symlinks.zsh
   ```

8. Then, update, upgrade, and install core tools and the stuff via `brew`.

   ```bash
   source ~/.dotfiles/setup-brew.zsh
   ```

9. Next, install core tools for Java and the stuff via `sdk`.

   ```bash
   source ~/.dotfiles/setup-sdk.zsh
   ```

   > SDKMAN install script tweaks our `.zshrc` file but those `export` commands are already done in the `.zsh_exports`, so we can disregard those changes.

10. Import Terminal.app Night Owl theme from [@lysyi3m/macos-terminal-themes](https://github.com/lysyi3m/macos-terminal-themes).

11. Download Microsoft 365 with OneDrive from Microsoft site.

12. Download Typora.app Notion Dark Enhanced theme from [@adrian-fuertes/notion-themes](https://github.com/adrian-fuertes/typora-notion-theme/tree/main).

13. Sign in to VS Code and sync settings, profiles, extensions et al.

14. Sign in to IntelliJ IDEA and sync settings, profiles, et al.

15. Sign in to Docker Desktop and install Docker Extensions.

16. Sing in to `gh`.
    ```bash
    gh auth login
    # What account do you want to log into? GitHub.com
    # What is your preferred protocol for Git operations on this host? HTTPS
    # Authenticate Git with your GitHub credentials? Yes
    # How would you like to authenticate GitHub CLI? Login with a web browser
    ```




## Useful Commands / Aliases

- `doc` is the alias for `docker` and `dc` is the alias for `docker compose`.
- `sql` is the alias for a dead simple SQL Server running on docker. Try `sql h` to show the list of supported commands.
- `gh a` and `git a` are aliases to list all their aliases.
- `serve` is a short hand command to run a dead simple web server from the current folder. Try `serve 4321` to see it in action.
- `yolo` is to upgrade *Every Thuckin' Thing!*.



## WOMM

Yep, it works on my machine and hopefully it does on your's as well but please don't hate me if it doesn't.



## Credit

Many of the customizations are taken from:

- [@kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [@mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles), and
- [@pawelgrzybek/dotfiles](https://github.com/pawelgrzybek/dotfiles)



## License

Copyright :copyright: 2020 It's actually me (@kosalanuwan). All rights reserved.

The source code is licensed under the [MIT license](#MIT-1-ov-file).
