// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@aave/core-v3/contracts/interfaces/IPool.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "../contracts/interfaces/IAaveVault.sol";


contract AaveVault is IAaveVault, Ownable {
    IPool public lendingPool;
    IERC20 public stablecoin;

    AggregatorV3Interface public priceFeed; // Chainlink price feed


    constructor(IPool _lendingPool, IERC20 _stablecoin, address _priceFeedAddress) Ownable(msg.sender){
        lendingPool = _lendingPool;
        stablecoin = _stablecoin;
        priceFeed = AggregatorV3Interface(_priceFeedAddress);
    }

    function deposit(uint256 amount) external override onlyOwner {
        require(amount > 0, "Amount must be greater than 0");

        // Get the latest price from Chainlink
        uint256 equivalentValue = getEquivalentValue(amount);

        // Approve lendingPool to transfer stablecoin
        stablecoin.approve(address(lendingPool), equivalentValue);

        // Deposit into Aave
        lendingPool.deposit(address(stablecoin), equivalentValue, address(this), 0);
    }

    function withdraw(uint256 amount) external override onlyOwner {
        require(amount > 0, "Amount must be greater than 0");

        // Withdraw from Aave
        lendingPool.withdraw(address(stablecoin), amount, address(this));
    }

    function getBalance() external view override returns (uint256) {
        return stablecoin.balanceOf(address(this));
    }

    function getEquivalentValue(uint256 amount) internal view returns (uint256) {
        (, int256 price, , ,) = priceFeed.latestRoundData();
        require(price > 0, "Invalid price from Chainlink");
        
        return amount*uint256(price);
    }
}
