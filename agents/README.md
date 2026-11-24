# 👥 AI Agent Personas & Subagents

Direktori ini mendefinisikan persona, peran, instruksi sistem, dan kapabilitas agen AI otonom yang dapat dipanggil (*invoked*) di berbagai project.

---

## 📋 Daftar Agent

| Agent | Peran / Job Title | Karakteristik Utama | Tools Utama |
| :--- | :--- | :--- | :--- |
| **`product-architect`** | Lead Product & System Architect | Wawancara kebutuhan sistem (opsi A/B/C/D), menyusun PRD standar Silicon Valley, diagram Mermaid, kriteria Gherkin. | Planning tools, System design, Spec generation |
| **`researcher`** | Codebase & Web Researcher | Menjelajahi codebase secara non-destruktif, membaca dokumentasi, mencari referensi web. | Read-only tools, Web search, File inspection |
| **`browser-automation`** | Headless Chrome DevTools Driver | Menavigasi web live, testing UI, isi formulir, screenshot, verifikasi visual. | Chrome DevTools, Page clicks, Form inputs |
| **`image-generator`** | Visual Asset & Media Designer | Membuat aset visual, mockup, diagram, ilustrasi untuk UI/UX. | Image generator model, media render |
| **`senior-developer`** | Pragmatic Full-Stack Architect | Menulis kode bersih, efisien, minim perubahan (YAGNI), berorientasi arsitektur solid. | Read/Write tools, Shell execution, Git |
| **`qa-auditor`** | Quality & Security Assurance | Menguji menyeluruh, menemukan celah logika, bug konkurensi, verifikasi regresi. | Flutter test, Unit testing, Static analysis |

---

## 💡 Cara Menggunakan Subagent

### Dalam Antigravity / Gemini Agent System:
Panggil agent menggunakan deklarasi `invoke_subagent` atau definisikan dengan `define_subagent`:

```json
{
  "TypeName": "research",
  "Role": "Codebase Researcher",
  "Prompt": "Analisis alur autentikasi dan temukan semua endpoint terkait."
}
```

