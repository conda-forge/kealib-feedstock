cd build

nmake install
if errorlevel 1 exit 1

nmake test
if errorlevel 1 exit 1
