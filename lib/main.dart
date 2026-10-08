// Mengimpor paket Flutter Material UI untuk membangun antarmuka aplikasi.
import 'package:flutter/material.dart';
// Mengimpor widget CounterWidget dari bagian 1 modul.
import 'package:w4s3/widget_basic/counter_widget.dart';
// Mengimpor widget TextFieldWidget dari bagian 2 modul.
import 'package:w4s3/widget_basic/textfield_widget.dart';
// Mengimpor widget FormWidget dari bagian 3 modul.
import 'package:w4s3/widget_basic/form_widget.dart';
// Mengimpor halaman ProdukListPage dari bagian 4 modul.
import 'package:w4s3/pages/produk_list_page.dart';
// Mengimpor widget DialogWidget dari bagian 5 modul.
import 'package:w4s3/widget_basic/dialog_widget.dart';
// Mengimpor halaman MainNavigationPage dari bagian 6 modul.
import 'package:w4s3/pages/main_navigation_page.dart';
// Mengimpor halaman utama KatalogHomePage (Studi Kasus Tugas modul W4S3).
import 'package:w4s3/pages/katalog_home_page.dart';

// Fungsi main sebagai titik masuk utama (entry point) saat aplikasi Flutter dijalankan.
void main() {
  // Memanggil runApp untuk menginisialisasi dan menjalankan widget utama MyApp.
  runApp(const MyApp());
}

// Class MyApp sebagai Root Widget aplikasi yang mewarisi StatelessWidget.
class MyApp extends StatelessWidget {
  // Constructor MyApp dengan parameter key opsional.
  const MyApp({super.key});

  // Method build untuk mengonfigurasi MaterialApp dan tema dasar aplikasi.
  @override
  Widget build(BuildContext context) {
    // Mengembalikan MaterialApp sebagai pembungkus utama aplikasi berbasis Material Design.
    return MaterialApp(
      // Menentukan judul aplikasi.
      title: 'PAM Week 4 Sesi 3',
      // Menyembunyikan banner 'DEBUG' di pojok kanan atas layar.
      debugShowCheckedModeBanner: false,
      // Mengatur tema warna visual aplikasi menggunakan ColorScheme seed.
      theme: ThemeData(
        // Menentukan warna utama tema berbasis warna biru (Colors.blue).
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Mengaktifkan Material 3 untuk gaya tampilan UI modern.
        useMaterial3: true,
      ),
      // Menentukan halaman utama aplikasi yang pertama kali dibuka (MenuPraktikumPage).
      home: const MenuPraktikumPage(),
    );
  }
}

// Class MenuPraktikumPage sebagai menu navigasi utama untuk mengakses seluruh materi modul dan tugas akhir.
class MenuPraktikumPage extends StatelessWidget {
  // Constructor MenuPraktikumPage dengan parameter key opsional.
  const MenuPraktikumPage({super.key});

