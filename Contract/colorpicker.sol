// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// ✅ These GitHub imports work directly in Remix — no setup needed
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/access/Ownable.sol";

/// @title ColorPicker — unique colour NFTs
/// @notice Each bytes3 colour (R,G,B) can be minted only once.
contract ColorPicker is ERC721, Ownable {
    uint256 public nextTokenId;

    // track if a colour is already taken (bytes3: 3 bytes -> R,G,B)
    mapping(bytes3 => bool) public colorTaken;

    // map tokenId to its colour
    mapping(uint256 => bytes3) public tokenColor;

    event ColorMinted(address indexed minter, uint256 indexed tokenId, bytes3 color);
    event ColorBurned(address indexed burner, uint256 indexed tokenId, bytes3 color);

    constructor() ERC721("ColorPicker", "COLOR") {}

    /// @notice Mint an NFT that represents a unique colour (bytes3: 0xRRGGBB)
    function mint(bytes3 color) external {
        require(!colorTaken[color], "Color already taken");
        nextTokenId += 1;
        uint256 tokenId = nextTokenId;

        colorTaken[color] = true;
        tokenColor[tokenId] = color;

        _safeMint(msg.sender, tokenId);

        emit ColorMinted(msg.sender, tokenId, color);
    }

    /// @notice Owner of token may burn it, freeing the colour for re-use
    function burn(uint256 tokenId) external {
        require(_exists(tokenId), "Nonexistent token");
        require(ownerOf(tokenId) == msg.sender, "Not token owner");

        bytes3 color = tokenColor[tokenId];
        colorTaken[color] = false;
        delete tokenColor[tokenId];

        _burn(tokenId);

        emit ColorBurned(msg.sender, tokenId, color);
    }

    /// @notice Get the colour for a tokenId
    function colorOfToken(uint256 tokenId) external view returns (bytes3) {
        require(_exists(tokenId), "Nonexistent token");
        return tokenColor[tokenId];
    }

    /// @notice Convenience: check if a colour is taken
    function isColorTaken(bytes3 color) external view returns (bool) {
        return colorTaken[color];
    }
}
                                                                                                                                                                                    
