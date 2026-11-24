# OWASP Mobile Application Security Verification Standard (MASVS) Checklist

Gunakan checklist ini sebagai panduan audit kepatuhan keamanan aplikasi mobile (Flutter / Android / iOS).

---

## 1. MASVS-STORAGE: Penyimpanan Data Aman
- [ ] **Data Sensitif Terenkripsi:** Token otentikasi (JWT/Bearer), refresh token, dan informasi pribadi (PII) disimpan di Keychain (iOS) atau Keystore (Android) melalui `flutter_secure_storage`.
- [ ] **Tidak Ada Log Sensitif:** Tidak ada perintah `print()`, `debugPrint()`, atau log pihak ketiga yang mencetak data kartu, password, atau OTP di rilis produksi.
- [ ] **Cache & Keyboard Cache:** Field input password/OTP menonaktifkan autocorrect dan auto-suggest (`autocorrect: false`, `enableSuggestions: false`, `obscureText: true`).
- [ ] **Screenshots / App Switcher Privacy:** Di iOS dan Android, layar yang menampilkan informasi sensitif (medis, saldo rekening) disamarkan (*blur* / *screen protection*) saat aplikasi berada di background.

---

## 2. MASVS-CRYPTO: Kriptografi yang Benar
- [ ] **Algoritma Kuat:** Menggunakan standar enkripsi modern (AES-GCM 256-bit atau ChaCha20-Poly1305). Hindari DES, 3DES, MD5, atau SHA-1 untuk tujuan keamanan.
- [ ] **Random Number Generator yang Aman:** Pembuatan token/nonce menggunakan CSPRNG (`Random.secure()` di Dart), bukan `Random()` biasa.
- [ ] **Kunci Tidak Dibuat Statis:** Kunci enkripsi tidak di-hardcode di kode aplikasi.

---

## 3. MASVS-AUTH: Otentikasi & Otorisasi
- [ ] **Otentikasi di Sisi Server:** Seluruh verifikasi otentikasi (termasuk verifikasi biometrik seperti FaceID/Fingerprint) harus divalidasi dengan token kriptografi dari server, bukan sekadar boolean `isAuthenticated = true` di sisi client.
- [ ] **Sesi Kadaluarsa (Session Expiration):** Token akses memiliki masa berlaku singkat (misal: 15–60 menit) dan menggunakan refresh token dengan mekanisme rotasi.
- [ ] **Proteksi Brute-Force OTP:** Alur pengiriman dan input OTP membatasi percobaan (maksimal 3–5 kali) dengan jeda waktu (*rate limiting / cooldown timer*).

---

## 4. MASVS-NETWORK: Keamanan Jaringan
- [ ] **Wajib HTTPS / TLS:** Tidak ada panggilan API menggunakan protokol HTTP polos (`http://`).
- [ ] **Validasi Sertifikat (Certificate Pinning):** Untuk endpoint transaksi kritis, lakukan pinning terhadap sertifikat SSL/TLS atau public key untuk mencegah serangan *Man-in-the-Middle* (MitM).
- [ ] **Nonaktifkan Cleartext Traffic:**
  - Android: `android:usesCleartextTraffic="false"` pada `AndroidManifest.xml`.
  - iOS: `NSAppTransportSecurity` melarang arbitrary HTTP loads.

---

## 5. MASVS-PLATFORM: Konfigurasi Platform & Izin
- [ ] **Prinsip Hak Akses Minimal (Least Privilege):** Hanya meminta izin (kamera, lokasi, mikrofon, storage) jika benar-benar digunakan saat itu juga (*runtime permission*).
- [ ] **Exported Components:** Activity, BroadcastReceiver, atau Service di Android yang tidak diperlukan oleh aplikasi luar diberi tanda `android:exported="false"`.
- [ ] **Deep Link / Universal Link Validation:** Parameter yang diterima dari deep link wajib divalidasi secara ketat sebelum dinavigasi untuk mencegah bypass otentikasi.

---

## 6. MASVS-CODE: Kualitas & Integritas Kode
- [ ] **Obfuscation & Minification:** Build rilis menggunakan fitur obfuscation (misal: `--obfuscate --split-debug-info` pada Flutter build).
- [ ] **Cek Root / Jailbreak:** Aplikasi transaksi kritis mendeteksi apakah perangkat dalam kondisi rooted/jailbroken.
- [ ] **Update Dependency:** Semua package pihak ketiga di `pubspec.yaml` diperiksa dari celah kerentanan CVE yang sudah diketahui.
