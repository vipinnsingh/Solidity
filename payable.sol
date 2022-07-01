// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract fallbackandReceive{

    event log(string _name , address _add, uint _value, bytes _data);


    fallback() external payable{

        emit log("fallback", msg.sender , msg.value, msg.data);

    }

    receive() external payable{

        emit log("Receive", msg.sender , msg.value, " ");

    }

    function checkbalance() public view returns(uint)
    {
        return address(this).balance;
    }
} 