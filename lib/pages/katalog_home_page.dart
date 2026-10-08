// Mengimpor library Flutter Material Design.
import 'package:flutter/material.dart';
// Mengimpor model Product.
import 'package:w4s3/models/product.dart';
// Mengimpor widget kustom ProductCard.
import 'package:w4s3/widget_basic/product_card.dart';
// Mengimpor Halaman Detail Produk Katalog.
import 'package:w4s3/pages/katalog_detail_page.dart';
// Mengimpor Halaman Form Tambah Produk.
import 'package:w4s3/pages/tambah_produk_page.dart';
// Mengimpor Halaman Profil Pengguna.
import 'package:w4s3/pages/profil_page.dart';

// Class KatalogHomePage sebagai StatefulWidget utama yang menggabungkan seluruh fitur katalog produk.
class KatalogHomePage extends StatefulWidget {
  // Constructor KatalogHomePage dengan parameter key opsional.
  const KatalogHomePage({super.key});

  // Memunculkan instance _KatalogHomePageState untuk mengelola status halaman utama.
  @override
  State<KatalogHomePage> createState() => _KatalogHomePageState();
}

// Class state yang menyimpan data produk, jumlah keranjang, dan tab terpilih.
class _KatalogHomePageState extends State<KatalogHomePage> {
  // Variabel penanda tab BottomNavigationBar yang sedang terpilih (0: Katalog, 1: Profil).
  int _tabTerpilih = 0;
  // Variabel penampung jumlah item yang ada di keranjang belanja.
  int _cartCount = 0;

  // Daftar produk awal yang berisi minimal 5 produk berbeda.
  final List<Product> _daftarProduk = [
    // Produk 1: Kursi Minimalis
    Product(nama: 'Kursi Minimalis', harga: 350000, icon: Icons.chair),
    // Produk 2: Meja Kerja Kayu
    Product(nama: 'Meja Kerja Kayu', harga: 750000, icon: Icons.table_restaurant),
    // Produk 3: Lampu Meja LED
    Product(nama: 'Lampu Meja LED', harga: 120000, icon: Icons.light),
    // Produk 4: Headphone Wireless
    Product(nama: 'Headphone Wireless', harga: 500000, icon: Icons.headphones),
    // Produk 5: Jam Dinding Digital
    Product(nama: 'Jam Dinding Digital', harga: 150000, icon: Icons.access_time),
  ];

