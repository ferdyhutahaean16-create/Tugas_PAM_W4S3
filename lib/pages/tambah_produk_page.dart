// Mengimpor library Material UI dari Flutter.
import 'package:flutter/material.dart';
// Mengimpor data model Product.
import 'package:w4s3/models/product.dart';

// Class TambahProdukPage sebagai StatefulWidget untuk form penambahan produk baru.
class TambahProdukPage extends StatefulWidget {
  // Constructor TambahProdukPage dengan parameter key opsional.
  const TambahProdukPage({super.key});

  // Memunculkan instance state _TambahProdukPageState.
  @override
  State<TambahProdukPage> createState() => _TambahProdukPageState();
}

// Class state yang mengelola kondisi form dan input text controller.
class _TambahProdukPageState extends State<TambahProdukPage> {
  // Key unik GlobalKey<FormState> untuk memvalidasi elemen-elemen di dalam Form.
  final _formKey = GlobalKey<FormState>();
  // TextEditingController untuk membaca teks nama produk dari input.
  final _namaController = TextEditingController();
  // TextEditingController untuk membaca nilai harga produk dari input.
  final _hargaController = TextEditingController();

  // Method dispose untuk membersihkan memori controller saat widget dihancurkan.
  @override
  void dispose() {
    // Membebaskan resource controller nama.
    _namaController.dispose();
    // Membebaskan resource controller harga.
    _hargaController.dispose();
    // Memanggil method dispose bawaan parent class State.
    super.dispose();
  }

  // Fungsi _simpan untuk memvalidasi form dan mengembalikan objek Product baru ke halaman sebelumnya.
  void _simpan() {
    // Memeriksa jika seluruh field form telah lolos validasi.
    if (_formKey.currentState!.validate()) {
      // Mengonversi teks input harga menjadi bilangan bulat (integer).
      final int hargaParsed = int.parse(_hargaController.text);
      // Membuat objek Product baru dari data input nama dan harga.
      final newProduct = Product(
        // Menetapkan nama produk dari input controller nama.
        nama: _namaController.text,
        // Menetapkan harga produk dari hasil konversi integer.
        harga: hargaParsed,
        // Menetapkan ikon default belanja untuk produk baru.
        icon: Icons.card_giftcard,
      );
      // Menutup halaman form dan mengembalikan objek newProduct ke pemanggil.
      Navigator.pop(context, newProduct);
    }
  }

  // Method build untuk membangun struktur visual halaman form tambah produk.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur utama halaman.
    return Scaffold(
      // AppBar di bagian atas dengan judul 'Tambah Produk Baru'.
      appBar: AppBar(title: const Text('Tambah Produk Baru')),
      // Padding memberikan jarak 16 pixel di sekeliling body.
      body: Padding(
        // Padding 16 pixel di seluruh batas.
        padding: const EdgeInsets.all(16.0),
        // Widget Form membungkus beberapa TextFormField untuk validasi kolektif.
        child: Form(
          // Memasangkan _formKey ke widget Form.
          key: _formKey,
          // Column menyusun elemen-elemen input form secara vertikal.
          child: Column(
            // Mengatur perataan anak-anak widget di dalam Column ke rata kiri.
            crossAxisAlignment: CrossAxisAlignment.start,
            // Daftar widget anak di dalam Column form.
            children: [
              // TextFormField untuk menginput nama produk.
              TextFormField(
                // Menghubungkan controller nama ke TextFormField ini.
                controller: _namaController,
                // Mengatur dekorasi visual input nama produk.
                decoration: const InputDecoration(
                  // Label teks 'Nama Produk'.
                  labelText: 'Nama Produk',
                  // Garis tepi berlapis kotak di sekeliling input.
                  border: OutlineInputBorder(),
                  // Ikon shopping bag di sisi kiri input.
                  prefixIcon: Icon(Icons.shopping_bag),
                ),
                // Fungsi validator untuk memeriksa isi kolom nama produk.
                validator: (value) {
                  // Memeriksa jika input bernilai null atau string kosong.
                  if (value == null || value.trim().isEmpty) {
                    // Mengembalikan pesan kesalahan jika nama belum diisi.
                    return 'Nama produk wajib diisi';
                  }
                  // Mengembalikan null jika input valid.
                  return null;
                },
              ),
              // Memberikan jarak vertikal setinggi 16 pixel antar input field.
              const SizedBox(height: 16),
              // TextFormField untuk menginput harga produk.
              TextFormField(
                // Menghubungkan controller harga ke TextFormField ini.
                controller: _hargaController,
                // Menentukan jenis keyboard berupa angka (number).
                keyboardType: TextInputType.number,
                // Mengatur dekorasi visual input harga produk.
                decoration: const InputDecoration(
                  // Label teks 'Harga Produk (Rp)'.
                  labelText: 'Harga Produk (Rp)',
                  // Garis tepi berlapis kotak di sekeliling input.
                  border: OutlineInputBorder(),
                  // Ikon attach_money di sisi kiri input.
                  prefixIcon: Icon(Icons.attach_money),
                ),
                // Fungsi validator untuk memeriksa keabsahan angka harga produk.
                validator: (value) {
                  // Memeriksa jika input bernilai null atau string kosong.
                  if (value == null || value.trim().isEmpty) {
                    // Mengembalikan pesan kesalahan jika harga belum diisi.
                    return 'Harga produk wajib diisi';
                  }
                  // Mencoba melakukan konversi string ke integer.
                  if (int.tryParse(value) == null) {
                    // Mengembalikan pesan kesalahan jika harga bukan angka valid.
                    return 'Harga harus berupa angka yang valid';
                  }
                  // Memeriksa jika nilai harga kurang dari atau sama dengan nol.
                  if (int.parse(value) <= 0) {
                    // Mengembalikan pesan kesalahan jika harga tidak lebih dari nol.
                    return 'Harga harus lebih besar dari 0';
                  }
                  // Mengembalikan null jika input harga valid.
                  return null;
                },
              ),
              // Memberikan jarak vertikal setinggi 24 pixel sebelum tombol simpan.
              const SizedBox(height: 24),
              // SizedBox selebar double.infinity agar tombol memenuhi lebar layar.
              SizedBox(
                // Mengatur lebar selebar layar yang tersedia.
                width: double.infinity,
                // ElevatedButton untuk menyimpan data produk baru.
                child: ElevatedButton.icon(
                  // Menentukan fungsi _simpan yang dipanggil saat tombol diklik.
                  onPressed: _simpan,
                  // Menampilkan ikon simpan pada tombol.
                  icon: const Icon(Icons.save),
                  // Menampilkan teks 'Simpan Produk' pada tombol.
                  label: const Text('Simpan Produk'),
                  // Menyesuaikan gaya bantalan dalam (padding) tombol.
                  style: ElevatedButton.styleFrom(
                    // Memberikan padding vertikal 12 pixel pada tombol.
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
