#!/bin/bash

mkdir build
cd build

cmake ${CMAKE_ARGS} -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D CMAKE_PREFIX_PATH=$PREFIX \
..

make -j $CPU_COUNT VERBOSE=1 V=1


