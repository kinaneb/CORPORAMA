FROM debian:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-full

WORKDIR /app

COPY app/requirements.txt .

COPY . .

RUN chmod +x app/entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]