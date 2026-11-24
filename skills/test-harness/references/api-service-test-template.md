# Template Test Harness: API Service & OTP Flow

Template siap pakai untuk menguji modul otentikasi, pendaftaran, dan verifikasi OTP.

---

```dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

// Mock dependencies
class MockHttpClient extends Mock implements http.Client {}

// Contoh Service yang diuji
class AuthService {
  final http.Client client;
  final String baseUrl;

  AuthService({required this.client, this.baseUrl = 'https://api.example.com'});

  Future<bool> verifyOtp({required String phone, required String otp}) async {
    if (otp.length != 6) {
      throw ArgumentError('OTP harus 6 digit');
    }

    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone, 'otp': otp}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['verified'] == true;
      } else if (response.statusCode == 400) {
        throw Exception('Kode OTP salah atau sudah kadaluarsa');
      } else {
        throw Exception('Terjadi kesalahan server: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Tidak ada koneksi internet');
    }
  }
}

void main() {
  late MockHttpClient mockClient;
  late AuthService authService;

  setUp(() {
    mockClient = MockHttpClient();
    authService = AuthService(client: mockClient);
    registerFallbackValue(Uri.parse('https://api.example.com'));
  });

  group('AuthService - verifyOtp', () {
    const testPhone = '081234567890';
    const testOtp = '123456';

    test('Lulus verifikasi ketika server mengembalikan status 200 dan verified=true', () async {
      // Arrange
      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({'verified': true, 'message': 'OTP Valid'}),
            200,
          ));

      // Act
      final result = await authService.verifyOtp(phone: testPhone, otp: testOtp);

      // Assert
      expect(result, isTrue);
      verify(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).called(1);
    });

    test('Melempar ArgumentError jika OTP kurang dari 6 digit tanpa memanggil API', () async {
      // Act & Assert
      expect(
        () => authService.verifyOtp(phone: testPhone, otp: '123'),
        throwsArgumentError,
      );

      // Pastikan HTTP client TIDAK PERNAH dipanggil (hemat kuota & cegah request sia-sia)
      verifyNever(() => mockClient.post(any(), headers: any(named: 'headers'), body: any(named: 'body')));
    });

    test('Melempar Exception ketika OTP salah (Respon 400)', () async {
      // Arrange
      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({'message': 'Invalid OTP'}),
            400,
          ));

      // Act & Assert
      expect(
        () => authService.verifyOtp(phone: testPhone, otp: testOtp),
        throwsA(predicate((e) => e is Exception && e.toString().contains('Kode OTP salah'))),
      );
    });

    test('Melempar Exception ramah ketika koneksi internet terputus (SocketException)', () async {
      // Arrange
      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenThrow(const SocketException('Network unreachable'));

      // Act & Assert
      expect(
        () => authService.verifyOtp(phone: testPhone, otp: testOtp),
        throwsA(predicate((e) => e is Exception && e.toString().contains('Tidak ada koneksi internet'))),
      );
    });
  });
}
```
