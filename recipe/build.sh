#!/bin/bash

mkdir build
cd build

EXTRA=
if [[ $(uname) == "Darwin" ]]; then
    SANITIZE="-fsanitize=address,alignment,unreachable,vla-bound,vptr"
    EXTRA='-DCMAKE_EXE_LINKER_FLAGS="$SANITIZE" -DCMAKE_CXX_FLAGS="$SANITIZE"'
fi

cmake ${CMAKE_ARGS} -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D CMAKE_PREFIX_PATH=$PREFIX $EXTRA \
..

make -j $CPU_COUNT


