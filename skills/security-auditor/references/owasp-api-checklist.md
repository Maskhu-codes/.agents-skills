# OWASP API Security Top 10 Checklist

Checklist audit keamanan backend & API yang dikonsumsi oleh aplikasi mobile atau web.

---

| Kategori OWASP API | Nama Kerentanan | Poin Pengecekan Kritis |
| :--- | :--- | :--- |
| **API1:2023** | **Broken Object Level Authorization (BOLA / IDOR)** | Setiap request ke objek spesifik (misal `/api/v1/orders/{id}`) wajib memvalidasi apakah user yang login berhak atas objek tersebut. |
| **API2:2023** | **Broken Authentication** | Token JWT divalidasi tanda tangannya (*signature*), masa aktifnya (*exp*), dan tidak menerima algoritma `none`. Password di-hash dengan Argon2id atau Bcrypt. |
| **API3:2023** | **Broken Object Property Level Authorization** | Mencegah *Mass Assignment*. User biasa tidak boleh bisa mengirim `{ "is_admin": true }` pada payload pendaftaran atau update profil. |
| **API4:2023** | **Unrestricted Resource Consumption** | Wajib ada *Rate Limiting* per IP dan per User ID (khususnya endpoint login, kirim OTP, dan export data besar). Pagination dibatasi (maksimal 50-100 items per request). |
| **API5:2023** | **Broken Function Level Authorization (BFLA)** | Endpoint admin (misal `/api/admin/users/delete`) tidak boleh bisa diakses oleh role umum hanya dengan menebak URL. |
| **API6:2023** | **Unrestricted Access to Sensitive Business Flows** | Alur bisnis sensitif (seperti klaim voucher, pemesanan tiket, transfer poin) memiliki proteksi bot dan penanganan konkurensi (mencegah *race condition*). |
| **API7:2023** | **Server Side Request Forgery (SSRF)** | Endpoint yang menerima URL dari client (misal fitur fetch image URL / webhook) tidak boleh mengakses IP internal (`127.0.0.1`, `169.254.169.254`, `10.0.0.0/8`). |
| **API8:2023** | **Security Misconfiguration** | Header keamanan aktif: `Content-Security-Policy`, `X-Content-Type-Options: nosniff`, CORS tidak menggunakan wildcard `*` untuk endpoint yang membawa kredensial. |
| **API9:2023** | **Improper Inventory Management** | Versi API lama (v1, v2) yang sudah deprecated dan tidak terproteksi harus dimatikan agar tidak jadi celah pintu belakang. |
| **API10:2023**| **Unsafe Consumption of APIs** | Validasi dan sanitasi respon dari vendor pihak ketiga (payment gateway, SMS vendor) sebelum disimpan ke database lokal. |
