// SPDX-License-Identifier: MIT-OR-APACHE-2.0
pragma solidity ^0.8.23;

interface IErc20  {
    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    error InsufficientBalance(address, uint256, uint256);

    error InsufficientAllowance(address, address, uint256, uint256);
}

interface IATON is IErc20  {
    function initializeContract() external returns (bool);

    function donateEthAndAccumulateAton() external payable returns (bool);

    function accumulateAton(uint256 amount) external returns (bool);

    function transfer(address to, uint256 amount) external returns (bool);

    function mintAtonFromEth() external payable returns (bool);

    function swap(uint256 amount) external returns (bool);

    function isOracle(address account) external view returns (bool);

    function isEngine(address account) external view returns (bool);

    function grantEngineAndOracleRole(address account, uint8 role_id) external;

    function revokeEngineAndOracleRole(address account, uint8 role_id) external;

    error ZeroEther(address);

    error ZeroAton(address);

    error AlreadyInitialized();

    error AccessControlUnauthorizedAccount(address, bytes32);

    error AccessControlBadConfirmation();

    error OwnableUnauthorizedAccount(address);

    error OwnableInvalidOwner(address);
}