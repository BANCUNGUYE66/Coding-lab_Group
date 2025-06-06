import random
import time
from datetime import datetime

while True:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    device_id = f"HR_{random.randint(1,2)}"
    heart_rate = random.randint(60, 100)
    
    with open("hospital_data/active_logs/heart_rate.log", "a") as f:
        f.write(f"{timestamp} {device_id} {heart_rate}\n")
    
    time.sleep(5)
