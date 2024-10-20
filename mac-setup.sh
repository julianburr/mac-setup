#!/bin/bash

#######
# Create a folder who contains downloaded things for the setup
#######
INSTALL_FOLDER=~/.macsetup
mkdir -p $INSTALL_FOLDER
SETUP_PROFILE=$INSTALL_FOLDER/.profile


#######
# Install software
#######

# Brew
if ! hash brew
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
else
  printf "\e[93m%s\e[m\n" "You already have brew installed."
fi

# curl / wget
brew install curl
brew install wget

{
  echo 'export PATH="/usr/local/opt/curl/bin:$PATH"'
  echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"'
  echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"'
  echo 'export PATH="$PATH:/usr/local/nginx/sbin"'
} >> $SETUP_PROFILE

# Git & config
brew install git

{
  echo '[core]'
  echo '  ignorecase = false'
  echo '[pull]'
	echo '  ff = only'
	echo '  default = current'
  echo '[push]'
  echo '  default = current'
  echo '[user]'
	echo '  name = Julian Burr'
	echo '  email = hello@julianburr.de'
} >> "~/.gitconfig"

# ZSH
brew install zsh
sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R root:staff /usr/local/share/zsh

# iTerm2 & oh-my-zsh & command line helpers
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install --cask iterm2
brew install bash-completion

brew install lsd
brew install tree
brew install ack
brew install jq

{
  echo ""
  echo "ZSH_THEME=\"robbyrussell\""
  echo "plugins=(git)"
  echo ""
  echo "# lsd aliases"
  echo "alias ls='lsd'"
  echo "alias ll='ls -l'"
  echo "alias la='ls -a'"
  echo "alias lla='ls -la'"
  echo "alias lt='ls --tree'"
  echo ""
  echo "# personal misc aliases"
  echo "alias cdp='cd ~/Documents/Projects"
} >> $SETUP_PROFILE

# NVM, node & yarn
mkdir ~/.nvm
brew install nvm
nvm install node
brew install yarn

{
  echo ''
  echo '# nvm setup'
  echo 'export PATH="$PATH:$(npm bin)"'
  echo 'export PATH="$PATH:~/.yarn/bin"'
  echo ''
  echo 'export NVM_DIR="$HOME/.nvm"'
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm'
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'
  echo ''
  echo '# Automatically use .nvmrc if available'
  echo 'find-up() {'
  echo '  path=$(pwd)'
  echo '  while [[ "$path" != "" && ! -e "$path/$1" ]]; do'
  echo '    path=${path%/*}'
  echo '  done'
  echo '  echo "$path"'
  echo '}'
  echo ''
  echo 'load-nvmrc() {'
  echo '  nvmrc_path=$(find-up .nvmrc | tr -d '[:space:]')'
  echo '  if [ -n "$nvmrc_path" ]; then'
  echo '    nvm_version=$(cat $nvmrc_path/.nvmrc)'
  echo '    nvm use $nvm_version'
  echo '  fi'
  echo '}'
  echo ''
  echo 'autoload -U add-zsh-hook'
  echo 'add-zsh-hook chpwd load-nvmrc'
  echo 'load-nvmrc'
} >> $SETUP_PROFILE

# gbh
yarn global add git-branch-history

# Docker
brew install --cask docker
brew install bash-completion
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion

# VS Code, extensions & user settings
brew install --cask visual-studio-code

code --install-extension attilabuti.vscode-mjml
code --install-extension irongeek.vscode-env
code --install-extension wix.vscode-import-cost
code --install-extension gruntfuggly.todo-tree
code --install-extension redhat.vscode-yaml
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension bradlc.vscode-tailwindcss
code --install-extension github.vscode-github-actions
code --install-extension astro-build.astro-vscode
code --install-extension eamodio.gitlens
code --install-extension graphql.vscode-graphql
code --install-extension graphql.vscode-graphql-syntax

{
  echo '{'
  echo '  "editor.tabSize": 2,'
  echo '  "editor.insertSpaces": true,'
  echo '  "editor.defaultFormatter": "esbenp.prettier-vscode",'
  echo '  "editor.codeActionsOnSave": {'
  echo '    "source.fixAll.eslint": "explicit"'
  echo '  },'
  echo '  "eslint.validate": ["javascript", "typescript"],'
  echo '  "prettier.documentSelectors": ["**/*.astro"],'
  echo '  "files.associations": {'
  echo '    ".env.local": "env",'
  echo '    "*.astro": "astro",'
  echo '    "*.css": "tailwindcss"'
  echo '  },'
  echo '  "typescript.preferences.importModuleSpecifier": "non-relative",'
  echo '  "typescript.updateImportsOnFileMove.enabled": "never",'
  echo '  "javascript.updateImportsOnFileMove.enabled": "never",'
  echo '}'
} >> "~/Library/Application Support/Code/User/settings.json"

# Browser
brew install --cask google-chrome
brew install --cask firefox
brew install --cask microsoft-edge
brew install --cask brave-browser

# Other misc software
brew install --cask vlc
brew install --cask kap
brew install --cask slack
brew install --cask ngrok


#######
# Reload profile files
#######
echo "source $SETUP_PROFILE  # alias and things added the setup script" >> "$HOME/.zsh_profile"
echo "source $SETUP_PROFILE  # alias and things added the setup script" >> ~/.bash_profile

source "$HOME/.zsh_profile"
source ~/.bash_profile