# AGENTS.md

Instruksi untuk AI agent yang bekerja di repo ini.

## Orchestrator & Agent (model AI)

> Standar lintas-portofolio dari [`ahliweb/personal-coding`](https://github.com/ahliweb/personal-coding/blob/main/docs/tingkatan-model-ai-claude-openai.md) (docs/tingkatan-model-ai-claude-openai.md, snapshot 2026-10-28). Harga, effort, dan lini model dipelihara di sana — jangan disalin ke repo ini.

Pekerjaan yang perlu dipecah ke beberapa agent memakai pola **orchestrator → agent**. Orchestrator memecah pekerjaan, membagi tugas, mengatur ketergantungan, lalu memeriksa dan menyatukan hasil; agent mengerjakan satu bagian yang sudah dibatasi.

| Peran | Claude Code | Codex / OpenAI |
| --- | --- | --- |
| Orchestrator | Opus 5.5, effort `high` | GPT-6.1 Sol, `high` |
| Agent kompleks — lintas komponen, keamanan, integrasi, risiko regresi | Sonnet 5.5, `medium` (subagent `pelaksana-kompleks`) | GPT-6.1 Sol atau Terra, `medium` |
| Agent sederhana — mekanis, terdefinisi jelas, risiko rendah | Haiku 5.5, `low` (subagent `pelaksana-sederhana`) | GPT-6 Luna atau Terra, `low` |

Pekerjaan kritis (arsitektur, keamanan, migrasi besar): orchestrator Fable 5.1 `high`–`xhigh`, agent kompleks Opus 5.5 `high`.

Aturan:

1. **Jangan memecah tugas kecil.** Coba satu model kuat (Opus 5.5 / GPT-6.1 Sol) dengan effort rendah lebih dulu.
2. **Naikkan, jangan menebak.** Agent sederhana yang menemukan ambiguitas, risiko, atau sentuhan arsitektur berhenti dan mengembalikan tugas ke orchestrator, yang memindahkannya ke agent kompleks.
3. **Agent paralel terisolasi.** Tidak boleh menyentuh file atau modul yang sama; tugas yang saling bergantung dijalankan berurutan.
4. **Verifikasi tetap di orchestrator.** Diff, uji, dan angka dicek sendiri sebelum dipakai; laporan agent bukan bukti.
5. **Agent tetap di scope-nya.** Tidak mengubah arsitektur, tidak mendelegasikan lagi, tidak menyentuh area di luar tugas.
6. **Aturan repo ini tetap berlaku** untuk setiap agent — alur kerja, gerbang, guardrail keamanan, konvensi commit.
