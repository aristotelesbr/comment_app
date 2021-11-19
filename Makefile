create:
	@docker-compose run --rm app bundle exec rake db:create

prepare:
	@docker-compose run --rm app bundle exec rake db:create db:migrate

migrate:
	@docker-compose run --rm app bundle exec rake db:migrate

c:
	@docker-compose run --rm app bundle exec rake app:console

setup:
	@docker-compose run --rm app bundle exec rake db:drop db:create db:migrate app:setup

tests_prepare:
	@docker-compose run --rm app bundle exec rake db:test:prepare

test:
	@docker-compose run --rm app bundle exec rspec $(ARGS)

kill:
	@docker-compose down

run:
	@docker-compose up