// Mengimpor library Flutter Material Design untuk elemen UI.
import 'package:flutter/material.dart';

// Class ProdukDetailPage menampilkan informasi detail produk yang dipilih.
class ProdukDetailPage extends StatelessWidget {
  // Variabel untuk menyimpan nama produk yang dikirim dari halaman sebelumnya.
  final String namaProduk;
  // Variabel untuk menyimpan harga produk yang dikirim dari halaman sebelumnya.
  final int harga;

  // Constructor ProdukDetailPage yang mewajibkan parameter namaProduk dan harga.
  const ProdukDetailPage({
    // Key unik untuk widget.
    super.key,
    // Parameter wajib namaProduk.
    required this.namaProduk,
    // Parameter wajib harga.
    required this.harga,
  });

  // Method build untuk membangun struktur tampilan detail produk.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai kerangka utama halaman detail produk.
    return Scaffold(
      // AppBar dengan judul 'Detail Produk'.
      appBar: AppBar(title: const Text('Detail Produk')),
      // Memberikan jarak padding 16 pixel di sekitar elemen body.
      body: Padding(
        // Padding 16 pixel di semua sisi.
        padding: const EdgeInsets.all(16.0),
        // Column menyusun informasi produk secara vertikal.
        child: Column(
          // Mengatur perataan teks ke sisi kiri.
          crossAxisAlignment: CrossAxisAlignment.start,
          // Daftar widget anak di dalam Column.
          children: [
            // Teks untuk menampilkan nama produk.
            Text(
              // Menampilkan nama produk dari variabel.
              namaProduk,
              // Mengatur ukuran font 24 dan cetak tebal.
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Memberikan jarak vertikal setinggi 8 pixel.
            const SizedBox(height: 8),
            // Teks untuk menampilkan harga produk dalam format Rupiah.
            Text('Rp $harga'),
            // Memberikan jarak vertikal setinggi 24 pixel sebelum tombol pilihan.
            const SizedBox(height: 24),
            // Tombol untuk memilih produk dan mengembalikan nilainya ke halaman sebelumnya.
            ElevatedButton(
              // Callback saat tombol ditekan.
              onPressed: () {
                // Menutup halaman saat ini dan mengembalikan nilai namaProduk ke caller.
                Navigator.pop(context, namaProduk);
              },
              // Teks yang ditampilkan pada tombol.
              child: const Text('Pilih Produk Ini'),
            ),
          ],
        ),
      ),
    );
  }
}
