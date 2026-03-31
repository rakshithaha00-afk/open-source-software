#!/bin/bash
# Author: Rakshit, 24MEI10086

echo "===== Open Source Manifesto Generator ====="

# user input
read -p "enter a daily open-source tool: " TOOL
read -p "define freedom in one word: " FREEDOM
read -p "something you want to build and share: " BUILD

# check for empty input
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]
then
    echo "error: all fields must be filled."
    exit 1
fi

# dynamic filename
USER_NAME=$(whoami)
FILE="manifesto_$USER_NAME.txt"

# write to file
echo "===== open source manifesto =====" > "$FILE"
echo "user: $USER_NAME" >> "$FILE"
echo "date: $(date)" >> "$FILE"
echo "" >> "$FILE"

echo "i use $TOOL every day and believe in $FREEDOM." >> "$FILE"
echo "i commit to building $BUILD and sharing it freely with others." >> "$FILE"
echo "knowledge grows when it is open, not hidden." >> "$FILE"

echo "----------------------------------"

# display file
cat "$FILE"

