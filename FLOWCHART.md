# Z+ Secure - Application Flowchart

This document explains how Z+ Secure works using simple flowcharts and diagrams.

## 📊 Main Application Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    START APPLICATION                         │
│              (User launches Z+ Secure)                       │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│              INITIALIZE APPLICATION                          │
│  • Load GUI components                                       │
│  • Set up password generator                                 │
│  • Prepare encryption algorithms                             │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│              DISPLAY MAIN WINDOW                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Password Length: [16]                               │   │
│  │  Character Sets: ☑ Uppercase  ☑ Lowercase          │   │
│  │                 ☑ Digits      ☑ Special             │   │
│  │  Speed: [Fast (KMAC)]                                │   │
│  │  [Generate Button]                                   │   │
│  └─────────────────────────────────────────────────────┘   │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
              ┌────────┴────────┐
              │  User Clicks    │
              │  "Generate"     │
              └────────┬────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│           VALIDATE USER INPUT                                │
│  • Check if at least one character set is selected          │
│  • Verify password length is valid                          │
└──────────────────────┬──────────────────────────────────────┘
                       │
              ┌────────┴────────┐
              │  Valid?         │
              └────────┬────────┘
         ┌─────────────┴─────────────┐
         │ NO                         │ YES
         ▼                            ▼
┌──────────────────┐    ┌─────────────────────────────────────┐
│  Show Error      │    │  START PASSWORD GENERATION          │
│  Message         │    │  • Collect random data              │
│  "Please select  │    │  • Initialize encryption algorithm  │
│   at least one   │    │  • Prepare character set            │
│   character set" │    └──────────────┬──────────────────────┘
└──────────────────┘                   │
                                       ▼
                    ┌──────────────────────────────────────┐
                    │  GENERATE RANDOM BYTES               │
                    │  Using selected DRBG algorithm:      │
                    │  • KMAC (Fast)                       │
                    │  • HMAC (Standard)                   │
                    │  • CMAC (Maximum Security)           │
                    └──────────────┬───────────────────────┘
                                   │
                                   ▼
                    ┌──────────────────────────────────────┐
                    │  CONVERT BYTES TO PASSWORD           │
                    │  • Map random bytes to characters    │
                    │  • Ensure character diversity        │
                    │  • Apply "no repetition" if enabled  │
                    └──────────────┬───────────────────────┘
                                   │
                                   ▼
                    ┌──────────────────────────────────────┐
                    │  CALCULATE PASSWORD STRENGTH         │
                    │  • Count total possible combinations │
                    │  • Calculate cracking time           │
                    │  • Format time in readable format    │
                    └──────────────┬───────────────────────┘
                                   │
                                   ▼
                    ┌──────────────────────────────────────┐
                    │  DISPLAY RESULTS                     │
                    │  • Show generated password           │
                    │  • Enable copy button                │
                    │  • Add to password history           │
                    │  • Show popup with cracking time     │
                    └──────────────┬───────────────────────┘
                                   │
                                   ▼
                    ┌──────────────────────────────────────┐
                    │  POPUP ANIMATION                     │
                    │  1. Fade in (0.4 seconds)            │
                    │  2. Display (5 seconds)              │
                    │  3. Fade out (0.4 seconds)           │
                    │  4. Close popup                      │
                    └──────────────────────────────────────┘
                                   │
                                   ▼
                    ┌──────────────────────────────────────┐
                    │  WAIT FOR NEXT ACTION                │
                    │  • User can generate another         │
                    │  • User can copy password            │
                    │  • User can view history             │
                    └──────────────────────────────────────┘
