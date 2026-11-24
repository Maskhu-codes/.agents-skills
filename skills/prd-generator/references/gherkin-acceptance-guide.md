# 📐 Panduan Menulis Kriteria Penerimaan Gherkin (Given-When-Then)

Kriteria penerimaan (*Acceptance Criteria*) adalah penentu apakah sebuah fitur sudah selesai atau belum. Format **Given-When-Then** (Gherkin BDD) adalah standar internasional yang menghilangkan perdebatan antara Product Manager, Developer, dan QA Tester.

---

## 🧩 Rumus Dasar:

* **GIVEN (Kondisi Awal):** Prasyarat sistem atau status pengguna sebelum aksi dimulai.
* **WHEN (Aksi / Pemicu):** Tindakan nyata yang dilakukan pengguna atau kejadian sistem.
* **THEN (Hasil yang Terverifikasi):** Perubahan nyata yang terjadi pada sistem atau antarmuka.
* **AND / BUT (Tambahan Kondisi):** Kondisi sekunder untuk memperjelas.

---

## ❌ Contoh Buruk vs ✅ Contoh Pro

### Kasus: Form Reset Password

#### ❌ Contoh Buruk (Ambigu, Tidak Bisa Diuji Otomatis):
> *"Sistem harus bisa mereset password dengan lancar dan aman."*  
> *(Kenapa buruk? Apa definisi 'lancar'? Berapa minimal karakter? Apa yang terjadi jika token salah?)*

#### ✅ Contoh Pro (Gherkin BDD):
```markdown
- [ ] Scenario: Reset password dengan token valid
  - **Given:** Pengguna telah menerima reset_token valid dan belum kedaluwarsa.
  - **When:** Pengguna memasukkan password baru 'Rahasia123!' dan konfirmasi password cocok.
  - **Then:** Sistem mengenkripsi password dengan Bcrypt, memperbarui database `ta_user_pasien`.
  - **And:** Sistem menghapus `reset_token` dari database agar tidak bisa dipakai ulang.
  - **And:** Antarmuka menampilkan modal sukses dan tombol kembali ke halaman login.

- [ ] Scenario: Gagal reset password karena token kedaluwarsa
  - **Given:** Reset token telah melewati batas waktu 30 menit.
  - **When:** Pengguna menekan tombol 'Simpan Kata Sandi'.
  - **Then:** Sistem mengembalikan respon HTTP 400 Bad Request.
  - **And:** Antarmuka menampilkan pesan: 'Token reset sudah kedaluwarsa. Silakan ulangi proses lupa kata sandi.'
```

