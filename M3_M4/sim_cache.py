#!/usr/bin/env python3
"""
CMPE3209 Computer Organization - Adım 4 Cache Simülatörü (Parametrik)
Öğrenci: Mirac Alademiroğlu (5001240027) - Görev G1
Parametreler:
  - Cache kapasitesi: 128 B
  - Line (block) boyutu: 32 B
  - Eşleme: Direct-mapped (4 line) -> w = 5, r = 2, tag = 25 bit
  - Yazma politikası: Write-through (+ write-allocate kuralı)
  - Erişim süreleri: T1 = 1 cycle, T2 = 35 cycle
"""

import csv
import math
import os
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt


def load_trace(csv_path):
    """trace.csv dosyasını yükler."""
    trace = []
    with open(csv_path, "r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            row["addr_int"] = int(row["adres_hex"], 16)
            trace.append(row)
    return trace


def simulate_cache(trace, cache_size=128, line_size=32, assoc=1,
                   write_policy="WT", write_allocate=True):
    """
    LRU yer değiştirmeli parametrik cache simülatörü.
    write_policy: 'WT' (Write-Through) veya 'WB' (Write-Back)
    """
    num_lines = cache_size // line_size
    num_sets = num_lines // assoc
    offset_bits = int(math.log2(line_size))
    set_bits = int(math.log2(num_sets)) if num_sets > 1 else 0

    sets = [
        [{"valid": False, "tag": 0, "dirty": False, "last_used": 0}
         for _ in range(assoc)]
        for _ in range(num_sets)
    ]

    hits = 0
    misses = 0
    mem_writes = 0
    seen_blocks = set()
    details_30 = []
    snapshot_30 = None

    for step, ref in enumerate(trace, start=1):
        addr = ref["addr_int"]
        rw = ref.get("RW") or ref.get("rw")

        block_addr = addr >> offset_bits
        set_idx = (block_addr & ((1 << set_bits) - 1)) if set_bits > 0 else 0
        tag = addr >> (offset_bits + set_bits)
        word_off = addr & ((1 << offset_bits) - 1)

        cset = sets[set_idx]
        hit_way = None
        for w_idx, line in enumerate(cset):
            if line["valid"] and line["tag"] == tag:
                hit_way = w_idx
                break

        evicted_str = "yok"
        if hit_way is not None:
            hits += 1
            res = "Hit"
            was_in_cache_before = "Evet (cache'te mevcut)"
            cset[hit_way]["last_used"] = step
            if rw == "W":
                if write_policy == "WT":
                    mem_writes += 1
                else:
                    cset[hit_way]["dirty"] = True
        else:
            misses += 1
            res = "Miss"
            was_in_cache_before = (
                "Evet (conflict/capacity)" if block_addr in seen_blocks
                else "Hayır (cold miss)"
            )

            if rw == "W" and not write_allocate:
                # Write-no-allocate durumunda yalnızca ana belleğe yazılır
                mem_writes += 1
            else:
                target_way = None
                for w_idx, line in enumerate(cset):
                    if not line["valid"]:
                        target_way = w_idx
                        break
                if target_way is None:
                    target_way = min(range(assoc), key=lambda w: cset[w]["last_used"])
                    old_line = cset[target_way]
                    old_block_addr = (old_line["tag"] << set_bits) | set_idx
                    evicted_str = f"0x{(old_block_addr << offset_bits):08x} (tag={hex(old_line['tag'])})"
                    if write_policy == "WB" and old_line["dirty"]:
                        mem_writes += 1

                cset[target_way]["valid"] = True
                cset[target_way]["tag"] = tag
                cset[target_way]["last_used"] = step
                cset[target_way]["dirty"] = (rw == "W" and write_policy == "WB")
                if rw == "W" and write_policy == "WT":
                    mem_writes += 1

        seen_blocks.add(block_addr)

        if step <= 30:
            details_30.append({
                "step": step,
                "rw": rw,
                "addr_hex": ref["adres_hex"],
                "tag": hex(tag),
                "line_set": set_idx,
                "word": word_off,
                "res": res,
                "evicted": evicted_str,
                "seen_before": was_in_cache_before,
            })

        if step == 30:
            snap = []
            for s_i, st in enumerate(sets):
                for w_i, ln in enumerate(st):
                    snap.append({
                        "line": s_i * assoc + w_i,
                        "set": s_i,
                        "valid": int(ln["valid"]),
                        "tag_hex": hex(ln["tag"]) if ln["valid"] else "—",
                        "dirty": int(ln["dirty"]) if write_policy == "WB" else "— (WT)",
                        "lru": ln["last_used"] if assoc > 1 else "— (Direct)",
                    })
            snapshot_30 = {
                "hits": hits,
                "misses": misses,
                "H": hits / 30.0,
                "mem_writes": mem_writes,
                "lines": snap,
            }

    total = len(trace)
    return {
        "total": total,
        "hits": hits,
        "misses": misses,
        "H": hits / total if total else 0.0,
        "mem_writes": mem_writes,
        "details_30": details_30,
        "snapshot_30": snapshot_30,
    }


def plot_design_space(mapping_results, linesize_results, out_png):
    """4e tasarım uzayı grafiğini oluşturur ve kaydeder."""
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(11, 4.5), dpi=180)
    fig.suptitle(
        "Adım 4e: Cache Tasarım Uzayı Keşfi (C = 128 B, -O0 Trace = 1563 Erişim)",
        fontsize=11,
        fontweight="bold",
    )

    # Panel 1: Eşleme (Associativity) etkisi
    m_labels = [x[0] for x in mapping_results]
    m_hits = [x[1]["H"] * 100.0 for x in mapping_results]
    bars1 = ax1.bar(m_labels, m_hits, color=["#2563eb", "#0ea5e9", "#14b8a6", "#10b981"], width=0.55)
    ax1.set_title("Eşleme Politikası Etkisi (Line = 32 B)")
    ax1.set_ylabel("Hit Oranı H (%)")
    ax1.set_ylim(85, 96)
    ax1.grid(axis="y", linestyle="--", alpha=0.5)
    for bar, val in zip(bars1, m_hits):
        ax1.text(bar.get_x() + bar.get_width() / 2, val + 0.25, f"{val:.2f}%",
                 ha="center", va="bottom", fontsize=8.5, fontweight="bold")

    # Panel 2: Line Boyutu (Block Size) etkisi
    l_labels = [x[0] for x in linesize_results]
    l_hits = [x[1]["H"] * 100.0 for x in linesize_results]
    ax2.plot(l_labels, l_hits, marker="o", linewidth=2.2, markersize=7, color="#dc2626")
    ax2.set_title("Line Boyutu Etkisi (Direct-Mapped)")
    ax2.set_ylabel("Hit Oranı H (%)")
    ax2.set_ylim(85, 96)
    ax2.grid(True, linestyle="--", alpha=0.5)
    for lbl, val in zip(l_labels, l_hits):
        ax2.annotate(f"{val:.2f}%", (lbl, val), textcoords="offset points",
                     xytext=(0, 7), ha="center", fontsize=8.5, fontweight="bold")

    plt.tight_layout(rect=[0, 0, 1, 0.94])
    plt.savefig(out_png)
    plt.close(fig)


