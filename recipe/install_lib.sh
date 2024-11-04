
cd build
make install
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
    CTEST_OUTPUT_ON_FAILURE=1 make test
    $OTOOL -L ./src/test1
    $OTOOL -l ./src/test1
fi
