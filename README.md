# 🤖 AI Agent Skills Repository

Repositori ini menyimpan kumpulan **Agent Skills** untuk AI Assistant (Google Antigravity, Gemini Code Assist, Claude Code, Cursor, dll.) agar dapat digunakan kembali dengan mudah di berbagai project di masa mendatang.

---

## 📂 Struktur Direktori

```text
.agents-skills/
├── README.md              # Dokumentasi & panduan penggunaan
├── install.ps1            # Script installer otomatis untuk Windows PowerShell
├── install.sh             # Script installer otomatis untuk Linux / macOS
│
├── skills/                # ⭐ Kumpulan Custom Agent Skills Utama
│   ├── anti-slop-design/      # Frontend design berstandar tinggi tanpa estetika generik AI
│   ├── caveman/               # Mode komunikasi super ringkas, to the point, hemat token
│   ├── design-taste-frontend/ # Desain frontend berkarakter untuk landing page & app
│   ├── micro-interactions/    # Arsitek mikro-interaksi, transisi, animasi & motion design
│   ├── ponytail/              # Lazy senior dev: solusi teringkas & paling efisien (YAGNI)
│   ├── ponytail-audit/        # Audit kualitas codebase menyeluruh (bug, load, security)
│   └── ponytail-review/       # Code review mendalam per commit / pull request
│
└── builtin-skills/        # 🛠️ Built-in Skills Resmi Antigravity / Gemini
    ├── agy-customizations/    # Panduan & referensi sistem kustomisasi Antigravity
    ├── antigravity_guide/     # Panduan komprehensif ekosistem Antigravity
    ├── automation/            # Perancang background automation terjadwal
    ├── conversations/         # Pengelolaan percakapan agent
    ├── generative_ui/         # Render widget UI interaktif & diagram visual
    ├── mcp-app-development/   # Pembuatan aplikasi MCP (Model Context Protocol)
    ├── migrate-agent-settings/# Migrasi pengaturan dari agen AI lain
    ├── migrate-workflows/     # Migrasi workflow warisan ke skill modern
    ├── native_swarm/          # Orkestrasi swarm agent multi-peran
    ├── permissioned-github/   # Integrasi GitHub aman & terautentikasi
    ├── plugin/                # Manajemen dan pembuatan paket plugin
    ├── run-workflow/          # Orkestrasi skrip alur kerja dinamis Python
    ├── swarm_monitor/         # Pemantau kesehatan proses swarm
    ├── swarm_narrator/        # Narator pelaporan swarm
    ├── swarm_pane/            # Tampilan visual ringkasan swarm
    └── ui-plugin-navigation/  # Navigasi panel antarmuka plugin
```

---

## 🚀 3 Cara Menggunakan Skill di Project Baru

Pilih salah satu cara berikut saat memulai project baru:

### Cara 1: Menggunakan Script Installer Otomatis (Direkomendasikan)

#### Untuk Pengguna Windows (PowerShell):
1. **Instal ke Global Config** (Otomatis aktif di semua project pada laptop ini):
   ```powershell
   cd D:\agents-skills
   .\install.ps1 -Target Global
   ```
2. **Instal ke Folder Project Tertentu**:
   ```powershell
   cd D:\agents-skills
   .\install.ps1 -Target Local -Destination "D:\Path\Ke\Project-Baru-Anda\skills"
   ```

#### Untuk Pengguna Linux / macOS (Bash):
```bash
cd /path/to/.agents-skills
chmod +x install.sh
./install.sh global
# atau untuk project lokal:
./install.sh local /path/to/new-project/skills
```

---

### Cara 2: Sebagai Git Submodule (Paling Rapi untuk Multi-Repo)

Jika Anda ingin project baru Anda selalu terhubung dengan repositori skill ini:

```bash
cd "D:\Path\Ke\Project-Baru-Anda"

# Tambahkan sebagai submodule ke folder .agents-skills atau skills
git submodule add https://github.com/Maskhu-codes/.agents-skills.git .agents-skills
```

Jika ada pembaruan skill di kemudian hari, cukup jalankan:
```bash
git submodule update --remote
```

---

### Cara 3: Salin Manual (Copy-Paste)

Anda cukup menyalin folder skill yang diinginkan dari direktori `skills/` ke dalam:
- Folder project lokal: `<project-root>/skills/` atau `<project-root>/.gemini/config/skills/`
- Folder global user: `C:\Users\<Username>\.gemini\config\skills\`

---

## 📖 Katalog Custom Agent Skills

| Nama Skill | Deskripsi & Kegunaan | Trigger Kata Kunci |
| :--- | :--- | :--- |
| **`anti-slop-design`** | Menghindari tampilan frontend generik AI (purple-gradient, rounded-corner, font generic). Menghasilkan desain profesional dan khas. | `anti-slop`, `design ui`, `landing page`, `dashboard` |
| **`caveman`** | Mode komunikasi super singkat & padat tanpa basa-basi, langsung fakta teknis & solusi, sangat menghemat token. | `/caveman`, `caveman mode`, `be brief`, `less tokens` |
| **`design-taste-frontend`** | Standar selera desain tingkat lanjut untuk antarmuka web/mobile, sistem desain nyata, dan pra-pemeriksaan estetika. | `frontend design`, `redesign`, `portfolio` |
| **`micro-interactions`** | Arsitek mikro-interaksi, transisi halus, motion token, animasi layout, feedback haptik/visual, spring physics. | `micro-interaction`, `animation`, `transition`, `motion` |
| **`ponytail`** | Mode lazy senior engineer: menerapkan solusi paling sederhana, elegan, dan minim perubahan kode (YAGNI principle). | `ponytail`, `be lazy`, `simplest solution`, `yagni` |
| **`ponytail-audit`** | Audit menyeluruh kualitas arsitektur repository: mendeteksi bug, beban kapasitas, keamanan, dead code, dan bloat. | `/ponytail-audit`, `audit codebase`, `review repo` |
| **`ponytail-review`** | Code review mendalam per perubahan: memeriksa logika, keamanan, kecepatan eksekusi, dan kebersihan baris kode. | `/ponytail-review`, `code review`, `review PR` |

---

## 🛠️ Lisensi & Kontributor
- **Owner:** [Maskhu-codes](https://github.com/Maskhu-codes)
- **Kompatibilitas:** Antigravity IDE, Google Gemini CLI, Claude Code, Cursor, Copilot Workspace.
