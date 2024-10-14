#!/bin/bash

# Prompt for access token
ACCESS_TOKEN="ya29.a0AcM612wPfoygQ4Bpumn_pmSigEjk7jO-p4Q_25M5FWazEL9Wils0IoqURgFe3CxvbgIHTLOVdJy8bp17tC3FZRwaVWE15socuDjQ-_t5axD0JnUCPzpupLxNin7euKFhKgSEjar0taU3CFhzaQXa5_P25ExwjwB7dEtVB0LXaCgYKATsSARASFQHGX2Mij5dZo0gYWXYolGVjqkJQMw0175"

# Define the input file containing URLs
INPUT_FILE="file_urls.txt"

# Define the output directory
OUTPUT_DIR="bign"

# Check if the input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Input file '$INPUT_FILE' not found!"
    exit 1
fi

# Check if the output directory exists
if [[ ! -d "$OUTPUT_DIR" ]]; then
    echo "Output directory '$OUTPUT_DIR' does not exist!"
    exit 1
fi

# Loop through each line in the input file
while IFS= read -r URL; do
    # Extract the file ID from the URL
    FILE_ID=$(echo "$URL" | grep -oP 'd/\K[^/]+')

    # Check if FILE_ID was extracted successfully
    if [[ -z "$FILE_ID" ]]; then
        echo "Failed to extract file ID from URL: $URL"
        continue
    fi

    # Get the file metadata to retrieve the original name
    FILE_METADATA=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://www.googleapis.com/drive/v3/files/$FILE_ID?fields=name")
    ORIGINAL_NAME=$(echo "$FILE_METADATA" | jq -r '.name')

    # Check if the original name was retrieved successfully
    if [[ -z "$ORIGINAL_NAME" ]]; then
        echo "Failed to retrieve original name for file ID: $FILE_ID"
        continue
    fi

    # Use curl to download the file to the specified output directory
    OUTPUT_FILE="$OUTPUT_DIR/$ORIGINAL_NAME"
    echo "Downloading file with ID: $FILE_ID as '$ORIGINAL_NAME' to '$OUTPUT_FILE'"
    curl -H "Authorization: Bearer $ACCESS_TOKEN" -C - "https://www.googleapis.com/drive/v3/files/$FILE_ID?alt=media" -o "$OUTPUT_FILE"

    # Check if the download was successful
    if [[ $? -eq 0 ]]; then
        echo "Downloaded: $OUTPUT_FILE"
    else
        echo "Failed to download file with ID: $FILE_ID"
    fi
done < "$INPUT_FILE"










#!/bin/bash

# Set your Google Drive access token as a variable
ACCESS_TOKEN="ya29.a0AcM612wPfoygQ4Bpumn_pmSigEjk7jO-p4Q_25M5FWazEL9Wils0IoqURgFe3CxvbgIHTLOVdJy8bp17tC3FZRwaVWE15socuDjQ-_t5axD0JnUCPzpupLxNin7euKFhKgSEjar0taU3CFhzaQXa5_P25ExwjwB7dEtVB0LXaCgYKATsSARASFQHGX2Mij5dZo0gYWXYolGVjqkJQMw0175"

# Define the input file containing URLs
INPUT_FILE="file_urls.txt"

# Define the output directorya
OUTPUT_DIR="bign"

# Check if the input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Input file '$INPUT_FILE' not found!"
    exit 1
fi

# Check if the output directory exists
if [[ ! -d "$OUTPUT_DIR" ]]; then
    echo "Output directory '$OUTPUT_DIR' does not exist!"
    exit 1
fi

# Loop through each line in the input file
#while IFS= read -r URL; do
  #  # Extract the file ID from the URL
  #  FILE_ID=$(echo "$URL" | grep -oP 'd/\K[^/]+')

    # Check if FILE_ID was extracted successfully
  #  if [[ -z "$FILE_ID" ]]; then
  #      echo "Failed to extract file ID from URL: $URL"
  #      continue
 #   fi

    # Get the file metadata to retrieve the original name
 #   FILE_METADATA=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://www.googleapis.com/drive/v3/files/$FILE_ID?fields=name")
 #   ORIGINAL_NAME=$(echo "$FILE_METADATA" | jq -r '.name')

    # Check if the original name was retrieved successfully
#    if [[ -z "$ORIGINAL_NAME" ]]; then
#        echo "Failed to retrieve original name for file ID: $FILE_ID"
 #       continue
#    fi

    # Use curl to download the file to the specified output directory
#    OUTPUT_FILE="$OUTPUT_DIR/$ORIGINAL_NAME"
#    echo "Downloading file with ID: $FILE_ID as '$ORIGINAL_NAME' to '$OUTPUT_FILE'"
#    curl -H "Authorization: Bearer $ACCESS_TOKEN" -C - "https://www.googleapis.com/drive/v3/files/$FILE_ID?alt=media" -o "$OUTPUT_FILE"
#
#    # Check if the download was successful
#    if [[ $? -eq 0 ]]; then
#        echo "Downloaded: $OUTPUT_FILE"
#    else
#        echo "Failed to download file with ID: $FILE_ID"
#    fi
#done < "$INPUT_FILE"
