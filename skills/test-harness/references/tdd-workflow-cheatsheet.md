# TDD Workflow Cheat Sheet untuk Developer & AI

Gunakan checklist ini setiap kali membuat fungsi atau service baru:

---

## Checklist Eksekusi TDD

| Tahap | Checklist Tindakan | Status |
| :--- | :--- | :---: |
| **1. Specification** | Tentukan interface/signature fungsi (input parameter, return type, kemungkinan error/exception). | ⬜ |
| **2. Test Suite Setup** | Buat file pengujian di folder `test/` yang sejajar dengan lokasi file di `lib/`. | ⬜ |
| **3. Mock Isolation** | Mock semua boundary eksternal (HTTP, Database, Bluetooth, SharedPreferences). | ⬜ |
| **4. Red State** | Tulis tes untuk skenario sukses pertama. Jalankan: `flutter test path/to/test.dart`. Hasil harus **FAIL** (karena fungsi target belum ada). | ⬜ |
| **5. Green State** | Buat implementasi fungsi dengan kode seminimal mungkin sampai tes **PASS**. | ⬜ |
| **6. Edge Cases** | Tambahkan skenario kegagalan: timeout, data null, 401 unauthorized, respon json rusak. | ⬜ |
| **7. Refactor** | Rapikan kode, ekstrak konstanta, hapus kode duplikat. Jalankan tes kembali: tetap **PASS**. | ⬜ |

---

## Perintah Terminal yang Sering Digunakan

```powershell
# Menjalankan seluruh test di proyek
flutter test

# Menjalankan 1 file spesifik (cepat untuk feedback loop TDD)
flutter test test/services/auth_service_test.dart

# Menjalankan test dengan laporan code coverage
flutter test --coverage

# Menjalankan test dan melihat output print/debug
flutter test --reporter=expanded
```
