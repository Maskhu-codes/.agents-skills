# 🤖 AI Agent & Skills Ultimate Kit

Koleksi lengkap aset **AI Agent, Custom Skills, Plugin Swarm, dan Tooling Desain & Arsitektur Sistem** yang dirancang oleh **[Maskhu-codes](https://github.com/Maskhu-codes)**. Repositori ini berfungsi sebagai perpustakaan terpusat agar seluruh project di masa mendatang dapat langsung memiliki agen AI berkemampuan tinggi dengan mudah.

---

## ⚡ Panduan Cepat Pakai (Quickstart)

Hanya perlu **1 langkah** untuk memasang seluruh skill ke project baru Anda:

```powershell
# Buka terminal di project baru Anda, lalu jalankan:
D:\agents-skills\install.ps1 -Target Local -Destination ".\skills"
```
*Atau jalankan `D:\agents-skills\install.ps1 -Target Global` agar aktif otomatis di semua project pada laptop Anda.*

---

## 📂 Struktur Repositori

```text
.agents-skills/
├── README.md                      # Dokumentasi lengkap & panduan (file ini)
├── install.ps1                    # Installer otomatis untuk Windows PowerShell
├── install.sh                     # Installer otomatis untuk Linux / macOS
│
├── skills/                        # ⭐ Kumpulan Skill Siap Pakai
│   ├── [📋 Product Management & System Architecture (PRD)]
│   │   └── prd-generator/         # Generator PRD & arsitektur sistem (wawancara A/B/C/D, Gherkin, Mermaid)
│   │
│   ├── [🛡️ Keamanan & AppSec (OWASP Standard)]
│   │   └── security-auditor/      # Audit keamanan kode, scan secret/API key, OWASP MASVS & API Top 10
│   │
│   ├── [🧪 Test Engineering & TDD Harness]
│   │   └── test-harness/          # Automated test harness, TDD (Red-Green-Refactor), mocktail & edge cases
│   │
│   ├── [🎨 Anti-Slop & Desain UI Premium]
│   │   ├── impeccable/            # Framework anti-slop (60+ aturan, /polish, /bolder, /quieter)
│   │   ├── tactile-design/        # Desain fisik & taktil (hairline 0.5px, tombol pegas, sumur input)
│   │   ├── anti-slop-design/      # Mencegah tampilan generik ungu-biru AI
│   │   ├── design-taste-frontend/ # Selera desain tingkat tinggi untuk landing page & app
│   │   └── micro-interactions/    # Arsitek animasi mikro, gesture feedback, spring physics
│   │
│   ├── [🛠️ Rekayasa Frontend Presisi - Jakub Krehel]
│   │   ├── better-typography/     # Tipografi, font pairing, variable font, OpenType
│   │   ├── better-colors/         # Format warna modern, kontras WCAG, semantic token
│   │   ├── better-motion/         # Fisika animasi gerak, transisi enter/exit, performa frame
│   │   ├── better-accessibility/  # Standar WCAG, navigasi keyboard, screen reader, ARIA
│   │   ├── better-layout/         # Sistem grid, alignment, layout responsif & ritme spasial
│   │   ├── better-ui/             # Kedalaman permukaan (surfaces) & konsistensi ikon
│   │   ├── better-writing/        # UX copywriting, microcopy, pesan error & empty state
│   │   ├── break/                 # Stress test komponen UI (teks panjang, layar sempit, data null)
│   │   ├── build-design/          # Jembatan desain Figma ke kode produksi
│   │   ├── explain-interface/     # Rekonstruksi & analisis efek visual dari screenshot
│   │   ├── interface-review/      # Audit konsistensi token & sinyal visual
│   │   ├── state-machine/         # Manajemen status transisi UI yang kompleks
│   │   ├── variant/               # Pola pemilihan varian komponen UI
│   │   ├── better-interface/      # Format review UI & resolusi hierarki visual
│   │   ├── afk/                   # Otomasi tugas saat developer sedang tidak di depan layar
│   │   └── upskill/               # Riset & sintesis referensi teknis baru
│   │
│   └── [💼 Produktivitas Senior Developer]
│       ├── ponytail/              # Solusi teringkas, elegan, dan paling efisien (prinsip YAGNI)
│       ├── ponytail-audit/        # Audit menyeluruh kualitas codebase (bug, beban, celah keamanan)
│       ├── ponytail-review/       # Code review mendalam per commit atau Pull Request
│       └── caveman/               # Mode komunikasi super singkat & hemat token
│
├── agents/                        # 👥 Persona Subagent Otonom
│   ├── product-architect.md       # Lead Product Manager & System Architect (PRD & System Modeling)
│   ├── security-engineer.md       # Lead AppSec Engineer (OWASP MASVS & Vulnerability Hunter)
│   ├── test-engineer.md           # Senior QA Automation & Test Harness Architect (TDD & Mocktail)
│   ├── researcher.md              # Agen riset codebase & dokumentasi web (read-only)
│   ├── senior-developer.md        # Agen pengembang pragmatis (clean code & minimal diff)
│   ├── browser-automation.md      # Agen otomatisasi peramban Chrome DevTools & live test UI
│   └── qa-auditor.md              # Agen verifikasi kualitas, audit error & testing
│
├── plugins/                       # 🔌 Plugin Multi-Agent
│   └── swarm/                     # Orkestrasi multi-agent swarm & message board
│
├── mcp/                           # 🌐 Model Context Protocol (MCP)
│   └── mcp_config.json            # Konfigurasi server MCP (Figma Dev Mode, dll.)
│
└── builtin-skills/                # 📚 16 Built-in Reference Skills Antigravity
    └── ... (agy-customizations, automation, generative_ui, mcp-app, run-workflow, dll.)
```

---

## 🎯 Cheat Sheet: Kapan Menggunakan Setiap Skill?

### 1. Kategori Perencanaan & PRD Sistem (Spec-Driven Architecture)
| Nama Skill | Kapan Digunakan? | Perintah / Trigger |
| :--- | :--- | :--- |
| **`prd-generator`** | Saat ingin merancang sistem baru, merumuskan ide produk, atau membuat dokumen PRD lengkap berstandar Silicon Valley sebelum mulai koding. | `"buat prd"`, `"create a prd"`, `"spesifikasi sistem"`, `"rancang sistem ini"`, `"plan feature"` |

---

### 2. Kategori Desain & Anti-Slop (UI Cantik & Tidak Terlihat Buatan AI)
| Nama Skill | Kapan Digunakan? | Perintah / Trigger |
| :--- | :--- | :--- |
| **`impeccable`** | Saat ingin menyempurnakan estetika UI secara menyeluruh, audit anti-slop, atau membuat desain lebih berani/tenang. | `/impeccable polish`<br>`/impeccable bolder`<br>`/impeccable quieter`<br>`/impeccable audit` |
| **`tactile-design`** | Saat membuat komponen interaktif (tombol, form input, kartu) agar terasa fisik, berbobot nyata, dan punya garis tepi mikro 0.5px. | `tactile design`<br>`physical ui`<br>`layered surfaces` |
| **`anti-slop-design`** | Menghindari tampilan klise AI (gradien ungu-biru murahan, card di dalam card, font Inter sembarangan). | `anti-slop`<br>`design ui`<br>`landing page` |
| **`design-taste-frontend`** | Mengembangkan landing page, portfolio, atau dashboard dengan selera estetika tingkat tinggi. | `frontend design`<br>`redesign`<br>`dashboard ui` |
| **`micro-interactions`** | Menambahkan sentuhan animasi mikro, gesture feedback, loading skeleton, dan transisi halus. | `micro-interaction`<br>`animation`<br>`transition` |

---

### 3. Kategori Rekayasa Frontend Spesifik (16 Modul Jakub Krehel)
| Modul Skill | Spesialisasi Teknis | Contoh Penggunaan |
| :--- | :--- | :--- |
| **`better-typography`** | Tipografi, OpenType, variable font, spasi huruf, dan font pairing harmonis. | "Perbaiki tipografi halaman ini agar terbaca jelas." |
| **`better-colors`** | Warna modern (OKLCH), rasio kontras WCAG, dan palet warna semantik. | "Buat palet warna netral yang lolos uji kontras WCAG AAA." |
| **`better-motion`** | Fisika pegas, transisi enter/exit, dan animasi berkinerja 60fps tanpa jeda. | "Tambahkan animasi buka-tutup modal yang halus." |
| **`better-accessibility`** | Aksesibilitas web (A11y), navigasi keyboard, screen reader, dan hit area sentuh. | "Audit aksesibilitas form login dan tombol navigasi." |
| **`better-layout`** | Sistem grid, adaptasi responsif, alignment, dan ritme spasial. | "Rapikan layout form agar simetris di mobile & desktop." |
| **`better-ui`** | Kedalaman visual, tumpukan permukaan (*surfaces*), dan ikonografi seragam. | "Perbaiki hierarki visual kartu daftar produk." |
| **`better-writing`** | UX writing, microcopy tombol, pesan error ramah, dan status kosong (*empty state*). | "Tuliskan microcopy yang jelas untuk dialog konfirmasi." |
| **`break`** | Pengujian stres (*stress test*) komponen terhadap teks kepanjangan atau layar sempit. | "Uji komponen kartu ini: apa yang rusak jika nama pengguna 100 karakter?" |
| **`build-design`** | Menjembatani desain Figma ke dalam kode produksi yang rapi. | "Konversi frame Figma ini menjadi kode frontend." |
| **`explain-interface`** | Menganalisis dan membongkar teknik desain dari gambar/screenshot. | "Bagaimana cara membuat efek glassmorphism seperti di screenshot ini?" |
| **`state-machine`** | Merancang status komponen yang rumit (loading, error, success, empty, idle). | "Petakan state machine untuk alur upload multi-file." |

---

### 4. Kategori Senior Developer & Code Review (Cepat & Bersih)
| Nama Skill | Kapan Digunakan? | Perintah / Trigger |
| :--- | :--- | :--- |
| **`ponytail`** | Saat ingin perubahan kode sesedikit mungkin, efisien, tanpa kode berlebih (prinsip YAGNI). | `ponytail`<br>`be lazy`<br>`simplest solution` |
| **`ponytail-audit`** | Audit kesehatan seluruh repository (mencari bug, kebocoran memori, dead code, dan bloat). | `/ponytail-audit`<br>`audit codebase`<br>`review repo` |
| **`ponytail-review`** | Review mendalam sebelum commit atau submit Pull Request. | `/ponytail-review`<br>`code review`<br>`review PR` |
| **`caveman`** | Mode bicara super ringkas tanpa basa-basi untuk menghemat token dan langsung ke inti kode. | `/caveman`<br>`talk like caveman`<br>`be brief` |

---

### 5. Kategori Keamanan & Pengujian Otomatis (Security & Test Harness)
| Nama Skill | Kapan Digunakan? | Perintah / Trigger |
| :--- | :--- | :--- |
| **`security-auditor`** | Sebelum rilis atau merge PR: mendeteksi kebocoran API key/secret, audit penyimpanan lokal aman (Keychain/Keystore), proteksi BOLA/IDOR, dan kepatuhan OWASP MASVS. | `"audit keamanan"`, `"security check"`, `"owasp audit"`, `"scan secret"`, `"cek celah keamanan"` |
| **`test-harness`** | Saat membuat service/fitur baru: membangun test otomatis terisolasi, mocking network/database dengan mocktail, uji skenario timeout/error 500, dan alur TDD. | `"buat unit test"`, `"test harness"`, `"tdd"`, `"mock service"`, `"tulis test untuk ini"` |

---

## 🛠️ 3 Cara Pemasangan di Project Lain

### Cara 1: Menggunakan Script Installer Otomatis
```powershell
# 1. Pasang langsung ke folder project Anda (Rekomendasi per project):
D:\agents-skills\install.ps1 -Target Local -Destination "D:\Path\Ke\Project-Baru\skills"

# 2. Atau pasang ke direktori global (Otomatis aktif di semua workspace):
D:\agents-skills\install.ps1 -Target Global
```

### Cara 2: Sebagai Git Submodule (Paling Rapi untuk Tim)
```bash
cd "D:\Path\Ke\Project-Baru"
git submodule add https://github.com/Maskhu-codes/.agents-skills.git .agents-skills
```
*Jika repositori ini diperbarui di kemudian hari, jalankan `git submodule update --remote` untuk mendapatkan skill terbaru.*

### Cara 3: Salin Folder Secara Manual
Salin folder skill yang Anda butuhkan dari `D:\agents-skills\skills\` ke folder `skills/` di project baru Anda.

---

## 👨‍💻 Kontributor & Lisensi
- **Owner:** [Maskhu-codes](https://github.com/Maskhu-codes)
- **Kompatibilitas:** Antigravity IDE, Google Gemini CLI, Claude Code, Cursor, Copilot Workspace, OpenCode.
