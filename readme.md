# Degen Token creation

Degen Token is an ERC20 token built on the Ethereum blockchain. It provides functionality for minting new tokens, transferring tokens, burning tokens, and redeeming tokens for in-game items.

## Getting Started
You have to use npm init command to start this is in your own local pc


### Deployment

1. Deploy the Degen Token smart on avalance fuji testnet using hardhat.
2. Once deployed, the smart contract will create an instance of the Degen Token with the symbol "DGN".

## Functions

The Degen Token smart contract provides the following functions:

-> `mint(address to, uint256 amount)`: Mint the tokena and deploy it . only owner can perform this task.
-> `balance()`: this will show the token present on callers address.
-> `tranfer(address to, uint256 value)`: transfer function will tranfer the token from one account to another.
-> `redeemTokens(uint256 value)`: Redeem Degen tokens for in-game items based on the specified value.

## Configuration

The Degen Token smart contract uses the Hardhat development environment and provides the following network configurations:

- `hardhat`: Hardhat development network configuration.
- `fuji`: Avalanche Fuji Testnet configuration.
- `mainnet`: Avalanche Mainnet configuration.

Please ensure that you have set up the appropriate network and account configurations in the `hardhat.config.js` file.

## Author

Amrita Kumari
https://www.linkedin.com/in/amrita-kumari-753319232/

## License

This project is licensed under the MIT License.


