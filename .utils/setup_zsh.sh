#!/usr/bin/env sh

# Function to make zsh the default shell
make_zsh_default_shell() {
    # If this user's login shell is already "zsh", do not attempt to switch.
    if [ "$(basename -- $SHELL)" = "zsh" ]; then
        return
    else
        sudo chsh -s "$(command -v zsh)" "${USER}"
    fi
}

# Check if zsh is installed
if command -v zsh >/dev/null; then
    # Make zsh the default shell
    make_zsh_default_shell

    # Install oh-my-zsh if not already installed
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
fi

# Install plugins and themes for oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    # ohmyzsh - syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # ohmyzsh - auto-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # zsh vi mode
    git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-vi-mode

    # powerline10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # zoxide
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# Replace .zshrc file created by oh-my-zsh with the one from the repository
aria2c --allow-overwrite=true --dir=${HOME}/ "https://raw.githubusercontent.com/latentlect/.dotfiles/main/.zshrc"
