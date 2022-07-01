// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract demo

{
    struct Student
    {   
        string  name;
        uint  class;


    }

    mapping (uint=>Student) public data;

    function setter(uint rollno, string memory _name, uint _class) public
    {
        data[rollno]=Student(_name,_class);
    }









}