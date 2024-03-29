#!/bin/bash
# Define directories for different file types
declare -A directories=(
    ["Images"]="jpg jpeg png gif"
    ["Documents"]="pdf doc docx txt"
    ["Videos"]="mp4 mov avi"
    ["Music"]="mp3 wav"
    ["Archives"]="zip tar gz"
    ["Scripts"]="sh py"
)
# Function to organize files
organize_files() {
    echo "Organizing files in $1 directory..."
    for file in *.$2; do
        if [ -f "$file" ]; then
            mkdir -p "$1"
            mv "$file" "$1"
            echo "Moved $file to $1"
        fi
    done
}
# Loop through directories and organize files
for dir in "${!directories[@]}"; do
    for ext in ${directories[$dir]}; do
        organize_files "$dir" "$ext"
    done
done
echo "File organization complete!"
