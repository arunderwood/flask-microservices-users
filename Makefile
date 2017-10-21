reset_db:
	docker-compose run users-service python manage.py recreate_db

test:
	docker-compose run users-service python manage.py test
