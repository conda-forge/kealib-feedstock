
set -xe
env
cd python
rm -rf build
mkdir build
cd build

cmake ${CMAKE_ARGS} -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=$CONDA_PREFIX \
    -D CMAKE_PREFIX_PATH=$CONDA_PREFIX ..
    
make
make install
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
ctest --output-on-failure
fi
