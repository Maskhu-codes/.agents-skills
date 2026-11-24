# Flutter Test Harness dengan Mocktail

Panduan resmi membangun *test harness* pada proyek Flutter menggunakan `mocktail`. Bebas dari `build_runner` yang lambat dan 100% *null-safe*.

---

## 1. Setup Dependencies di `pubspec.yaml`

Tambahkan di bawah `dev_dependencies`:
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.4
```

---

## 2. Struktur Dasar Test Harness

Setiap file pengujian harus mengikuti pola **Arrange - Act - Assert (AAA)**:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

// 1. Buat Mock Class
class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;

  // 2. Setup sebelum setiap tes
  setUp(() {
    mockHttpClient = MockHttpClient();
    // Jika ada parameter Uri/Object kompleks yang perlu didaftarkan fallback-nya:
    registerFallbackValue(Uri.parse('https://example.com'));
  });

  group('Kategori Pengujian Service', () {
    test('🟢 Harus mengembalikan data sukses ketika respon server 200 OK', () async {
      // ARRANGE (Persiapan Mock)
      when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('{"status": "success"}', 200));

      // ACT (Eksekusi fungsi yang diuji)
      // final result = await myService.fetchData(client: mockHttpClient);

      // ASSERT (Verifikasi hasil & verifikasi pemanggilan)
      // expect(result.status, equals('success'));
      verify(() => mockHttpClient.get(any(), headers: any(named: 'headers'))).called(1);
    });

    test('🔴 Harus melempar exception ketika respon server 500', () async {
      // ARRANGE
      when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Internal Server Error', 500));

      // ACT & ASSERT
      // expect(() => myService.fetchData(client: mockHttpClient), throwsA(isA<ServerException>()));
    });
  });
}
```

---

## 3. Menangani Parameter Kompleks (registerFallbackValue)

Jika metode yang di-*mock* menerima tipe data buatan sendiri (bukan primitif string/int), daftarkan fallback di `setUpAll`:

```dart
class FakeUri extends Fake implements Uri {}

setUpAll(() {
  registerFallbackValue(FakeUri());
});
```
