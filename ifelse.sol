// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Elif
{

    function check(int x) public pure returns(string memory)
    {
        string memory value;
    if (x>0)
    {
        return value="greater than zero";
    }
    else if (x<0)
    {
        return value="less than zero";
    }
    else 
    {
        return value="equal to zero";
    }
    }

}