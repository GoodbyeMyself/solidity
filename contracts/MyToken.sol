// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721, Ownable {

    uint256 private _nextTokenId = 0;
    
    // constructor(address initialOwner)
    constructor()
        ERC721("MyToken", "MTK")
        // Ownable(initialOwner)
        Ownable(msg.sender)
    {}

    // function safeMint(address to, uint256 tokenId) public onlyOwner {
    //     _safeMint(to, tokenId);
    // }

    function mint(uint256 quantity) public payable {

        require(quantity == 1, "quantity must be 1");

        require(msg.value == 0.01 ether, "must pay 0.01 ether");

        uint256 tokenId = _nextTokenId++;

        _mint(msg.sender, tokenId);
    }
}
