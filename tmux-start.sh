#!/usr/bin/env bash

# Resolve the parent directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# List of session names, just give list of projects
SESSIONS=(
  "ai"
  "practice"
  "octopotatogames"
  "roblox"
  "homelab"
)

WINDOWS=(
  "editor"
  "shell"
  "logs"
)

for SESSION in "${SESSIONS[@]}"; do
  # Create session with first window
  tmux new-session -d -s "$SESSION" -n "${WINDOWS[0]}" -c "$PARENT_DIR"

  # Create remaining windows
  for ((i=1; i<${#WINDOWS[@]}; i++)); do
    tmux new-window -t "$SESSION" -n "${WINDOWS[$i]}" -c "$PARENT_DIR"
  done
done

# Attach to the first session
tmux attach-session -t "${SESSIONS[0]}"
