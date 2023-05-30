//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Bank 
{

    mapping(address => uint) private balances;

    event Deposit(address indexed owner, uint amount);
    event Withdraw(address indexed owner, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);
    event GetBalance(address indexed owner, uint amount);


    function deposit(address _account, uint _number) public payable 
    {   require (balances [_account] + _number <=10000000, "Warning: Your transaction has failed due to reaching the limit of 1 million.");
        balances[_account] += _number;
        emit Deposit(_account, _number);
    }

    function withdraw(address _account, uint _number) public payable 
    {
        require(balances[_account] > 0, "Warning: Your transaction has failed due to insufficient balance!");
        require (balances [_account] + _number <=10000000, "Warning: Your transaction has failed due to reaching the limit of 1 million.");
        balances[_account] -= _number;
        emit Withdraw(_account, _number);
    }

    function transfer(address _from, address _to, uint _number) public payable 
    {
        require (balances [_from] >= 0, "Warning: Your transaction has failed due to insufficient balance. Please ensure that you have enough funds to cover the transaction.");
        require (_from != _from, "Warning: You cannot transfer the amount to yourself. Please provide a valid recipient address for the transaction.");
        balances[_from] -= _number;
        balances[_to] += _number;
        emit Transfer(_from, _to, _number);
    }

    function getBalance(address _address) public returns (uint) 
    {
    uint balance = balances[_address];
    emit GetBalance(_address, balance);
    return balance;
}

}
