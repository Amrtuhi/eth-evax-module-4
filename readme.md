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
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract Degen is ERC20, ERC20Burnable, Ownable {
    constructor
    (
        string memory name,
        string memory symbol,
        address initialOwner
    ) 
    ERC20(name, symbol) Ownable(initialOwner) 
    {}

    function mint(address to, uint256 amount) public onlyOwner 
    {
        _mint(to, amount);
    }

    function balance() external view returns (uint256) 
    {
        return this.balanceOf(msg.sender);
    }

    function tranfer(address to, uint256 value)
        external
        returns (string memory)
    {
        require(balanceOf(msg.sender) >= value);
        approve(msg.sender, value);
        transferFrom(msg.sender, to, value);
        return "success";
    }

    function storeinfo() external pure returns (string memory) 
    {
        return
            "1. GAME NFT  100tokens 2. GAME TSHIRT  750 tokens   3. ACCESSORIES 500 tokens";
    }

    function redeemTokens(uint256 _value) external {
        require(_value > 0, "Invalid token value");
        require(balanceOf(msg.sender) >= _value, "Insufficient balance");
        if (_value == 1) 
        {
            _burn(msg.sender, 100);
        } 
        else if (_value == 2)
        {
            _burn(msg.sender, 750);
        } 
        else if (_value == 3) 
        {
            _burn(msg.sender, 500);
        }
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
