// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract demo
{
    function getter() public view returns(uint blockno, uint timestamp, address msgsender)
    {
        return(block.number, block.timestamp, msg.sender);
    }


}