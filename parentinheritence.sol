// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract A{
    event log(string name , uint age);

    function f1() virtual public
    {
        emit log("A", 21);
    }

    function f2() virtual public
    {
        emit log("A",21);
    }

}

contract B is A{

    function f1() public virtual override
    {
        emit log("B", 31);
        A.f1();
    }

    function f2() public virtual override
    {
        emit log("B",31);
        A.f2();
    }
}

contract C is A{

    function f1() public virtual override
    {
        emit log("c", 31);
    }

    function f2() public virtual override
    {
        emit log("C",31);
        A.f2();
    }

}

contract D is C,B{

     function f1() public  override(B,C)
    {
        emit log("D", 31);
        B.f1();
    }

    function f2() public override(B,C)
    {
        emit log("D",31);
        super.f2();
    }


}