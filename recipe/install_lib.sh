
cd build
make install
if [[ ("${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "") ]]; then
    export ASAN_OPTIONS="verbosity=1:malloc_context_size=20"
    ctest --output-on-failure
fi