  // Method build untuk menyusun daftar opsi menu latihan modul dan tugas.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai kerangka halaman menu utama.
    return Scaffold(
      // AppBar di bagian atas dengan judul 'Modul W4S3 Praktikum'.
      appBar: AppBar(
        // Judul AppBar.
        title: const Text('Modul W4S3 Praktikum'),
        // Mengatur latar belakang AppBar menggunakan warna primary tema.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // ListView menyusun tombol menu daftar latihan dan tugas secara vertikal.
      body: ListView(
        // Memberikan padding 16 pixel di sekeliling daftar menu.
        padding: const EdgeInsets.all(16.0),
        // Daftar widget anak di dalam ListView.
        children: [
          // Card untuk highlight Tugas Utama Studi Kasus Katalog Produk.
          Card(
            // Mengatur warna latar belakang Card menjadi warna primary muda.
            color: Theme.of(context).colorScheme.primaryContainer,
            // ListTile untuk item menu Tugas Studi Kasus Katalog Produk.
            child: ListTile(
              // Ikon toko di sebelah kiri item menu.
              leading: const Icon(Icons.shopping_bag, size: 36),
              // Judul menu Tugas Utama.
              title: const Text(
                // Teks judul.
                'Tugas: Mini Aplikasi Katalog Produk',
                // Gaya teks cetak tebal (bold).
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // Subjudul penjelas gabungan seluruh materi W4S2 & W4S3.
              subtitle: const Text('Studi Kasus Katalog Produk dengan Form, Dialog, Keranjang, & Tab'),
              // Ikon panah penanda navigasi ke kanan.
              trailing: const Icon(Icons.arrow_forward_ios),
              // Callback saat menu di-tap untuk membuka KatalogHomePage.
              onTap: () {
                // Berpindah ke KatalogHomePage menggunakan Navigator.push.
                Navigator.push(
                  // Konteks navigasi.
                  context,
                  // MaterialPageRoute menuju KatalogHomePage.
                  MaterialPageRoute(builder: (context) => const KatalogHomePage()),
                );
              },
            ),
          ),
          // Memberikan jarak vertikal setinggi 16 pixel.
          const SizedBox(height: 16),
          // Teks pembatas bagian materi latihan dasar modul.
          const Text(
            // Teks judul bagian latihan.
            'Latihan Modul Bagian 1 - 7:',
            // Gaya teks judul bagian.
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // Memberikan jarak vertikal setinggi 8 pixel.
          const SizedBox(height: 8),
          // Item Menu 1: StatefulWidget & setState (CounterWidget).
          ListTile(
            // Ikon tambah.
            leading: const Icon(Icons.add_circle_outline),
            // Teks judul menu bagian 1.
            title: const Text('1. StatefulWidget & setState (Counter)'),
            // Ikon panah kanan.
            trailing: const Icon(Icons.chevron_right),
            // Callback navigasi ke CounterWidget.
            onTap: () {
              // Navigasi ke CounterWidget.
              Navigator.push(
                // Context navigasi.
                context,
                // MaterialPageRoute menuju CounterWidget.
                MaterialPageRoute(builder: (context) => const CounterWidget()),
              );
            },
          ),
          // Divider pemberi garis pemisah tipis antar item.
          const Divider(),
          // Item Menu 2: TextField (TextFieldWidget).
          ListTile(
            // Ikon edit teks.
            leading: const Icon(Icons.edit),
            // Teks judul menu bagian 2.
            title: const Text('2. TextField (Input Teks)'),
            // Ikon panah kanan.
            trailing: const Icon(Icons.chevron_right),
            // Callback navigasi ke TextFieldWidget.
            onTap: () {
              // Navigasi ke TextFieldWidget.
              Navigator.push(
                // Context.
                context,
                // MaterialPageRoute menuju TextFieldWidget.
                MaterialPageRoute(builder: (context) => const TextFieldWidget()),
              );
            },
          ),
          // Divider garis pemisah.
          const Divider(),
          // Item Menu 3: Form & Validasi (FormWidget).
          ListTile(
            // Ikon tugas/form.
            leading: const Icon(Icons.assignment),
            // Teks judul menu bagian 3.
            title: const Text('3. Form & Validasi'),
            // Ikon panah kanan.
            trailing: const Icon(Icons.chevron_right),
            // Callback navigasi ke FormWidget.
            onTap: () {
              // Navigasi ke FormWidget.
              Navigator.push(
                // Context.
                context,
                // MaterialPageRoute menuju FormWidget.
                MaterialPageRoute(builder: (context) => const FormWidget()),
              );
            },
          ),
          // Divider garis pemisah.
          const Divider(),
          // Item Menu 4: Navigasi Antar Halaman (ProdukListPage).
          ListTile(
            // Ikon navigasi peta.
            leading: const Icon(Icons.alt_route),
            // Teks judul menu bagian 4.
            title: const Text('4. Navigasi Antar Halaman & Kirim Data'),
            // Ikon panah kanan.
            trailing: const Icon(Icons.chevron_right),
            // Callback navigasi ke ProdukListPage.
            onTap: () {
              // Navigasi ke ProdukListPage.
              Navigator.push(
                // Context.
                context,
                // MaterialPageRoute menuju ProdukListPage.
                MaterialPageRoute(builder: (context) => ProdukListPage()),
              );
            },
          ),
          // Divider garis pemisah.
          const Divider(),
          // Item Menu 5: Dialog & SnackBar (DialogWidget).
          ListTile(
            // Ikon pesan/dialog.
            leading: const Icon(Icons.chat_bubble_outline),
            // Teks judul menu bagian 5.
            title: const Text('5. Dialog & SnackBar'),
            // Ikon panah kanan.
            trailing: const Icon(Icons.chevron_right),
            // Callback navigasi ke DialogWidget.
            onTap: () {
              // Navigasi ke DialogWidget.
              Navigator.push(
                // Context.
                context,
                // MaterialPageRoute menuju DialogWidget.
                MaterialPageRoute(builder: (context) => const DialogWidget()),
              );
            },
          ),
          // Divider garis pemisah.
          const Divider(),
          // Item Menu 6: BottomNavigationBar (MainNavigationPage).
          ListTile(
            // Ikon navigasi tab bawah.
            leading: const Icon(Icons.tab),
            // Teks judul menu bagian 6.
            title: const Text('6. BottomNavigationBar (Navigasi Tab)'),
            // Ikon panah kanan.
            trailing: const Icon(Icons.chevron_right),
            // Callback navigasi ke MainNavigationPage.
            onTap: () {
              // Navigasi ke MainNavigationPage.
              Navigator.push(
                // Context.
                context,
                // MaterialPageRoute menuju MainNavigationPage.
                MaterialPageRoute(builder: (context) => const MainNavigationPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
