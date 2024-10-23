# StackSync

This project provides a secure API service for executing arbitrary Python code within a controlled environment using Flask and nsjail.


### Prerequisites

- Docker
- Python 3.12 or higher

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/industrial-disease/stacksync_thc.git
   cd stacksync_thc
2. Build the Docker image:
   ```bash
   docker build -t stacksync-thc .
3. Run the service:
   ```bash
   docker run --privileged -p 8080:8080 \
   -v/Users/marcostopper/Documents/stacksync_thc/nsjail/configs/stacksync.cfg:/opt/nsjail/configs/stacksync.cfg \
   -v /Users/marcostopper/Documents/stacksync_thc:/mnt/app:rw \
   stacksync-thc nsjail --config /opt/nsjail/configs/stacksync.cfg -- /usr/bin/python3    /mnt/app/stacksync_thc.py
4. Test the service:
   ```bash
   curl -X POST http://127.0.0.1:8080/execute \
     -H "Content-Type: application/json" \
     -d '{"script": "def main(): return {\"message\": \"Hello, Ruben!\"}"}'
