// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Array{
    uint[] public arra;

    function pushElement(uint value) public
    {
        return arra.push(value);
    }

    function popElement() public
    {
        return arra.pop();
    }
    function length() public view returns(uint)
    {
        return arra.length;
    }
}
