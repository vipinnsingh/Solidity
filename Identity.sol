// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 <0.9.0;

contract Identity 
{
    string name;
    uint age;

    constructor()
    {
        name="Vipin";
        age=22;
    }
    function giveName() view public returns(string memory)
    {
        return name;
    }
    function giveage() view public returns(uint)
    {
        return age;
    }

    function setage() public
    {
        age=age*2;
    }
}