# Hospital Data Monitoring & Archival System

This project is a group-based assignment simulating a hospital data monitoring and archiving system using Python and Bash shell scripts. It demonstrates skills in real-time data collection, interactive scripting, log file management, and analysis using Linux CLI tools. I collaborated with my team by contributing to both scripting and testing parts of the project.

The system uses three Python simulators (`heart_monitor.py`, `temp_sensor.py`, and `water_meter.py`) to generate real-time logs for heart rate, temperature, and water usage. These logs are stored under `hospital_data/active_logs/` and continuously updated.

Two key Bash scripts automate log handling:

- `archive_logs.sh`: lets the user select a log (heart rate, temperature, or water usage) to archive. It renames the log with a timestamp, moves it to the right archive folder, and creates a new empty log for continued monitoring.
- `analyze_logs.sh`: provides a menu to analyze one of the logs, counts device entries, captures timestamps, and appends the results to `reports/analysis_report.txt`.

## How to Run

1. **Start Simulators** (each in its own terminal):
```bash
python3 heart_monitor.py start
python3 temp_sensor.py start
python3 water_meter.py start
````

2. **Check Logs** (optional):

```bash
tail -f hospital_data/active_logs/heart_rate.log
```

3. **Run Archiving Script**:

```bash
./archive_logs.sh
```

4. **Run Analysis Script**:

```bash
./analyze_logs.sh
```

All contributions were made collaboratively, and tracked via GitHub commits as required. This project helped us practice shell scripting, automation, and log-based data analysis in a real-world-like setup.

```
