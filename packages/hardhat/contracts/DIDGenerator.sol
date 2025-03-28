// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DIDGenerator {
    // Mapping to store DIDs associated with Ethereum addresses
    mapping(address => string) public addressToDID;
    
    // Event to emit when a DID is generated
    event DIDGenerated(address indexed user, string did);

    // Function to generate a DID based on the caller's address
    function generateDID() public returns (string memory) {
        require(bytes(addressToDID[msg.sender]).length == 0, "DID already generated for this address");

        // Generate DID in the format: did:ethr:0x<address>
        string memory did = string(
            abi.encodePacked(
                "did:ethr:0x",
                toHexString(uint256(uint160(msg.sender)), 20)
            )
        );

        // Store the DID
        addressToDID[msg.sender] = did;

        // Emit event
        emit DIDGenerated(msg.sender, did);

        return did;
    }

    // Function to retrieve a DID for an address
    function getDID(address user) public view returns (string memory) {
        return addressToDID[user];
    }

    // Helper function to convert address to hex string
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes16 hexSymbols = "0123456789abcdef";
        bytes memory buffer = new bytes(2 * length);
        for (uint256 i = 2 * length; i > 0; --i) {
            buffer[i - 1] = hexSymbols[value & 0xf];
            value >>= 4;
        }
        return string(buffer);
    }
}