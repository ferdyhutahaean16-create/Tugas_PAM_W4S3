// Mengimpor paket Flutter Material UI untuk menggunakan widget-widget standar.
import 'package:flutter/material.dart';

// Mendefinisikan class TextFieldWidget sebagai StatefulWidget untuk mengelola input teks dinamis.
class TextFieldWidget extends StatefulWidget {
  // Constructor untuk TextFieldWidget dengan parameter key opsional.
  const TextFieldWidget({super.key});

  // Membuat instance dari _TextFieldWidgetState untuk menangani logika state widget ini.
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

// Class State yang berisi controller dan variabel penampung teks input.
class _TextFieldWidgetState extends State<TextFieldWidget> {
  // Controller untuk membaca dan memanipulasi teks pada TextField.
  final TextEditingController _namaController = TextEditingController();
  // Variabel string _preview untuk menyimpan teks real-time dari input nama.
  String _preview = '';

  // Method dispose untuk membersihkan resource TextEditingController ketika widget tidak lagi digunakan.
  @override
  void dispose() {
    // Membebaskan memori yang digunakan oleh _namaController.
    _namaController.dispose();
    // Memanggil method dispose bawaan dari parent class State.
    super.dispose();
  }

  // Method build untuk menyusun tampilan halaman TextField.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai kerangka utama halaman aplikasi.
    return Scaffold(
      // AppBar di bagian atas dengan judul halaman 'TextField'.
      appBar: AppBar(title: const Text('TextField')),
      // Padding memberikan jarak selebar 16.0 pixel di seluruh sisi konten body.
      body: Padding(
        // Menetapkan jarak padding 16.0 untuk semua sisi.
        padding: const EdgeInsets.all(16.0),
        // Column menyusun input field dan teks pratinjau secara vertikal.
        child: Column(
          // Mengatur perataan anak-anak widget di dalam Column rata kiri.
          crossAxisAlignment: CrossAxisAlignment.start,
          // Daftar widget anak di dalam Column.
          children: [
            // Widget TextField untuk menerima input teks interaktif dari pengguna.
            TextField(
              // Menghubungkan controller ke TextField agar nilai input dapat dipantau.
              controller: _namaController,
              // Mengatur dekorasi dan gaya visual dari TextField.
              decoration: const InputDecoration(
                // Label teks yang muncul di dalam/atas kolom input.
                labelText: 'Nama Anda',
                // Memberikan garis tepi berlapis di sekeliling kolom input.
                border: OutlineInputBorder(),
                // Menampilkan ikon orang di sisi kiri bagian dalam kolom input.
                prefixIcon: Icon(Icons.person),
              ),
              // Callback yang dipanggil setiap kali pengguna mengetik atau mengubah isi teks.
              onChanged: (value) {
                // Memperbarui state agar teks pratinjau diperbarui secara langsung (real-time).
                setState(() {
                  // Menyimpan nilai terbaru dari input ke variabel _preview.
                  _preview = value;
                });
              },
            ),
            // Memberikan jarak vertikal sebesar 16 pixel.
            const SizedBox(height: 16),
            // Menampilkan teks sapaan beserta teks yang diketik pengguna secara langsung.
            Text('Halo, $_preview!'),
          ],
        ),
      ),
    );
  }
}
