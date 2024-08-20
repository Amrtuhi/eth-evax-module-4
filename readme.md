# DEGEN TOKEN CREATION

This Solidity program is a simple "Degen gaming" program that demonstrates the use of Degen token from ERC20 to perform different tasks like minting, transfering, redeem and burn token.

## Description

This program is writing in Solidity and uses hardhat js config file for hardhat cinfiguration and it perform task like mint, burn,redeem and transfer token from one metamask account to another and which is shown in the snowtrace.

## Getting Started

### Executing program

->use remix Ethereum IDE to perform and run this program.
->use of snowtrace and metamask to connect with each other.
->metacmask should be in fuji C-Chain.
->write the code and connect in remix ide.
->copy address from metamask and paste it in the remix at address column.
->perform the task in the IDE.
->check it in the snowtrace wheather the task which are performed are displayed there or not.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Degen is ERC20, ERC20Burnable, Ownable {

    event ItemRedeemed(address indexed player, string itemName, uint256 tokensSpent);

    constructor() ERC20("degen", "DGN") Ownable(msg.sender) {}
        // The Ownable constructor automatically sets msg.sender as the owner, no need to specify explicitly
    

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function transferTokens(address to, uint256 amount) external returns (string memory) {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _transfer(msg.sender, to, amount);  // Direct transfer without unnecessary approval
        return "Transfer successful";
    }

    function storeInfo() external pure returns (string memory) {
        return "1. GAME NFT 100 tokens 2. GAME TSHIRT 750 tokens 3. ACCESSORIES 500 tokens";
    }

    function redeemTokens(uint256 option) external {
        uint256 tokensRequired;
        string memory itemName;

        if (option == 1) {
            tokensRequired = 100;
            itemName = "GAME NFT";
        } else if (option == 2) {
            tokensRequired = 750;
            itemName = "GAME TSHIRT";
        } else if (option == 3) {
            tokensRequired = 500;
            itemName = "ACCESSORIES";
        } else {
            revert("Invalid redeem option");
        }

        require(balanceOf(msg.sender) >= tokensRequired, "Insufficient balance to redeem");
        _burn(msg.sender, tokensRequired);

        // Emit an event that indicates the item redeemed
        emit ItemRedeemed(msg.sender, itemName, tokensRequired);
    }
}
```

## Help

-> version in compiler should be same  as the code
-> compile the code in injected provider environment
-> Metamask wallet should have some AVAX to perform the task.


## Authors

Amrita Kumari 
https://www.linkedin.com/in/amrita-kumari-753319232/


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
