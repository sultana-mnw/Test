pragma solidity ^0.4.0;
contract token{
    mapping(address=>uint)public balance;
    address owner;
    string public name;
    string public symbol;
    uint public decimal;
    uint public totalSupply;
    function token(){
         totalSupply=100;
         name="mnw";
     symbol="mnw";
      balance[msg.sender] = totalSupply;
     
       decimal=0;
     }
   
    modifier onlyowner(){
        
        owner=msg.sender;
        _;
    }
    
    function transfer(address to, uint amount)onlyowner public returns(bool){
    
    balance[to]=balance[to]+amount;
    balance[msg.sender]=balance[msg.sender]-amount;
    return true;
     }
    
    function mint(uint amount)onlyowner public returns (bool){
        require(amount>0);
        require(totalSupply > amount);
        
        balance[msg.sender]=+amount;
        return true;
    }   
     
     function tranferfrom(address from,address to,uint amount)public returns(bool){
         require(amount > 0 && balance[from]>=amount );
         balance[to]=balance[to]+amount;
         balance[from]=balance[from]-amount;
         return true;
         
     }    

        
    
}
