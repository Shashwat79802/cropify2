FROM python:3.7.12-slim

WORKDIR /app

RUN apt-get update && apt install -y build-essential

COPY requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app/

# RUN flask seed run --root="forum/database/seeds"

CMD ["flask", "run", "-h", "0.0.0.0"]