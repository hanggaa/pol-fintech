# Simulasi Blockchain — Fintech1000s

## Cara Pakai

1. Buka `index.html` di browser (atau deploy ke GitHub Pages)
2. Masukkan **Private Key** wallet Polygon Mainnet (yang berisi POL untuk gas fee)
3. Jika belum punya contract: kosongkan field Contract Address → sistem akan deploy otomatis
4. Jika sudah punya contract: paste address contract yang sudah di-deploy sebelumnya
5. Pilih user → klik "Perpanjang Tempo" pada invoice → konfirmasi → hash tersimpan di blockchain

## Estimasi Biaya

- Deploy contract: ~0.01-0.05 POL
- Store hash per transaksi: ~0.001-0.01 POL
- Total 9 transaksi: ~0.05-0.1 POL

## Smart Contract

File: `contract.sol`

Functions:
- `storeHash(documentId, hash)` — simpan hash dokumen
- `verifyDocument(documentId)` — ambil hash + timestamp + address
- `documentExists(documentId)` — cek apakah dokumen sudah ada
- `totalDocuments()` — total dokumen tersimpan

## Network

- **Chain**: Polygon Mainnet (Chain ID: 137)
- **RPC**: https://polygon-rpc.com
- **Explorer**: https://polygonscan.com

## Keamanan

⚠️ JANGAN push private key ke public repository!
File ini hanya untuk simulasi/demo internal.
