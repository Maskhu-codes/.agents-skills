# Secure Coding Cheat Sheet (Flutter / Dart & API)

Panduan praktis perbaikan kode (*remediation*) dari celah keamanan umum.

---

## 1. Penyimpanan Token & Kredensial Sensitif

### ❌ Salah (Insecure):
```dart
// Menggunakan SharedPreferences biasa (tersimpan dalam file XML teks polos di Android)
final prefs = await SharedPreferences.getInstance();
await prefs.setString('jwt_token', token);
```

### ✅ Benar (Secure):
```dart
// Menggunakan FlutterSecureStorage (tersimpan di Android Keystore / iOS Keychain)
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const secureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(encryptedSharedPreferences: true),
  iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
);

await secureStorage.write(key: 'jwt_token', value: token);
```

---

## 2. Pengelolaan API Key & Secret (Bukan Hardcoded)

### ❌ Salah (Insecure):
```dart
class ApiConfig {
  static const String apiKey = "AIzaSyD-sAmPLe-KeY-123456789"; // Bocor jika repo di-push!
}
```

### ✅ Benar (Secure):
Gunakan `--dart-define` saat compile:
```dart
class ApiConfig {
  static const String apiKey = String.fromEnvironment('API_KEY');
  
  static void validate() {
    assert(apiKey.isNotEmpty, 'API_KEY wajib disertakan via --dart-define');
  }
}
```
Atau gunakan package `flutter_dotenv` dengan file `.env` yang **wajib masuk ke `.gitignore`**:
```gitignore
# .gitignore
.env
.env.*
!.env.example
```

---

## 3. Redaksi Log pada Mode Produksi

### ❌ Salah (Insecure):
```dart
// Mencetak payload sensitif ke log terminal / logcat Android
print("Login Response: $responseBody"); // Password / Token ikut tercetak!
```

### ✅ Benar (Secure):
```dart
import 'package:flutter/foundation.dart';

void safeLog(String message) {
  if (kDebugMode) {
    // Hanya tercetak saat tahap development lokal
    debugPrint("[DEBUG] $message");
  }
}
```

---

## 4. Input Masking & Obfuscation (OTP & Password)

### ✅ Benar (Secure):
```dart
TextFormField(
  controller: _passwordController,
  obscureText: true,
  enableSuggestions: false,
  autocorrect: false,
  keyboardType: TextInputType.visiblePassword,
  decoration: const InputDecoration(
    labelText: 'Password',
  ),
);
```
