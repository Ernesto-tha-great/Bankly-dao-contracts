// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DaoRegistry {
    event UserRegistered(address indexed user);
    event UserRevoked(address indexed user);

    mapping(address => bool) private registeredUsers;

    mapping(address => bool) private admins;

    modifier onlyAdmin() {
        require(admins[msg.sender], "Only admins can call this function");

        _;
    }

    constructor() {
        admins[msg.sender] = true;
    }

    function registerUser(address _user) external {
        require(address(_user) != address(0), "Invalid address");
        require(!registeredUsers[_user], "User already registered");
        registeredUsers[_user] = true;

        emit UserRegistered(_user);
    }

    function revokeUser(address _user) external onlyAdmin {
        require(address(_user) != address(0), "Invalid address");
        require(registeredUsers[_user], "User not registered");
        registeredUsers[_user] = false;

        emit UserRevoked(_user);
    }

    function isRegistered(address _user) external view returns (bool) {
        return registeredUsers[_user];
    }

    function isAdmin(address _user) external view returns (bool) {
        return admins[_user];
    }

    function grantAdminRole(address userAddress) external onlyAdmin {
        admins[userAddress] = true;
    }

    function revokeAdminRole(address userAddress) external onlyAdmin {
        admins[userAddress] = false;
    }
}
