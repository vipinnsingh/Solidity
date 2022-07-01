// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Allowances{

    receive() external payable
    {

    }

    address public owner;

    constructor()
    {
        owner= msg.sender;
    }

    function checkbalance() public view returns(uint)
    {
        return address(this).balance;
    }

    mapping(address => uint) public allowances;

    function addAllowances(address _to, uint amt)   public
    {
        require(msg.sender== owner);
        allowances[_to] += amt;
    }

    event Moneysent(string description, address to, uint amount);
    function withdrawMoney(string memory _description, address payable _to, uint amt) public
    {
        require(msg.sender==owner|| allowances[msg.sender]> amt);
        require(address(this).balance >= amt);
        if(owner != msg.sender)
        {
            allowances[msg.sender] -= amt;
        }
        emit Moneysent(_description, _to, amt);
        _to.transfer(amt);


    }






}