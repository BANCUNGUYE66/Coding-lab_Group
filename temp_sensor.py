import random
import time
from datetime import datetime

while True:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    device_id = f"TEMP_{random.randint(1,2)}"
    temperature = round(random.uniform(36.0, 38.0), 1)
    
    with open("hospital_data/active_logs/temperature.log", "a") as f:
        f.write(f"{timestamp} {device_id} {temperature}\n")
    
    time.sleep(10)
