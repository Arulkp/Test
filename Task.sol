pragma solidity ^0.4.11;
import "./ERC20.sol";

contract my is ERC20Basic
{
      uint256 constant public totalsupply=10000;
      address public owner;
      string public name;
      string public symbol;
      uint256 public decimals;

     mapping(address=>uint) public balance;
     function my()
   {
     owner=msg.sender;
     name="ERC20";
     symbol="###";
     decimals=2;
     balance[owner]=totalsupply;
     
   }
     modifier onlybyowner()
   {
     require(owner!=msg.sender);
  _;
 }
 function transfer(address to,uint amount) public onlybyowner returns(bool)  
 {
    
     balance[to]=balance[to]+amount;
     balance[owner]=balance[owner]-amount;
 }
 function transferfrom(address from,address to,uint amount) public
 {
     balance[from]=balance[from]-amount;
     balance[to]=balance[to]+amount;
 }
 function balanceOf(address who) public view returns(uint) 
 {
     return balance[who];
 }

 function mint(uint amount) public
 {
    require(amount<totalsupply);  
    balance[owner]=balance[owner]+amount;
  
 }

        
}
