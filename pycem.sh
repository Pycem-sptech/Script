java -version

if [ $? == 0 ];
    then
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Cliente já possui o java instalado"
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Deseja fazer a instalação do aplicativo Pycem? [s/n]"
        read resp

        if [ \"$resp\" == \"s\" ];
            then
                git clone https://github.com/Pycem-sptech/pycemExtractor.git
                clear
                echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Pycem instalado!"
                echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Deseja executá-lo? [s/n]"
            read resp2

            if [ \"$resp2\" == \"s\" ];
                then
                    cd pycemExtractor/target/
                    echo "Inicializando o PycemExtractor"
                    java -jar pycem.jar
            fi
        fi
    else
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Cliente ainda não tem o java instalado nessa máquina"
        echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Deseja instalar o java? [s/n]"
        read get

        if [ \"$get\" == \"s\" ];
            then
                sudo apt install openjdk-17-jre -y
                clear
                echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) O java foi instalado com sucesso!"
                echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Deseja fazer a instalação do aplicativo Pycem? [s/n]"
                read resp3

            if [ \"$resp3\" == \"s\" ];
                then
                    git clone https://github.com/Pycem-sptech/pycemExtractor.git
                    clear
                    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Pycem instalado!"
                    echo "$(tput setaf 10)[Bot Pycem]:$(tput setaf 7) Deseja executá-lo? [s/n]"
                read resp4

                if [ \"$resp4\" == \"s\" ];
                    then
                        cd pycemExtractor/target/
                        echo "Inicializando o PycemExtractor"
                        java -jar pycem.jar
                fi
            fi
        fi
fi
