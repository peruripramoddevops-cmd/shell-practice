#!/bin/bash


usage(){
 echo "Usage: $0 <filename_or_path>"
 exit 1

}
# Check if a filename argument was provided
if [ -z "$1" ]; then
   usage
fi

# Store the provided path in a variable
FILEPATH="$1"

# Check if the file exists
if [ ! -e "$FILEPATH" ]; then
    echo "'$FILEPATH' is not present."
    exit 1
fi

    # Check for readability
if [ ! -r "$FILEPATH" ]; then
    echo "'$FILEPATH' is readable."
    exit 1
fi

# checks the sizes
if [ ! -s $FILEPATH ]; then
   echo "File $FILEPATH is empty. Lines:0, Words:0, characters:0"
   exit 0
fi

WC_OUTPUT=$(wc "$FILEPATH")

set -- $WC_OUTPUT
LINES=$1
WORDS=$2
CHARACTERS=$3

# Print the results.
echo "File: '$FILEPATH'"
echo "Number of lines: $LINES"
echo "Number of words: $WORDS"
echo "Number of characters: $CHARACTERS"

