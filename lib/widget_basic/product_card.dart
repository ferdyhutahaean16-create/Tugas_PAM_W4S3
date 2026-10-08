// Mengimpor paket Flutter Material UI.
import 'package:flutter/material.dart';

// Class ProductCard sebagai reusable widget untuk menampilkan kartu item produk.
class ProductCard extends StatelessWidget {
  // Property string untuk menampung nama produk.
  final String nama;
  // Property integer untuk menampung harga produk.
  final int harga;
  // Property fungsi callback VoidCallback saat kartu produk ditekan.
  final VoidCallback onTap;
  // Property opsional fungsi callback VoidCallback saat tombol hapus ditekan.
  final VoidCallback? onDelete;
  // Property opsional IconData untuk ikon produk.
  final IconData? icon;

  // Constructor ProductCard yang menerima parameter wajib nama, harga, dan onTap.
  const ProductCard({
    // Key unik untuk widget.
    super.key,
    // Parameter nama produk wajib diisi.
    required this.nama,
    // Parameter harga produk wajib diisi.
    required this.harga,
    // Parameter callback onTap wajib diisi.
    required this.onTap,
    // Parameter opsional callback onDelete.
    this.onDelete,
    // Parameter opsional icon produk.
    this.icon,
  });

  // Method build untuk menyusun tampilan kartu produk.
  @override
  Widget build(BuildContext context) {
    // GestureDetector mendeteksi ketukan (tap) pada kartu produk.
    return GestureDetector(
      // Mengaitkan event ketukan ke callback fungsi onTap.
      onTap: onTap,
      // Container sebagai pembungkus kartu produk dengan gaya visual.
      child: Container(
        // Memberikan padding dalam sebesar 12 pixel di seluruh sisi kartu.
        padding: const EdgeInsets.all(12),
        // Dekorasi visual seperti warna latar dan sudut melengkung.
        decoration: BoxDecoration(
          // Warna latar belakang kartu abu-abu muda.
          color: Colors.grey[200],
          // Membuat sudut kartu melengkung dengan radius 12 pixel.
          borderRadius: BorderRadius.circular(12),
        ),
        // Column menyusun ikon, informasi teks nama, harga, dan tombol hapus.
        child: Column(
          // Mengatur perataan elemen di dalam Column ke rata kiri.
          crossAxisAlignment: CrossAxisAlignment.start,
          // Mengatur ukuran Column agar menyesuaikan isi konten.
          mainAxisSize: MainAxisSize.min,
          // Daftar widget anak di dalam Column.
          children: [
            // Memeriksa jika ada ikon produk yang diberikan.
            if (icon != null) ...[
              // Menampilkan ikon produk di dalam Container melingkar.
              Center(
                // Menempatkan ikon di tengah secara horizontal.
                child: Icon(
                  // Menggunakan icon dari parameter.
                  icon,
                  // Ukuran ikon sebesar 40 pixel.
                  size: 40,
                  // Warna ikon menggunakan warna utama tema (primary).
                  color: Theme.of(context).primaryColor,
                ),
              ),
              // Memberikan jarak vertikal setinggi 8 pixel setelah ikon.
              const SizedBox(height: 8),
            ],
            // Row menyusun nama produk dan tombol hapus jika ada secara horizontal.
            Row(
              // Mengatur perataan utama menjadi spaceBetween agar tombol hapus berada di kanan.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // Daftar anak widget di dalam Row nama produk.
              children: [
                // Expanded agar teks nama produk fleksibel memenuhi ruang.
                Expanded(
                  // Teks untuk nama produk.
                  child: Text(
                    // Menampilkan nilai dari variabel nama.
                    nama,
                    // Gaya teks: berat font semi-bold (600) dan ukuran font 16.
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    // Memotong teks dengan titik-titik jika terlalu panjang.
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Jika callback onDelete tidak null, tampilkan tombol hapus ikon sampah.
                if (onDelete != null)
                  // IconButton untuk aksi menghapus produk.
                  IconButton(
                    // Mengurangi ukuran padding ikon agar ringkas.
                    padding: EdgeInsets.zero,
                    // Mengurangi batas area sentuh tombol.
                    constraints: const BoxConstraints(),
                    // Ikon sampah berwarna merah.
                    icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                    // Mengaitkan callback onDelete saat ikon ditekan.
                    onPressed: onDelete,
                  ),
              ],
            ),
            // Memberikan jarak vertikal setinggi 4 pixel antar teks.
            const SizedBox(height: 4),
            // Teks untuk harga produk.
            Text(
              // Menampilkan harga produk format Rp.
              'Rp $harga',
              // Mengatur warna teks menjadi abu-abu.
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
