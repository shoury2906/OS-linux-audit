# 🐧 The Open Source Audit — Linux Kernel

<div align="center">

![Linux](https://img.shields.io/badge/Linux-Kernel-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![License](https://img.shields.io/badge/License-GPL--v2-blue?style=for-the-badge)
![Course](https://img.shields.io/badge/Course-OSS%20NGMC-navy?style=for-the-badge)
![VIT](https://img.shields.io/badge/Institution-VIT-red?style=for-the-badge)
![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)

</div>

---

## 👤 Student Details

| Field | Details |
|---|---|
| **Name** | Shoury Kumar Agrawal |
| **Registration No** | 24BCE10328 |
| **Course** | Open Source Software (OSS NGMC) |
| **Institution** | VIT |
| **Software Chosen** | Linux Kernel |
| **License** | GNU General Public License v2 (GPL-2.0) |

---

## 📌 About This Project

This is a capstone project for the **Open Source Software (OSS NGMC)** course at VIT. The project is a structured audit of the **Linux Kernel** — examining its origin, its GPL v2 license, its ethical foundations, its technical footprint on a Linux system, and its place in the broader FOSS ecosystem.

Alongside the written report, five Bash shell scripts demonstrate practical Linux command-line skills covering variables, loops, conditionals, file handling, and user input.

---

## 📁 Repository Structure

```
oss-audit-24BCE10328/
│
├── README.md                               ← You are here
├── .gitignore
│
├── scripts/
│   ├── script1_system_identity.sh          ← System Identity Report
│   ├── script2_package_inspector.sh        ← FOSS Package Inspector
│   ├── script3_disk_permission_audit.sh    ← Disk & Permission Auditor
│   ├── script4_log_analyzer.sh             ← Log File Analyzer
│   └── script5_manifesto_generator.sh      ← Manifesto Generator
│
├── report/
│   └── OSS_Audit_Report_RoushanRajSharma_24BSA10180.pdf
│
└── screenshots/
    └── (script output screenshots)
```

---

## 📜 Report Structure

The full report (23 pages) covers all required parts of the audit:

| Part | Topic | Marks |
|---|---|---|
| **A1** | Origin Story of the Linux Kernel | 12 |
| **A2** | GPL v2 License Analysis | 12 |
| **A3** | Ethics of Open Source | 10 |
| **B**  | Linux Footprint on a Running System | 10 |
| **C**  | The FOSS Ecosystem | 8 |
| **D**  | Open Source vs Proprietary Comparison | 8 |
| **Scripts** | 5 Shell Scripts (8 marks each) | 40 |
| | **Total** | **100** |

---

## 🛠️ Shell Scripts

### Script 1 — System Identity Report
**File:** `scripts/script1_system_identity.sh`

Displays a welcome screen showing distro name, kernel version, logged-in user, home directory, uptime, date/time, and the GPL v2 license message.

**Concepts:** Variables, `echo`, command substitution `$()`, `/etc/os-release`, `uname`, `whoami`, `uptime`, `date`

```bash
chmod +x scripts/script1_system_identity.sh
./scripts/script1_system_identity.sh
```

---

### Script 2 — FOSS Package Inspector
**File:** `scripts/script2_package_inspector.sh`

Checks if the Linux kernel package is installed, prints version and license details, and uses a `case` statement to display a philosophy note about the package.

**Concepts:** `if-then-else`, `case` statement, `dpkg` / `rpm`, `grep`, pipes

```bash
chmod +x scripts/script2_package_inspector.sh
./scripts/script2_package_inspector.sh
```

---

### Script 3 — Disk and Permission Auditor
**File:** `scripts/script3_disk_permission_audit.sh`

Loops through key system directories and reports permissions, owner, group, and disk usage. Includes a dedicated check for kernel-specific directories like `/boot` and `/lib/modules`.

**Concepts:** `for` loop, array variables, `ls -ld`, `du -sh`, `awk`, `cut`

```bash
chmod +x scripts/script3_disk_permission_audit.sh
./scripts/script3_disk_permission_audit.sh
```

---

### Script 4 — Log File Analyzer
**File:** `scripts/script4_log_analyzer.sh`

Reads a log file line by line, counts keyword matches, and prints the last 5 matching lines. Accepts log file path and keyword as arguments.

**Concepts:** `while read` loop, counter variable, `$1`/`$2` arguments, `grep`, `tail`

```bash
chmod +x scripts/script4_log_analyzer.sh

# Usage
./scripts/script4_log_analyzer.sh /var/log/syslog error
./scripts/script4_log_analyzer.sh /var/log/syslog warning
```

---

### Script 5 — Open Source Manifesto Generator
**File:** `scripts/script5_manifesto_generator.sh`

Asks the user three interactive questions and generates a personalised open-source philosophy statement, saving it to a `.txt` file.

**Concepts:** `read`, string concatenation, `>` / `>>` file writing, `date`, alias concept

```bash
chmod +x scripts/script5_manifesto_generator.sh
./scripts/script5_manifesto_generator.sh
```

---

## ⚡ Quick Start — Run All Scripts

```bash
# 1. Clone the repository
git clone https://github.com/[yourusername]/oss-audit-24BCE10328.git
cd oss-audit-24BCE10328

# 2. Make all scripts executable at once
chmod +x scripts/*.sh

# 3. Run each script
./scripts/script1_system_identity.sh
./scripts/script2_package_inspector.sh
./scripts/script3_disk_permission_audit.sh
./scripts/script4_log_analyzer.sh /var/log/syslog
./scripts/script5_manifesto_generator.sh
```

---

## 📦 Dependencies

| Script | Dependencies | Notes |
|---|---|---|
| Script 1 | `bash`, `uname`, `whoami`, `uptime`, `date` | Available on all Linux systems |
| Script 2 | `dpkg` or `rpm` | Auto-detected based on your distro |
| Script 3 | `ls`, `du`, `awk`, `cut` | Available on all Linux systems |
| Script 4 | `grep`, `tail` | Needs a readable log file path as argument |
| Script 5 | `bash`, `date` | No external dependencies |

> **Tested on:** Ubuntu 22.04 LTS / Fedora 38

---

## 🔗 References

- [Linux Kernel Source — kernel.org](https://www.kernel.org)
- [GNU GPL v2 License Text](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
- [The Free Software Definition — GNU](https://www.gnu.org/philosophy/free-sw.html)
- [The Cathedral and the Bazaar — Eric S. Raymond](http://catb.org/~esr/writings/cathedral-bazaar/)
- [The Linux Command Line — William Shotts](https://linuxcommand.org/tlcl.php)
- [GNU Bash Manual](https://www.gnu.org/software/bash/manual/)

---

<div align="center">

*Submitted as part of the Open Source Software (OSS NGMC) Capstone Project — VIT*

*Shoury Kumar Agrawal | 24BCE10328*

</div>
