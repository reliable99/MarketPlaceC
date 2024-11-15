 // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Listing {

    struct Item {
        uint256 id;
        string name;
        uint256 price;
    }
    

    mapping(uint256 => Item) public items; 

    function listItem(string memory _name, uint256 _price) external returns (uint256 itemId   ) {
        
        bytes32 userId = keccak256(abi.encode(msg.sender));
          
        items[userId] = Item(_name, msg.sender, _price);
        
        return uint256(userId);   
    }

    function getListing(uint256 itemId ) external view returns (string memory name, address ownerAddress, uint256 price) {
        bytes32 userId = keccak256(abi.encode(itemId));
        
        Item itemStruct  = items[userId];
        
        return (
            string(itemStruct.name),
            msg.sender,
            itemStruct.price
        );
 
    }

}