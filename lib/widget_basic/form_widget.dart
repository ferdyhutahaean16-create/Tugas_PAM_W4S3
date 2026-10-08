// Mengimpor paket Flutter Material UI untuk widget berbasis Material Design.
import 'package:flutter/material.dart';

// Mendefinisikan FormWidget sebagai StatefulWidget untuk mengelola form ber-state dengan validasi.
class FormWidget extends StatefulWidget {
  // Constructor untuk FormWidget dengan super.key opsional.
  const FormWidget({super.key});

  // Memunculkan instance _FormWidgetState yang mengelola status form.
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

// Class state yang berisi controller, kunci form, dan metode pengiriman/validasi data.
class _FormWidgetState extends State<FormWidget> {
  // GlobalKey unik untuk mengidentifikasi dan memvalidasi Form secara global.
  final _formKey = GlobalKey<FormState>();
  // Controller untuk membaca nilai teks dari kolom input nama lengkap.
  final _namaController = TextEditingController();
  // Controller untuk membaca nilai teks dari kolom input email.
  final _emailController = TextEditingController();

  // Fungsi untuk menjalankan validasi form dan menampilkan SnackBar jika berhasil.
  void _submit() {
    // Memeriksa apakah seluruh field di dalam form memenuhi kriteria validator.
    if (_formKey.currentState!.validate()) {
      // Menampilkan SnackBar jika validasi form berhasil.
      ScaffoldMessenger.of(context).showSnackBar(
        // Menampilkan pesan persetujuan berisi nama yang diinputkan.
        SnackBar(content: Text('Form valid! Nama: ${_namaController.text}')),
      );
    }
  }

  // Method build untuk menyusun tampilan halaman form pendaftaran.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur halaman dasar aplikasi.
    return Scaffold(
      // AppBar di bagian atas halaman dengan judul 'Form Pendaftaran'.
      appBar: AppBar(title: const Text('Form Pendaftaran')),
      // Memberikan padding 16 pixel di sekeliling area form.
      body: Padding(
        // Menentukan padding 16 pixel untuk seluruh batas tepi.
        padding: const EdgeInsets.all(16.0),
        // Widget Form membungkus beberapa TextFormField untuk dikelola bersama-sama.
        child: Form(
          // Memasangkan _formKey ke widget Form ini.
          key: _formKey,
          // Column menyusun input-input form secara vertikal.
          child: Column(
            // Mengatur perataan elemen di dalam Column agar rata kiri.
            crossAxisAlignment: CrossAxisAlignment.start,
            // Daftar widget anak di dalam Column form.
            children: [
              // TextFormField untuk menginput nama lengkap dengan fitur validasi.
              TextFormField(
                // Mengaitkan controller untuk membaca isi input nama.
                controller: _namaController,
                // Mengatur dekorasi tampilan input seperti label dan border.
                decoration: const InputDecoration(
                  // Menampilkan label 'Nama Lengkap'.
                  labelText: 'Nama Lengkap',
                  // Menampilkan garis tepi kotak di sekeliling input.
                  border: OutlineInputBorder(),
                ),
                // Fungsi validasi untuk mengecek ketersediaan input nama.
                validator: (value) {
                  // Memeriksa jika input bernilai null atau kosong.
                  if (value == null || value.isEmpty) {
                    // Mengembalikan pesan error jika input kosong.
                    return 'Nama wajib diisi';
                  }
                  // Mengembalikan null jika input valid tanpa pesan error.
                  return null;
                },
              ),
              // Memberikan jarak vertikal setinggi 16 pixel.
              const SizedBox(height: 16),
              // TextFormField untuk menginput email dengan fitur validasi email.
              TextFormField(
                // Mengaitkan controller untuk membaca isi input email.
                controller: _emailController,
                // Mengatur dekorasi tampilan input email.
                decoration: const InputDecoration(
                  // Menampilkan label 'Email'.
                  labelText: 'Email',
                  // Menampilkan garis tepi kotak di sekeliling input email.
                  border: OutlineInputBorder(),
                ),
                // Fungsi validasi untuk memvalidasi format email.
                validator: (value) {
                  // Memeriksa jika input email kosong.
                  if (value == null || value.isEmpty) {
                    // Mengembalikan pesan error jika email belum diisi.
                    return 'Email wajib diisi';
                  }
                  // Memeriksa apakah input mengandung karakter '@'.
                  if (!value.contains('@')) {
                    // Mengembalikan pesan error jika format email tidak sesuai.
                    return 'Format email tidak valid';
                  }
                  // Mengembalikan null jika format email valid.
                  return null;
                },
              ),
              // Memberikan jarak vertikal setinggi 24 pixel sebelum tombol.
              const SizedBox(height: 24),
              // ElevatedButton untuk memicu aksi pengiriman/validasi form.
              ElevatedButton(
                // Menentukan aksi _submit yang dijalankan saat tombol 'Daftar' ditekan.
                onPressed: _submit,
                // Menampilkan teks 'Daftar' pada tombol.
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
