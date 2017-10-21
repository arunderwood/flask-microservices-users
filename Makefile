start:
	docker-compose up -d

reset_db:
	docker-compose run users-service python manage.py recreate_db

seed:
	$(MAKE) reset_db
	docker-compose run users-service python manage.py seed_db

test:
	docker-compose run users-service python manage.py test

aws-docker-machine:
	docker-machine -D create --driver amazonec2 --amazonec2-region us-east-2 aws

start-prod:
	docker-compose -f docker-compose-prod.yml up -d

reset_db-prod:
	docker-compose -f docker-compose-prod.yml run users-service python manage.py recreate_db

seed-prod:
	$(MAKE) reset_db
	docker-compose -f docker-compose-prod.yml run users-service python manage.py seed_db

test-prod:
	docker-compose -f docker-compose-prod.yml run users-service python manage.py test
