// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "../contracts/interfaces/ICrowdfundingFactory.sol";
import "./Crowdfunding.sol";
import "@aave/core-v3/contracts/interfaces/IPool.sol";


contract CrowdfundingFactory is ICrowdfundingFactory, Ownable {
    address[] public allCrowdfundings;

    event CrowdfundingCreated(address indexed crowdfunding, address indexed projectOwner);

    constructor() Ownable(msg.sender){}
    function createCrowdfunding(
        IERC20 _stablecoin,
        uint256 _targetFunding,
        IPool _lendingPool,
        address _priceFeedAddress
    ) external override onlyOwner returns (Crowdfunding) {

        AaveVault newAaveVault = new AaveVault(_lendingPool, _stablecoin, _priceFeedAddress);


        Crowdfunding newCrowdfunding = new Crowdfunding(msg.sender, _stablecoin, _targetFunding, newAaveVault);

        allCrowdfundings.push(address(newCrowdfunding));

        emit CrowdfundingCreated(address(newCrowdfunding), msg.sender);

        return newCrowdfunding;
    }

    function getAllCrowdfundings() external view returns (address[] memory) {
        return allCrowdfundings;
    }
}
