// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCount;
    string private _baseTokenURI;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mint(address to_) public onlyOwner returns (uint256) {
        _tokenIdCount.increment();
        uint256 _tokenId = _tokenIdCount.current();
        _mint(to_, _tokenId);
        return _tokenId;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function updateBaseTokenURI(string memory baseTokenURI_) public onlyOwner {
        _baseTokenURI = baseTokenURI_;
    }

    function tokenURI(uint256 tokenId_)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(_exists(tokenId_), "MyNFT: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return string(abi.encodePacked(baseURI, tokenId_));
    }
}
