# Bash completion support
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source $(brew --prefix)/etc/bash_completion

# Iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Go language environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/work/go

# The next line enables shell command completion for git
test -e "${HOME}/git-completion.bash" && source "${HOME}/git-completion.bash"

# The next line updates PATH for adb fastboot
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
  export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

# The next line updates PATH for pip installed packages
if [ -d "/usr/local/opt/python/libexec/bin" ] ; then
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"
fi

export PATH="$HOME/bin:$GOROOT/bin:$GOPATH/bin:/usr/local/sbin:$PATH"

test -e "$(which vim)" && alias vi=$(which vim)

# Ovftool alias
alias ovftool="/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool"


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Kubectl bash completion support
source <(kubectl completion bash)
# minikube bash completion support
source <(minikube completion bash)
# helm bash completion support
source <(helm completion bash)

# pip completion support
eval "`pip completion --bash`"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/net-snmp/bin:$PATH"
export PATH="/usr/local/opt/net-snmp/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arvindc/google-cloud-sdk/path.bash.inc' ]; then source '/Users/arvindc/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arvindc/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/arvindc/google-cloud-sdk/completion.bash.inc'; fi
