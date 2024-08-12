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
