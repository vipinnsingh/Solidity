// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Eventt{
    
    event Amount(address account, string message, uint value);
    function setvalue(uint _value) public
    {
        emit Amount(msg.sender, "has ether", _value);
    }
}

contract App{
    event Chat(address indexed from , address to, string message);

    function send(address _to, string memory _message) public
    {
        emit Chat(msg.sender, _to, _message);
    }
}