#
# General
#

ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH=$HOME/oh-my-zsh
source $ZSH/oh-my-zsh.sh

export CDPATH=$HOME:$HOME/repos

# ls -A after cd'ing
function chpwd() {
	ls -A
}

#
# History
#

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE



#
# Aliases
#

# 
# use neovim
alias vim='nvim'
# edit general settings
alias vimrc="vim ~/repos/dotfiles/nvim/general/settings.vim"
# edit init.vim
alias vimi="vim ~/repos/dotfiles/nvim/init.vim"
alias vimplug="vim ~/repos/dotfiles/nvim/vim-plug/plugins.vim"
# reload .zshrc file
alias zshconfig="source ~/.zshrc"
# edit zsh theme
alias zshtheme="vim ~/repos/dotfiles/zsh/brandor.zsh-theme"
# edit .zshrc
alias zshrc="vim ~/repos/dotfiles/zsh/.zshrc"
# edit zsh custom theme
alias zshtheme="vim ~/repos/dotfiles/zsh/brandor.zsh-theme"
alias c="clear"
alias ll="ls -l"
alias lal="ls -al"
alias chrome="open -a \"Google Chrome\""
alias wm="vim ~/.working_memory.txt"

#
# SFDO Specific
#
alias cu="c; cd ~/repos/cumulusci"
alias cumulusci="c; cd ~/repos/cumulusci"
alias ccic="c; cd ~/repos/cumulusci; code ."
alias metaci="c; cd ~/repos/metaci; source env; bin/unpack-node"
alias mci="c; cd ~/repos/metaci; source env; bin/unpack-node"
alias metadeploy="c; cd ~/repos/metadeploy; source env; bin/unpack-node"
alias mdp="c; cd ~/repos/metadeploy; source env; bin/unpack-node"
alias metecho="c; cd ~/repos/metashare"
alias npsp="c; cd ~/repos/npsp"
alias statusite="c; cd ~/repos/statusite"
alias tube="c; cd ~/repos/tubular"


#
# CumulusCI
#
alias ccihome='cd ~/.cumulusci'
alias ccilog='vim ~/.cumulusci/logs/cci.log'
alias ccfi='cci flow info'
alias ccfl='cci flow list'
alias ccfr='cci flow run'
alias ccob='cci org browser'
alias ccoc='cci org connect'
alias ccod='cci org default'
alias ccoi='cci org info'
alias ccol='cci org list'
alias ccor='cci org remove'
alias ccos='cci org scratch'
alias ccsd='cci org scratch_delete'
alias ccrm='cci org scratch_delete'
alias ccpc='cci project cd'
alias ccpd='cci project dependencies'
alias ccpi='cci project info'
alias ccpl='cci project list'
alias ccsc='cci service connect'
alias ccsl='cci service list'
alias ccss='cci service show'
alias cctd='cci task doc'
alias ccti='cci task info'
alias cctl='cci task list'
alias cctr='cci task run'
alias ccupg='pip install --upgrade cumulusci'
function ccicmd() {
        cci task run command eval($1)
}

function ccidevnew() {
    cci org scratch_delete $1
    cci org default $1
    cci org browser 
}

# grep for task
function gft() {
    cci task list | grep $1
}

# grep for flow
function gff() {
    cci flow list | grep $1
}

# grep in universal cumulusci.yml file
# first param is the string you want to search in the universal cumulusci.yml file
# second param is lines of context _after_ a match is detected.
function ccyml() {
    grep $1 ~/repos/cumulusci/cumulusci/cumulusci.yml -A $2 --line-num    
}

function metacib {
    /usr/bin/open -a "/Applications/Google Chrome.app" https://mrbelvedereci.herokuapp.com/builds/$1 
}

# Search python docs (python doc search)
function pds() {
    /usr/bin/open -a "/Applications/Google Chrome.app" https://docs.python.org/3/search.html?q=$1
}

# JavaScript dependency updates made easy
alias yarn-upgrade="yarn upgrade-interactive --latest"
alias yarn-reset="rm -rf node_modules/ yarn.lock; yarn"

function ccidevnew() {
    cci org scratch_delete $1
    cci org default $1
    cci org browser 
}

#
# git stuff
#
alias g='git'
alias gsl='git stash list'
alias gsp='git stash pop'
alias prune_branches='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

# git stash drop @index
function gsd {
    git stash drop @{$1}
}

# grep history
function ghist {
    history | grep $1 | tail -n 30
}

# add all changes, commit, and push dotfiles
function save_dots() {
    cd dotfiles; git add . ; g commit -m 'savepoint' ; git push ; cd - ;
}

plugins=(
    colored-man-pages
    heroku
    pip
    vundle
)
