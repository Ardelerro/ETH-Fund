// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICrowdfunding {
    function contribute(uint256 amount) external;
    function withdraw() external;
    function getContribution(address contributor) external view returns (uint256);
    function getFundingStatus() external view returns (uint256);
    function getTargetFunding() external view returns (uint256);
    function finalizeFunding() external;
}