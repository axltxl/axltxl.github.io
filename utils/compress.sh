#!/bin/bash

INPUT_DIR="src/images"
OUTPUT_DIR="src/images"
QUALITY=75  # Adjust JPEG quality (0-100)

mkdir -p "$OUTPUT_DIR"

for file in "$INPUT_DIR"/*.{jpg,jpeg,JPG,JPEG}; do
  [ -e "$file" ] || continue  # skip if no matching files

  filename=$(basename "$file")
  output_file="$OUTPUT_DIR/$filename"

  convert "$file" -strip -interlace Plane -sampling-factor 4:2:0 -quality $QUALITY "$output_file"

  echo "Compressed: $filename"
done

