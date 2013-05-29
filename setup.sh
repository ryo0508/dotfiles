#!/bin/sh

for name in *; do

  target="${HOME}/.${name}"

  if [ -e ${target} ]; then
    echo "Symlink already there: ${target}"
  else
    # ファイルがなかったら
    if [ ${name} != 'setup.sh' ] && [ ${name} != 'README.md' ]; then
      echo "Creating ${target}"
      ln -s "${PWD}/${name}" ${target}
    fi
  fi
done

# Sample: https://github.com/thoughtbot/dotfiles/blob/master/install.sh
