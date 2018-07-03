#!/bin/sh
set -e -x

if which puppet > /dev/null ; then
    echo "Puppet is already installed"
    exit 0
fi

export DEBIAN_FRONTEND=noninteractive
wget -qO /tmp/puppetlabs-release-pc1-xenial.deb https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb

dpkg -i /tmp/puppetlabs-release-pc1-xenial.deb
rm /tmp/puppetlabs-release-pc1-xenial.deb
sudo apt-get --assume-yes install aptitude
aptitude update
echo Installing puppet
aptitude install -y puppet
echo "Puppet installed!"