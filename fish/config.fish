fish_vi_key_bindings

function fish_user_key_bindings
    bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

alias v "nvim"
alias grep 'grep --color=auto'                                          # Color grep - highlight desired sequence
alias ccat 'highlight --out-format=ansi'                                # Color cat - print file with syntax highlight
alias mkd 'mkdir -pv'                                                   # make a complete path if doesn't exist, print if made
alias fz 'fzf-tmux'                                                     # open fuzzy finder in a new tmux pane
alias nm 'sudo nmap -sn 192.168.1.1/24'                                 # use nmap to scan the common /24 subnet without doing a port scan
alias x 'chmod +x'
alias cl "clear; ls -alh"
alias c "clear"
alias wanip 'dig @resolver1.opendns.com ANY myip.opendns.com +short'    # get current WAN ip of machine 
alias rmswp 'find . -type f -name "*.sw[klmnop]" -delete'               # TODO: get comment from wystan

function pop
   sed -i '' -e '$ d' $1
end

function tn
  tmux new -s $argv[1]
end

function ta
  tmux a -t $argv[1]
end

function ts
  tmux ls
end

funcsave pop
funcsave ta
funcsave tn
funcsave ts

