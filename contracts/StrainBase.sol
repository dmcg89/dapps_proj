pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./Metadata.sol";

contract StrainBase is ERC721Full, Ownable {
    address public metadata;

    constructor(string memory name, string memory symbol, address _metadata) public ERC721Full(name, symbol) {
        name = name;
        symbol = symbol;
        metadata = _metadata;
    }

    function mint(address recepient) public onlyOwner {
        // Mints incrementally (current total supply plus one).
        _mint(recepient, totalSupply() + 1);
    }

    function updateMetadata(address _metadata) public onlyOwner {
        metadata = _metadata;
    }

    function tokenURI(uint _tokenId) external view returns (string memory _infoUrl) {
        return Metadata(metadata).tokenURI(_tokenId);
    }
}