```

## 🔐 Password Generation Process (Detailed)

```
┌─────────────────────────────────────────────────────────────┐
│              PASSWORD GENERATION PROCESS                     │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  STEP 1: COLLECT ENTROPY     │
        │  (Gather random data)        │
        │  • System random numbers     │
        │  • Current time              │
        │  • System properties         │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  STEP 2: INITIALIZE DRBG     │
        │  (Set up encryption engine)  │
        │  • Choose algorithm:         │
        │    - KMAC (Fast)             │
        │    - HMAC (Standard)         │
        │    - CMAC (Maximum)          │
        │  • Feed entropy to algorithm │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  STEP 3: GENERATE RANDOM     │
        │  (Create random bytes)       │
        │  • Request random bytes      │
        │  • Algorithm processes data  │
        │  • Returns unpredictable     │
        │    random numbers            │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  STEP 4: BUILD CHARACTER SET │
        │  (Based on user selection)   │
        │  • Uppercase: A-Z (26)       │
        │  • Lowercase: a-z (26)       │
        │  • Digits: 0-9 (10)          │
        │  • Special: !@#$... (26)     │
        │  • Total: Up to 88 chars     │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  STEP 5: MAP TO PASSWORD     │
        │  (Convert bytes to chars)    │
        │  • Take random byte          │
        │  • Find position in charset  │
        │  • Add character to password │
        │  • Repeat for each position  │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  STEP 6: ENSURE DIVERSITY    │
        │  (Quality check)             │
        │  • Verify all selected types │
        │    are included              │
        │  • Check "no repetition"     │
        │    if enabled                │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  STEP 7: RETURN PASSWORD     │
        │  (Final result)              │
        │  • Secure random password    │
        │  • Ready to use              │
        └──────────────────────────────┘
```

## ⏱️ Password Strength Calculation Flow

```
┌─────────────────────────────────────────────────────────────┐
│         PASSWORD STRENGTH CALCULATION                        │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  GET PASSWORD DETAILS        │
        │  • Length: e.g., 16 chars    │
        │  • Character set size: 88    │
        │  • No repetition: Yes/No     │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  CALCULATE COMBINATIONS      │
        │  If no repetition:           │
        │    P(n,r) = n!/(n-r)!        │
        │  If repetition allowed:      │
        │    Total = charset^length    │
        │  Example: 88^16 = huge!      │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  USE AVERAGE CASE            │
        │  (More realistic estimate)   │
        │  Average = Total / 2         │
        │  (On average, find password  │
        │   after trying half)         │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  CALCULATE CRACKING TIME     │
        │  Time = Combinations /       │
        │         Attack Speed         │
        │                              │
        │  Attack speeds:              │
        │  • Fast offline: 100B/sec    │
        │  • Standard: 1B/sec          │
        │  • Online: 1,000/sec         │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  FORMAT TIME                 │
        │  • Convert seconds to:       │
        │    - Centuries (100+ years)  │
        │    - Decades (10+ years)     │
        │    - Years (1-9)             │
        │    - Months                  │
        │    - Days                    │
        │  • Show as "few centuries,   │
        │    5 years, 3 months..."     │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  DISPLAY IN POPUP            │
        │  • Fade in animation         │
        │  • Show time estimate        │
        │  • Fade out animation        │
        └──────────────────────────────┘
```

## 🎨 User Interface Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    MAIN WINDOW LAYOUT                        │
└─────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────┐
│  HEADER: "Z+ Secure"                                         │
│  "Generate Strong, Secure Passwords..."                      │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌─────────────────────────┐  ┌──────────────────────────┐  │
│  │  LEFT PANEL             │  │  RIGHT PANEL             │  │
│  │  (Controls)             │  │  (History)               │  │
│  │                         │  │                          │  │
│  │  Password Length: [16]  │  │  Password History        │  │
│  │                         │  │  ┌────────────────────┐  │  │
│  │  Speed: [Fast]          │  │  │ 1. abc123...       │  │  │
│  │                         │  │  │ 2. xyz789...       │  │  │
│  │  Character Sets:        │  │  │ 3. def456...       │  │  │
│  │  ☑ Uppercase            │  │  │ ...                │  │  │
│  │  ☑ Lowercase            │  │  └────────────────────┘  │  │
│  │  ☑ Digits               │  │                          │  │
│  │  ☑ Special              │  │  [Clear History]         │  │
│  │                         │  │                          │  │
│  │  [Generate Button]      │  │                          │  │
│  │                         │  │                          │  │
│  │  [Password Field]       │  │                          │  │
│  │                         │  │                          │  │
│  │  [Copy to Clipboard]    │  │                          │  │
│  │                         │  │                          │  │
│  │  Status: ✓ Generated    │  │                          │  │
│  └─────────────────────────┘  └──────────────────────────┘  │
│                                                               │
├──────────────────────────────────────────────────────────────┤
│  FOOTER: Security information                                │
└──────────────────────────────────────────────────────────────┘

                    ┌──────────────┐
                    │  POPUP       │
                    │  (Bottom)    │
                    │              │
                    │  "few        │
                    │   centuries, │
                    │   5 years,   │
                    │   3 months   │
                    │   time       │
                    │   needed..." │
                    │              │
                    └──────────────┘
```

