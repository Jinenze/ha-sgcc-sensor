FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    TZ=Asia/Shanghai

WORKDIR /app

COPY src/* .

RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    chromium-driver \
    && pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["python3","main.py"]
