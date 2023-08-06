//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {DaoRegistry} from "../src/DaoRegistry.sol";

contract DaoRegistryTest is Test {
    DaoRegistry daoRegistry;

    function setUp() external {
        daoRegistry = new DaoRegistry();
    }

    function testRegisterUser() public {
        daoRegistry.registerUser(address(this));
        assertEq(daoRegistry.isRegistered(address(this)), true);
    }

    function testRevokeUser() public {
        daoRegistry.registerUser(address(this));
        daoRegistry.revokeUser(address(this));
        assertEq(daoRegistry.isRegistered(address(this)), false);
    }

    function testGrantAdminRole() public {
        daoRegistry.grantAdminRole(address(this));
        assertEq(daoRegistry.isAdmin(address(this)), true);
    }

    function testRevokeAdminRole() public {
        daoRegistry.grantAdminRole(address(this));
        daoRegistry.revokeAdminRole(address(this));
        assertEq(daoRegistry.isAdmin(address(this)), false);
    }
}
