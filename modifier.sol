// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract Modifier{

    address public owner = msg.sender;

    modifier Onlymanager(){
        require(owner == msg.sender);
        _;
    }

    function f1() public view Onlymanager{

    }


    function f2() public view Onlymanager{
        
    }


    function f3() public view Onlymanager{
        
    }

    uint public age=40;

    modifier changeAge(uint _y){
        age= age+_y;
        _;
    }

    function change(uint _y) public changeAge(_y){

    }
   


}