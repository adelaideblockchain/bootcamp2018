pragma solidity ^0.4.17;

contract Person{
    /* Define variable owner of the type address */
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    function Person() { 
owner = msg.sender; 
}

    /* Function to recover the funds on the contract */
    function kill() {
 if (msg.sender == owner) selfdestruct(owner); 
}
}

contract Greeter is Person{
    /* Define variable greeting of the type string */
    string greeting;

    /* This runs when the contract is executed */
    function Greeter(string _greeting) public {
        greeting = _greeting;
    }

    /* Main function */
    function greet() constant returns (string) {
        return greeting;
    }
}
