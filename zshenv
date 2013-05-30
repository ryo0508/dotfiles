# ================================================================
# Version Control for Languages
# ================================================================
# rbenv
if which rbenv > /dev/null; then
  eval   "$(rbenv init - zsh)"
  # source "`$brew --prefix rbenv`/completions/rbenv.zsh"
fi

for function in ~/.zsh/functions/*; do
  source $function
done
