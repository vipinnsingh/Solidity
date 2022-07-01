// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Send{

    receive() external payable{

    }
    
    function checkBalance() view public returns(uint)
    {
        return address(this).balance;
    }

    function Call(address payable getter) public payable
    {
        (bool sent,)= getter.call{value: msg.value}("");
        require(sent, "transaction failed");
    }
}

contract Get{

    receive() external payable{

    }

    function checkBalance() view public returns(uint)
    {
        return address(this).balance;
    }
    
}