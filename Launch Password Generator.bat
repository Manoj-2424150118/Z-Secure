@echo off
title Z+ Secure
echo ========================================
echo   Z+ Secure
echo   Creating strong passwords to protect your data
echo ========================================
echo.

REM Check if Java is installed
java -version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Java is not installed or not in PATH
    echo Please install Java 11 or higher from https://adoptium.net/
    pause
    exit /b 1
)

REM Check if compiled classes exist
if not exist "target\classes\com\secure\spg\PasswordGeneratorGUI.class" (
    echo Compiling application...
    javac -cp "lib\bcprov-jdk18on-1.78.jar" -d target\classes src\main\java\com\secure\spg\*.java src\main\java\com\secure\spg\drbg\*.java
    if %ERRORLEVEL% NEQ 0 (
        echo Compilation failed!
        pause
        exit /b 1
    )
    echo Compilation successful!
    echo.
)

echo Launching Password Generator...
echo.
java -cp "target\classes;lib\bcprov-jdk18on-1.78.jar" com.secure.spg.Main

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo An error occurred while running the application.
    pause
)

