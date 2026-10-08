// Mengimpor paket Material UI Flutter.
import 'package:flutter/material.dart';
// Mengimpor ProdukDetailPage untuk navigasi ke halaman detail produk.
import 'package:w4s3/pages/produk_detail_page.dart';

// Class ProdukListPage menampilkan daftar item produk dalam bentuk daftar berurutan.
class ProdukListPage extends StatelessWidget {
  // Constructor ProdukListPage dengan parameter key opsional.
  ProdukListPage({super.key});

  // Data daftar produk berupa List of Map yang berisi nama dan harga produk.
  final List<Map<String, dynamic>> produk = [
    // Produk pertama: Kursi Minimalis.
    {'nama': 'Kursi Minimalis', 'harga': 350000},
    // Produk kedua: Meja Kerja Kayu.
    {'nama': 'Meja Kerja Kayu', 'harga': 750000},
    // Produk ketiga: Lampu Meja LED.
    {'nama': 'Lampu Meja LED', 'harga': 120000},
  ];

  // Method build untuk menyusun tampilan halaman daftar produk.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur utama halaman.
    return Scaffold(
      // AppBar dengan judul 'Daftar Produk'.
      appBar: AppBar(title: const Text('Daftar Produk')),
      // ListView.builder untuk membuat item daftar produk secara efisien/dinamis.
      body: ListView.builder(
        // Menentukan jumlah item sesuai dengan panjang List produk.
        itemCount: produk.length,
        // Builder fungsi yang dipanggil untuk setiap indeks item dalam daftar.
        itemBuilder: (context, index) {
          // Mengambil data item produk pada indeks saat ini.
          final item = produk[index];
          // Mengembalikan ListTile untuk menampilkan item produk.
          return ListTile(
            // Teks judul item yang berisi nama produk.
            title: Text(item['nama']),
            // Teks subjudul yang berisi harga produk dalam Rupiah.
            subtitle: Text('Rp ${item['harga']}'),
            // Menampilkan ikon panah ke kanan di sebelah kanan item.
            trailing: const Icon(Icons.chevron_right),
            // Aksi saat item daftar di-tap untuk navigasi ke ProdukDetailPage.
            onTap: () async {
              // Menunggu hasil kembalian data saat kembali dari ProdukDetailPage.
              final hasilPilihan = await Navigator.push(
                // Context navigasi.
                context,
                // MaterialPageRoute untuk berpindah ke ProdukDetailPage.
                MaterialPageRoute(
                  // Menginisialisasi ProdukDetailPage dengan membawa data nama dan harga produk.
                  builder: (context) => ProdukDetailPage(
                    // Mengirimkan nama produk.
                    namaProduk: item['nama'],
                    // Mengirimkan harga produk.
                    harga: item['harga'],
                  ),
                ),
              );

              // Memastikan konteks masih terpasang sebelum mengakses ScaffoldMessenger.
              if (!context.mounted) return;

              // Memeriksa jika ada data balikan dari ProdukDetailPage setelah tombol pilih ditekan.
              if (hasilPilihan != null) {
                // Menampilkan SnackBar berisi informasi nama produk yang telah dipilih.
                ScaffoldMessenger.of(context).showSnackBar(
                  // Menampilkan SnackBar berisi pesan produk pilihan.
                  SnackBar(content: Text('Anda memilih: $hasilPilihan')),
                );
              }
            },
          );
        },
      ),
    );
  }
}
