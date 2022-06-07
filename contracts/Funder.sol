// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// transfer and withdraw the amount
contract Funder{
    uint public numOfFunders;
    mapping(uint=>address) private funders;

    // whenever transfer fn called then ether will be received through this fn
    receive() external payable {}

    // store the address of the person who has transfered money
    // user can transfer the money into the contract
    function transfer() external payable{
        funders[numOfFunders] = msg.sender;
    }

    function withdraw(uint withdrawAmt) external{
        require(withdrawAmt <= 2000000000000000000, "Cannot withdraw more than 2 ETH");
        // transfer the amount to the person who asked for withdrawal
        payable(msg.sender).transfer(withdrawAmt);
    }
}