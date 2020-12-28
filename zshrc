# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sporty_256"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting colored-man-pages)

# User configuration

# Customize to your needs...
export GOPATH="$HOME/Go"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$GOPATH/bin:$GOPATH/src/github.com/uber/go-torch/FlameGraph:$HOME/.yarn/bin::/usr/local/opt/python/libexec/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# z
. `brew --prefix`/etc/profile.d/z.sh

#powerful mv
autoload -U zmv

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# aliases
source ~/.aliases

# Disable title automatic renamer
export DISABLE_AUTO_TITLE='true'
# /usr/local/opt/android-sdk
export ANDROID_HOME=~/Library/Android/sdk




PATH="/Users/thomashaddad/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/thomashaddad/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/thomashaddad/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/thomashaddad/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/thomashaddad/perl5"; export PERL_MM_OPT;
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export RUSTUP_HOME=~/.rustup
export RUSTROOT=~/.asdf/installs/rust/1.29.0
export CARGO_HOME=$RUSTROOT/bin
export PATH=$PATH:$RUSTROOT/bin
# Base16 Shell
BASE16_SHELL="$HOME/.base16-manager/chriskempson/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

function link_wttj_cms_shared() {
  cd /Users/thomashaddad/dev/wttj-cms-shared && yarn link
  cd /Users/thomashaddad/dev/wk-dashboard-react && yarn link wttj-cms-shared && yarn
  cd /Users/thomashaddad/dev/wttj-front && yarn link wttj-cms-shared && yarn
}

function unlink_wttj_cms_shared() {
  cd /Users/thomashaddad/dev/wk-dashboard-react && yarn unlink wttj-cms-shared
  cd /Users/thomashaddad/dev/wttj-front && yarn unlink wttj-cms-shared && yarn
  cd /Users/thomashaddad/dev/wttj-cms-shared && yarn unlink && yarn
  cd /Users/thomashaddad/dev/wttj-cms-shared
}
export GNUPGHOME="bash /usr/local/opt/asdf/keyrings/nodejs"

function pair_ngrok() {
  ssh -p $2 $1@0.tcp.ngrok.io -i ~/.ssh/id_rsa  -o "UserKnownHostsFile /dev/null"
}

function get_secret() {
  if [[ $2 == "parameter" ]]; then
    aws ssm get-parameter --name $1 --with-decryption --output json | jq -r '.Parameter.Value'
  else
    aws ssm get-parameter --name /aws/reference/secretsmanager$1 --with-decryption --output json | jq -r '.Parameter.Value | fromjson | to_entries[] | [.key,.value | tostring] | join("=")'
  fi
}

function ssh_jump() {
  ssh -A -J $1 -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" $2
}

if test "$SSH_AUTH_SOCK" ; then
  ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
export HOMEBREW_GITHUB_API_TOKEN=09cad8779ee3891d9cca6b4109fcb6a17a40a793
export CPATH=/Library/Developer/CommandLineTools/usr/include/c++/v1
