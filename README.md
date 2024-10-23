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
   docker run --privileged -p 8080:8080 stacksync-thc
