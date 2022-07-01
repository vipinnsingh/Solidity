// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Enum{
    enum Order{Pending, Dispatched, Cancelled, Delivered, Returned}

    Order status;

    function getstatus() public view returns(Order)
    {
        return status;
    }

    function setstatus(Order _status) public 
    {
        status = _status;
    }

    function ret() public{
        status = Order.Returned;
    }

    function reset() public{
        delete status;
    }

}