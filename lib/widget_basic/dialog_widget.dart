// Mengimpor library Flutter Material Design.
import 'package:flutter/material.dart';

// Class DialogWidget untuk mendemonstrasikan penggunaan AlertDialog dan SnackBar.
class DialogWidget extends StatelessWidget {
  // Constructor DialogWidget dengan parameter key opsional.
  const DialogWidget({super.key});

  // Fungsi untuk menampilkan dialog konfirmasi penghapusan item.
  void _tampilkanKonfirmasi(BuildContext context) {
    // Memanggil fungsi showDialog bawaan Flutter untuk memunculkan pop-up dialog.
    showDialog(
      // Meneruskan BuildContext saat ini.
      context: context,
      // Builder yang mengembalikan widget AlertDialog.
      builder: (context) {
        // AlertDialog untuk jendela dialog konfirmasi.
        return AlertDialog(
          // Judul dari dialog konfirmasi.
          title: const Text('Hapus Item?'),
          // Isi pesan penjelas di dalam dialog.
          content: const Text('Item ini akan dihapus secara permanen.'),
          // Tombol-tombol aksi pilihan pada bagian bawah dialog.
          actions: [
            // Tombol 'Batal' untuk membatalkan aksi hapus.
            TextButton(
              // Menutup dialog tanpa melakukan tindakan penghapusan.
              onPressed: () => Navigator.pop(context),
              // Teks tombol 'Batal'.
              child: const Text('Batal'),
            ),
            // Tombol 'Hapus' untuk mengonfirmasi aksi penghapusan.
            TextButton(
              // Callback saat tombol 'Hapus' ditekan.
              onPressed: () {
                // Menutup jendela dialog konfirmasi.
                Navigator.pop(context);
                // Menampilkan SnackBar umpan balik bahwa item berhasil dihapus.
                ScaffoldMessenger.of(context).showSnackBar(
                  // Pesan SnackBar umpan balik.
                  const SnackBar(content: Text('Item telah dihapus')),
                );
              },
              // Teks tombol 'Hapus'.
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  // Method build untuk menyusun tampilan utama DialogWidget.
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur dasar halaman.
    return Scaffold(
      // AppBar dengan judul 'Dialog'.
      appBar: AppBar(title: const Text('Dialog')),
      // Memposisikan konten di tengah layar.
      body: Center(
        // Tombol berwarna merah yang memicu pemanggilan dialog konfirmasi.
        child: ElevatedButton(
          // Memanggil fungsi _tampilkanKonfirmasi saat tombol diklik.
          onPressed: () => _tampilkanKonfirmasi(context),
          // Mengubah warna latar belakang tombol menjadi merah.
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          // Teks pada tombol.
          child: const Text('Hapus Item'),
        ),
      ),
    );
  }
}
