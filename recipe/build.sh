#!/bin/bash

if [ `uname` == Darwin ]; then
    export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
fi

cd trunk
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D CMAKE_SKIP_RPATH=ON \
-D HDF5_INCLUDE_DIR=$PREFIX/include \
-D HDF5_LIB_PATH=$PREFIX/lib \
.

make
make install
make test
