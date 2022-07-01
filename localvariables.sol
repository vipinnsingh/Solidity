// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract local
{

    function mine() pure public returns(uint, string memory)
    {
        string memory name="vipin";
        uint age=99;
        return (age,name);
       

    }  
        
}