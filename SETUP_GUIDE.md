# Setup Guide for Z+ Secure

## Prerequisites Installation

This project requires **Java 11 or higher** and **Maven 3.6 or higher**.

### Step 1: Install Java JDK

1. **Download Java JDK 11 or higher:**
   - Visit: https://adoptium.net/ (recommended) or https://www.oracle.com/java/technologies/downloads/
   - Download JDK 11, 17, or 21 for Windows (x64)

2. **Install Java:**
   - Run the installer
   - **Important:** During installation, check the option to "Add to PATH" or add Java manually to PATH

3. **Verify Installation:**
   ```powershell
   java -version
   javac -version
   ```

### Step 2: Install Maven

1. **Download Maven:**
   - Visit: https://maven.apache.org/download.cgi
   - Download the Binary zip archive (apache-maven-3.9.x-bin.zip)

2. **Install Maven:**
   - Extract the zip file to a location like `C:\Program Files\Apache\maven`
   - Add Maven to your PATH:
     - Open System Properties → Environment Variables
     - Edit the "Path" variable under System variables
     - Add: `C:\Program Files\Apache\maven\bin` (or your Maven installation path)

3. **Set JAVA_HOME (if not set):**
   - Create a new System variable: `JAVA_HOME`
   - Set value to your JDK installation path (e.g., `C:\Program Files\Java\jdk-17`)

4. **Verify Installation:**
   ```powershell
   mvn -version
   ```

### Alternative: Use Chocolatey (if you have it)

If you have Chocolatey package manager installed:

```powershell
choco install openjdk17
choco install maven
```

## Running the Project

Once Java and Maven are installed:

### Option 1: Run with Maven (Recommended)

```powershell
# Navigate to project directory
cd C:\Users\Manoj\Downloads\Project\Z+Secure1

# Build and run
mvn clean compile exec:java -Dexec.mainClass="com.secure.spg.Main"
```

### Option 2: Build JAR and Run

```powershell
# Build the project
mvn clean package

# Run the JAR
java -cp target/secure-password-generator-1.0.0.jar com.secure.spg.Main
```

### Option 3: Compile and Run Manually

```powershell
# Compile
mvn clean compile

# Run (Maven will handle classpath)
mvn exec:java -Dexec.mainClass="com.secure.spg.Main"
```

## Troubleshooting

### Java not found
- Make sure Java is installed and added to PATH
- Restart your terminal/PowerShell after installation
- Verify with: `java -version`

### Maven not found
- Make sure Maven is installed and added to PATH
- Set JAVA_HOME environment variable
- Restart your terminal/PowerShell after installation
- Verify with: `mvn -version`

### Build errors
- Make sure you have internet connection (Maven downloads dependencies)
- Check that Java 11+ is installed
- Try: `mvn clean install -U` to force update dependencies



