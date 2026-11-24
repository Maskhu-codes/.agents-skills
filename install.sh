#!/usr/bin/env bash
# AI Agent Skills Installer for Linux / macOS
set -e

TARGET="${1:-global}"
DESTINATION="${2:-}"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
SOURCE_SKILLS="$DIR/skills"

if [ -z "$DESTINATION" ]; then
    if [ "$TARGET" = "global" ]; then
        DESTINATION="$HOME/.gemini/config/skills"
    else
        DESTINATION="$(pwd)/skills"
    fi
fi

echo "=========================================="
echo "  AI Agent Skills Installer (Bash)"
echo "=========================================="
echo "Sumber Skill : $SOURCE_SKILLS"
echo "Tujuan       : $DESTINATION ($TARGET)"
echo "------------------------------------------"

mkdir -p "$DESTINATION"

for skill in "$SOURCE_SKILLS"/*; do
    if [ -d "$skill" ]; then
        skill_name="$(basename "$skill")"
        cp -r "$skill" "$DESTINATION/"
        echo "[✓] Terinstal: $skill_name"
    fi
done

echo "------------------------------------------"
echo "[SELESAI] Semua skill berhasil disalin ke $DESTINATION"

