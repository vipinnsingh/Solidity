// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.5.0 < 0.8.0;

contract crowdfunding
{
    mapping(address=>uint) public contributors;
    address public manager;
    uint public target;
    uint public deadline;
    uint public mincontribution;
    uint public raisedamount;
    uint public noOfcontributors;

    struct Request
    {
        string description;
        address payable recepient;
        uint value;
        bool completed;
        uint noOfvoters;
        mapping(address=>bool) voters;
     }

    constructor(uint _target, uint _deadline)
    {
        target= _target;
        deadline= block.timestamp+_deadline;
        mincontribution= 100 wei;
        manager= msg.sender;
    }

    function sendEther() public payable
    {
        require(block.timestamp<deadline, "Deadline has been passed");
        require(msg.value>=mincontribution,"Min contribution is not met");

        if(contributors[msg.sender]==0)
        {
            noOfcontributors++;
        }    
            contributors[msg.sender]+=(msg.value);
            raisedamount+=(msg.value);
    }

    function getbalance() public view returns(uint)
    {
        require(msg.sender==manager);
        return address(this).balance;   
    }

    function refund() public 
    {
        require(deadline<block.timestamp && raisedamount<target, "refund not applicable");
        require(contributors[msg.sender]>0);
        address payable user= payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender]=0;
    }

    modifier onlymanager()
    {
        require(msg.sender==manager, "only manager can call this function");
        _;
    }

    mapping(uint=>Request) public requests;
    uint public number;

    function createrequest(string memory _description, address payable _recipient, uint _value) public onlymanager
    {
        Request storage newRequest= requests[number];
        number++; 
        newRequest.description=_description;
        newRequest.recepient=_recipient;
        newRequest.value=_value;
        newRequest.completed=false;
        newRequest.noOfvoters=0;
    }

    function voterequest(uint _requestno) public
    {
        require(contributors[msg.sender]>0,"you must be a contributor");
        Request storage thiss= requests[_requestno];
        require(thiss.voters[msg.sender]==false,"you have already voted");
        thiss.voters[msg.sender]=true;
        thiss.noOfvoters++;
    }

    function makepayment(uint _requestno) public onlymanager
    {   
        require(raisedamount>target);
        Request storage thiss= requests[_requestno];
        require(thiss.completed==false,"Already paid");
        require(thiss.noOfvoters>noOfcontributors/2,"Majority does not support");
        thiss.recepient.transfer(thiss.value);
        thiss.completed=true;
    }



}