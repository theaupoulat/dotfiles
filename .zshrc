export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(nvm git zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Configuration
alias src="source $HOME/.zshrc"
alias conf="nvim $HOME/.zshrc"
alias init="cd $HOME/.config/nvim/ && nvim init.lua"


# TMUX
alias ts="tmux_session_list"
tmux_session_list() {
    tmux a -t $(tmux list-sessions -F '#{session_name}' | fzf)
}

# Git Workflow
alias gundo='git reset --soft HEAD~1'
alias gcm="git commit -m"
alias gap="git add -p"
alias sb="git branch --sort=-committerdate | head -8 | fzf --height=10 | xargs git checkout"
alias prs='git log main --author="$(git config user.name)"'

alias checks="gh pr checks --watch"
alias pr="gh pr create -a theaupoulat -d --body="""
function ship {
  gh pr create -a theaupoulat --label='[ ship ] ci-please-approve-and-automerge' "$@" && claude "/review the pr for the current branch"
}
alias prw='gh pr view --web'

# Brag
export BRAG_DIR=~/Documents/brag

# Kubernetes
alias kctx="k ctx"
alias kns="k ns"
alias kns_staging="k ns gke_marketplace-staging-273515_europe-west1-d_app-cluster"
alias kns_prod="k ns gke_marketplace-production-274216_europe-west1-d_app-cluster"
alias stern="k stern"
alias sqlproxy='$HOME/Code/infrastructure/scripts/connect-to-sql-proxy.sh'

# Inato DX
alias inato="cd $HOME/Code/inato-marketplace"
alias work="inato && nvim ."
alias infra="cd $HOME/Code/infrastructure"
alias b="pnpm run -w server"
alias d="pnpm run -w domain"
alias dt="d typecheck"
alias dl="d lint:fix"
alias f="pnpm run -w marketplace"
alias kernel="pnpm run -w kernel"
alias pcb="pnpm run clean-build"
alias frmt="pnpm run format"
alias ehrdev='USE_LOCAL_STORAGE=false pnpm run ehr dev'
alias deploy="open https://inato.semaphoreci.com/"

# Inato marketplace navigation
alias ep="open http://localhost:3000/sites/76d64be0-760e-4d9b-813b-20592451ca55/application/ed72f9d1-a961-4996-9e3d-b26983422d9d"
alias tr="open http://localhost:3000/trials/51168569-a1e9-441f-b864-f121bec63682/site-selection/sites/recommended\?sortBy\=mostRelevant"
alias sp="open http://localhost:3000/sites/76d64be0-760e-4d9b-813b-20592451ca55/site-profile"

alias s_ep="open https://marketplace.staging.inato.com/sites/76d64be0-760e-4d9b-813b-20592451ca55/application/ed72f9d1-a961-4996-9e3d-b26983422d9d"
alias s_tr="open https://marketplace.staging.inato.com/trials/51168569-a1e9-441f-b864-f121bec63682/site-selection/sites/recommended\?sortBy\=mostRelevant"
alias s_sp="open https://marketplace.staging.inato.com/sites/76d64be0-760e-4d9b-813b-20592451ca55/site-profile"




export NODE_OPTIONS="--max_old_space_size=8192"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="~/.krew/bin:$PATH"

export PATH="/Users/theau/.devcontainers/bin:$PATH"


export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/theau/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


. "$HOME/.local/bin/env"