## 🔄 Complete User Journey

```
USER ACTION                    SYSTEM RESPONSE
─────────────────────────────────────────────────────────────

1. Launch App          →    Display main window
                           Initialize generator
                           Show default settings

2. Adjust Settings     →    Update UI controls
   (Length, types)          Enable/disable options

3. Click "Generate"    →    Validate input
                           Show "Generating..." status
                           
                           ↓
                           
                           Collect random data
                           Initialize encryption
                           Generate random bytes
                           Convert to password
                           Calculate strength
                           
                           ↓
                           
                           Display password
                           Enable copy button
                           Add to history
                           Show popup (fade in)
                           
4. View Popup          →    Display cracking time
   (5 seconds)              Fade out after 5s

5. Click "Copy"        →    Copy to clipboard
                           Show "Copied!" message

6. Use Password        →    Paste in application
                           Save in password manager

7. Generate Another    →    Repeat from step 3
```

## 🧮 Mathematical Concepts (Simplified)

### How Many Possible Passwords?

**Example: 16-character password with 88-character set**

```
Total Combinations = 88^16
                   = 88 × 88 × 88 × ... (16 times)
                   = 1,853,020,188,851,841,000,000,000,000,000,000
                   (That's 1.8 decillion!)

Average to Try = Total / 2
               = 926,510,094,425,920,500,000,000,000,000,000,000
```

### How Long to Crack?

```
Time = Average Combinations / Attack Speed

Fast Attack (100 billion/sec):
  = 926,510,094,425,920,500,000,000,000,000,000,000 / 100,000,000,000
  = 9,265,100,944,259,205,000,000,000,000 seconds
  = 293,000,000,000,000,000,000,000 years
  = "few centuries" (simplified display)
```

## 📱 Key Components Interaction

```
┌──────────────────┐
│  Main.java       │  ← Entry point
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ PasswordGenerator│  ← User interface
│ GUI.java         │
└────────┬─────────┘
         │
    ┌────┴────┐
    │         │
    ▼         ▼
┌─────────┐ ┌──────────────────────┐
│ Secure  │ │ PasswordStrength     │
│ Password│ │ Calculator.java      │
│ Generator│ │                      │
│ .java   │ │ • Calculate time     │
│         │ │ • Format display     │
│ • Generate│ │ • Show popup        │
│ • DRBG   │ └──────────────────────┘
│ • Charset│
└────┬────┘
     │
     ▼
┌──────────────────┐
│  DRBG Classes    │
│  • HMACDRBG      │
│  • CMACDRBG      │
│  • KMACDRBG      │
└──────────────────┘
```

---

## 🎓 Learning Points

1. **Randomness is Key**: True randomness makes passwords unpredictable
2. **Length Matters**: Longer passwords = exponentially more secure
3. **Variety Helps**: More character types = harder to crack
4. **Time is Security**: The longer it takes to crack, the more secure

## 💭 Think of It Like...

- **Password Generator** = A super-smart dice roller that never repeats patterns
- **DRBG Algorithms** = Different types of "dice" (all are secure, some are faster)
- **Character Set** = The "sides" of your dice (more sides = more possibilities)
- **Password Length** = How many times you roll the dice
- **Cracking Time** = How long it would take to try every possible combination

---

**Remember**: The goal is to create passwords so complex that even the fastest computers would need centuries to crack them. Z+ Secure makes this easy!


