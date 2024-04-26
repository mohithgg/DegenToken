// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    mapping(uint256 => uint256) public ig_itms; 
    uint256 internal i=0;

    string public swords_items; 

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        swords_items="Welcome to our Swords Shop mateyyy - 1.katana , 2.kukhri , 3.cutlass ";
        for(i=1; i<=3; i++){
            ig_itms[i]=3;
        }
    }

    function mint(address receiver_address, uint256 token_amt) public onlyOwner {
        _mint(receiver_address, token_amt);
    }

    function redeem(uint256 choice) public {
        require(balanceOf(msg.sender) >= 4500, "Insufficient balance");
        require(choice > 0 && choice <= 3, "Invalid choice");  
        _burn(msg.sender, 1500 * choice);
        ig_itms[choice]--; 
    }

    function burn(uint256 token_val) public returns(bool) {
        _burn(msg.sender, token_val);
        return true;
    }

    function transfer(address recipient_addr, uint256 token_val) public override returns(bool) {
        _transfer(msg.sender, recipient_addr, token_val);
        return true;
    }
}
