#!/bin/bash

# Check if a filename argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <filename_or_path>"
    exit 1
fi

# Store the provided path in a variable
FILEPATH="$1"

# Check if the file exists
if [ ! -e "$FILEPATH" ]; then
    echo "'$FILEPATH' is not present."
# If the file exists, perform the permission checks
else
    echo "'$FILEPATH' exists."

    # Check for readability
    if [ -r "$FILEPATH" ]; then
        echo "'$FILEPATH' is readable."
    else
        echo "'$FILEPATH' is not readable."
    fi

    # Check for writability
    if [ -w "$FILEPATH" ]; then
        echo "'$FILEPATH' is writable."
    else
        echo "'$FILEPATH' is not writable."
    fi
fi
