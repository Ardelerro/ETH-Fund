// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IAaveVault {
    function deposit(uint256 amount) external;
    function withdraw(uint256 amount) external;
    function getBalance() external view returns (uint256);
}