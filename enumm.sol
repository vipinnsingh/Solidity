// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Enumm
{
    enum user {allowed, not_allowed, wait}

    user public u1=user.not_allowed;

    uint public lottery=100;

    function setter() public
    {

        if (u1==user.wait)
        {
            lottery=0;
        }
    }






}