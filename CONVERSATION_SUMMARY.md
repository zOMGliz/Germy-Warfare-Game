# Germy Warfare — Session Summary

**Date:** 2026-04-11  
**Team:** zOMGliz  
**Project:** Germy Warfare (HTML5 canvas game)

---

## Topics Covered

### 1. Level Mechanics & Difficulty Balancing
- **Level 1:** Macrophages only. Die = lose 1 life, restart L1. Survive = next level.
- **Level 2:** B cells added (1). Fire every 3s after 5s pause. Antibody speed ramps 2.0→5.0.
- **Level 3:** Eosinophils only (start 3, spawn every 7s up to 10). No macros/B cells.
- **Death handling:** `handleDeath()` → if lives>0: restart current level (keep lives). If lives=0: game over → L1.
- **B cell respawn:** 8s after kill, fresh B cell spawns (shootTimer=300, speed resets to 2.0 and ramps).

### 2. Art & UI
- Created `bill_destroyed.svg` (X eyes, dull red cracked glycoproteins).
- Game over splash: shows appropriate Bill image based on `deathCause` (macrophage/eosinophil → destroyed, bcell → stuck).
- "You Died" splash (life loss): shows death-type image, remaining lives icons, "Restart Level" / "Restart Game" buttons.
- Restart Game: confirm dialog before going to L1.
- Removed "Time Survived" and "Macrophages Destroyed" from level complete stats.
- Added **Total Score** (running sum across levels) to level complete splash.

### 3. B Cell Balancing
- **Original problem:** Ignore B cell = annoying (can't focus on fibroblasts). Kill B cell = trivial level.
- **Solution:** B cells respawn 8s after kill with fresh speed timer.
- **B cell death on touch:** If Bill touches B cell directly → `handleDeath()` (deathCause='bcell').
- **Sound on respawn:** `playSound('ding')` — soft organic blop (noise + 280Hz sine, lowpass 900Hz).

### 4. Sounds
- `playSound('win')` — chipper ascending beeps on level complete.
- `playSound('macroOw')` — funny voice-like "OW!" when shooting a macrophage.
- `playSound('ding')` — organic blop when B cell respawns.
- Bill's hurt sound ('ow') unchanged (sawtooth + LFO wobble).

### 5. Bug Fixes
- **Duplicate loop bug:** `nextLevelBtn`, `startOverBtn`, `restartGameBtn` were calling `loop()` while already running → 2× physics speed. Removed extra `loop()` calls; existing loop resumes after splash hidden.

### 6. Other
- `bcellRespawnTimer` / `eosinRespawnTimer` pattern for delayed respawns.
- Each B cell tracks `spawnSecondsLeft` for per-cell antibody speed.
- `deathCause` tracks how Bill died: 'macrophage' | 'eosinophil' | 'bcell'.

---

## Key Files
| File | Notes |
|------|-------|
| `index.html` | All game code (single-file HTML/JS) |
| `bill_destroyed.svg` | Dead Bill sprite |
| `bill_stuck.svg` | Bill with stuck antibodies |
| `bcell.svg`, `macrophage.svg`, `eosinophil.svg` | Enemy sprites |

---

## Links (from WELCOME.md)
| What | URL |
|------|-----|
| Preview | https://autoqa.teachx.ai/hackathon/preview/zomgliz/ |
| IDE | https://autoqa.teachx.ai/hackathon/ide/zomgliz/ |
| Terminal | https://autoqa.teachx.ai/hackathon/t/zomgliz/ |

---

*Auto-generated summary of session changes & decisions.*
