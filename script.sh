java -version

if [ $? == 0 ];
    then
        echo "Cliente já possui o java instalado"
        echo "Deseja fazer a instalação do aplicativo Pycem? [s/n]"
        read resp

        if [ \"$resp\" == \"s\" ];
            then
                git clone https://github.com/Pycem-sptech/pycemJar.git
                echo "Pycem instalado!"
                echo "Deseja executá-lo? [s/n]"
            read resp2

            if [ \"$resp2\" == \"s\" ];
                    then
                    cd #Diretório em que o arquivo Pycem está alocado
                    java -jar #Arquivo pycem.jar atualizado
            fi
        fi
    else
        echo "Cliente ainda não tem o java instalado nessa máquina"
        echo "Deseja instalar o java? [s/n]"
        read get

        if [ \"$get\" == \"s\" ];
            then
                sudo apt install openjdk-17-jre -y
        
            echo "O java foi instalado com sucesso!"
            echo "Deseja fazer a instalação do aplicativo Pycem? [s/n]"
            read resp3

            if [ \"$resp3\" == \"s\" ];
                then
                    git clone https://github.com/Pycem-sptech/Script-Insta-o.git
                    echo "Pycem instalado!"
                    echo "Deseja executá-lo? [s/n]"
                read resp4

                if [ \"$resp4\" == \"s\" ];
                    then
                        cd #Diretório em que o arquivo Pycem está alocado
                        java -jar #Arquivo pycem.jar atualizado
                fi
            fi
        fi

fi