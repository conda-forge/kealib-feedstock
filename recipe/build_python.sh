
set -xe

cd python
rm -rf build
mkdir build
cd build

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" == "1" ]]; then
    # determine awkward version using some magic rather than importing (which fails due to binary modules)
    # Probably if I was better at working out the emulation stuff this wouldn't be needed...
    VER=`grep __version__ ${STDLIB_DIR}/site-packages/awkward/_version.py | awk '{print $NF}' | tr -d "'"`
    PLATFORM_OPTS="-D AWKWARD_VERSION=$VER"
else
    PLATFORM_OPTS=""
fi

cmake ${CMAKE_ARGS} -D CMAKE_BUILD_TYPE=Release \
    -D Python_EXECUTABLE=$PYTHON \
    -D CMAKE_INSTALL_PREFIX=$CONDA_PREFIX \
    -D CMAKE_PREFIX_PATH=$CONDA_PREFIX $PLATFORM_OPTS ..
    
make
make install
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
    ctest --output-on-failure
fi
