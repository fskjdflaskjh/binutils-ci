#! /bin/bash -ex

. config

mkdir build
cd build
wget ${BINUTILS_URL} -O binutils.tar.gz
tar -xf binutils.tar.gz
cd binutils-gdb*
mkdir build && cd build
../configure --prefix=`pwd`/root --target=${TARGET_TRIPLET} ${BINUTILS_CONFIGURE_PARAMETERS[@]}
make -j
make check
