# The following tells the system where to find the 'brew' command.
# The location of the brew command is different on Intel and Silicon Macs, so the 'uname' command is used to check.

if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else 
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Preferred editor 
export EDITOR=vim

export XDG_CONFIG_HOME="$HOME/.config"

# Include ~/Documents/3comp/bin, and .local/bin, in $PATH:
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# Path to your Oh My Zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# Store compdump files in cache and not in $HOME (see https://stackoverflow.com/questions/62931101/i-have-multiple-files-of-zcompdump-why-do-i-have-multiple-files-of-these):
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# EZA
export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza/
export EZA_ICONS_AUTO=1

# PYTHON (see https://github.com/pyenv/pyenv?tab=readme-ov-file#installation,
# https://pipenv.pypa.io/en/latest/installation.html)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Disable creation of a .lesshst file:
export LESSHISTFILE=-

# BAT colors
export BAT_THEME="gruvbox-dark"

# Ensure dircolors is aliased to gdircolors if possible:
#if [ -x "$(command -v gdircolors)" ]; then alias dircolors='gdircolors'; fi
# Run dircolors:
eval `gdircolors -b $XDG_CONFIG_HOME/dircolors`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

export _ZO_DATA_DIR="$HOME/Documents/shared-settings/zoxide"
