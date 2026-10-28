# 🧮 Secure Calculator Smart Contract

A secure, access-controlled arithmetic calculator smart contract built with **Solidity ^0.8.20** and tested using **Foundry**. 

This contract implements fundamental mathematical operations with role-based access control, division-by-zero protection, state tracking, and comprehensive event logging.

---

## 📌 Architecture & Features

- **Role-Based Access Control (`onlyAdmin`):** Restricts sensitive operations (such as division) to an authorized administrator address defined at deployment.
- **Arithmetic Safety & Validation:** Implements strict checks to prevent common math vulnerabilities, including division-by-zero protection and zero-address validation for the admin role.
- **State Persistence:** Stores the latest computation result publicly (`resultado`), allowing external contracts and frontends to read ongoing states instantly.
- **Comprehensive Event Logging:** Emits explicit events (`Addition`, `Substraction`, `Multiplier`, `Division`) for every calculation, ensuring seamless off-chain tracking and indexing.

---

## 🛠 Tech Stack & Tools

- **Language:** Solidity `^0.8.20`
- **Framework:** Foundry (Forge & Cast)
- **Target Network:** EVM Compatible Chains

---

## 🚀 Smart Contract Overview

### Core Functions

1. **`constructor(uint256 firstResultado_, address admin_)`**
   - Initializes the contract state with an initial result and assigns the administrator address (validating against the zero address).

2. **`addition(uint256 firstNumber_, uint256 secondNumber_)`**
   - Performs addition, updates the global state, and emits the `Addition` event.

3. **`substraction(uint256 firstNumber_, uint256 secondNumber_)`**
   - Executes subtraction, updates state, and emits the `Substraction` event.

4. **`multiplier(uint256 firstNumber_, uint256 secondNumber_)`**
   - Multiplies values, updates state, and emits the `Multiplier` event.

5. **`division(uint256 firstNumber_, uint256 secondNumber_)` *(Admin Only)***
   - Protected by `onlyAdmin`. Validates that the divisor is not zero, computes the division, updates state, and emits the `Division` event.

---

## ⚡ Quickstart & Testing (Foundry)

### 1. Clone Repository & Install Dependencies
```bash
git clone [https://github.com/mtmoises/calculator-smart-contract.git](https://github.com/mtmoises/calculator-smart-contract.git)
cd calculator-smart-contract
forge install
