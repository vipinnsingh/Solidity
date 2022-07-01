// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract maping
{
    mapping (uint=>string) public rollno;

    function setter(uint roll_no, string memory name) public
    {
        rollno[roll_no]=name;
    }



}