#!/bin/bash

set -e

[ -z "$1" ] && theme_name='' || theme_name=$1

if [ -z $theme_name ]
then
    printf "\n\e[34m ############## WORDPRESS ########################### \e[39m\n\n"
    echo " - Configurações de ambiente"
    printf "\n\e[34m #################################################### \e[39m\n\n"
    read -p "- Nome do projeto: " theme_name;
fi

printf "\n\e[34m ############## WORDPRESS ########################### \e[39m\n\n"
echo ' - Baixando última versão do Wordpress...'
printf "\n\e[34m #################################################### \e[39m\n\n"
curl -SO https://wordpress.org/latest.zip && 

printf "\n\e[34m ############## WORDPRESS ########################### \e[39m\n\n"
echo ' - Descompactando...'
printf "\n\e[34m #################################################### \e[39m\n\n"
unzip latest.zip &&

printf "\n\e[34m ############## WORDPRESS ########################### \e[39m\n\n"
echo ' - Criando projeto...'
printf "\n\e[34m #################################################### \e[39m\n\n"
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
echo "	define('DB_NAME', 'app_development')"
echo ''
echo "	define('DB_USER', root)"
echo ''
echo "	define('DB_PASSWORD', 'password')"
echo ''
echo "	define('DB_HOST', '0.0.0.0:3306')"
echo ''

read -p "Pressione qualquer tecla para continuar... " -n1 -s;

mv -v wp-config-sample.php wp-config.php && 

nano wp-config.php;

printf "\n\e[32m ############## WORDPRESS ########################### \e[39m\n\n"
echo ' - Configuração inicial do projeto conluída.'
printf "\n\e[32m #################################################### \e[39m\n\n"