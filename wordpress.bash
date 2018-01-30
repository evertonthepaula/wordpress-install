#!/bin/bash

read -p "- Nome do projeto: " theme_name;

read -p "- Host do banco de dados: " db_hostname;

read -p "- Usuário mysql: " db_user;

read -s -p "- Senha mysql: " db_password;

echo ' '
echo ' '
echo " - Criando base de dados $theme_name..."
echo ''

mysql -h$db_hostname -u$db_user -p$db_password -e "create database $theme_name default character set utf8 default collate utf8_general_ci";

echo ''
echo ' - Baixando última versão do Wordpress...'
echo ''

curl -SO https://wordpress.org/latest.zip && 

echo ''
echo ' - Descompactando...'
echo ''

unzip latest.zip;

echo ''
echo ' - Criando projeto...'
echo ''

rm latest.zip & mv wordpress $theme_name && cd $theme_name && 

mkdir -p wp-content/themes/$theme_name/assets/{css,img/icons,js};

> wp-content/themes/$theme_name/screenshot.png;

> wp-content/themes/$theme_name/index.php;

> wp-content/themes/$theme_name/style.css echo "
/*
Theme Name: $theme_name
Theme URI: 
Author:
Author URI:
Description:
Version: 1.0
License:
License URI: 
Tags: 
Text Domain:

/*--------------------------------------------------------------
>>> NÃO UTILIZE ESTE ARQUIVO PARA ESTILIZAR O TEMA!
----------------------------------------------------------------
";

echo ''
echo ' -----------------------------------------'
echo ' - Configuração do wp-config'
echo ' -----------------------------------------'
echo '	Agora será necessária sua atenção para configurar manualmente o arquivo wp-config.'
echo '	Para saber mais acesse:'
echo ''
echo 'Exemplo de configuração:'
echo ''
echo "	define('DB_NAME', $theme_name)"
echo ''
echo "	define('DB_USER', $db_user)"
echo ''
echo "	define('DB_PASSWORD', 'password')"
echo ''
echo "	define('DB_HOST', $db_hostname)"
echo ''

read -p "Pressione qualquer tecla para continuar... " -n1 -s;

mv -v wp-config-sample.php wp-config.php && 

nano wp-config.php;

google-chrome http://localhost:8000 & php -S localhost:8000