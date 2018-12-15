if [[ ! -o interactive ]]; then
    return
fi

compctl -K _bl bl

_bl() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(bl commands)"
  else
    completions="$(bl completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
