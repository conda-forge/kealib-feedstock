#!/bin/bash

cd trunk

mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D CMAKE_PREFIX_PATH=$PREFIX \
..

make
make install
make test

