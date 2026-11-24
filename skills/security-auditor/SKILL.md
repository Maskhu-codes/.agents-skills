---
name: security-auditor
description: Standar audit keamanan aplikasi (AppSec) berbasis OWASP MASVS (Mobile) dan OWASP API Top 10. Memeriksa kebocoran token/secret, insecure data storage, otentikasi lemah, dan kerentanan injeksi sebelum kode dirilis ke produksi.
---

# 🛡️ Security Auditor Skill (OWASP Standard)

Skill ini memberikan SOP (*Standard Operating Procedure*) untuk melakukan audit keamanan statis (*Static Application Security Testing* / SAST) dan *threat modeling* pada kode aplikasi (khususnya Mobile Flutter dan Web/Backend API).

---

## 🎯 Kapan Skill Ini Digunakan?

1. **Pre-Commit / Pre-PR Audit:** Sebelum kode di-merge atau di-push ke branch utama.
2. **Review Fitur Sensitif:** Pada modul autentikasi, pembayaran, pendaftaran pasien/user, OTP, penyimpanan data lokal, dan komunikasi HTTP/WebSocket.
3. **Persiapan Rilis:** Sebelum build APK/IPA untuk Google Play Store atau Apple App Store.

---

## 🔍 5 Aturan Emas Audit Keamanan (The 5 Golden Rules)

### 1. Zero Hardcoded Secrets (Aturan Nol Kebocoran Kunci)
* **DILARANG KERAS** menyimpan API Key, JWT Secret, Database Password, Private Key, atau Client Secret secara langsung di source code (`.dart`, `.js`, `.ts`, `.py`, `.env` yang masuk git).
* **Solusi Wajib:**
  * Gunakan file `.env` yang terdaftar di `.gitignore`.
  * Gunakan runtime configuration (misal `--dart-define` atau `--dart-define-from-file` pada Flutter).
  * Simpan secret di Environment Variable server / CI/CD secrets (GitHub Secrets).

### 2. Secure Local Storage (Penyimpanan Aman)
* **DILARANG** menyimpan token sesi, password, data medis/pribadi (PII), atau refresh token di storage polos:
  * ❌ `SharedPreferences` (Android/iOS)
  * ❌ `localStorage` / `sessionStorage` (Web)
* **Wajib Gunakan Storage Terenkripsi:**
  * ✅ `flutter_secure_storage` (menggunakan Android Keystore & iOS Keychain).
  * ✅ Enkripsi SQLite menggunakan SQLCipher (misal pada Drift/Floor).

### 3. Transport Security & Network Protection
* **Wajib HTTPS / TLS 1.3** di semua endpoint produksi.
* Nonaktifkan `cleartext traffic` (HTTP biasa) di Android Manifest dan iOS Info.plist untuk build release.
* Validasi input payload dan header `Authorization: Bearer <token>` pada setiap request sensitif.
* Lindungi endpoint dari serangan Man-in-the-Middle (MitM) dengan mempertimbangkan SSL Certificate Pinning pada aplikasi transaksi finansial / medis.

### 4. Broken Object Level Authorization (BOLA / IDOR)
* Jangan pernah percaya ID yang dikirim dari client tanpa memverifikasi hak akses pengguna yang sedang login.
* Contoh: `GET /api/v1/patients/{patient_id}/records` -> Backend WAJIB memvalidasi apakah user token yang merequest benar-benar dokter/pasien pemilik data tersebut.

### 5. Input Sanitization & SQL/NoSQL Injection
* Selalu gunakan parameterized queries / ORM resmi.
* Validasi dan sanitasi input form (tipe data, panjang karakter, regex format nomor HP, email, dsb).

---

## 📋 Prosedur Audit Langkah-demi-Langkah (SOP)

Saat diminta mengaudit keamanan kode, jalankan langkah berikut:

### Langkah 1: Scanning Secret & Credentials Leakage
Cari pola-pola berbahaya:
```text
- Pola Regex: (api_key|apikey|secret|password|bearer|auth_token)\s*=\s*['"][a-zA-Z0-9_\-\.]{8,}['"]
- File pengecekan: lib/**/*.dart, config/, .env.example, pubspec.yaml
```

### Langkah 2: Audit Storage & State Management
Periksa di mana data sesi disimpan:
* Cari pemanggilan `SharedPreferences.getInstance()`:
  * Apakah ada kunci seperti `'token'`, `'jwt'`, `'refresh_token'`, `'password'`?
  * Jika ada, **Kategori: High Vulnerability** -> Wajib migrasikan ke `FlutterSecureStorage`.

### Langkah 3: Audit Error Handling & Logging
* Pastikan log debug seperti `print()` atau `log()` **TIDAK** mencetak payload sensitif di mode release (password, token OTP, nomor rekam medis).
* Gunakan conditional logging (misal `if (kDebugMode)` di Flutter).

### Langkah 4: Buat Laporan Temuan (Security Finding Report)
Format laporan audit wajib menyertakan:
1. **Tingkat Keparahan (Severity):** Critical / High / Medium / Low.
2. **Lokasi File & Baris:** `file:///path/to/file.dart#L12-L20`.
3. **Deskripsi Kerentanan:** Mengapa ini berbahaya.
4. **Bukti Kode (Vulnerable Code vs Remediation Code):** Sebelum vs Sesudah.
5. **Standar Referensi:** Nomor klausul OWASP MASVS atau OWASP API.

---

## 📚 Referensi Tersedia
* [owasp-mobile-checklist.md](file:///D:/agents-skills/skills/security-auditor/references/owasp-mobile-checklist.md) - Checklist lengkap OWASP MASVS untuk aplikasi Mobile.
* [owasp-api-checklist.md](file:///D:/agents-skills/skills/security-auditor/references/owasp-api-checklist.md) - Checklist OWASP API Top 10.
* [secure-coding-cheatsheet.md](file:///D:/agents-skills/skills/security-auditor/references/secure-coding-cheatsheet.md) - Contoh kode aman (Secure Storage, Environment Variables, Error Redaction).
