FROM python:3.10-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x app/entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]