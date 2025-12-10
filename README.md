# Z+ Secure - Password Generator

**Z+ Secure** is a user-friendly password generator that creates extremely strong, secure passwords to protect your online accounts and data. Think of it as a digital lock maker that creates keys so complex that even supercomputers would take centuries to crack them!

## 🎯 What Does It Do?

Z+ Secure generates random, unpredictable passwords that are:
- **Super Strong**: Uses military-grade encryption technology
- **Unpredictable**: Each password is completely random - no patterns
- **Customizable**: You choose the length and character types
- **Safe**: Complies with international security standards (NIST SP 800-90B)

## ✨ Key Features

### 1. **Smart Password Generation**
- Creates passwords using advanced random number generators
- Ensures every password is unique and unpredictable
- Supports different security levels (Fast, Standard, Maximum Security)

### 2. **Customizable Options**
- **Password Length**: Choose how long you want your password (1-256 characters)
- **Character Types**: Select which characters to include:
  - Uppercase letters (A-Z)
  - Lowercase letters (a-z)
  - Numbers (0-9)
  - Special characters (!@#$%^&* etc.)
  - Phonetic symbols (optional)
- **No Repetition**: Option to prevent characters from repeating

### 3. **Password Strength Indicator**
- Shows you exactly how long it would take to crack your password
- Displays time in easy-to-understand format (years, months, days, centuries)
- Example: "few centuries, 5 years, 3 months and 15 days time needed to crack this password"

### 4. **User-Friendly Interface**
- Simple, clean design that anyone can use
- Password history to see your recently generated passwords
- One-click copy to clipboard
- Beautiful popup notifications with animations

## 🔒 How Secure Is It?

### The Technology Behind It

Z+ Secure uses three different encryption methods (you can choose which one):

1. **KMAC DRBG (Fast)**: 
   - Uses advanced mathematical functions
   - Fastest option
   - Still extremely secure

2. **HMAC DRBG (Standard)**:
   - Uses cryptographic hash functions
   - Good balance of speed and security
   - Widely used in banking systems

3. **CMAC DRBG (Maximum Security)**:
   - Uses AES-256 encryption (same as banks and governments)
   - Highest security level
   - Slightly slower but most secure

### Security Standards

- **NIST SP 800-90B Compliant**: Follows international security guidelines
- **AES-256 Security**: 256-bit encryption strength (same as military-grade)
- **True Randomness**: Uses secure random number generation

## 📊 How It Works (Simple Explanation)

### Step 1: You Set Your Preferences
- Choose password length
- Select which character types to use
- Pick security level (Fast/Standard/Maximum)

### Step 2: The Generator Creates Randomness
- Collects random data from your computer (like digital dice rolling)
- Uses advanced algorithms to turn this randomness into password characters
- Ensures the password meets your requirements

### Step 3: You Get Your Password
- A strong password appears instantly
- You can copy it with one click
- The system shows you how secure it is

### Step 4: Password Strength Calculation
- Calculates all possible password combinations
- Estimates how long it would take to try all combinations
- Shows you the result in easy-to-understand time units

## 🚀 Getting Started

### Requirements
- **Java 11 or higher** (free download from [Adoptium](https://adoptium.net/))
- **Windows, Mac, or Linux** operating system

### Quick Start

1. **Download and Extract** the project files
2. **Double-click** `Launch Password Generator.bat` (Windows) or run the JAR file
3. **Choose your settings**:
   - Set password length (recommended: 16-42 characters)
   - Select character types
   - Choose generation speed
4. **Click "Generate"** to create your password
5. **Copy** the password to use it

### Using the Application

#### Basic Usage
1. Open the application
2. Set your desired password length using the spinner
3. Select which character types to include (checkboxes)
4. Choose generation speed (Fast is recommended for most users)
5. Click the "Generate" button
6. Copy your password using the "Copy to Clipboard" button

#### Advanced Options
- **No Repetition**: Check this if you don't want any character to appear twice
- **Phonetic Symbols**: Include special phonetic characters (rarely needed)
- **Password History**: View your last 10 generated passwords in the right panel

## 📈 Understanding Password Strength

### What Makes a Password Strong?

1. **Length**: Longer passwords are stronger
   - 8 characters: Weak (can be cracked in minutes)
   - 16 characters: Good (can take years)
   - 42+ characters: Excellent (can take centuries)

2. **Character Variety**: More character types = stronger password
   - Using uppercase, lowercase, numbers, and symbols makes it much harder to crack

3. **Randomness**: No patterns or words
   - "Password123" is weak (predictable)
   - "K9#mP@2xQ$vL7!" is strong (random)

### Reading the Time Estimate

When you generate a password, you'll see a message like:
- **"few decades, 5 years, 3 months and 15 days time needed to crack this password"**

This means:
- Even with the fastest computers trying billions of guesses per second
- It would take that long to try all possible combinations
- Your password is extremely secure!

## 🛠️ Technical Details (Simplified)

### What is DRBG?
**DRBG** stands for "Deterministic Random Bit Generator" - it's a fancy way of saying "a machine that creates truly random numbers for security purposes."

Think of it like:
- **Regular random**: Like rolling dice (can be predicted)
- **DRBG random**: Like quantum particle behavior (truly unpredictable)

### Why Three Different Methods?

Different methods have different strengths:
- **KMAC**: Fastest, great for everyday use
- **HMAC**: Balanced, used by many banks
- **CMAC**: Most secure, used by governments

All three are extremely secure - choose based on your needs!

## 📁 Project Structure

```
Z+Secure1/
├── src/main/java/com/secure/spg/
│   ├── Main.java                    # Application entry point
│   ├── PasswordGeneratorGUI.java    # User interface
│   ├── SecurePasswordGenerator.java # Password generation logic
│   ├── PasswordStrengthCalculator.java # Security strength calculator
│   └── drbg/                        # Encryption algorithms
│       ├── HMACDRBG.java
│       ├── CMACDRBG.java
│       └── KMACDRBG.java
├── lib/                             # Required libraries
├── Launch Password Generator.bat    # Quick launcher (Windows)
└── README.md                        # This file
```

## 🔧 Building from Source

### Using Maven (Recommended)

```bash
# Compile the project
mvn clean compile

# Run the application
mvn exec:java -Dexec.mainClass="com.secure.spg.Main"

# Create executable JAR
mvn clean package
```

### Manual Compilation

```bash
# Compile Java files
javac -cp "lib/bcprov-jdk18on-1.78.jar" -d target/classes src/main/java/com/secure/spg/*.java src/main/java/com/secure/spg/drbg/*.java

# Run the application
java -cp "target/classes;lib/bcprov-jdk18on-1.78.jar" com.secure.spg.Main
```

## 💡 Tips for Using Passwords

1. **Use a Password Manager**: Store your generated passwords securely
2. **Never Share Passwords**: Keep them private
3. **Use Unique Passwords**: Different password for each account
4. **Update Regularly**: Change important passwords every few months
5. **Copy Carefully**: Make sure you copy the entire password

## ❓ Frequently Asked Questions

### Q: How long should my password be?
**A**: For most accounts, 16-32 characters is excellent. For very sensitive accounts (banking, email), 42+ characters is recommended.

### Q: Which generation speed should I use?
**A**: "Fast (KMAC)" is recommended for most users. It's still extremely secure and generates passwords quickly.

### Q: Is this really secure?
**A**: Yes! The technology used is the same as what banks and governments use. Your passwords are generated using military-grade encryption.

### Q: Can I use the same password twice?
**A**: Technically yes, but it's not recommended. Each password generated is random, so duplicates are extremely unlikely anyway.

### Q: What if I forget my password?
**A**: Z+ Secure doesn't store passwords. Make sure to save them in a password manager or secure location.

## 📝 License

This project is provided as-is for secure password generation purposes.

## 🙏 Acknowledgments

- Built using **BouncyCastle** cryptography library
- Complies with **NIST SP 800-90B** standards
- Follows **AES-256** security specifications

## 📞 Support

For issues or questions:
1. Check the `SETUP_GUIDE.md` for installation help
2. Read `USER_GUIDE.md` for usage instructions
3. Review the troubleshooting sections in the guides

---

**Remember**: Strong passwords are your first line of defense online. Z+ Secure makes it easy to create passwords that are both strong and secure!
