#!/bin/bash

BLUE='0;35'
NC='\033[0m'
VERSAO=11

echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Olá, seja bem-vindo à Pycem. Serei seu guia para instalar nossa aplicação." 
echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Verificando se você possui o Java instalado."
sleep 2

java -version
if [ $? -eq 0 ]; then
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Você já possui o Java instalado."
else
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Não encontramos nenhuma versão do Java instalada, mas podemos instalar agora!"
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Confirme se deseja instalar o Java (s/n)."
    read -r inst
    if [ "$inst" == "s" ]; then
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Ok, instalando o Java."
        sudo add-apt-repository ppa:webupd8team/java -y
        sleep 5
        sudo apt update -y
        sleep 6
        clear
        
        if [ "$VERSAO" -eq 11 ]; then
            echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Estamos instalando a versão 17 do Java."
            sudo apt install openjdk-17-jdk openjdk-17-jre -y
            sleep 10
            clear
            echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Java instalado com sucesso."
            echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Atualizando os pacotes..."
            sudo apt update && sudo apt upgrade -y
            sleep 5
        fi
    else
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Obrigado pela informação. Você optou por não instalar o Java. Até a próxima." 
        exit 0
    fi
fi

# SEGUNDA PARTE
echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Estarei verificando se você possui o Docker instalado."
docker --version >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Você já possui o Docker instalado."
else
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Podemos instalar o Docker na sua máquina (s/n)?"
    read -r inst
    if [ "$inst" == "s" ]; then
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Estamos instalando o Docker..."
        sleep 2
        sudo apt install docker.io -y
        sleep 3
        sudo systemctl start docker
        sleep 7
        sudo systemctl enable docker
        sleep 7
        clear
    else
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Obrigado pela informação. Você optou por não instalar o Docker. Até a próxima." 
        exit 0
    fi
fi

echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Agora vamos verificar se você já possui o banco de dados."
sudo docker images
if [ "$(sudo docker ps -aqf name=pycemBD)" ]; then
    echo -e "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Você já possui o banco de dados em seu sistema! Vamos inicializar o container."
    sleep 2
    sudo docker start pycemBD
    sleep 2
    clear
    echo -e "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Container pycemBD inicializado!"
    sudo docker ps -a
    clear
else
    echo -e "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Não encontramos nenhum banco de dados MySQL em sua máquina. Vamos resolver isso!"
    sudo docker pull mysql:5.7
    sleep 2
    sudo docker images
    sleep 2
    clear
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Agora iremos criar e configurar a aplicação do banco de dados dentro do container."
    sudo docker run -d -p 3306:3306 --name pycemBD -e "MYSQL_DATABASE=banco1" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
    sleep 10
    sudo docker start pycemBD
    sleep 3
    sudo docker ps -a
    sleep 2
    sudo docker exec -i pycemBD mysql -uroot -purubu100 -e "USE banco1; CREATE TABLE registro( idRegistro int primary key auto_increment, uso_processador varchar(45), uso_ram varchar(45), uso_hd varchar(45), data_registro datetime not null default current_timestamp);"
    sleep 10
    echo -e "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Tabelas criadas com sucesso!"
    clear
fi

# TERCEIRA PARTE
echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Vamos verificar se nossa aplicação já está instalada."
ls
sleep 2

if [ -f "$Aplicacao_Java" ]; then
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) A nossa aplicação já existe."
else
    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Não encontramos nossa aplicação. Deseja baixar nossa aplicação? (s/n)"
    read -r inst
    if [ "$inst" == "s" ]; then
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Baixando nossa aplicação..."
        git clone https://github.com/Pycem-sptech/Aplicacao_Java.git
        clear
    else
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Você escolheu não baixar nossa aplicação. Até a próxima!"	
        exit 0
    fi
fi

echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Iniciando o Pycem²..."

# sleep 3
cd Aplicacao_Java
sleep 2
# sudo chmod +x pycemJar-1.0-SNAPSHOT-jar-with-dependencies.jar
# sleep 2
java -jar pycemJar-1.0-SNAPSHOT-jar-with-dependencies.jar