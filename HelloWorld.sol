// declare the version of Solidity our contract works with
pragma solidity >=0.4.22 <0.6.0;

// create our contract
contract HelloWorld {
    
    // declare our message variable
    string public message;
    
    // assign the calling address to owner
    address payable owner;
    
    // requires that only the contract creator can execute
    modifier onlyOwner {
        require (owner == msg.sender);
        _;
    }
    
    // this constructor function will only be called once
    // when the contract is initially deployed
    // it cannot be accessed after deployment
    constructor(string memory _initialMessage) public {
        message = _initialMessage;
        owner = msg.sender;
    }
    
    // retrieves the current value of message variable
    function getCurrentMessage() public view returns (string memory) {
       return message; 
    }
    
    // allows us to set a new message
    function setNewMessage (string memory _newMessage) public onlyOwner {
        message = _newMessage;
    }
    
    // allows us to disable the contract
    function disableContract() public onlyOwner {
        selfdestruct (owner);
    }
}