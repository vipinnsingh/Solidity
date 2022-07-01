// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Array{
    uint[5] public arra=[34,33,1,122,123];

    function setter(uint index, uint value) public
    {
        arra[index]=value;
    }

    function length() public view returns(uint)
    {
        return arra.length;
    }
}