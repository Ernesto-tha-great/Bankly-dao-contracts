// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GovernanceToken is ERC20 {
    constructor(uint256 _amount) ERC20("Bankly Coin", "BKT") {
        _mint(msg.sender, _amount);
    }
}
