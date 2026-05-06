# Immune Cell Personalities — Germy Warfare

Reference for enemy behaviors and vibes.

---

## 🦠 Macrophages (Level 1+)

| Trait | Value |
|-------|-------|
| Speed | 0.8 |
| On touch Bill | Kill |
| Special | Splits into 4 on death + says "OW!" |
| Personality | Dumb brutes. No strategy, just wander. Punishing to shoot. |

---

## 🔵 B Cells (Level 2+)

| Trait | Value |
|-------|-------|
| Speed | 0.2 |
| On touch Bill | Death (stuck antibodies) |
| Special | Shoot sticky antibodies every 3s (after 5s pause). 5 stuck = game over. Respawn 8s with fresh speed timer. |
| Personality | Patient snipers. Hang back and shoot from range. Each one has its own ramping speed. |

---

## 🩷 Eosinophils (Level 3+)

| Trait | Value |
|-------|-------|
| Speed | 0.55 |
| On touch Bill | Kill |
| Special | Target infected fibroblasts → cure them on touch. Repel from each other. Wander if no targets. Respawn 8s (none on L4-5). |
| Personality | The "good cop" — trying to *cure* fibros, not just kill. But they'll still eat Bill. |

---

## 🟡 Neutrophils (Level 4 only)

| Trait | Value |
|-------|-------|
| Speed | 0.15 (same as Bill) |
| On touch Bill | Kill |
| Special | Chase fibroblasts, convert them to neutrophils on touch. Respawn 8s only if last one killed. |
| Personality | Reluctant workers. Slow, bored, just converting fibros lazily. Kill Bill if he gets in the way. |

**SVG vibe:** Bored eyes, half-lidded, droopy mouth — tired and unimpressed.

---

## 🟦 Helper T Cells (Level 5 only)

| Trait | Value |
|-------|-------|
| Speed | 0.45 |
| On touch Bill | Kill |
| Special | Chase Bill. Respawn 3s after killed. |
| Personality | Teachers pet. Goody two shoes. Snotty. Chases Bill with a self-satisfied attitude. Originally designed to herd Bill toward eosinophils — now just kills him directly. |

**SVG vibe:** Raised arched eyebrows, smug smirk, gold star badge, bow tie, white mouth.

---

## 🕸️ Dendritic Cells (Level 7)

| Trait | Value |
|-------|-------|
| Speed | 0.3 (slow drift) |
| On touch Bill | Kill |
| Special | Places cytokines near Bill every 6-8s. Cytokines decay in ~10s. Bill dies on contact. **Immortal** — glycoprotein shots just make them angry (5s). Up to 4-6 cytokines active. |
| Personality | Patient trappers. Calm, methodical. Drift slowly and seed the battlefield with cytokine mines in Bill's path. When shot, they flash angry but refuse to die. |

**SVG vibe:** Big spidery cell, long branching arms. Angry version has red eyes / sharper edges.

---

## 🥷 Natural Killer Ninjas (Level 8)

| Trait | Value |
|-------|-------|
| Speed | 0.6 |
| On touch Bill | Kill |
| Special | Blink dodge: if glycoprotein within 50px → teleport 40px randomly (1.5s cooldown). Dramatic teleport every 10s to random location. Respawn 8s after death (max 4). Staggered spawns tied to countdown. |
| Personality | Stealthy assassins. Relentless chasers who vanish the moment you aim. Blink away from shots, then pop up elsewhere with a dramatic teleport burst. Cold, calculated, ninja-like. |

**SVG vibe:** Dark silhouette, hooded, fast motion lines. Ninja aesthetic.

---

## 👑 Myeloid Progenitor + Monocytes (Level 9)

| Trait | Value |
|-------|-------|
| Speed | Progenitor 0.35 (slow drift toward Bill). Monocytes orbit only. |
| On touch Bill | Kill (either progenitor or monocytes) |
| Special | Progenitor: 6 armor layers, drifts toward Bill slowly. Monocytes: 6 minions orbiting in large ellipses (180-260px radii). When progenitor dies, monocytes scatter and chase Bill at speed 2.0. |
| Personality | Majestic ruler + royal guard. The queen moves slowly, stately, toward Bill. Her monocytes form a living, rotating shield. When she falls, the guard goes berserk. |

**SVG vibe:** Progenitor = large blobby cell with pulsing nucleus, stern face. Monocytes = smaller round cells with big nuclei orbiting in formation.

---

## 🧬 Hematopoietic Stem Cell (Level 10)

| Trait | Value |
|-------|-------|
| Speed | 0.5-2.2 (wanders, caps at 2.2) |
| On touch Bill | Kill |
| Special | 800 HP boss. 3 phases: **Phase 1 (100-60%)** calm, slow spawns (eosinophil, neutrophil). **Phase 2 (60-30%)** surge, faster spawns (cytotoxic T, helper T, basophil). **Phase 3 (30-0%)** desperation, all-out multi-spawns. Recoils + ripples + flashes on every hit. Drops crowns (35% chance) = 2x damage power-up. |
| Personality | Ancient throne. Calm and inevitable at first. As you wound it, it grows desperate — spawning harder and faster. The source of all immune cells. |

**SVG vibe:** Massive organic blob at top of screen. Pulsing nucleus, cytoplasmic tentacles. Phases shift its color (purple → magenta → red).

---

## Summary Table

| Cell | Speed | Touch Bill | Special Trait | Vibe |
|------|-------|------------|---------------|------|
| Macrophage | 0.8 | Kill | Splits into 4 on death | Dumb brute |
| B Cell | 0.2 | Death (stuck) | Shoots sticky antibodies | Patient sniper |
| Eosinophil | 0.55 | Kill | Cures infected fibros | Reluctant healer |
| Neutrophil | 0.15 | Kill | Converts fibros | Tired worker |
| Helper T | 0.45 | Kill | Chases Bill smugly | Snotty teacher's pet |
| Dendritic | 0.3 | Kill | Places cytokine mines (immortal) | Patient trapper |
| NK Ninja | 0.6 | Kill | Blink dodge + dramatic teleport | Stealthy assassin |
| Progenitor | 0.35 | Kill | Monocytes orbit; armor layers | Majestic ruler |
| HSC Boss | 0.5-2.2 | Kill | 3-phase spawns; drops crowns | Ancient throne |

---

*Auto-generated reference from code + design notes.*
