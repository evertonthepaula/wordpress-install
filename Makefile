.PHONY: server environment php-image db install-wp help

project_name := 'wpProject'

server: php-image db
	bash ./docker/helpers/php-start.sh "" /$(project_name)/ php_image "php -S 0.0.0.0:8000"

environment: php-image db
	bash ./docker/helpers/wp-environment.sh "" /$(project_name)/ php_image "make install-wp"

php-image:
	docker build -t php_image -f ./docker/dockerfiles/environment.dockerfile .

db:
	docker-compose -f ./docker/compose/docker-wp-db.yml up -d

install-wp:
	bash ./sh/wp-install.sh $(project_name)

install-wp-manual:
	bash ./sh/wp-install.sh

help:
	@echo
	@echo Wordpress-container CLI : 1.0.0
	@echo
	@echo Tipos de comandos"\n"
	@echo - Ambiente:"    "Manipulam containers docker. Podem subir ambientes através de container ou executar comandos dentro de um container.
	@echo - Deploy:"      "Comandos que automatizam deploy para servidores pré estabelecidos.
	@echo - Monsanto:"    "Comandos que foram introduzidos exclusivamente para o projeto Monsanto.
	@echo - NPM:"         "Comandos NPM que podem ser executados a partir do terminal do container.
	@echo - Obsoletos:"   "Comandos não recomendados. Quer dizer que você não deveria mais executá-los, mas se precisar eles ainda estão disponíveis.
	@echo
	@echo
	@echo Ambiente:
	@echo " " make db"                  "Inicia o serviço de banco de dados MYSQL.
	@echo " " make server"              "Inicia o container docker em ambiente de desenvolvimento PHP.
	@echo " " make php-image"           "Cria uma imagem do UBUNTU+PHP.
	@echo " " make install-wp"          "Instala Wordpress.
	@echo " " make install-wp-manual"   "Instala Wordpress manualmente.
	@echo " " make environment"         "Configura todo o ambiente de desenvolvimento e a instalação Wordpress padrão.
	@echo
