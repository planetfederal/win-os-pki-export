@echo off

set CMAKE_BIN=Z:\DevTools\CMake34\bin
set PF=%PROGRAMFILES%
set PF86=%PROGRAMFILES(x86)%

call "%PF%\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /x64 /Release
call "%PF86%\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" amd64

path %PATH%;%CMAKE_BIN%

set BUILDCONF=RelWithDebInfo

echo "PATH: %PATH%"
echo "LIB: %LIB%"
echo "INCLUDE: %INCLUDE%"

cd "%~dp0"

rd /s /q build
md build
cd /D build

cmake -G "Visual Studio 10 Win64" ^
  -D CMAKE_CONFIGURATION_TYPES=%BUILDCONF% ^
  ..
if errorlevel 1 goto error

cmake --build . --config %BUILDCONF%
if errorlevel 1 goto error

REM cmake --build . --target INSTALL --config %BUILDCONF%
REM if errorlevel 1 goto error

:finish
exit /b

:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%
