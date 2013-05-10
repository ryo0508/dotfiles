files=('.tmux.conf' '.zlogin' '.zshenv' '.zshrc' '.zlogout' '.zprofile')

for f in "${files[@]}"
do
  if [ ! -h ${HOME}/${f} ]; then
    ln -s ${PWD}/${f} ${HOME}
    echo Symlink created for: ${f}
  else
    echo "${f} already exists :)"
  fi
done
