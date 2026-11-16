
FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

RUN python -m pip install --no-cache-dir PyYAML

COPY feed.py /usr/local/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
