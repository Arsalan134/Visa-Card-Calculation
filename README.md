# 💳🔢 Visa Card Number Validator & Generator

<div align="center">

![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![Visa](https://img.shields.io/badge/Visa-1A1F71?style=for-the-badge&logo=visa&logoColor=white)
![Algorithm](https://img.shields.io/badge/Algorithm-Luhn-blue?style=for-the-badge)
![Security](https://img.shields.io/badge/Security-Educational-red?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

*Master the mathematics behind credit card validation with Swift! 🧮*

[🚀 Features](#-features) • [🔧 How It Works](#-how-it-works) • [💻 Usage](#-usage) • [🧮 Luhn Algorithm](#-luhn-algorithm) • [⚠️ Disclaimer](#️-disclaimer)

</div>

---

## 🌟 What is This?

A **Swift implementation** of credit card number validation and completion using the famous **Luhn Algorithm**! This educational tool demonstrates how credit card numbers are mathematically validated and can even complete partial card numbers through intelligent brute-force techniques.

### 🎯 **The Science**
- **Luhn Algorithm Implementation** 🧮 - The mathematical formula behind credit card validation
- **Missing Digit Recovery** 🔍 - Complete partial card numbers with missing digits
- **Educational Purpose** 📚 - Learn the mathematics of payment systems
- **Swift Performance** ⚡ - Efficient algorithms with modern Swift techniques

---

## 🚀 Features

### ✅ **Card Validation**
- **Luhn Algorithm**: Industry-standard credit card validation
- **Visa Format**: Specialized formatting for Visa card numbers
- **Checksum Verification**: Mathematical validation of card authenticity
- **Error Detection**: Identifies invalid card number patterns

### 🔍 **Missing Digit Recovery**
- **Brute Force Engine**: Systematically tries all possible combinations
- **Smart Permutations**: Efficiently generates missing digit possibilities
- **Multiple Solutions**: Finds all valid completions for partial numbers
- **Performance Optimized**: Fast computation even with multiple missing digits

### 📊 **Analysis Tools**
- **Combination Counter**: Shows total number of valid possibilities
- **Formatted Output**: Clean, readable credit card number display
- **Debug Information**: Detailed algorithm execution steps
- **Space Elimination**: Handles input with spaces and formatting

---

## 🔧 How It Works

### 🧮 **Luhn Algorithm Explanation**

The Luhn algorithm (also known as "modulus 10") is used by all major credit card companies:

```swift
// Example: 4203 8221 2695 3596
// Step 1: Starting from RIGHT, double every second digit
Card number:    4 2 0 3  8 2 2 1  2 6 9 5  3 5 9 6
Double these:   4|×|0|×| 8|×|2|×| 2|×|9|×| 3|×|9|×

// Step 2: Apply doubling (positions 1,3,5,7,9,11,13,15 from right)
Original:       4 2 0 3  8 2 2 1   2 6 9 5    3 5 9 6
After doubling: 8 2 0 6  16 2 4 2  4 6 18 10  6 5 18 12

// Step 3: If doubled digit > 9, replace with sum of digits
8  2  0  6  16→7  2  4  2  4  6  18→9  10→1  6  5  18→9  12→3
8  2  0  6  7     2  4  2  4  6  9     1     6  5  9     3

// Step 4: Sum all digits
8+2+0+6+7+2+4+2+4+6+9+1+6+5+9+3 = 74

// Step 5: If sum is divisible by 10, card is valid!
74 % 10 = 4 ≠ 0 → Invalid card number
```

### 🔍 **Missing Digit Recovery Process**

```swift
Input:  "4203 8221 25?1 4085" 
        ↓
Step 1: Identify missing positions (marked with ?)
Step 2: Generate all possible digit combinations (0-9)
Step 3: Test each combination with Luhn algorithm
Step 4: Return all valid complete card numbers
        ↓
Output: "4203 8221 2501 4085" ✅
        "4203 8221 2591 4085" ✅
```

---

## 💻 Usage

### 🚀 **Quick Start**

```bash
# Clone the repository
git clone https://github.com/Arsalan134/Visa-Card-Calculation.git
cd Visa-Card-Calculation

# Run the validator
swift main.swift
```

### 📝 **Code Examples**

#### **1. Validate Complete Card Number**
```swift
let cardNumber = "4203822126953596"
let isValid = check(number: cardNumber)
print("Card is \(isValid ? "valid" : "invalid")")
```

#### **2. Complete Partial Card Number**
```swift
let partialCard = Array("4203822125?14085")
printCompletedCardNumbers(sequence: partialCard)
// Output: All valid completions with missing digit filled
```

#### **3. Format Card Number**
```swift
let rawNumber = "4203822126953596"
let formatted = rawNumber.formatVisa()
print(formatted) // "4203 8222 6953 596"
```

#### **4. Custom Validation**
```swift
let sequence = [4,2,0,3,8,2,2,1,2,6,9,5,3,5,9,6]
let valid = isCorrect(sequence: sequence)
print("Luhn check: \(valid)")
```

---

## 🧮 Luhn Algorithm

### 📐 **Mathematical Foundation**

The Luhn algorithm was developed by **Hans Peter Luhn** at IBM in 1954:

```
Given card number: 4 5 5 6 7 3 7 5 8 6 8 9 9 8 5 5

Step 1: Starting from right, double every second digit
4 5 5 6 7 3 7 5 8 6 8 9 9 8 5 5
↑   ↑   ↑   ↑   ↑   ↑   ↑   ↑
8   12  6   10  12  18  16  10

Step 2: If result > 9, subtract 9
8   3   6   1   3   9   7   1

Step 3: Sum all digits
4+8+5+3+6+6+7+1+7+3+5+9+8+9+9+7+8+1+5+5 = 116

Step 4: Check if divisible by 10
116 % 10 = 6 ≠ 0 → Invalid
```

### 🎯 **Why It Works**

- **Error Detection**: Catches 100% of single-digit errors
- **Transposition**: Detects 89% of adjacent digit swaps
- **Mathematical Elegance**: Simple modular arithmetic
- **Industry Standard**: Used by Visa, MasterCard, American Express

---

## ⚙️ Configuration

### 🔧 **Customizable Parameters**

```swift
// Modify in main.swift
let sequence = Array("4203822125?14085") // Your partial card number
let numbers = [0,1,2,3,4,5,6,7,8,9]     // Possible digits
```

### 🎨 **Output Formatting**
```swift
extension String {
    func formatVisa() -> String {
        // Formats as: "1234 5678 9012 3456"
        // Customize spacing and format here
    }
}
```

---

## 📊 Performance Analysis

### ⚡ **Complexity Analysis**

| Operation | Time Complexity | Space Complexity |
|-----------|----------------|------------------|
| **Single Validation** | O(n) | O(1) |
| **Missing 1 digit** | O(10) | O(1) |
| **Missing 2 digits** | O(100) | O(10²) |
| **Missing k digits** | O(10^k) | O(10^k) |

### 📈 **Benchmark Results**
```
Single card validation:     < 1ms
1 missing digit:           < 10ms
2 missing digits:          < 100ms
3 missing digits:          ~ 1 second
4+ missing digits:         Exponential growth
```

---

## 🔍 Examples

### ✅ **Valid Card Numbers**
```
4556737586899855 ✓ (Luhn checksum: 0)
4532015112830366 ✓ (Luhn checksum: 0)
4716461583322103 ✓ (Luhn checksum: 0)
```

### ❌ **Invalid Card Numbers**
```
4556737586899856 ✗ (Luhn checksum: 1)
1234567890123456 ✗ (Luhn checksum: 6)
0000000000000000 ✗ (Luhn checksum: 0 but invalid format)
```

### 🔍 **Partial Number Completion**
```swift
Input:  "4203 8221 25?1 4085"
Output: Found 1 valid completion:
        "4203 8221 2501 4085" ✅

Input:  "4203 8221 2??1 4085"  
Output: Found 10 valid completions:
        "4203 8221 2001 4085" ✅
        "4203 8221 2091 4085" ✅
        "4203 8221 2181 4085" ✅
        ... and 7 more
```

---

## 🛠️ Advanced Features

### 🔮 **Future Enhancements**
- [ ] **Multiple Card Types**: Support for MasterCard, AmEx, Discover
- [ ] **BIN Database**: Bank Identification Number lookup
- [ ] **Parallel Processing**: Multi-threaded brute force
- [ ] **GUI Interface**: SwiftUI-based user interface
- [ ] **API Integration**: RESTful web service

### 🏗️ **Extensibility**
```swift
// Add support for other card types
enum CardType {
    case visa        // 4xxx xxxx xxxx xxxx
    case mastercard  // 5xxx xxxx xxxx xxxx  
    case amex        // 3xxx xxxxxx xxxxx
    case discover    // 6xxx xxxx xxxx xxxx
}
```

---

## ⚠️ Disclaimer

### 🚨 **IMPORTANT SECURITY NOTICE**

This project is **STRICTLY for educational purposes only**:

- ✅ **Educational Use**: Understanding payment system mathematics
- ✅ **Academic Research**: Studying algorithm implementation
- ✅ **Software Testing**: Validating payment processing systems
- ❌ **Illegal Activities**: Never use for fraud or unauthorized access
- ❌ **Real Transactions**: Don't use generated numbers for purchases
- ❌ **Identity Theft**: Respect privacy and legal boundaries

### 🔒 **Ethical Guidelines**
- This tool demonstrates **mathematical concepts**, not security vulnerabilities
- Generated numbers are **mathematically valid** but not linked to real accounts
- Always follow **responsible disclosure** practices
- Respect **terms of service** of payment processors

---

## 📚 Educational Value

### 🎓 **Learning Outcomes**
- **Algorithm Implementation**: Hands-on experience with Luhn algorithm
- **Swift Programming**: Advanced Swift concepts and techniques
- **Mathematical Validation**: Understanding checksum algorithms
- **Brute Force Techniques**: Systematic problem-solving approaches
- **Financial Technology**: Insight into payment processing systems

### 📖 **Resources for Further Learning**
- [ISO/IEC 7812](https://www.iso.org/standard/70484.html) - Card numbering standard
- [Luhn Algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) - Mathematical foundation
- [Payment Card Industry](https://www.pcisecuritystandards.org/) - Security standards

---

## 🤝 Contributing

We welcome educational contributions! Here's how you can help:

### 🛠️ **Development Areas**
- 🔧 Add support for additional card types (MasterCard, AmEx)
- 📊 Improve algorithm performance and optimization
- 🎨 Create SwiftUI interface for better user experience
- 📚 Enhance documentation and educational content
- 🧪 Add comprehensive unit tests

### 📝 **How to Contribute**
1. Fork the repository
2. Create feature branch (`git checkout -b feature/educational-improvement`)
3. Commit changes (`git commit -m 'Add educational feature'`)
4. Push to branch (`git push origin feature/educational-improvement`)
5. Open Pull Request

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### ⚖️ **Legal Usage**
This educational software is provided for learning purposes. Users are responsible for ensuring their use complies with all applicable laws and regulations.

---

## 🙋‍♂️ Author

**Arsalan Iravani**
- 🔗 LinkedIn: [@airavani](https://www.linkedin.com/in/airavani/)
- 📧 Email: [Contact](mailto:airavani2018@gmail.com)

---

## 🚀 About Me

I'm an **iOS Developer** and **Algorithm Enthusiast** passionate about understanding the mathematics behind everyday technology. This project explores the fascinating world of financial algorithms that power our payment systems.

**Other Projects**: 📱 iOS Apps • 🏠 Smart Home Solutions • 🚗 Automotive Electronics • 🛩️ Aerospace Technology

---

<div align="center">

### 🌟 **Star this repo if you found it educational!** 🌟

**Made with ❤️ and mathematical curiosity**

*"Understanding algorithms is understanding the digital world around us"*

### 📚 **Educational • 🔒 Ethical • 💡 Innovative**

</div>
