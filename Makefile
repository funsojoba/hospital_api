COMPOSE = docker compose
SERVICE = api


up:
	$(COMPOSE) up

build:
	$(COMPOSE) build

up-b:
	$(COMPOSE) up -b

logs:
	$(COMPOSE) logs -f

enter:
	$(COMPOSE) exec $(SERVICE) bash

createsuperuser:
	$(COMPOSE) exec $(SERVICE) python manage.py createsuperuser

pre-commit:
	pre-commit run --all-files

populate-history:
	$(COMPOSE) exec $(SERVICE) python manage.py populate_history --auto

shell:
	$(COMPOSE) exec $(SERVICE) python manage.py shell

test:
	$(COMPOSE) exec $(SERVICE) python manage.py test

down:
	$(COMPOSE) down -v

migrate:
	$(COMPOSE) exec $(SERVICE) python manage.py migrate

dbbackup:
	$(COMPOSE) exec $(SERVICE) python manage.py dbbackup

dbrestore:
	$(COMPOSE) exec $(SERVICE) python manage.py dbrestore

migrations:
	$(COMPOSE) exec $(SERVICE) python manage.py makemigrations

showmigrations:
	$(COMPOSE) exec $(SERVICE) python manage.py showmigrations
