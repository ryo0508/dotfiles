#!/bin/sh

FORCE=false

while getopts :f opt; do
  case ${opt} in
    f)
      FORCE=true;;
    \?)
      exit 1;;
  esac
done


for name in *; do

  target="${HOME}/.${name}"

  if [ -e ${target} ]; then
    if [ -h ${target} ]; then
      if ${FORCE} ; then
        ln -snf "${PWD}/${name}" ${target}; echo "overwrote: ${target}";
      else
        # シンボリックリンクだったら上書きするか聞く
        read -p "Do you wanna overwrite existing symlink: ${target}?" yn
        case $yn in
          [Yy]* ) ln -snf "${PWD}/${name}" ${target}; echo "done!";;
          [Nn]* ) echo "Ok";;
          * )  echo "Please answer something... :(";;
        esac
      fi
    else
      echo "Can't update ordinary file: ${target}"
    fi
  else
    # ファイルがなかったら
    if [ ${name} != 'setup.sh' ] && [ ${name} != 'README.md' ]; then
      echo "Creating ${target}"
      ln -s "${PWD}/${name}" ${target}
    fi
  fi
done

# Sample: https://github.com/thoughtbot/dotfiles/blob/master/install.sh
