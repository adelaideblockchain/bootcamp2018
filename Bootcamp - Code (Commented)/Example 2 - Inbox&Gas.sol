pragma solidity ^0.4.17; //Specifed version of solidity inside this file

//Defines a new contract (similar to classes), that will have methods and variables
contract Inbox{
    
    //Declares a string type variable named 'message', and sets its type to public, allowing it to be utilised by different "classes"
   	//The value asigned to message as a storage variable will be stored for ALL ETERNITY witin the Ethereum blockchain
	    /*This is in contrast to local variables local variables are kind of one time created when a contract
		is executed and then thrown away at the very end.
		And they are never actually persisted on the block chain in this course for the most part.
		We will be making use of storage variables but in some cases we'll be using local variables instead.*/
	string public message;
    
    //Defines different functions that will be members of this contract
   

//Because this function has same name as contract --> Contructor function (i.e. They are automatically called one time when the contract is first created)
    function Inbox(string InitialMessage) public{
        message = InitialMessage;
    }
    
//syntax follows: function <function name>(<Arguments>) <accessmodifier/function type>
    function setMessage(string newMessage) public{
        message = newMessage;
    }

    //Reviewing function based upon amount of gas needed to run
    //https://github.com/djrtwo/evm-opcode-gas-costs/blob/master/opcode-gas-costs_EIP-150_revision-1e18248_2017-04-12.csv

    function doMath(int a, int b){
        a+b;
        b-a;
        a*b;
        a=0;

    }


}
