# Symlink .dotfiles into HOME

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
for file in .{zsh_prompt,zshrc,gitconfig,gitignore,npmrc}; do
  # Symlink instead of replacing.
  # ln -s <source> <destination>
  # E.g. ln -s ~/.dotfiles/.docker-compose ~/.docker-compose
  rm -rf ~/$file && ln -s ~/.dotfiles/$file ~/$file
done;
unset file;

# GitHub is special
rm -rf ~/.config/gh/config.yml && ln -s ~/.dotfiles/.gh ~/.config/gh/config.yml
