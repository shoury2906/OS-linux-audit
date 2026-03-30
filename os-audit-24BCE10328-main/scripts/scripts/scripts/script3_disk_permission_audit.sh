#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author  : [Your Name] | Roll No: [Roll Number]
# Course  : Open Source Software (OSS NGMC)
# Purpose : Loop through key Linux system directories and report
#           permissions, ownership, and disk usage for each.
#           Also checks the Linux kernel's own directories.
# =============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/lib" "/opt")

echo "========================================================"
echo "  Disk and Permission Auditor"
echo "  Run by : $(whoami) on $(date '+%d %B %Y %H:%M:%S')"
echo "========================================================"
echo ""
printf "%-20s %-30s %-10s\n" "Directory" "Permissions (type user group)" "Size"
echo "------------------------------------------------------------------------"

# --- For loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists on this system
    if [ -d "$DIR" ]; then
        # ls -ld shows directory info without listing contents
        # awk extracts: field 1 = permissions, field 3 = owner, field 4 = group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives human-readable size; cut extracts only the size column
        # 2>/dev/null suppresses permission-denied errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-20s %-30s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        # Directory does not exist on this system — report it clearly
        printf "%-20s %-30s\n" "$DIR" "[does not exist on this system]"
    fi

done

echo ""
echo "========================================================"
echo "  Linux Kernel — Specific Directory Check"
echo "========================================================"
echo ""

# --- Extra section: check kernel-related directories ---
# These are the directories where the Linux kernel stores its files.
KERNEL_DIRS=("/boot" "/lib/modules" "/proc" "/sys")

for KDIR in "${KERNEL_DIRS[@]}"; do
    if [ -d "$KDIR" ]; then
        # Get permissions and ownership
        PERMS=$(ls -ld "$KDIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$KDIR" 2>/dev/null | cut -f1)

        echo "  Directory : $KDIR"
        echo "  Perms     : $PERMS"
        echo "  Size      : ${SIZE:-N/A}"

        # Extra info for /boot — list kernel image files
        if [ "$KDIR" = "/boot" ]; then
            echo "  Kernel files in /boot:"
            ls /boot/vmlinuz* 2>/dev/null | while read -r f; do
                echo "    -> $f"
            done
        fi

        # Extra info for /lib/modules — list installed kernel versions
        if [ "$KDIR" = "/lib/modules" ]; then
            echo "  Installed kernel module versions:"
            ls /lib/modules/ 2>/dev/null | while read -r v; do
                echo "    -> $v"
            done
        fi

        echo ""
    else
        echo "  $KDIR : does not exist on this system"
        echo ""
    fi
done

echo "Audit complete."
echo ""
