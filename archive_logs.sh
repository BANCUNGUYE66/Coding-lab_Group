#!/bin/bash

# Define directories and files
ACTIVE_LOGS_DIR="hospital_data/active_logs"
ARCHIVE_DIR="hospital_data/archived_logs"

# Create directories if they don't exist
mkdir -p "$ACTIVE_LOGS_DIR"
mkdir -p "$ARCHIVE_DIR/heart_data_archive"
mkdir -p "$ARCHIVE_DIR/temperature_data_archive"
mkdir -p "$ARCHIVE_DIR/water_usage_data_archive"

# Display menu
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

# Process user choice
case $choice in
    1)
        log_file="heart_rate.log"
        archive_subdir="heart_data_archive"
        log_name="Heart Rate"
        ;;
    2)
        log_file="temperature.log"
        archive_subdir="temperature_data_archive"
        log_name="Temperature"
        ;;
    3)
        log_file="water_usage.log"
        archive_subdir="water_usage_data_archive"
        log_name="Water Usage"
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 3."
        exit 1
        ;;
esac

# Check if log file exists
if [ ! -f "$ACTIVE_LOGS_DIR/$log_file" ]; then
    echo "Error: $log_name log file does not exist in $ACTIVE_LOGS_DIR/"
    exit 1
fi

# Generate timestamp for archive filename
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
archive_filename="${log_file%.*}_${timestamp}.log"

# Archive the log file
echo "Archiving $log_file..."
mv "$ACTIVE_LOGS_DIR/$log_file" "$ARCHIVE_DIR/$archive_subdir/$archive_filename"

# Create new empty log file
touch "$ACTIVE_LOGS_DIR/$log_file"

echo "Successfully archived to $archive_subdir/$archive_filename"
