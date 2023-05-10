java -version

if [ $? == 0 ];
    then
        echo "Cliente já possui o java instalado"
        echo "Deseja fazer a instalação do aplicativo Pycem? [s/n]"
        read resp

        if [ \"$resp\" == \"s\" ];
            then
                git clone https://github.com/Pycem-sptech/pycemExtractor.git
                clear
                echo "Pycem instalado!"
                echo "Deseja executá-lo? [s/n]"
            read resp2

            if [ \"$resp2\" == \"s\" ];
                then
                    cd pycemExtractor/target/
                    echo "Inicializando o PycemExtractor"
                    java -jar pycemExtractor.jar
            fi
        fi
    else
        echo "Cliente ainda não tem o java instalado nessa máquina"
        echo "Deseja instalar o java? [s/n]"
        read get

        if [ \"$get\" == \"s\" ];
            then
                sudo apt install openjdk-17-jre -y
                clear
                echo "O java foi instalado com sucesso!"
                echo "Deseja fazer a instalação do aplicativo Pycem? [s/n]"
                read resp3

            if [ \"$resp3\" == \"s\" ];
                then
                    git clone https://github.com/Pycem-sptech/pycemExtractor.git
                    clear
                    echo "Pycem instalado!"
                    echo "Deseja executá-lo? [s/n]"
                read resp4

                if [ \"$resp4\" == \"s\" ];
                    then
                        cd pycemExtractor/target/
                        echo "Inicializando o PycemExtractor"
                        java -jar pycemExtractor.jar
                fi
            fi
        fi
fi