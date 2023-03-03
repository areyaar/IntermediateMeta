pragma solidity ^0.8.0;

contract ExampleContract {
    address public owner;
    uint public value;
    
    constructor() {
        owner = msg.sender;
    }
    
    function setValue(uint _value) public {
        require(msg.sender == owner, "Only the owner can set the value.");
        value = _value;
    }
    
    function withdraw() public {
        require(value > 0, "Value must be greater than 0.");
        require(msg.sender == owner, "Only the owner can withdraw the value.");
        value = 0;
        payable(owner).transfer(value);
    }
    
    function getValue() public view returns (uint) {
        return value;
    }
    
    function kill() public {
        require(msg.sender == owner, "Only the owner can kill the contract.");
        selfdestruct(payable(owner));
    }
    
    function doSomething(uint x, uint y) public pure returns (uint) {
        uint z = x + y;
        assert(z >= x && z >= y);
        return z;
    }
}
