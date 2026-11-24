# 🤖 AI Agent & Skills Repository

Repositori ini adalah bundel lengkap aset **AI Agent & Skills** untuk AI Assistant (Google Antigravity, Gemini Code Assist, Claude Code, Cursor, Copilot, dll.) yang dirancang oleh **[Maskhu-codes](https://github.com/Maskhu-codes)** agar dapat digunakan kembali dengan mudah di berbagai project di masa mendatang.

---

## 📂 Struktur Repositori

```text
.agents-skills/
├── README.md                  # Dokumentasi utama repositori
├── install.ps1                # Script installer otomatis untuk Windows PowerShell
├── install.sh                 # Script installer otomatis untuk Linux / macOS
│
├── agents/                    # 👥 Definisi Persona & Subagent Otonom
│   ├── README.md              # Panduan arsitektur subagent
│   ├── researcher.md          # Agen riset codebase & dokumentasi web
│   ├── senior-developer.md    # Agen pengembang senior pragmatis (YAGNI)
│   ├── browser-automation.md  # Agen otomasi Chrome DevTools
│   └── qa-auditor.md          # Agen verifikasi kualitas, audit & testing
│
├── skills/                    # ⭐ Kumpulan Custom Agent Skills Utama
│   ├── anti-slop-design/      # Frontend design berstandar tinggi tanpa estetika generik AI
│   ├── caveman/               # Mode komunikasi super ringkas, to the point, hemat token
│   ├── design-taste-frontend/ # Desain frontend berkarakter untuk landing page & app
│   ├── micro-interactions/    # Arsitek mikro-interaksi, transisi, animasi & motion design
│   ├── ponytail/              # Lazy senior dev: solusi teringkas & paling efisien
│   ├── ponytail-audit/        # Audit kualitas codebase menyeluruh (bug, load, security)
│   └── ponytail-review/       # Code review mendalam per commit / pull request
│
├── plugins/                   # 🔌 Plugin & Orkestrasi Multi-Agent
│   └── swarm/                 # Plugin swarm orchestration & message board
│
├── mcp/                       # 🌐 Integrasi Model Context Protocol (MCP)
│   └── mcp_config.json        # Konfigurasi server MCP (Figma Dev Mode, dll)
│
└── builtin-skills/            # 🛠️ Built-in Skills Resmi Antigravity / Gemini
    ├── agy-customizations/    # Panduan sistem kustomisasi
    ├── antigravity_guide/     # Panduan komprehensif Antigravity
    ├── automation/            # Background automation terjadwal
    ├── conversations/         # Pengelolaan percakapan agent
    ├── generative_ui/         # Render widget UI interaktif & visual
    ├── mcp-app-development/   # Pembuatan aplikasi MCP
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

## 🚀 3 Cara Memakai di Project Baru

### Cara 1: Menggunakan Script Installer Otomatis (Paling Mudah)

#### Pengguna Windows (PowerShell):
```powershell
# 1. Pasang ke project lokal saat ini
D:\agents-skills\install.ps1 -Target Local -Destination ".\skills"

# 2. Atau pasang ke global user config (aktif otomatis di semua project)
D:\agents-skills\install.ps1 -Target Global
```

#### Pengguna Linux / macOS (Bash):
```bash
chmod +x ./install.sh
./install.sh local /path/to/project/skills
```

---

### Cara 2: Menghubungkan sebagai Git Submodule (Rekomendasi Proyek Tim)
```bash
cd "D:\Path\Ke\Project-Baru"
git submodule add https://github.com/Maskhu-codes/.agents-skills.git .agents-skills
```

---

### Cara 3: Salin Folder Manual
Salin folder yang dibutuhkan (`skills/`, `agents/`, atau `mcp/`) langsung ke direktori project Anda.

---

## 📖 Ringkasan Custom Skills

| Nama Skill | Deskripsi & Kegunaan | Trigger Kata Kunci |
| :--- | :--- | :--- |
| **`anti-slop-design`** | Menghindari tampilan frontend generik AI. Menghasilkan desain profesional khas. | `anti-slop`, `design ui`, `landing page`, `dashboard` |
| **`caveman`** | Mode komunikasi super singkat & padat tanpa basa-basi teknis, sangat hemat token. | `/caveman`, `caveman mode`, `be brief`, `less tokens` |
| **`design-taste-frontend`** | Standar selera desain tingkat lanjut untuk antarmuka web/mobile, sistem desain nyata. | `frontend design`, `redesign`, `portfolio` |
| **`micro-interactions`** | Arsitek mikro-interaksi, transisi halus, motion token, animasi layout, feedback haptik/visual. | `micro-interaction`, `animation`, `transition`, `motion` |
| **`ponytail`** | Mode lazy senior engineer: menerapkan solusi paling sederhana, elegan, dan minim baris kode (YAGNI). | `ponytail`, `be lazy`, `simplest solution`, `yagni` |
| **`ponytail-audit`** | Audit menyeluruh arsitektur repository: mendeteksi bug, beban kapasitas, keamanan, dan bloat. | `/ponytail-audit`, `audit codebase`, `review repo` |
| **`ponytail-review`** | Code review mendalam: memeriksa logika, keamanan, kecepatan eksekusi, dan kebersihan baris kode. | `/ponytail-review`, `code review`, `review PR` |

---

## 🛠️ Lisensi & Kontributor
- **Owner:** [Maskhu-codes](https://github.com/Maskhu-codes)
- **Repo URL:** [https://github.com/Maskhu-codes/.agents-skills.git](https://github.com/Maskhu-codes/.agents-skills.git)