def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    trace_path = os.path.join(base_dir, "trace.csv")
    out_txt = os.path.join(base_dir, "cache_sim_output.txt")
    output_subdir = os.path.join(base_dir, "output")
    out_png = os.path.join(
        output_subdir if os.path.isdir(output_subdir) else base_dir,
        "cache_design_space.png",
    )

    trace = load_trace(trace_path)
    t1, t2 = 1.0, 35.0

    # 4c + 4d: Ana konfigürasyon (128 B, 32 B, Direct-mapped, WT)
    res_main = simulate_cache(trace, cache_size=128, line_size=32, assoc=1,
                              write_policy="WT", write_allocate=True)
    h_main = res_main["H"]
    ts_main = h_main * t1 + (1.0 - h_main) * (t1 + t2)
    speedup_nocache = t2 / ts_main

    # 4e: Eşleme ve Line Boyutu taraması
    mapping_sweep = [
        ("Direct (1-way)", simulate_cache(trace, 128, 32, 1, "WT")),
        ("2-way (LRU)", simulate_cache(trace, 128, 32, 2, "WT")),
        ("4-way (LRU)", simulate_cache(trace, 128, 32, 4, "WT")),
        ("Fully Assoc", simulate_cache(trace, 128, 32, 4, "WT")),
    ]
    linesize_sweep = [
        ("8 B (16 line)", simulate_cache(trace, 128, 8, 1, "WT")),
        ("16 B (8 line)", simulate_cache(trace, 128, 16, 1, "WT")),
        ("32 B (4 line)", res_main),
        ("64 B (2 line)", simulate_cache(trace, 128, 64, 1, "WT")),
    ]

    plot_design_space(mapping_sweep, linesize_sweep, out_png)

    lines = []
    lines.append("=== CMPE3209 ADIM 4 CACHE SİMÜLASYON ÇIKTISI ===")
    lines.append(f"Toplam veri referansı: {res_main['total']} "
                 f"(Read={sum(1 for r in trace if (r.get('RW') or r.get('rw'))=='R')}, "
                 f"Write={sum(1 for r in trace if (r.get('RW') or r.get('rw'))=='W')})")
    s30 = res_main["snapshot_30"]
    lines.append(f"\n[4c] İlk 30 Erişim: Hit={s30['hits']}, Miss={s30['misses']}, "
                 f"H={s30['H']:.6f}, Bellek Yazma={s30['mem_writes']}")
    for ln in s30["lines"]:
        lines.append(f"  Line {ln['line']}: Valid={ln['valid']}, Tag={ln['tag_hex']}, "
                     f"Dirty={ln['dirty']}, LRU={ln['lru']}")

    lines.append(f"\n[4d] Tam Trace (128B, 32B, Direct, WT): "
                 f"Hit={res_main['hits']}, Miss={res_main['misses']}, "
                 f"H={h_main:.6f} ({h_main*100:.2f}%), MemWrites={res_main['mem_writes']}")

    lines.append("\n[4e] Eşleme Politikası (C=128B, Line=32B):")
    for label, r in mapping_sweep:
        lines.append(f"  {label:<16}: Hits={r['hits']:4d}, Misses={r['misses']:3d}, H={r['H']:.6f}")

    lines.append("\n[4e] Line Boyutu (C=128B, Direct-mapped):")
    for label, r in linesize_sweep:
        lines.append(f"  {label:<16}: Hits={r['hits']:4d}, Misses={r['misses']:3d}, H={r['H']:.6f}")

    lines.append(f"\n[4f] Ortalama Erişim Süresi (T1=1, T2=35 cycle):")
    lines.append(f"  Ts = {ts_main:.6f} cycle")
    lines.append(f"  Cache'siz T2/Ts hızlanması = {speedup_nocache:.6f}x")

    report = "\n".join(lines)
    with open(out_txt, "w", encoding="utf-8") as f:
        f.write(report + "\n")
    print(report)


if __name__ == "__main__":
    main()
