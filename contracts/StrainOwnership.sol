pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
// import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./StrainBase.sol";

/// TODO: Replace this with natspec descriptions
contract StrainOwnership is ERC721Full, StrainBase {

    using SafeMath for uint256;

    mapping (uint => address) strainApprovals;
    // function balanceOf(address _owner) external view returns (uint256);
    // function balanceOf(address _owner) external view returns (uint256) {
    //     return ownerStrainCount[_owner];
    // }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        return strainToOwner[_tokenId];
    }

    // function _transfer(address _from, address _to, uint256 _tokenId) private {
    //     ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
    //     ownerZombieCount[msg.sender] = ownerZombieCount[msg.sender].sub(1);
    //     zombieToOwner[_tokenId] = _to;
    //     emit Transfer(_from, _to, _tokenId);
    // }

    // function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
    //     require (zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
    //     _transfer(_from, _to, _tokenId);
    // }

    function approve(address _approved, uint256 _tokenId) external payable onlyOwnerOf(_tokenId) {
        strainApprovals[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }

}