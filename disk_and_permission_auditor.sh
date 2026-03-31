#!/bin/bash
# Author: Rakshit, 24MEI10086

echo "================================= Disk and Permission Auditor ================================="

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "System Directories Audit:"
for dir in "${DIRS[@]}"
do
    if [ -d "$dir" ]
    then
        printf "\nDirectory: %s\n" "$dir"

	#permission, owner and group
        ls -ld "$dir" | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4}'

	# the disk usage of the overall system
        printf "Disk Usage: "
        du -sh "$dir" 2>/dev/null | cut -f1
    fi
done

echo "==============================================================================================="

# python specific paths (in linux)
PY_PATHS=("/usr/bin/python3" "/usr/lib/python3" "$HOME/.local/lib")

echo "Python-Specific Audit:"
for path in "${PY_PATHS[@]}"
do
    if [ -d "$path" ]
    then
        printf "\nDirectory: %s\n" "$path"

        ls -ld "$path" | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4}'
        printf "Disk Usage: "
        du -sh "$path" 2>/dev/null | cut -f1

    elif [ -f "$path" ]
    then
        printf "\nFile: %s\n" "$path"

        ls -l "$path" | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4, "Size:", $5}'
    else
        printf "\nPath not found: %s\n" "$path"
    fi
done

echo "----------------------------------"