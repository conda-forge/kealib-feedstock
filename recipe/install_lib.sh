
cd build
make install
if [[ ("${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "") ]]; then
# && ($(uname) != "Darwin") ]]; then
    make test
fi
