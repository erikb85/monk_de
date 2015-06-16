#!/bin/bash

# start project environment
test ! -d /home/erikb85/monk_de && mkdir /home/erikb85/monk_de
cd /home/erikb85/monk_de
test ! -d repos && mkdir repos
test ! -d venvs && mkdir venvs
cd repos

# create repos where needed
test ! -d monk && git clone git@github.com:DFE/MONK monk
test ! -d tfw && git clone git@bitbucket.org:dresearchfe/testframework tfw

# start session
SESSION="monk-$(date +"%H%M%s")"
tmux new-session -d -s $SESSION

tmux set-window-option -t $SESSION -g automatic-rename off

# initialize devenvs

# initialize monk
tmux new-window -k -n "monk"
tmux send-keys 'cd /home/erikb85/monk_de' Enter
tmux send-keys 'cd repos' Enter
tmux send-keys 'cd monk' Enter
tmux send-keys 'git fetch' Enter
tmux send-keys 'clear' Enter
tmux send-keys 'git log --oneline --graph --decorate --all --max-count=10' Enter

# initialize tfw
tmux new-window -k -n "tfw"
tmux send-keys 'cd /home/erikb85/monk_de' Enter
tmux send-keys 'cd repos' Enter
tmux send-keys 'cd tfw' Enter
tmux send-keys 'git fetch' Enter
tmux send-keys 'clear' Enter
tmux send-keys 'git log --oneline --graph --decorate --all --max-count=10' Enter

# finishing it up
tmux select-window -t 0
tmux send-keys 'tmux rename-window overview' Enter
tmux send-keys 'clear' Enter

tmux -2 attach -t $SESSION
