// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./AaveVault.sol";
import "../contracts/interfaces/ICrowdfunding.sol";

enum FundingStatus {
    Open,
    Closed,
    Finalized
}

contract Crowdfunding is ICrowdfunding, Ownable {

    address public projectOwner;
    IERC20 public stablecoin;
    uint256 public targetFunding;
    uint256 public totalFunding;
    mapping(address => uint256) public contributions;
    FundingStatus public fundingStatus;
    AaveVault public aaveVault; // New AaveVault instance

    event ContributionReceived(address indexed contributor, uint256 amount);
    event FundingFinalized();

    modifier onlyProjectOwner() {
        require(msg.sender == projectOwner, "Not the project owner");
        _;
    }

    modifier onlyOpenFunding() {
        require(fundingStatus == FundingStatus.Open, "Funding not open");
        _;
    }

    constructor (
        address _projectOwner,
        IERC20 _stablecoin,
        uint256 _targetFunding,
        AaveVault _aaveVault
    ) Ownable(msg.sender) {
        projectOwner = _projectOwner;
        stablecoin = _stablecoin;
        targetFunding = _targetFunding;
        fundingStatus = FundingStatus.Open;
        aaveVault = _aaveVault;
    }

    function contribute(uint256 amount) external override onlyOpenFunding {
        require(amount > 0, "Amount must be greater than 0");

        // Transfer stablecoin from contributor to the AaveVault
        stablecoin.transferFrom(msg.sender, address(aaveVault), amount);

        // Deposit into AaveVault
        aaveVault.deposit(amount);

        // Update contribution and total funding
        contributions[msg.sender] = contributions[msg.sender] + amount;
        totalFunding = totalFunding + amount;

        emit ContributionReceived(msg.sender, amount);
    }

    function withdraw() external override onlyProjectOwner {
        require(fundingStatus == FundingStatus.Closed, "Funding not closed");

        // Withdraw from AaveVault
        aaveVault.withdraw(totalFunding);

        // Transfer total funding to the project owner
        stablecoin.transfer(projectOwner, totalFunding);

        // Update funding status to Finalized
        fundingStatus = FundingStatus.Finalized;

        emit FundingFinalized();
    }

    function getContribution(address contributor) external view override returns (uint256) {
        return contributions[contributor];
    }

    function getFundingStatus() external view override returns (uint256) {
        return uint256(fundingStatus);
    }

    function getTargetFunding() external view override returns (uint256) {
        return targetFunding;
    }

    function finalizeFunding() external override onlyProjectOwner {
        require(totalFunding >= targetFunding, "Target funding not reached");
        require(fundingStatus == FundingStatus.Open, "Funding not open");

        // Update funding status to Closed
        fundingStatus = FundingStatus.Closed;
    }
}
