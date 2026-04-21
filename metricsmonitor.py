import psutil

def system_health():
    cpu = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory().percent
    disk = psutil.disk_usage('/').percent

    print(f"CPU: {cpu}%, Memory: {memory}%, Disk: {disk}%")

    if cpu > 85 or memory > 90 or disk > 90:
        print("🚨 High Resource Usage!")

system_health()
