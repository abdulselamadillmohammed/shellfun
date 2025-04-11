#!/bin/sh
# The following task revolves around making use of "getopts"
# Change the file name to process_files.sh since it is initally named "exercise1"

# This file should support -n (dry run), -v (verbose) and -M which expects mode arguments
# If verbose mode is enabled, print a message for each file that is being processed

# For each file, if file ends in ".py", print "Deleting [filename]"
# if not in dry-run mode. (don't need to actually delete files)
# Else: print "Not deleting [filename]"

# Extra: Handle an unsupported option by printing an error message and exiting

# Ideally you should be outputing something like 
# Mode set to 755
# Processing script.py
# Deleting script.py (dry-run)
# Processing notes.txt
# Not deleting notes.txt

# Initialize flags
dry_run=false
verbose=false
mode=""

# Parse options
while getopts ":nvM:" opt; do
  echo "OPTION: $opt"
  case $opt in
    n) dry_run=true ;;
    v) verbose=true ;;
    M) mode="$OPTARG" ;;
    \?) echo "Error: Unsupported option -$OPTARG" >&2; exit 1;;
    :) echo "Error: Option -$OPTARG requires an argument." >&2; exit 1 ;;
  esac
done

shift $((OPTIND -1))

if [ -n "$mode" ]; then
  echo "Mode set to $mode"
fi

# Loop through each file argument 
for file in "$@"; do
  if $verbose; then
    echo "Processing $file"
  fi

  if [ "${file##*.}" = "py" ]; then
    if $dry_run; then
      echo "Deleting $file (dry-run)"
    else
      echo "Deleting $file"
    fi
  else 
   echo "Not deleting $file"
  fi
done



