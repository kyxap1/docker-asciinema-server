setup:
	@cp -v .env.production.dist .env.production
	@echo SECRET_KEY_BASE=${shell docker-compose run --rm phoenix mix phx.gen.secret } | \
		tee -a .env.production >/dev/null
	@docker-compose up -d postgres
	@docker-compose run --rm phoenix setup

deploy:
	@docker-compose up -d

logs:
	@docker-compose logs -t

purge:
	@docker-compose down --rmi local --volumes --remove-orphans
	@rm -v .env.production
