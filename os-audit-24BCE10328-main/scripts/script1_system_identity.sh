#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author  : [Your Name] | Roll No: [Roll Number]
# Course  : Open Source Software (OSS NGMC)
# Purpose : Display a welcome-screen style summary of the Linux
#           system — distro, kernel, user, uptime, and license.
# =============================================================

# --- Student details (fill these in before submission) ---
STUDENT_NAME="[Your Name]"
ROLL_NUMBER="[Roll Number]"
SOFTWARE_CHOICE="Linux Kernel"

# --- Gather system information using command substitution ---

# Kernel version from uname
KERNEL=$(uname -r)

# Currently logged-in username
USER_NAME=$(whoami)

# User's home directory from the shell environment
HOME_DIR=$HOME

# Human-readable system uptime
UPTIME=$(uptime -p)

# Current date and time, formatted clearly
DATETIME=$(date '+%A, %d %B %Y, %H:%M:%S %Z')

# Distribution name — read from the standard os-release file
# This file exists on virtually all modern Linux distributions
if [ -f /etc/os-release ]; then
    # Source the file to load PRETTY_NAME and other variables
    . /etc/os-release
    DISTRO="${PRETTY_NAME:-Unknown Distribution}"
else
    DISTRO="Unknown Distribution (os-release not found)"
fi

# The license that governs the Linux kernel
LICENSE="GNU General Public License v2 (GPL-2.0)"

# --- Display the report ---

echo "========================================================"
echo "        Open Source Audit — $STUDENT_NAME"
echo "        Roll No : $ROLL_NUMBER"
echo "        Software: $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date/Time    : $DATETIME"
echo ""
echo "--------------------------------------------------------"
echo "  OS License   : $LICENSE"
echo "  This means   : You are free to run, study, share,"
echo "                 and modify this operating system."
echo "--------------------------------------------------------"
echo ""
