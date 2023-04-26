java version

if [ $? == 0 ];
    then
        echo "Cliente já possui o java instalado"
        echo "Deseja fazer a instalação do arquivo .jar? [s/n]"
        read resp

        if [ \"$resp\" == \"s\" ];
            then
                git clone https://github.com/Pycem-sptech/pycemJar.git
                echo "Instalação concluida!"
                echo "Deseja executá-lo? [s/n]"
            read resp2

            if [ \"$resp2\" == \"s\" ];
                    then
                    cd pycemJar/
                    java -jar pycem.jar
            fi
        fi
    else
        echo "Cliente ainda não tem o java instalado nessa máquina"
        echo "Deseja instalar o java? [s/n]"
        read get

        if [ \"$get\" == \"s\" ];
            then
                sudo apt install openjdk-17-jre -y
        fi
fi