#!/bin/bash
# Author: Rakshit, 24MEI10086

echo "===== FOSS Package Inspector (Python) ====="

echo -n "Python Installation Status : "
if command -v python3 >/dev/null 2>&1
then
    echo "    Python3 is installed."

    echo -n "    Version:"
    python3 --version

    echo -n "    Location:"
    which python3

else
    echo "    Python3 is NOT installed."
    exit 1
fi

echo "----------------------------------"

if command -v pip3 >/dev/null 2>&1
then
    echo "pip is installed."

    echo "pip version:"
    pip3 --version
else
    echo "pip is NOT installed."
fi

echo "----------------------------------"

# Package manager detection
if command -v apt >/dev/null 2>&1
then
    pkg_manager="apt"
elif command -v dnf >/dev/null 2>&1
then
    pkg_manager="dnf"
elif command -v yum >/dev/null 2>&1
then
    pkg_manager="yum"
else
    pkg_manager="unknown"
fi

echo "----------------------------------"