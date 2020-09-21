#!/bin/bash
# Author: zouxu

. ./log.sh

# macros
ll_install='sudo apt-get -y install'

# head
ll_print_head

# update & upgrade
ll_print_term "Update and upgrade"

echo "Replace source \"http://cn.archive.ubuntu.com/ubuntu/\""
while true; do
  echo "1. press <enter>  set default \"https://mirrors.aliyun.com/ubuntu/\""
  echo "2. press <s>      set new"
  echo "3. press <n>      do nothing"
  read isSet
  if [ -z ${isSet} ]; then
    sudo sed -i s\#http://cn.archive.ubuntu.com/ubuntu/\#https://mirrors.aliyun.com/ubuntu/\#g /etc/apt/sources.list
    break
  elif [ ${isSet}x == 's'x ]; then
    read -p "new source:" ArchiveUbuntu
    sudo sed -i s\#http://cn.archive.ubuntu.com/ubuntu/\#${ArchiveUbuntu}\#g /etc/apt/sources.list
    break
  elif [ ${isSet}x == 'n'x ]; then
    break
  else
    ll_print_error "invalid input"
    continue 
  fi
done

echo "Replace source \"http://security.ubuntu.com/ubuntu/\""
while true; do
  echo "1. press <enter>  set default \"https://mirrors.aliyun.com/ubuntu/\""
  echo "2. press <s>      set new"
  echo "3. press <n>      do nothing"
  read isSet
  if [ -z ${isSet} ]; then
    sudo sed -i s\#http://security.ubuntu.com/ubuntu\#https://mirrors.aliyun.com/ubuntu/\#g /etc/apt/sources.list
    break
  elif [ ${isSet}x == 's'x ]; then
    read -p "new source:" SecurityUbuntu
    sudo sed -i s\#http://security.ubuntu.com/ubuntu\#${SecurityUbuntu}\#g /etc/apt/sources.list
    break
  elif [ ${isSet}x == 'n'x ]; then
    break
  else
    ll_print_error "invalid input"
    continue 
  fi
done

sudo apt-get update
sudo apt-get upgrade

# tools
ll_print_term "install aptitude"
${ll_install} aptitude

ll_print_term "install python3"
${ll_install} python3

ll_print_term "install python2"
${ll_install} python2

ll_print_term "install vim"
${ll_install} vim

ll_print_term "install neovim"
${ll_install} neovim

ll_print_term "install tig"
${ll_install} tig

ll_print_term "install zsh"
${ll_install} zsh

ll_print_term "install curl"
${ll_install} curl

ll_print_term "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ll_print_term "install autojump"
${ll_install} autojump

ll_print_term "install spacevim"
curl -sLf https://spacevim.org/install.sh | bash
