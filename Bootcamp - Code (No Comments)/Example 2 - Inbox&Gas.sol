pragma solidity ^0.4.17;

contract Inbox{
    
 	string public message;
 
    function Inbox(string InitialMessage) public{
        message = InitialMessage;
    }
    
    function setMessage(string newMessage) public{
        message = newMessage;
    }

   /*Gas info:
   https://github.com/djrtwo/evm-opcode-gas-costs/blob/master/opcode-gas-costs_EIP-150_revision-1e18248_2017-04-12.csv*/

    function doMath(int a, int b){
        a+b;
        b-a;
        a*b;
        a=0;
    }
}