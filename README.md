# 🎨 Blockchain Color Picker (Uniqueness Guaranteed)

<img width="1920" height="1080" alt="Screenshot 2025-10-29 140017" src="https://github.com/user-attachments/assets/3fed620b-05af-4d95-8217-f733e936d895" />
https://celo-sepolia.blockscout.com/address/0x92c26AAf6309b54ce50a084e3A28EeeC9433df3a
A beginner-friendly blockchain project that lets users **mint unique colors as NFTs** on Ethereum (or any EVM-compatible chain).  
Each color can be owned by only one wallet — **no two people can mint the same color**.  

Built using Solidity, Hardhat, and OpenZeppelin.

---

## 🧩 Overview

**ColorPicker** is an ERC-721 smart contract where every color (`#RRGGBB`) is represented as an NFT.  
Once a color is minted, it becomes permanently unique on-chain.  

This project demonstrates:
- How to create a simple ERC-721 NFT.
- How to enforce uniqueness of assets (like colors) on the blockchain.
- How to build & deploy contracts with Hardhat.




---

## ✨ Features

- 🖌️ **Mint a color** — claim any color as your own NFT.  
- 🔒 **Uniqueness guarantee** — no duplicate colors can exist.  
- 🧠 **Fully on-chain logic** — uniqueness enforced by the smart contract.  
- 🧾 **Metadata preview** — tokenURI includes color info and SVG image.  
- ⚙️ **Beginner-friendly Solidity** — clean and easy to understand.

---

## 🧠 Smart Contract Summary

| Function | Description |
|-----------|--------------|
| `mintColor(bytes3 color)` | Mint a new unique color as an NFT |
| `isColorTaken(bytes3 color)` | Check if a color is already minted |
| `tokenOfColor(bytes3 color)` | Get the token ID for a given color |
| `tokenURI(uint256 tokenId)` | Returns metadata & SVG for the color NFT |

---

## 🧱 Tech Stack

- **Solidity** (v0.8.19)
- **Hardhat** (development & testing)
- **OpenZeppelin** (ERC-721 & Ownable)
- **ethers.js** (for deployment/scripts)
- **Node.js** (v16+)

---

## ⚙️ Installation & Setup

```bash
# 1. Clone the repository
git clone https://github.com/<your-username>/colorpicker.git
cd colorpicker

# 2. Initialize a Node project
npm init -y

# 3. Install dependencies
npm install --save-dev hardhat @openzeppelin/contracts ethers hardhat-ethers

# 4. Create a Hardhat project
npx hardhat
# (choose "Create an empty hardhat.config.js" or "Sample project")

# 5. Add your Solidity contract
# Place ColorPicker.sol in the 'contracts/' folder
