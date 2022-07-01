// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract constructorr{
    uint public age;

    constructor(uint newage)
    {
        age=newage+2;
    }


}

