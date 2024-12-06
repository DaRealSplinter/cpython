SET VERSION=3.14.0
SET BUILD=prebuild
REM Select amd64/win32
SET CPU=amd64
SET DIRECTORY=python-%VERSION%%BUILD%-%CPU%

mkdir %DIRECTORY%

REM Create the DLLs folder and copy the contents to this directory
mkdir %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_asyncio.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_bz2.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_ctypes.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_ctypes_test.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_decimal.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_elementtree.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_hashlib.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_lzma.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_multiprocessing.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_overlapped.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_queue.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_socket.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_sqlite3.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_ssl.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testbuffer.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testcapi.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testclinic.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testclinic_limited.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testconsole.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testimportmultiple.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testinternalcapi.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testlimitedcapi.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testmultiphase.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_testsinglephase.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_tkinter.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_uuid.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_wmi.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\_zoneinfo.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\libcrypto-3.dll %DIRECTORY%\DLLs
copy PCbuild\%CPU%\libffi-8.dll %DIRECTORY%\DLLs
copy PCbuild\%CPU%\libssl-3.dll %DIRECTORY%\DLLs
copy PCbuild\%CPU%\pyexpat.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\select.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\sqlite3.dll %DIRECTORY%\DLLs
copy PCbuild\%CPU%\tcl86t.dll %DIRECTORY%\DLLs
copy PCbuild\%CPU%\tk86t.dll %DIRECTORY%\DLLs
copy PCbuild\%CPU%\unicodedata.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\winsound.pyd %DIRECTORY%\DLLs
copy PCbuild\%CPU%\zlib1.dll %DIRECTORY%\DLLs
copy PC\icons\py.ico %DIRECTORY%\DLLs
copy PC\icons\pyc.ico %DIRECTORY%\DLLs
copy PC\icons\pyd.ico %DIRECTORY%\DLLs

REM Not found in cpython
copy .support_files\DLLs\python_lib.cat %DIRECTORY%\DLLs
xcopy .support_files\Scripts %DIRECTORY%\Scripts /E /H /C /I

REM Create Doc directory and copy the html directory
mkdir %DIRECTORY%\Doc
xcopy Doc\build\html %DIRECTORY%\Doc\html /E /H /C /I

REM Copy Include directory
xcopy Include %DIRECTORY%\include /E /H /C /I

REM Copy Lib directory
xcopy Lib %DIRECTORY%\Lib /E /H /C /I

REM Create libs directory and copy files
mkdir %DIRECTORY%\libs
copy PCbuild\%CPU%\_tkinter.lib %DIRECTORY%\libs
copy PCbuild\%CPU%\python3.lib %DIRECTORY%\libs
copy PCbuild\%CPU%\python314.lib %DIRECTORY%\libs

REM Copy tcltk\lib directory to tcl
xcopy externals\tcltk-8.6.15.0\%CPU%\lib %DIRECTORY%\tcl /E /H /C /I

REM Copy the remaining files
copy PCbuild\%CPU%\LICENSE.txt %DIRECTORY%\
REM copy PCbuild\%CPU%\NEWS.txt %DIRECTORY%\
copy PCbuild\%CPU%\python.exe %DIRECTORY%\
copy PCbuild\%CPU%\python3.dll %DIRECTORY%\
copy PCbuild\%CPU%\python314.dll %DIRECTORY%\
copy PCbuild\%CPU%\pythonw.exe %DIRECTORY%\
copy PCbuild\%CPU%\vcruntime140.dll %DIRECTORY%\
copy PCbuild\%CPU%\vcruntime140_1.dll %DIRECTORY%\

REM Zip the folder for distribution
tar czf %DIRECTORY%.tgz %DIRECTORY%
