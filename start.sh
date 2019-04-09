#!/bin/bash

if [ "$1" == "" ]; then
    echo "Please provide your sophilabs email as first argument"
    exit 1;
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install bash-completion
brew install python3
brew install git
brew install bash
brew install node

echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' > .bash_profile

ssh-keygen -b 4096 -C $1

username=`echo $1 | cut -d "@" -f 1`
git config --global --add user.email $1
git config --global --add user.name `echo username`
sudo sh -c 'echo "/usr/local/bin/bash" >> /etc/shells'
chsh -s /usr/local/bin/bash
