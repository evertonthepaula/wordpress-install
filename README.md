# wordpress-install

Simples automatizador de Instalação do Wordpress.

## Motivações

Aprender mais sobre Shell script e Docker.

[Veja a postagem no medium](https://medium.com/@evertothepaula/automatizando-ou-quase-a-instala%C3%A7%C3%A3o-b%C3%A1sica-do-wordpress-9fdf31c6739a)

## Para utilizar Docker usando Makefile

Tipos de comandos

- **Ambiente**: Manipulam containers docker. Podem subir ambientes através de container ou executar comandos dentro de um container.
- **Deploy**: Comandos que automatizam deploy para servidores pré estabelecidos.
- **NPM**: Comandos NPM que podem ser executados a partir do terminal do container.
- **Obsoletos**: Comandos não recomendados. Quer dizer que você não deveria mais executá-los, mas se precisar eles ainda estão disponíveis.

Opções de Comando

- **make db**: Inicia o serviço de banco de dados MYSQL.
- **make server**: Inicia o container docker em ambiente de desenvolvimento PHP.
- **make php-image**: Cria uma imagem do UBUNTU+PHP.
- **make install-wp**: Instala Wordpress.
- **make install-wp-manual**: Instala Wordpress manualmente.
- **make environment**: Configura todo o ambiente de desenvolvimento e a instalação Wordpress padrão.
- **make help**: Mostra todas as opções de configuração.
