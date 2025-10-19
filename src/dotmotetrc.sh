#!/usr/bin/env bash

## ~/.motetrc
## motet developer experience workflows

##

msg() {
  echo "hello world"
}

upd() {
  ## updater
  sudo apt update && sudo apt upgrade -y
}

proc1() {

  upd
  ## essentials
  sudo apt install jq yq bc -y  
  sudo apt install nano zip tree unzip -y
  sudo apt install sqlite3 -y


#  curl -sSL https://bit.ly/install-xq | sudo bash
}

proc2() {
  ## gh cli
  curl -sS https://webi.sh/gh | sh
}

proc3() {
  upd
  ## python3 and doctech
  sudo apt install -y python3-{pil,qrcode,venv,pygments}
  sudo apt install -y weasyprint pandoc mkdocs pylint
}

proc5() {
  upd
  ## media tools
  sudo apt install ffmpeg espeak-ng sox -y
}

proc6() {
    upd
    # ide
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
    
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    
    upd
    sudo apt install -y sublime-text
}

proc22() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash  
  echo 

  echo "now try this: $ nvm install 22"
  echo
}

proc84() {
  ## php84.sh
  ## installs PHP 8.4 on Debian

  upd
  sudo apt -y install lsb-release ca-certificates curl apt-transport-https
  sudo curl -sSLo /tmp/debsuryorg-archive-keyring.deb https://packages.sury.org/debsuryorg-archive-keyring.deb
  sudo dpkg -i /tmp/debsuryorg-archive-keyring.deb
  sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
upd

  sudo apt install -y php8.4-common php8.4-{cli,bcmath,bz2,curl,gd,gmp,intl,mbstring,opcache,readline,xml,zip}

}

proc90() {
  ## backup dotfiles
  echo
}


gitupd() {

  ## uses latest commit to setup glt globals

  if [[ -z $(command -v git) ]]; then
    echo "[gitupd.sh] you need to install git"
    echo "[gitupd.sh] try: $ sudo apt install git"
    return
  fi

  if [[ -z $(git log) ]]; then
    echo "[gitupd.sh] not a git folder"
    return
  fi

  ## user section (after Author:)
  a=$(git log | grep @ | tail -1);
  b=${a##*:}
  USER=$(echo ${b%%<*} | xargs)

  ## email section
  d=${a##*<}
  EMAIL=${d%%>*}

  ## set the config
  git config --global user.name "$USER"
  git config --global user.email "$EMAIL"

  ## get the config
  git config --global user.name
  git config --global user.email
}

