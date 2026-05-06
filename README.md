# Germy Warfare

**Team:** zOMGliz  
**Members:** evink@teachx.ai

> Bill the Virus has to destroy the immune system in his quest to take over the world.

---

## Design Philosophy

My project epitomizes "Simplify and Optimize." I challenged myself to make a fun game in spite of rudimentary graphics and minimal storyline. To accomplish this, I focused on streamlining and optimizing gameplay; most of my time was spent adjusting level difficulty. I wanted each level to progressively get more challenging and each level needed to feel like it has it's own mechanics. This required a lot iteration to "cancel annoyances."

---

## Controls

- **Mouse** — Move Bill (you *are* the cursor!)
- **Space** — Shoot a glycoprotein (infects fibroblasts or kills enemies)
- **Shift** / **Click** — LYSIS: burst all infected fibroblasts at once (score + ammo!)

Chain lysis events together to increase points.

---

## Goals

- Survive all 10 levels (60 seconds each)
- Take out the immune system and take over the world
- Collect DNA (10 = extra life)
- Avoid and destroy immune cells

---

## Tech

Pure HTML/CSS/JavaScript. Canvas for gameplay, SVG art for sprites. No build step — just open `index.html` in a browser.

**Note:** This version is pre-delta-time (frame-rate dependent). Movement and timers scale with frame count, not real time. Gameplay may feel faster on 120Hz+ monitors and slower on 60Hz. See commit `d4e0937` for this baseline.

---

## Levels

1. **Level 1** — Macrophages chase you; shooting them splits them into 4
2. **Level 2** — B Cells snipe with sticky antibodies; 5 stuck = death
3. **Level 3** — Eosinophils cure infected fibroblasts; slow but deadly
4. **Level 4** — Neutrophils drift lazily, converting fibroblasts into more neutrophils
5. **Level 5** — Helper T + Cytotoxic T Cells; fast chasers and zig-zag assassins
6. **Level 6** — Basophils release histamine clouds that freeze Bill
7. **Level 7** — Dendritic Cells (immortal) place cytokine mines near you
8. **Level 8** — NK Ninja assassins: blink dodge, teleport every 10s
9. **Level 9** — Myeloid Progenitor (queen) with orbiting monocytes
10. **Level 10** — Hematopoietic Stem Cell boss spawns waves in escalating phases
