SHELL:=/bin/zsh

COMMAND=""


datas:
	kubectl $(COMMAND) -f infra/datas/pg.yaml
	kubectl $(COMMAND) -f infra/datas/mariadb.yaml
	kubectl $(COMMAND) -f infra/datas/redis.yaml

ui:
	kubectl $(COMMAND) -f infra/ui/adminer.yaml
	kubectl $(COMMAND) -f infra/ui/pgadmin4.yaml
	kubectl $(COMMAND) -f infra/ui/rediscommander.yaml

tools:
	# kubectl $(COMMAND) -f infra/tools/jupyter.yaml
	kubectl $(COMMAND) -f infra/tools/mermaid.yaml
	kubectl $(COMMAND) -f infra/tools/plantuml.yaml


apply:
	make datas COMMAND="apply"
	make ui COMMAND="apply"
	make tools COMMAND="apply"

delete:
	make datas COMMAND="delete"
	make ui COMMAND="delete"
	make tools COMMAND="delete"
