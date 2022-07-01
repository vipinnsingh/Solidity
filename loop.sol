// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract looop{
    uint[4] public arra;
    uint public intt;

    function lopp() public{
        do{
            arra[intt]=intt;
            intt++;
        }
        while (intt<arra.length);
       
        }

}