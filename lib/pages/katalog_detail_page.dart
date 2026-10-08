// Mengimpor library Flutter Material Design.
import 'package:flutter/material.dart';
// Mengimpor data model Product.
import 'package:w4s3/models/product.dart';

// Class KatalogDetailPage menampilkan rincian detail produk dari katalog.
class KatalogDetailPage extends StatelessWidget {
  // Field penampung data objek Product yang diteruskan ke halaman detail ini.
  final Product product;

  // Constructor KatalogDetailPage yang mewajibkan parameter product.
  const KatalogDetailPage({
    // Key unik untuk widget.
    super.key,
    // Parameter wajib product.
    required this.product,
  });

  // Method build untuk menyusun struktur tampilan halaman detail produk.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur dasar halaman.
    return Scaffold(
      // AppBar dengan judul nama produk yang sedang dilihat.
      appBar: AppBar(title: Text(product.nama)),
      // SingleChildScrollView agar konten tetap bisa di-scroll jika layar kecil.
      body: SingleChildScrollView(
        // Padding 16 pixel di sekitar area konten.
        padding: const EdgeInsets.all(16.0),
        // Column menyusun elemen-elemen detail produk secara vertikal.
        child: Column(
          // Perataan anak widget di dalam Column berpusat secara horizontal.
          crossAxisAlignment: CrossAxisAlignment.center,
          // Daftar widget anak di dalam Column.
          children: [
            // Memberikan jarak vertikal setinggi 16 pixel di bagian atas.
            const SizedBox(height: 16),
            // Container lingkaran sebagai latar belakang ikon besar produk.
            Container(
              // Memberikan padding sebesar 32 pixel di dalam lingkaran ikon.
              padding: const EdgeInsets.all(32),
              // Dekorasi lingkaran dengan warna latar abu-abu muda.
              decoration: BoxDecoration(
                // Warna latar belakang abu-abu muda.
                color: Colors.grey[200],
                // Bentuk dekorasi berupa lingkaran (circle).
                shape: BoxShape.circle,
              ),
              // Menampilkan ikon produk ukuran besar di dalam lingkaran.
              child: Icon(
                // Mengambil ikon dari property product.icon.
                product.icon,
                // Ukuran ikon sebesar 80 pixel.
                size: 80,
                // Warna ikon menggunakan warna primary tema aplikasi.
                color: Theme.of(context).primaryColor,
              ),
            ),
            // Memberikan jarak vertikal setinggi 24 pixel.
            const SizedBox(height: 24),
            // Teks untuk menampilkan nama lengkap produk.
            Text(
              // Mengambil teks nama produk.
              product.nama,
              // Gaya teks dengan ukuran font 26 dan cetak tebal (bold).
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              // Perataan teks di tengah horizontal.
              textAlign: TextAlign.center,
            ),
            // Memberikan jarak vertikal setinggi 12 pixel.
            const SizedBox(height: 12),
            // Teks untuk menampilkan harga produk dalam format Rupiah.
            Text(
              // Format harga produk Rp.
              'Rp ${product.harga}',
              // Gaya teks harga: ukuran 22, cetak tebal, warna hijau.
              style: const TextStyle(
                // Ukuran font 22.
                fontSize: 22,
                // Cetak tebal W600.
                fontWeight: FontWeight.w600,
                // Warna hijau (green).
                color: Colors.green,
              ),
            ),
            // Memberikan jarak vertikal setinggi 16 pixel.
            const SizedBox(height: 16),
            // Teks deskripsi singkat penjelas produk.
            const Text(
              // Kalimat deskripsi produk standar.
              'Produk berkualitas tinggi yang siap melengkapi kebutuhan harian Anda. Bergaransi resmi dan dapat dikirim ke seluruh wilayah Indonesia.',
              // Perataan teks di tengah.
              textAlign: TextAlign.center,
              // Gaya teks deskripsi berwarna abu-abu dengan tinggi baris 1.4.
              style: TextStyle(color: Colors.grey, height: 1.4),
            ),
            // Memberikan jarak vertikal setinggi 32 pixel sebelum tombol aksi.
            const SizedBox(height: 32),
            // SizedBox selebar layar untuk tombol 'Tambah ke Keranjang'.
            SizedBox(
              // Mengatur lebar selebar layar yang tersedia.
              width: double.infinity,
              // ElevatedButton dengan ikon untuk menambahkan produk ke keranjang belanja.
              child: ElevatedButton.icon(
                // Callback saat tombol 'Tambah ke Keranjang' ditekan.
                onPressed: () {
                  // Menutup halaman detail dan mengembalikan nilai boolean true sebagai tanda ditambahkan.
                  Navigator.pop(context, true);
                },
                // Menampilkan ikon shopping_cart di tombol.
                icon: const Icon(Icons.add_shopping_cart),
                // Teks pada tombol.
                label: const Text('Tambah ke Keranjang'),
                // Gaya tampilan tombol dengan padding vertikal.
                style: ElevatedButton.styleFrom(
                  // Memberikan padding vertikal 14 pixel pada tombol.
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
