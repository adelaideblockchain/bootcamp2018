pragma solidity ^0.4.17; 

contract Inbox{
    
   	string public message;
    
    //syntax follows: function <function name>(<Arguments>) <accessmodifier/function type>
    function Inbox(string InitialMessage) public{
        message = InitialMessage;
    }
    
    function setMessage(string newMessage) public{
        message = newMessage;
    }

    function getMessage() public view returns (string){
        return message;
    }
}