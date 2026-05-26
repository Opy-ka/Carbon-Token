// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarbonToken {
    string public name = "CarbonToken";
    string public symbol = "CBT";

    // Menyimpan saldo setiap wallet address
    mapping(address => uint256) public balanceOf;

    // Event untuk mencatat riwayat transaksi di blockchain
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 1. Fungsi MINT: Mencetak token baru (kuota untuk pabrik ramah lingkungan)
    function mint(address pabrik, uint256 jumlah) public {
        balanceOf[pabrik] += jumlah;
        emit Transfer(address(0), pabrik, jumlah);
    }

    // 2. Fungsi TRANSFER: Jual beli token antar pabrik
    function transfer(address pembeli, uint256 jumlah) public {
        balanceOf[msg.sender] -= jumlah;
        balanceOf[pembeli] += jumlah;
        emit Transfer(msg.sender, pembeli, jumlah);
    }
}