  // Fungsi untuk menampilkan dialog konfirmasi saat menghapus produk (Bagian 5 Dialog).
  void _konfirmasiHapusProduk(int index) {
    // Menyimpan produk yang dipilih untuk dihapus.
    final productTarget = _daftarProduk[index];
    // Memanggil showDialog untuk memunculkan AlertDialog konfirmasi hapus.
    showDialog(
      // Meneruskan konteks navigasi saat ini.
      context: context,
      // Builder fungsi yang memunculkan AlertDialog.
      builder: (context) {
        // AlertDialog konfirmasi hapus item produk.
        return AlertDialog(
          // Judul dialog konfirmasi hapus.
          title: const Text('Hapus Produk?'),
          // Pesan isi dialog penjelas nama produk yang akan dihapus.
          content: Text('Apakah Anda yakin ingin menghapus "${productTarget.nama}" dari katalog?'),
          // Daftar tombol pilihan aksi pada dialog.
          actions: [
            // Tombol 'Batal' untuk menutup dialog tanpa menghapus.
            TextButton(
              // Callback menutup dialog.
              onPressed: () => Navigator.pop(context),
              // Teks tombol 'Batal'.
              child: const Text('Batal'),
            ),
            // Tombol 'Hapus' berwarna merah untuk memproses penghapusan.
            TextButton(
              // Callback aksi saat tombol 'Hapus' ditekan.
              onPressed: () {
                // Menutup jendela dialog.
                Navigator.pop(context);
                // Memperbarui state daftar produk dengan menghapus item pada indeks tertentu.
                setState(() {
                  // Menghapus produk dari list berdasarkan indeksnya.
                  _daftarProduk.removeAt(index);
                });
                // Menampilkan SnackBar umpan balik pemberitahuan bahwa produk berhasil dihapus.
                ScaffoldMessenger.of(context).showSnackBar(
                  // SnackBar pemberitahuan hapus sukses.
                  SnackBar(content: Text('Produk "${productTarget.nama}" telah dihapus.')),
                );
              },
              // Teks tombol 'Hapus' berstyling warna merah.
              child: const Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk membuka halaman TambahProdukPage (Bagian 3 Form & Bagian 4 Navigasi await).
  void _bukaFormTambahProduk() async {
    // Menunggu data Product baru yang dikembalikan dari TambahProdukPage.
    final Product? produkBaru = await Navigator.push(
      // Konteks navigasi.
      context,
      // MaterialPageRoute menuju TambahProdukPage.
      MaterialPageRoute(builder: (context) => const TambahProdukPage()),
    );

    // Memastikan widget terpasang pada tree sebelum mengakses context.
    if (!mounted) return;

    // Memeriksa jika ada produk baru yang dikembalikan dari form.
    if (produkBaru != null) {
      // Memperbarui state daftar produk untuk menambahkan produk baru.
      setState(() {
        // Menambahkan objek produkBaru ke dalam _daftarProduk.
        _daftarProduk.add(produkBaru);
      });
      // Menampilkan SnackBar umpan balik bahwa produk baru berhasil ditambahkan.
      ScaffoldMessenger.of(context).showSnackBar(
        // SnackBar pemberitahuan tambah sukses.
        SnackBar(content: Text('Produk "${produkBaru.nama}" berhasil ditambahkan!')),
      );
    }
  }

  // Widget tampilan halaman katalog produk (Tab 0).
  Widget _buildKatalogTab() {
    // Memeriksa jika daftar produk kosong.
    if (_daftarProduk.isEmpty) {
      // Menampilkan tampilan pesan jika tidak ada produk di katalog.
      return const Center(
        // Teks pemberitahuan katalog kosong.
        child: Text('Belum ada produk di katalog.', style: TextStyle(fontSize: 16)),
      );
    }

    // Menggunakan GridView.builder untuk menampilkan produk dalam bentuk kisi (Grid).
    return GridView.builder(
      // Memberikan padding 16 pixel di sekeliling area grid.
      padding: const EdgeInsets.all(16),
      // Menentukan delegate kisi grid dengan 2 kolom.
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // Menentukan jumlah kolom sebanyak 2.
        crossAxisCount: 2,
        // Jarak horizontal antar kartu produk setinggi 12 pixel.
        crossAxisSpacing: 12,
        // Jarak vertikal antar kartu produk setinggi 12 pixel.
        mainAxisSpacing: 12,
        // Mengatur rasio perbandingan lebar dan tinggi tiap item kartu grid.
        childAspectRatio: 0.85,
      ),
      // Menentukan jumlah item sesuai dengan jumlah _daftarProduk.
      itemCount: _daftarProduk.length,
      // Builder untuk membangun tiap item kartu produk di posisi indeks tertentu.
      itemBuilder: (context, index) {
        // Mengambil data produk pada indeks saat ini.
        final product = _daftarProduk[index];
        // Menggunakan widget kustom ProductCard (Bagian 7) yang telah dibuat.
        return ProductCard(
          // Meneruskan nama produk.
          nama: product.nama,
          // Meneruskan harga produk.
          harga: product.harga,
          // Meneruskan ikon produk.
          icon: product.icon,
          // Aksi ketika kartu produk di-tap: Buka KatalogDetailPage.
          onTap: () async {
            // Menunggu respon kembalian dari KatalogDetailPage jika produk ditambahkan ke keranjang.
            final bool? ditambahkan = await Navigator.push(
              // Konteks navigasi.
              context,
              // MaterialPageRoute menuju KatalogDetailPage.
              MaterialPageRoute(
                // Menginisialisasi KatalogDetailPage dengan membawa data product.
                builder: (context) => KatalogDetailPage(product: product),
              ),
            );

            // Memastikan context masih mounted sebelum pemanggilan setState & ScaffoldMessenger.
            if (!context.mounted) return;

            // Memeriksa jika pengguna mengklik 'Tambah ke Keranjang' (dikembalikan bernilai true).
            if (ditambahkan == true) {
              // Memperbarui state hitungan keranjang belanja dengan setState.
              setState(() {
                // Menambah angka keranjang sebanyak 1.
                _cartCount++;
              });
              // Menampilkan SnackBar konfirmasi penambahan keranjang.
              ScaffoldMessenger.of(context).showSnackBar(
                // SnackBar konfirmasi keranjang.
                SnackBar(content: Text('${product.nama} ditambahkan ke keranjang!')),
              );
            }
          },
          // Aksi ketika ikon hapus pada kartu produk ditekan: Tampilkan konfirmasi hapus.
          onDelete: () => _konfirmasiHapusProduk(index),
        );
      },
    );
  }

  // Method build untuk menyusun antarmuka utama KatalogHomePage beserta AppBar badge & BottomNavigationBar.
  @override
  Widget build(BuildContext context) {
    // List tampilan halaman berdasarkan tab yang aktif.
    final List<Widget> tabPages = [
      // Halaman tab 0: Katalog Produk.
      _buildKatalogTab(),
      // Halaman tab 1: Profil Pengguna.
      const ProfilPage(),
    ];

    // Scaffold sebagai kerangka halaman utama.
    return Scaffold(
      // AppBar bagian atas aplikasi.
      appBar: AppBar(
        // Judul AppBar menyesuaikan tab yang aktif.
        title: Text(_tabTerpilih == 0 ? 'Katalog Produk' : 'Profil Pengguna'),
        // Bagian aksi AppBar sebelah kanan untuk ikon keranjang belanja dengan badge angka.
        actions: [
          // Hanya tampilkan ikon keranjang jika berada di tab Katalog (tab 0).
          if (_tabTerpilih == 0)
            // Stack menggabungkan IconButton keranjang dan Container badge angka (W4S2 Stack + Positioned).
            Stack(
              // Menempatkan elemen secara terpusat di dalam Stack.
              alignment: Alignment.center,
              // Daftar anak widget di dalam Stack.
              children: [
                // Tombol ikon keranjang belanja.
                IconButton(
                  // Ikon shopping_cart.
                  icon: const Icon(Icons.shopping_cart),
                  // Callback saat ikon keranjang di-tap: Menampilkan pesan jumlah keranjang saat ini.
                  onPressed: () {
                    // Menampilkan SnackBar informasi isi keranjang.
                    ScaffoldMessenger.of(context).showSnackBar(
                      // SnackBar informasi keranjang.
                      SnackBar(content: Text('Total barang di keranjang: $_cartCount')),
                    );
                  },
                ),
                // Jika jumlah keranjang lebih dari 0, tampilkan badge merah angka di sudut atas.
                if (_cartCount > 0)
                  // Positioned memposisikan badge lingkaran angka di pojok kanan atas ikon.
                  Positioned(
                    // Jarak dari batas kanan sebesar 8 pixel.
                    right: 8,
                    // Jarak dari batas atas sebesar 8 pixel.
                    top: 8,
                    // Container lingkaran merah badge angka keranjang.
                    child: Container(
                      // Padding dalam badge sebesar 2 pixel.
                      padding: const EdgeInsets.all(2),
                      // Dekorasi lingkaran merah badge.
                      decoration: BoxDecoration(
                        // Warna merah untuk badge pemberitahuan.
                        color: Colors.red,
                        // Sudut membulat radius 10 pixel.
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Batas ukuran minimal badge angka.
                      constraints: const BoxConstraints(
                        // Lebar minimal 16 pixel.
                        minWidth: 16,
                        // Tinggi minimal 16 pixel.
                        minHeight: 16,
                      ),
                      // Teks angka penunjuk jumlah barang di keranjang.
                      child: Text(
                        // Teks string dari angka _cartCount.
                        '$_cartCount',
                        // Gaya teks badge: warna putih, ukuran 10, tebal.
                        style: const TextStyle(
                          // Warna teks putih.
                          color: Colors.white,
                          // Ukuran font 10.
                          fontSize: 10,
                          // Cetak tebal.
                          fontWeight: FontWeight.bold,
                        ),
                        // Teks Rata tengah di dalam badge.
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
      // Body menampilkan halaman tab yang sedang terpilih.
      body: tabPages[_tabTerpilih],
      // FloatingActionButton untuk menambah produk baru (hanya muncul di tab Katalog).
      floatingActionButton: _tabTerpilih == 0
          ? FloatingActionButton(
              // Menentukan callback _bukaFormTambahProduk saat FAB di-tap.
              onPressed: _bukaFormTambahProduk,
              // Menampilkan ikon plus (+).
              child: const Icon(Icons.add),
            )
          : null,
      // BottomNavigationBar untuk navigasi antar tab Katalog dan Profil (Bagian 6).
      bottomNavigationBar: BottomNavigationBar(
        // Menentukan indeks tab aktif.
        currentIndex: _tabTerpilih,
        // Callback perpindahan tab saat item ditekan.
        onTap: (index) {
          // Memperbarui state _tabTerpilih dengan setState.
          setState(() {
            // Mengubah nilai _tabTerpilih.
            _tabTerpilih = index;
          });
        },
        // Daftar item tombol pada BottomNavigationBar.
        items: const [
          // Item tab 0: Katalog Produk.
          BottomNavigationBarItem(
            // Ikon store/toko.
            icon: Icon(Icons.store),
            // Label teks 'Katalog'.
            label: 'Katalog',
          ),
          // Item tab 1: Profil Pengguna.
          BottomNavigationBarItem(
            // Ikon person/profil.
            icon: Icon(Icons.person),
            // Label teks 'Profil'.
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
