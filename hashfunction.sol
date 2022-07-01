// SPDX-License-Identifier: GPL-3.0


pragma solidity >0.5.0 < 0.8.0;

contract Hashfunction{

    function Keccak(uint _age, string memory _name, address _add) public pure returns(bytes32)
    {
        return keccak256(abi.encodePacked(_age, _name, _add));
    }

      function Sha(uint _age, string memory _name, address _add) public pure returns(bytes32){
       return sha256(abi.encodePacked(_age, _name, _add));
    }

      function Ripe(uint _age, string memory _name, address _add) public pure returns(bytes20)
    {
        return ripemd160(abi.encodePacked(_age, _name, _add));
    }
}