@echo off
echo Compiling Z+ Secure...
javac -cp "lib\bcprov-jdk18on-1.78.jar" -d target\classes src\main\java\com\secure\spg\*.java src\main\java\com\secure\spg\drbg\*.java

if %ERRORLEVEL% NEQ 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

echo.
echo Launching Z+ Secure...
echo.
java -cp "target\classes;lib\bcprov-jdk18on-1.78.jar" com.secure.spg.Main

pause

