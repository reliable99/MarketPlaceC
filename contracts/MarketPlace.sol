 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/SafeERC721.sol";
import {Listing} from "./Listing.sol";
contract Marketplace {
    
    mapping(address => address) public listings;
    
    function createListingContract() external returns (address) {
        
        bytes32 userId = keccak256(abi.encode(msg.sender));
        
        Listing listingInstance = new Listing();
        
        listings[msg.sender] = address(listingInstance);
        
        return listings[msg.sender];
    }
}