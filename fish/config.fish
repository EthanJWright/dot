export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export SHELL=/usr/bin/fish

starship init fish | source
set fish_greeting

function zls
    z --list
end

function ls
    exa --long --header --git --icons --git-ignore
end

function lsa
    exa --long --header --git --icons --all
end

function lst
    exa --long --header --git --icons --tree --level=3 --git-ignore
end

function fd
    fdfind
end

function m
    touch $1; open -a MacVim.app $1 ;
end

function n
    cd ~/.notes
end
function s
    cd ~/.sandbox
end
function o
    cd ~/Dropbox/Obsidian/
end
function od
    cd ~/Dropbox/Obsidian/Dragon\ Heist
end

function ow
    cd ~/Dropbox/Obsidian/Work
end

function wtr
    curl wttr.in
end

function v
    nvim $argv
end
function vls
    nvim -S ~/.vim/sessions/$1.vim;
end
function vs
    ls ~/.vim/sessions;
end
alias grep='grep --color=auto'
alias ccat='highlight --out-format=ansi'
alias cat='bat '
alias mkd='mkdir -pv'
alias fz='fzf-tmux'
alias nm='sudo nmap -sn 192.168.1.1/24'
alias x='chmod +x'
alias c="clear"
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias rmswp='find . -type f -name "*.sw[klmnop]" -delete'
function pop
    sed -i '' -e '$ d' $1 ;
end
alias q='exit'
alias r='ranger'
alias open='xdg-open'
function tr
    mv "$argv ~/.trash;"
end



function gc
    git commit -m "$argv" ;
end
function gi
    curl -sL https://www.toptal.com/developers/gitignore/api/$argv >> .gitignore;
end
alias gp='git push'
alias gs='git status'

function tn
    tmux new -s $1 ;
end
function ta
    tmux a -t $1 ;
    end
function ts
    tmux ls ;
end

function tm
    tmux attach-session -t main || tmux new-session -s main
end


# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467C
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
