fish_add_path /usr/local/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin

set -gx GIT_CONFIG_GLOBAL $HOME/.config/git/.gitconfig
set -gx EDITOR nvim
set -gx CONFIG_HOME $HOME/.config

abbr e $EDITOR
abbr f yazi
abbr m rmpc

abbr fc '$EDITOR $CONFIG_HOME/fish/config.fish && source $HOME/.config/fish/config.fish'
abbr tc '$EDITOR $CONFIG_HOME/tmux/tmux.conf && tmux source-file $HOME/.config/tmux/tmux.conf'
abbr ec '$EDITOR $CONFIG_HOME/nvim/' 
abbr yc '$EDITOR $CONFIG_HOME/yazi/'
abbr kc '$EDITOR $CONFIG_HOME/kitty/kitty.conf'
#abbr du 'sudo du -h --max-depth=1 2>/dev/null'

abbr tn 'tmux new-session -s'
abbr ta 'tmux attach-session'
abbr tl 'tmux list-sessions'

abbr gu gitui
abbr gs 'git status'
abbr gb 'git branch'
abbr gl 'git log'
abbr gr 'git reset --hard origin/mainline && git pull'
abbr gp 'git pull --rebase --autostash'
abbr gc 'git commit -a -m'
abbr ga 'git commit --amend -a'

set fish_greeting

function fish_prompt
    set_color red
    switch (hostname)
        case 'dev-dsk*'; echo -n '[devd] '
        # case '*'; echo -n '[mac] '
    end
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n '> '
end

# if status is-interactive
#     and not set -q TMUX # if not already in tmux
#     and set -q SSH_TTY # if connected using ssh
#     tmux attach-session -t main; or tmux new-session -s main
# end
