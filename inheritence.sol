// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract A{

    uint public x=199;

    function f1() public pure returns(string memory)
    {
        return "I am in contract A";
    }

    function f2() public pure returns(string memory)
    {
        return "I am in contract A";
    }

    function f3() public pure virtual returns(string memory)
    {
        return "I am in contract A";
    }

}

contract B is A{
     
    

    function f3() public pure override returns(string memory)
    {
        return "I am in contract B";
    }


}