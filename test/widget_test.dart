// Mengimpor paket flutter_test untuk pengujian widget.
import 'package:flutter_test/flutter_test.dart';
// Mengimpor file main.dart aplikasi.
import 'package:w4s3/main.dart';

// Fungsi main untuk mendefinisikan pengujian widget.
void main() {
  // Menguji apakah aplikasi dapat dimuat dengan baik.
  testWidgets('Pengujian awal memuat aplikasi', (WidgetTester tester) async {
    // Membangun widget MyApp dan memicu frame pertama.
    await tester.pumpWidget(const MyApp());

    // Memastikan judul menu praktikan ditemukan pada antarmuka.
    expect(find.text('Modul W4S3 Praktikum'), findsOneWidget);
  });
}
