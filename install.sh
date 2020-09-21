#!/bin/bash

. ./log.sh

# head
print_head

# update & upgrade
print_term "Update and upgrade"

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
    print_error "invalid input"
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
    print_error "invalid input"
    continue 
  fi
done

sudo apt-get update
sudo apt-get upgrade

# tools
print_term "install vim"
sudo apt-get -y install vim
print_term "install neovim"
sudo apt-get -y install neovim
print_term "install tig"
sudo apt-get -y install tig
print_term "install zsh"
sudo apt-get -y install zsh
print_term "install curl"
sudo apt-get -y install curl
print_term "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
print_term "install autojump"
sudo apt-get install autojump
print_term "install spacevim"
curl -sLf https://spacevim.org/install.sh | bash
