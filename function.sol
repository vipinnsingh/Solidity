// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract sandwichfactory{
    struct Sandwich{
        string name;
        string status;

    }
    
    Sandwich[] sandwiches;

    function eatsandwich(uint _index) public
    {
       Sandwich storage mysandwiches= sandwiches[_index];
       mysandwiches.name="ntjhnr";
       mysandwiches.status="eaten";

    }

}