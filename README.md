# mac-setup

```shell
curl https://raw.githubusercontent.com/julianburr/mac-setup/main/mac-setup.sh | bash
```

Script for easier setup of a new mac as your dev machine. This script is based on https://github.com/thomaspoignant/mac-dev-setup which I've adjusted for my needs. It's supposed to run on a fresh MacOS machine and will install the following software:

- [Homebrew](https://brew.sh/)
- Terminal & command line helpers
  - [iTerm2](https://www.iterm2.com/)
  - zsh/[oh-my-zsh](https://ohmyz.sh/) - delightful community-driven (with 1500+ contributors) framework for managing your zsh configuration
  - [ack](https://github.com/beyondgrep/ack3/) - designed as a replacement for 99% of the uses of grep
  - [bash-completion](https://github.com/scop/bash-completion) - programmable completion functions for bash
  - [lsd](https://github.com/Peltoche/lsd) - next gen ls command
  - [tree](https://linux.die.net/man/1/tree) - recursive directory-listing program that produces a depth indented listing of files
  - [jq](https://stedolan.github.io/jq/) - lightweight and flexible command-line JSON processor
- [Git](https://git-scm.com/) & utilities
  - [oh-my-zsh git plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) - provides many aliases and a few useful functions
  - [gbh](https://github.com/julianburr/git-branch-history) - simple npm package to make changing between git branches more seemless
- NPM utilities
  - [nvm](https://github.com/nvm-sh/nvm)
  - [npm](https://www.npmjs.com/)
  - [yarn](https://yarnpkg.com/)
- Browsers
  - [Chrome](https://www.google.com/chrome/)
  - [Firefox](https://www.mozilla.org/firefox/)
  - [Edge](https://www.microsoft.com/en-us/edge?form=)
  - [Brave](https://brave.com/)
- [VSCode](https://code.visualstudio.com/) & extensions
  - [MJML](https://marketplace.visualstudio.com/items?itemName=attilabuti.vscode-mjml)
  - [ENV](https://marketplace.visualstudio.com/items?itemName=irongeek.vscode-env)
  - [Import Cost](https://marketplace.visualstudio.com/items?itemName=wix.vscode-import-cost)
  - [Todo Tree](https://marketplace.visualstudio.com/items?itemName=gruntfuggly.todo-tree)
  - [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
  - [Eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
  - [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
  - [Tailwind CSS](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
  - [Github Actions](https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions)
  - [Astro](https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode)
  - [GitLense](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
  - [GraphQL](https://marketplace.visualstudio.com/items?itemName=graphql.vscode-graphql)
  - [GraphQL Syntax](https://marketplace.visualstudio.com/items?itemName=graphql.vscode-graphql-syntax)
- [Slack](https://slack.com/)
- [Kap](https://getkap.co/)
- [VLC](https://www.videolan.org/vlc/)
- [Ngrok](https://ngrok.com/)
- [Docker](https://www.docker.com/)

## Manual steps after running the setup scripts

- SSH setup for Github
  - [Generate new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  - [Add a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

## How can I contribute?

This is mostly meant as my personal setup script and as inspiration for your own, so copy/paste it into your own repo to make the adjustments you want for your setup. If you find actual issues or potential improvements with this repo though, definitely feel free to open an issue or a pull request 🤓
