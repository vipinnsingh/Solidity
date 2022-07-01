// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

struct Student
{
    uint roll;
    string name;

}

contract school
{
    
    Student public s1;

    constructor(uint rollno, string memory namee)
    {
        s1.roll=rollno;
        s1.name=namee;

    }

    function change(uint rollno, string memory namee) public
    {
        Student memory newstudent=Student({ roll:rollno, name:namee });

        s1=newstudent;
    }


}


