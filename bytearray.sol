// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract bytearray{

    bytes4 public b4;
    bytes1 public b1;

    function setter() public
    {
        b4="ihb";
        b1="a";
    }
}