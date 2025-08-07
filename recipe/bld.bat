if not exist %PREFIX% mkdir %PREFIX%
if not exist %LIBRARY_LIB%\x64 mkdir %LIBRARY_LIB%\x64
if not exist %LIBRARY_BIN%\x64 mkdir %LIBRARY_BIN%\x64

echo ON
echo Current directory: %CD%
echo Listing source files:
dir /s
echo.
echo Checking if lib\x64 exists:
if exist lib\x64 (
    echo lib\x64 exists, moving files:
    move lib\x64\* %LIBRARY_LIB%\x64
) else (
    echo lib\x64 does not exist
)
echo.
echo Checking if bin\x64 exists:
if exist bin\x64 (
    echo bin\x64 exists, moving files:
    move bin\x64\* %LIBRARY_BIN%\x64
) else (
    echo bin\x64 does not exist
)
echo.
echo Checking if include exists:
if exist include (
    echo include exists, moving files:
    move include\* %LIBRARY_INC%
) else (
    echo include does not exist
)
echo.
echo Final structure:
dir %LIBRARY_BIN%\x64
dir %LIBRARY_LIB%\x64
