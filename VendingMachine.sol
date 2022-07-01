// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract VendingMachine{

    address public owner;
    mapping(address=> uint) public donutbalances;

    constructor() {
        owner = msg.sender;
        donutbalances[address(this)]= 100;
    }

    function getvendingmachinebalance() public view returns(uint)
    {
        return donutbalances[address(this)];
    }

    function restock(uint _donuts) public{
        require(msg.sender==owner,"Only manager can restock.");
        donutbalances[address(this)] += _donuts;
    }

    function purchase(uint _donut) public payable
    {
        require(msg.value>= _donut* 100 wei);
        require(donutbalances[address(this)] > _donut);
        donutbalances[address(this)] -= _donut;
        donutbalances[msg.sender] += _donut;
    }
}   
