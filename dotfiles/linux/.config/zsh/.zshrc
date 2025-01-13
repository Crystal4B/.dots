umask 0022
export http_proxy="http://proxy.ubisoft.org:3128"
export https_proxy="http://proxy.ubisoft.org:3128"
export no_proxy="localhost,127.0.0.1,.ubisoft.org,.ubisoft.onbe"
export PATH="/usr/local/go/bin:/home/msek/go/bin:${PATH}"
export KUBECONFIG="/home/msek/.kube/config"
. <(usc completion zsh)
compdef _usc usc
. <(r6s completion zsh)
compdef _r6s r6s
. <(cg completion zsh)
compdef _cg cg
