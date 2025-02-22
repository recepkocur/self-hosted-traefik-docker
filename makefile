# Last Update: 2025.02.18

# .env dosyasını yükle
include .env

# Yeniden Başlat
restart:
	chmod 600 acme.json
	docker compose down -v --remove-orphans
	docker compose up -d --build
	docker logs ${APP_NAME} -f

# Build
build:
	docker compose build

# Başlat
up:
	chmod 600 acme.json
	docker compose up -d

# Kapat
down:
	docker compose down -v --remove-orphans

# Temizle
clean:
	docker system prune -a

# Log
log:
	docker logs ${APP_NAME} -f

# Container Durumu
ps:
	docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" -a

# Düzeltme
fix:
	chmod 600 acme.json
	docker network create --driver bridge proxy
