# 🧳 Blockchain Lost & Found Registry
A simple and unique blockchain project using Solidity.

## 📌 Project Overview
The Lost & Found Registry allows users to:
- Report a lost item
- Mark an item as found
- Mark an item as resolved
- View item details

This project uses a Solidity smart contract for immutability and transparency.

---

## 📂 Smart Contract File
- Located at: **contracts/LostAndFound.sol**

### Smart Contract Functions
- `reportLost(itemName, description)`
- `markFound(itemId)`
- `markResolved(itemId)`
- `getItem(itemId)`
- `getTotalItems()`

---

## 🚀 How to Test the Contract (Using Remix)
1. Open https://remix.ethereum.org  
2. Create file: **LostAndFound.sol**  
3. Paste the smart contract code  
4. Compile using Solidity 0.8.x  
5. Deploy using **JavaScript VM (London)**  
6. Test the functions:
   - Report a lost item
   - Mark found
   - Mark resolved
   - Check item details

---

## 🧪 Example Usage
1. `reportLost("Black Wallet", "Leather wallet with ID")`
2. `markFound(0)`
3. `markResolved(0)`
4. Use `getItem(0)` to view output

---

## 👤 Author
Abhishek  
BE IoT, Cybersecurity & Blockchain  
