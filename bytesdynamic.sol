// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract dynamic{

    bytes public b="ghf";

    function pushElement() public
    {
        b.push('a');
    }
    function getelement(uint index) public view returns(bytes1)
    {
        return b[index];
    }
    function length() public view returns(uint)
    {
        return b.length;
    }
}