// Mengimpor library Flutter Material untuk tipe data IconData.
import 'package:flutter/material.dart';

// Class data model Product untuk merepresentasikan objek produk.
class Product {
  // Field untuk menyimpan nama dari produk.
  final String nama;
  // Field untuk menyimpan harga dari produk dalam bentuk integer.
  final int harga;
  // Field untuk menyimpan ikon representasi dari produk.
  final IconData icon;

  // Constructor class Product dengan parameter bernama yang wajib diisi.
  Product({
    // Parameter nama produk yang harus diisi.
    required this.nama,
    // Parameter harga produk yang harus diisi.
    required this.harga,
    // Parameter icon dengan nilai default Icons.shopping_bag jika tidak diisi.
    this.icon = Icons.shopping_bag,
  });
}
