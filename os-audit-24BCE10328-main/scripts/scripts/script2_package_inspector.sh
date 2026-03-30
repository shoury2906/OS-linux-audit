#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author  : [Your Name] | Roll No: [Roll Number]
# Course  : Open Source Software (OSS NGMC)
# Purpose : Check if a FOSS package is installed, display its
#           version and license, and print a philosophy note
#           using a case statement.
# =============================================================

# --- The package to inspect ---
# For Linux Kernel we check the kernel image package.
# On Debian/Ubuntu it is 'linux-image-generic'.
# On RHEL/Fedora  it is 'kernel'.
# The script auto-detects which package manager is available.

# Detect package manager and set the correct package name
if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
    PACKAGE="linux-image-generic"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
    PACKAGE="kernel"
else
    echo "ERROR: Neither dpkg nor rpm found. Cannot inspect packages."
    exit 1
fi

echo "========================================================"
echo "  FOSS Package Inspector"
echo "  Package Manager : $PKG_MANAGER"
echo "  Package         : $PACKAGE"
echo "========================================================"
echo ""

# --- Check if the package is installed using if-then-else ---
if [ "$PKG_MANAGER" = "dpkg" ]; then

    # dpkg -l lists installed packages; grep for an exact match
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "STATUS: $PACKAGE is INSTALLED on this system."
        echo ""
        echo "Package Details:"
        echo "----------------"
        # Extract version and description using dpkg-query
        dpkg-query -W -f='  Version     : ${Version}\n  Architecture: ${Architecture}\n  Description : ${binary:Summary}\n' "$PACKAGE"
        echo "  License     : GPL-2.0 (GNU General Public License v2)"
    else
        echo "STATUS: $PACKAGE is NOT installed."
        echo "To install, run: sudo apt install $PACKAGE"
    fi

elif [ "$PKG_MANAGER" = "rpm" ]; then

    # rpm -q returns 0 if package is found, non-zero otherwise
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "STATUS: $PACKAGE is INSTALLED on this system."
        echo ""
        echo "Package Details:"
        echo "----------------"
        # Extract specific fields with grep
        rpm -qi "$PACKAGE" | grep -E "^(Version|License|Summary|Architecture)"
    else
        echo "STATUS: $PACKAGE is NOT installed."
        echo "To install, run: sudo dnf install $PACKAGE"
    fi

fi

echo ""

# --- Case statement: print a philosophy note per package name ---
# This demonstrates the case construct in Bash.
echo "Philosophy Note:"
echo "----------------"

case $PACKAGE in
    linux-image-generic|kernel)
        echo "  Linux Kernel: The foundation everything runs on — built by"
        echo "  a student who believed software freedom was a right, not a privilege."
        ;;
    httpd|apache2)
        echo "  Apache HTTP Server: the open web server that proved a community"
        echo "  could build infrastructure better than any single corporation."
        ;;
    mysql|mariadb)
        echo "  MySQL/MariaDB: open source at the heart of millions of apps —"
        echo "  and a lesson in what happens when community and commerce clash."
        ;;
    firefox)
        echo "  Firefox: a nonprofit's answer to corporate browser monopoly —"
        echo "  proof that the open web is worth fighting for."
        ;;
    vlc)
        echo "  VLC: born in a Paris university dorm, now plays anything anywhere —"
        echo "  the spirit of open source distilled into one media player."
        ;;
    git)
        echo "  Git: Linus Torvalds built it in two weeks when proprietary tools failed him."
        echo "  Today it underpins almost all software development on the planet."
        ;;
    python3|python)
        echo "  Python: a language shaped entirely by its community —"
        echo "  open governance, open development, open to everyone."
        ;;
    *)
        echo "  $PACKAGE: another piece of the open-source world that someone"
        echo "  built, shared, and gave freely so others could stand on their work."
        ;;
esac

echo ""
