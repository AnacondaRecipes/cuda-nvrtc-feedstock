@echo ON
echo ========================================
echo BUILD SCRIPT DEBUGGING
echo ========================================
echo Current directory: %CD%
echo PREFIX: %PREFIX%
echo LIBRARY_LIB: %LIBRARY_LIB%
echo LIBRARY_BIN: %LIBRARY_BIN%
echo LIBRARY_INC: %LIBRARY_INC%
echo.

if not exist %PREFIX% (
    echo Creating PREFIX directory: %PREFIX%
    mkdir %PREFIX%
) else (
    echo PREFIX directory already exists: %PREFIX%
)

if not exist %LIBRARY_LIB%\x64 (
    echo Creating LIBRARY_LIB\x64 directory: %LIBRARY_LIB%\x64
    mkdir %LIBRARY_LIB%\x64
) else (
    echo LIBRARY_LIB\x64 directory already exists: %LIBRARY_LIB%\x64
)

if not exist %LIBRARY_BIN%\x64 (
    echo Creating LIBRARY_BIN\x64 directory: %LIBRARY_BIN%\x64
    mkdir %LIBRARY_BIN%\x64
) else (
    echo LIBRARY_BIN\x64 directory already exists: %LIBRARY_BIN%\x64
)

echo.
echo ========================================
echo SOURCE DIRECTORY STRUCTURE
echo ========================================
echo Listing all files and directories:
dir /s
echo.

echo ========================================
echo CHECKING SOURCE DIRECTORIES
echo ========================================
echo Checking if lib\x64 exists:
if exist lib\x64 (
    echo lib\x64 EXISTS - contents:
    dir lib\x64
    echo.
    echo Moving lib\x64 files to %LIBRARY_LIB%\x64:
    move lib\x64\* %LIBRARY_LIB%\x64
    echo Move completed. New contents of %LIBRARY_LIB%\x64:
    dir %LIBRARY_LIB%\x64
) else (
    echo lib\x64 DOES NOT EXIST
    echo Checking if lib directory exists:
    if exist lib (
        echo lib exists, contents:
        dir lib
    ) else (
        echo lib directory does not exist
    )
)
echo.

echo Checking if bin\x64 exists:
if exist bin\x64 (
    echo bin\x64 EXISTS - contents:
    dir bin\x64
    echo.
    echo Moving bin\x64 files to %LIBRARY_BIN%\x64:
    move bin\x64\* %LIBRARY_BIN%\x64
    echo Move completed. New contents of %LIBRARY_BIN%\x64:
    dir %LIBRARY_BIN%\x64
) else (
    echo bin\x64 DOES NOT EXIST
    echo Checking if bin directory exists:
    if exist bin (
        echo bin exists, contents:
        dir bin
    ) else (
        echo bin directory does not exist
    )
)
echo.

echo Checking if include exists:
if exist include (
    echo include EXISTS - contents:
    dir include
    echo.
    echo Moving include files to %LIBRARY_INC%:
    move include\* %LIBRARY_INC%
    echo Move completed. New contents of %LIBRARY_INC%:
    dir %LIBRARY_INC%
) else (
    echo include DOES NOT EXIST
)
echo.

echo ========================================
echo FINAL INSTALLED STRUCTURE
echo ========================================
echo Final LIBRARY_BIN\x64 contents:
dir %LIBRARY_BIN%\x64
echo.
echo Final LIBRARY_LIB\x64 contents:
dir %LIBRARY_LIB%\x64
echo.
echo Final LIBRARY_INC contents:
dir %LIBRARY_INC%
echo ========================================
