FROM python:3.10

RUN apt-get update && apt-get install -y nginx supervisor

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]