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
