#!/bin/sh

# Definition of a few fonction

info () {
  printf " [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


# Actual code

echo ''
info 'Setting up the personnal gnuplot configuration'
info '=============================================='
echo ''

info 'Backing up current gnuplot config'
info '---------------------------------'
if [ -x "$HOME/.gnuplot" ]
then
  today=`date +%Y%m%d`
  mv $HOME/.gnuplot $HOME/.gnuplot.$today
EOF
fi

echo ''
info 'Downloading the configuration'
info '-----------------------------'

if [ -x "/usr/bin/git" ] ; then
  if [ -x "$HOME/.gnuConf" ] ; then
    cd $HOME/.gnuConf
    git pull --quiet
    cd
  else
    git clone --quiet 'https://github.com/HoplaGeiss/gnuplotConfiguration' "$HOME/.gnuConf"
  fi
  mv $HOME/.gnuConf/gnuplot $HOME/.gnuplot
else
  fail 'Please install git'
fi
echo '.gnuplot imported'


success 'Setup complete. Enjoy!!'
