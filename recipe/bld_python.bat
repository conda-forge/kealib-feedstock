cd python
rd /s /q build
mkdir build
cd build

cmake -G "NMake Makefiles" -D CMAKE_BUILD_TYPE=Release ^
    -D Python_EXECUTABLE=%PREFIX%\python.exe ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ..
if errorlevel 1 exit 1
    
nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1
ctest --output-on-failure
if errorlevel 1 exit 1
