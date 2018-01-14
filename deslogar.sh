#!/bin/bash
clear

dir="/usr/share/Invent-rio"


deslogar(){

cd $dir

OPCAO=$(dialog --stdout				\
	--title 'Sair'				\
	--menu 'Você deseja...'			\
	0 0 0					\
	"1" 'Encerrar sessão'			\
	"2" 'Desligar'				\
	"3" 'Voltar')


if [[ $? == "1" || $? == "255" ]]
                then
                        cd $dir

                         source menu.sh $1

fi

	if [[ $OPCAO == 1 ]]
		then
			cd $dir
			OP=21
			source log.sh $OP


                         	dialog                                                  	\
                        	--title 'Encerrar sessão'                                   	\
                         	--yesno 'Tem certeza que deseja encerrar esta sessão?'       	\
                         	0 0

                        		 if [[ $? == 0 ]]
                                		then
                                         		source login.sh pass
                 fi

			deslogar $1

	elif [[ $OPCAO == 2 ]]
		then
			OP=22
			source log.sh $OP

		
                        		dialog                                                  \
                         		--title 'Sair'                                          \
                         		--yesno 'Tem certeza que deseja sair do programa?'      \
                         		0 0
 
                        	if [[ $? == 0 ]]
                                	 then
                                        	 clear
                                        	 echo "Good-bye..."
                                         	 exit 0
                 	fi


		deslogar $1

	else
		source menu.sh $1

fi

}

deslogar $1
