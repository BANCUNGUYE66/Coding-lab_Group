#!/bin/bash

LOG_DIR="hospital_data/active_logs"
REPORT_DIR="hospital_data/reports"
mkdir -p "$REPORT_DIR"

analyze_log() {
    local log_file="$1"
    local log_name="$2"
    
    if [ ! -f "$log_file" ]; then
        echo "Error: $log_name log not found!"
        return 1
    fi

    report_file="$REPORT_DIR/analysis_report.txt"
    echo -e "\n=== $log_name Report - $(date) ===" >> "$report_file"
    awk '{print $2}' "$log_file" | sort | uniq -c >> "$report_file"
    echo "[$(date)] Analysis by Methode Duhujubumwe recorded for $log_name." >> "$report_file"
    echo "Report saved to $report_file"
}

PS3="Select log to analyze: "
select opt in "Heart Rate" "Temperature" "Water Usage"; do
    case $opt in
        "Heart Rate") analyze_log "$LOG_DIR/heart_rate.log" "Heart Rate"; break ;;
        "Temperature") analyze_log "$LOG_DIR/temperature.log" "Temperature"; break ;;
        "Water Usage") analyze_log "$LOG_DIR/water_usage.log" "Water Usage"; break ;;
        *) echo "Invalid option";;
    esac
done
