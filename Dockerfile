# python image
FROM python:3.12-slim

# working directory
WORKDIR /app

# current directory contents into the container
COPY . /app



RUN pip install --no-cache-dir Flask numpy pandas

# nsjail dependencies
RUN apt-get update && apt-get install -y git build-essential flex bison libprotobuf-dev protobuf-compiler \
    libnl-3-dev libnl-route-3-dev libcap-dev pkg-config


RUN git clone https://github.com/google/nsjail.git /opt/nsjail \
    && cd /opt/nsjail && make


ENV PATH="/opt/nsjail:${PATH}"

# Expose the port Flask will run on
EXPOSE 8080

# run Flask app when container launches
CMD ["python3", "stacksync_thc.py"]

