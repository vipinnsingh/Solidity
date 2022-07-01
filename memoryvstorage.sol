// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract stormem
{
    string[] public name=['rita','radha','raja'];

    function mem() public view
    {
        string[] memory s1=name;
        s1[0]='anil';
    }
    
    function sto() public
    {
        string[] storage s1=name;
        s1[0]='anil';
    }




}