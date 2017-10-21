start:
	docker-compose up -d

reset_db:
	docker-compose run users-service python manage.py recreate_db

seed:
	$(MAKE) reset_db
	docker-compose run users-service python manage.py seed_db

test:
	docker-compose run users-service python manage.py test
