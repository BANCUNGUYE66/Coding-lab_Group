import random
import time
from datetime import datetime

while True:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    device_id = "WATER_1"
    consumption = random.randint(50, 200)
    
    with open("hospital_data/active_logs/water_usage.log", "a") as f:
        f.write(f"{timestamp} {device_id} {consumption}\n")
    
    time.sleep(30)
