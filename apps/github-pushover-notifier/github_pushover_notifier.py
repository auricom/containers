import os
import sys
import time
import yaml
import requests
from datetime import datetime

PUSHOVER_API_URL = "https://api.pushover.net/1/messages.json"
PUSHOVER_APP_TOKEN = os.environ.get("PUSHOVER_APP_TOKEN")
PUSHOVER_USER_KEY = os.environ.get("PUSHOVER_USER_KEY")

def load_repositories():
    with open("config.yaml") as f:
        config = yaml.safe_load(f)
    return config["repositories"]

def get_latest_release(repo):
    url = f"https://api.github.com/repos/{repo}/releases/latest"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    return None

def send_pushover_notification(title, message):
    data = {
        "token": PUSHOVER_APP_TOKEN,
        "user": PUSHOVER_USER_KEY,
        "title": title,
        "message": message
    }
    response = requests.post(PUSHOVER_API_URL, data=data)
    if response.status_code == 200:
        print(f"Notification sent: {title}")
    else:
        print(f"Error sending notification: {response.text}")

def main():
    if not PUSHOVER_APP_TOKEN or not PUSHOVER_USER_KEY:
        print("Please set PUSHOVER_APP_TOKEN and PUSHOVER_USER_KEY environment variables.")
        sys.exit(1)

    repositories = load_repositories()
    release_dates = {}

    while True:
        for repo in repositories:
            latest_release = get_latest_release(repo)
            if latest_release:
                release_date = datetime.fromisoformat(latest_release["published_at"].rstrip("Z"))
                # if repo not in release_dates or release_date > release_dates[repo]:
                if release_date > release_dates[repo]:
                    title = f"New release for {repo}"
                    message = f"{latest_release['name']} ({latest_release['tag_name']})"
                    send_pushover_notification(title, message)
                    release_dates[repo] = release_date
        time.sleep(3600)  # Check for new releases every hour

if __name__ == "__main__":
    main()
