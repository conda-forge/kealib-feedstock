
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
-D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
-D CMAKE_BUILD_TYPE=Release ^
-G "NMake Makefiles" ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

