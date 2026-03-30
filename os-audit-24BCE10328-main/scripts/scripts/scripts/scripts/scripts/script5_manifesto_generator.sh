#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author  : [Your Name] | Roll No: [Roll Number]
# Course  : Open Source Software (OSS NGMC)
# Purpose : Ask the user three questions interactively, then
#           compose and save a personalised open-source
#           philosophy statement to a .txt file.
# =============================================================

# --- Alias concept (demonstrated via comment) ---
# In a live shell session you could type:
#   alias manifesto='./script5_manifesto_generator.sh'
# and then just run: manifesto
# Aliases let you create shorthand names for commands.
# They are defined in ~/.bashrc for persistence across sessions.

# Get the current date for the manifesto signature
DATE=$(date '+%A, %d %B %Y')

# Output file is named after the current user
OUTPUT="manifesto_$(whoami).txt"

echo "========================================================"
echo "   Open Source Manifesto Generator"
echo "   Powered by: Bash + your own thinking"
echo "========================================================"
echo ""
echo "Answer three questions and I will write your manifesto."
echo ""

# --- Interactive input using 'read' ---

# Question 1: a tool they use daily
read -p "1. Name one open-source tool you use every day: " TOOL

# Question 2: what freedom means to them (one word)
read -p "2. In one word, what does 'freedom' mean to you?  " FREEDOM

# Question 3: something they would build and share
read -p "3. Name one thing you would build and share freely: " BUILD

echo ""
echo "Generating your manifesto..."
echo ""

# --- String concatenation: build the manifesto paragraph ---
# Each echo >> appends a line to the output file.
# Using > on the first write clears any old version of the file.

# Write the header — use > to create/overwrite the file
echo "========================================" > "$OUTPUT"
echo " MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo " Generated on: $DATE" >> "$OUTPUT"
echo " By: $(whoami)" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write the manifesto body — concatenating the user's answers into prose
echo "I believe in the power of open source." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day I rely on $TOOL — a tool built by the community," >> "$OUTPUT"
echo "for the community, and given freely to the world." >> "$OUTPUT"
echo "It exists because someone chose to share rather than to lock away." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom means $FREEDOM." >> "$OUTPUT"
echo "That is exactly what open-source software protects —" >> "$OUTPUT"
echo "not just the freedom to use a program, but the freedom to understand it," >> "$OUTPUT"
echo "improve it, and pass it on to someone else." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day I will build $BUILD and share it freely with the world." >> "$OUTPUT"
echo "Because knowledge shared is knowledge multiplied." >> "$OUTPUT"
echo "Every great tool I use today exists because someone before me" >> "$OUTPUT"
echo "chose to publish their work instead of protect it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I stand on the shoulders of giants — Linus Torvalds, Richard Stallman," >> "$OUTPUT"
echo "and the thousands of unnamed contributors who wrote code at night" >> "$OUTPUT"
echo "for no pay and no recognition, only the belief that it mattered." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I carry that responsibility forward." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $(whoami), $DATE" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

# --- Display the saved manifesto to the screen ---
echo "Manifesto saved to: $OUTPUT"
echo "--------------------------------------------"
cat "$OUTPUT"
echo ""
