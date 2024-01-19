// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@aave/core-v3/contracts/interfaces/IPool.sol";
import "../Crowdfunding.sol";


interface ICrowdfundingFactory {
    function createCrowdfunding(
        IERC20 _stablecoin,
        uint256 _targetFunding,
        IPool _lendingPool,
        address _priceFeedAddress
    ) external returns (Crowdfunding);
}