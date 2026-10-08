// Mengimpor library Material UI dari Flutter.
import 'package:flutter/material.dart';

// Class MainNavigationPage sebagai StatefulWidget untuk navigasi berbasis tab di bagian bawah layar.
class MainNavigationPage extends StatefulWidget {
  // Constructor MainNavigationPage dengan key opsional.
  const MainNavigationPage({super.key});

  // Memunculkan state _MainNavigationPageState.
  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

// Class state yang menyimpan indeks tab aktif dan daftar widget tampilan untuk tiap tab.
class _MainNavigationPageState extends State<MainNavigationPage> {
  // Variabel penanda indeks tab yang sedang aktif, diinisialisasi 0 (Beranda).
  int _tabTerpilih = 0;

  // List widget untuk tiap halaman yang akan ditampilkan sesuai tab yang dipilih.
  final List<Widget> _halaman = const [
    // Halaman Beranda pada indeks 0.
    Center(child: Text('Halaman Beranda', style: TextStyle(fontSize: 20))),
    // Halaman Favorit pada indeks 1.
    Center(child: Text('Halaman Favorit', style: TextStyle(fontSize: 20))),
    // Halaman Profil pada indeks 2.
    Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 20))),
  ];

  // Method build untuk menyusun struktur navigasi utama aplikasi.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai kerangka halaman utama.
    return Scaffold(
      // AppBar bagian atas dengan judul 'Main Navigation'.
      appBar: AppBar(title: const Text('Main Navigation')),
      // Body menampilkan halaman sesuai indeks tab yang sedang terpilih.
      body: _halaman[_tabTerpilih],
      // BottomNavigationBar untuk item navigasi tab di bagian bawah layar.
      bottomNavigationBar: BottomNavigationBar(
        // Menentukan indeks tab aktif saat ini.
        currentIndex: _tabTerpilih,
        // Callback yang dijalankan ketika salah satu ikon tab di-tap.
        onTap: (index) {
          // Memperbarui state agar halaman berpindah ke tab yang dipilih.
          setState(() {
            // Mengubah nilai _tabTerpilih ke indeks baru yang ditekan.
            _tabTerpilih = index;
          });
        },
        // Daftar item tombol pada BottomNavigationBar.
        items: const [
          // Item tab pertama: Beranda.
          BottomNavigationBarItem(
            // Ikon rumah untuk tab beranda.
            icon: Icon(Icons.home),
            // Label teks untuk tab beranda.
            label: 'Beranda',
          ),
          // Item tab kedua: Favorit.
          BottomNavigationBarItem(
            // Ikon hati untuk tab favorit.
            icon: Icon(Icons.favorite),
            // Label teks untuk tab favorit.
            label: 'Favorit',
          ),
          // Item tab ketiga: Profil.
          BottomNavigationBarItem(
            // Ikon orang untuk tab profil.
            icon: Icon(Icons.person),
            // Label teks untuk tab profil.
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
