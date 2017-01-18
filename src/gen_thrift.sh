#!/bin/bash
#-------------------------------------
# Filename gen_thrift.sh
# Revision 1.0
# Data 2016/11/21
# Des Install thrift
# author: pairs
# email:736418319@qq.com
# env: ubuntu
#-------------------------------------

script=$(readlink -f "$0")
route=$(dirname "$script")

HAS_CHECKINSTALL=`which checkinstall >/dev/null 2>&1 && echo true || echo false`

if [ "$HAS_CHECKINSTALL"x = "false"x ]; then
echo "--please install checkinstall first"
echo "-- down src : git clone http://checkinstall.izto.org/checkinstall.git"
exit -1;
fi

# init denps
sudo apt-get -y install automake bison flex g++ git libevent-dev libssl-dev libtool make pkg-config  autoconf zlib
sudo apt-get -y  install libboost-dev
sudo apt-get -y  install libboost-all-dev

# python denps
sudo apt-get -y install python-all python-all-dev python-all-dbg

# down thrift
if  [ !-d thrift ]; then
git clone https://github.com/apache/thrift.git
fi
cd thrift

# use cmake here
if [ -d tmp ]; then
sudo rm -rf tmp
fi
mkdir tmp
cd tmp && cmake ../ || exit 1
sudo make -j 1 || exit 2
sudo checkinstall -D --install=no --fstrans=no --default --pkgname=thrift --pkgversion=0.9.3 --pakdir=$route || exit 3
