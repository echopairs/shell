#!/bin/sh
script=$(readlink -f "$0")
route=$(dirname "$script")
HAS_CHECKINSTALL=`which checkinstall >/dev/null 2>&1 && echo true || echo false`
if [ "$HAS_CHECKINSTALL"x = "false"x ]; then
echo "--please install checkinstall first: sudo apt install checkinstall" || exit 1;
fi
# init autoconf
sudo apt-get install -y build-essential autoconf  libtool >/dev/null 2>&1
#:<<!
# get source code if dir exsits just remove it.(the code may be incomplete)
[ -d "$route/grpc" ] && rm -rf grpc
git clone -b $(curl -L http://grpc.io/release) https://github.com/grpc/grpc
#!
# update submodule
cd grpc
git submodule update --init
# init grpc
make -j 2 || (echo "init grpc failed") || exit 2
sudo checkinstall -D --install=no --fstrans=no --default --pkgname=grpc --pkgversion=1.0.0 --pakdir=$route || exit 3
# init protobuf
cd third_party/protobuf
autoreconf -f -i -Wall,no-obsolete
./configure
make -j 2 || exit 4
sudo checkinstall -D --install=no --fstrans=no --default --pkgname=protobuf --pkgversion=3.0.0-GA --pakdir=$route || exit 5
