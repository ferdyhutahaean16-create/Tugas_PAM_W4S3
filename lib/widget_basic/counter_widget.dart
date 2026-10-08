// Mengimpor library Flutter Material Design yang menyediakan berbagai komponen UI dasar.
import 'package:flutter/material.dart';

// Mendefinisikan class CounterWidget sebagai StatefulWidget karena status/datanya dapat berubah secara dinamis.
class CounterWidget extends StatefulWidget {
  // Constructor untuk CounterWidget dengan parameter super.key opsional.
  const CounterWidget({super.key});

  // Membuat instance State yang terkait dengan CounterWidget ini.
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

// Class State untuk mengelola kondisi dan logika dari CounterWidget.
class _CounterWidgetState extends State<CounterWidget> {
  // Variabel private _jumlah untuk menyimpan angka hitungan counter, diinisialisasi dengan nilai 0.
  int _jumlah = 0;

  // Fungsi untuk menambah nilai _jumlah dan memperbarui tampilan UI.
  void _tambah() {
    // Memanggil setState agar Flutter memperbarui tampilan build dengan nilai terbaru dari _jumlah.
    setState(() {
      // Menambahkan nilai variabel _jumlah sebanyak 1.
      _jumlah++;
    });
  }

  // Fungsi untuk mengurangi nilai _jumlah dan memperbarui tampilan UI.
  void _kurang() {
    // Memanggil setState agar Flutter menggambar ulang UI setelah status berubah.
    setState(() {
      // Memeriksa jika nilai _jumlah lebih besar dari 0 sebelum menguranginya agar tidak negatif.
      if (_jumlah > 0) _jumlah--;
    });
  }

  // Method build untuk membangun struktur visual tampilan widget.
  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman aplikasi seperti AppBar dan Body.
    return Scaffold(
      // Menampilkan AppBar di bagian atas layar dengan judul 'Counter'.
      appBar: AppBar(title: const Text('Counter')),
      // Memposisikan seluruh isi body tepat di tengah layar.
      body: Center(
        // Menggunakan Column untuk menyusun widget-widget secara vertikal.
        child: Column(
          // Mengatur agar semua elemen di dalam Column berpusat secara vertikal.
          mainAxisAlignment: MainAxisAlignment.center,
          // Daftar widget anak yang ada di dalam Column.
          children: [
            // Menampilkan nilai dari variabel _jumlah dalam bentuk teks.
            Text(
              // Interpolasi string untuk menampilkan angka _jumlah saat ini.
              '$_jumlah',
              // Mengatur gaya teks seperti ukuran font 48 dan cetak tebal.
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            // Memberikan jarak vertikal setinggi 16 pixel antara teks dan baris tombol.
            const SizedBox(height: 16),
            // Menggunakan Row untuk menyusun tombol penambah dan pengurang secara horizontal.
            Row(
              // Mengatur agar elemen dalam Row berada di tengah secara horizontal.
              mainAxisAlignment: MainAxisAlignment.center,
              // Daftar widget anak di dalam Row.
              children: [
                // Tombol icon untuk mengurangi nilai counter saat ditekan.
                IconButton(
                  // Menentukan fungsi _kurang yang akan dijalankan ketika tombol diklik.
                  onPressed: _kurang,
                  // Menampilkan ikon minus melingkar dengan ukuran 36 pixel.
                  icon: const Icon(Icons.remove_circle, size: 36),
                ),
                // Memberikan jarak horizontal sebesar 24 pixel antar tombol.
                const SizedBox(width: 24),
                // Tombol icon untuk menambah nilai counter saat ditekan.
                IconButton(
                  // Menentukan fungsi _tambah yang akan dijalankan ketika tombol diklik.
                  onPressed: _tambah,
                  // Menampilkan ikon plus melingkar dengan ukuran 36 pixel.
                  icon: const Icon(Icons.add_circle, size: 36),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
