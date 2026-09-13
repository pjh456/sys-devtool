history | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10

alias ll='ls -lah'
alias la='ls -A'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias grep='rg --color=auto'
alias cat='bat --paging=never'
alias py='python3'
