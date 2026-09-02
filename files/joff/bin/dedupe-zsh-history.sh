#!/bin/bash

: "${HISTFILE:=$HOME/.zsh_history}"

cp "${HISTFILE}" "${HISTFILE}.bak"

awk -F';' '
{
  cmd = substr($0, index($0, ";") + 1)
  lines[NR] = $0
  cmds[NR] = cmd
  last[cmd] = NR
}
END {
  for (i = 1; i <= NR; i++)
    if (last[cmds[i]] == i) print lines[i]
}' "$HISTFILE.bak" > "$HISTFILE"
