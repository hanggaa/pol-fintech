// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title BuktiTempoVerifier
 * @notice Menyimpan hash dokumen Bukti Tempo di blockchain Polygon
 * @dev Fintech1000s — PT. Mitra Seribu Saudara
 */
contract BuktiTempoVerifier {
    struct Document {
        bytes32 hash;
        uint256 timestamp;
        address storedBy;
    }

    mapping(string => Document) public documents;
    string[] public documentIds;
    address public owner;

    event HashStored(
        string indexed documentId,
        bytes32 hash,
        uint256 timestamp,
        address storedBy
    );

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Simpan hash dokumen Bukti Tempo
     * @param documentId ID dokumen (misal: "BT/202604/0001")
     * @param hash Keccak256 hash dari data transaksi (JSON)
     */
    function storeHash(string memory documentId, bytes32 hash) public {
        require(documents[documentId].timestamp == 0, "Document already exists");
        
        documents[documentId] = Document({
            hash: hash,
            timestamp: block.timestamp,
            storedBy: msg.sender
        });
        
        documentIds.push(documentId);
        emit HashStored(documentId, hash, block.timestamp, msg.sender);
    }

    /**
     * @notice Verifikasi hash dokumen
     * @param documentId ID dokumen yang ingin diverifikasi
     * @return hash, timestamp, storedBy
     */
    function verifyDocument(string memory documentId) public view returns (bytes32, uint256, address) {
        Document memory doc = documents[documentId];
        return (doc.hash, doc.timestamp, doc.storedBy);
    }

    /**
     * @notice Cek apakah dokumen sudah tersimpan
     */
    function documentExists(string memory documentId) public view returns (bool) {
        return documents[documentId].timestamp != 0;
    }

    /**
     * @notice Total dokumen yang tersimpan
     */
    function totalDocuments() public view returns (uint256) {
        return documentIds.length;
    }
}
