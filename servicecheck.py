import os

SERVICE = "nginx"

def check_service():
    status = os.system(f"systemctl is-active --quiet {SERVICE}")
    if status != 0:
        print(f"❌ {SERVICE} is down. Restarting...")
        os.system(f"systemctl restart {SERVICE}")
        print(f"✅ {SERVICE} restarted")
    else:
        print(f"✅ {SERVICE} is running")

check_service()
