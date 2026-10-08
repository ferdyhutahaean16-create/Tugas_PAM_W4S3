// Mengimpor library Material UI dari Flutter.
import 'package:flutter/material.dart';

// Class ProfilPage sebagai tampilan sederhana untuk tab Profil pengguna.
class ProfilPage extends StatelessWidget {
  // Constructor ProfilPage dengan parameter key opsional.
  const ProfilPage({super.key});

  // Method build untuk menyusun antarmuka halaman profil.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai kerangka dasar halaman profil.
    return Scaffold(
      // AppBar di bagian atas dengan judul 'Profil Pengguna'.
      appBar: AppBar(title: const Text('Profil Pengguna')),
      // Memposisikan konten di tengah layar.
      body: Center(
        // Column menyusun avatar, nama, dan detail profil secara vertikal.
        child: Column(
          // Mengatur perataan elemen di dalam Column agar berada di tengah vertikal.
          mainAxisAlignment: MainAxisAlignment.center,
          // Daftar widget anak di dalam Column.
          children: const [
            // CircleAvatar untuk menampilkan ikon foto profil lingkaran.
            CircleAvatar(
              // Menentukan radius lingkaran sebesar 50 pixel.
              radius: 50,
              // Menampilkan ikon person di dalam foto profil.
              child: Icon(Icons.person, size: 50),
            ),
            // Memberikan jarak vertikal setinggi 16 pixel.
            SizedBox(height: 16),
            // Teks untuk menampilkan nama praktikan.
            Text(
              // Nama pengguna/praktikan.
              'Mahasiswa PAM',
              // Gaya teks nama dengan ukuran 22 dan cetak tebal.
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Memberikan jarak vertikal setinggi 8 pixel.
            SizedBox(height: 8),
            // Teks subjudul untuk menampilkan NIM atau email praktikan.
            Text(
              // Informasi NIM/Email praktikan.
              'NIM: 123456789 | PAM W4S3',
              // Gaya teks dengan warna abu-abu.
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
