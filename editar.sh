#!/bin/bash
clear

dir="/usr/share/Invent-rio"

validacao(){
 
cd $dir/registros/

 if [[ -r $1 ]]
        then
                echo
        else
                 editar $1
         fi
}


verificacao_ida(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/$1/"
cd $dir/registros/$1/

arquivo="$1.csv"

grep "$2" $arquivo
#sleep 3

	if [[ $? == 1 ]]
		then
			clear
			#echo "ID ($2) inválido!"
			#read -p "Pressione [enter] para continuar." ENTER

			dialog						\
				--title 'Erro'				\
				--msgbox "ID ($ID) inválido."		\
				0 0

			verificacao_opcao $1
	fi

		
#passou


NOME=$(dialog	--stdout					\
	--title	'DESCRIÇÃO'					\
	--inputbox 'Entre com a nova descrição do item: ' 	\
	0 0)

if [[ $? == "1" ]]
                then
                       #cd /home/vinicius/Projeto/Invent-rio/
			cd $dir

                        source editar.sh $1
fi


ID=$(grep "$2" $arquivo | cut -d";" -f1)

CT=$(grep "$2" $arquivo | cut -d";" -f2)

NL=$(grep "$2" $arquivo | cut -d";" -f4) #Número do Lab
NB=$(grep "$2" $arquivo | cut -d";" -f5) #Número da bancada no Lab
LB=$(grep "$2" $arquivo | cut -d";" -f6) #Lado da bancada

DC=$(grep "$2" $arquivo | cut -d";" -f5)

#echo "ID: $ID"
#echo "CT: $CT"
#echo "DC: $DC"

#sleep 3

PRODUCT="$ID;$CT;$NOME;$NL;$DC"

grep -Riv "$2" $arquivo > $1 #Joga a saída sem o ID a ser editado para $1

#echo "$1" > $arquivo

echo $PRODUCT >> $1 #Incrementa o nome certo dentro de $1

cat $1 > $arquivo

le=$(cat $arquivo)
#echo "Para sair do arquivo a seguir, pressione a tecla q"
#read -p "Agora, pressione [enter]" ENTER


le=$(less $arquivo)

dialog							\
	--title 'Sucesso!'				\
	--msgbox 'Nova descrição alterada com sucesso.'	\
	0 0


dialog				\
	--title "$2"		\
	--textbox $arquivo	\
	0 0		

clear


verificacao_opcao $1

}


verificacao_idb(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/$1/"
cd $dir/registros/$1/
 
arquivo="$1.csv"

grep "$2" $arquivo

        if [[ $? == 1 ]]
                then
			clear
			#echo "ID ($2) inválido!"
                        #read -p "Pressione [enter] para continuar." ENTER
 
			dialog							\
				--title 'Erro'					\
				--msgbox "ID ($ID) inválido."			\
				0 0

                         verificacao_opcao $1
         fi


#read -p "Entre com a nova descrição do produto: " DESCRICAO

DESCRICAO=$(dialog	--stdout						\
		--title 'APELIDO'						\
		--inputbox 'Entre com o novo apelido do item: '			\
		0 0)


if [[ $? == "1" ]]
                then
                        cd $dir

                        source editar.sh $1
fi



ID=$(grep "$2" $arquivo | cut -d";" -f1)
 
CT=$(grep "$2" $arquivo | cut -d";" -f2)

NM=$(grep "$2" $arquivo | cut -d";" -f3)

NL=$(grep "$2" $arquivo | cut -d";" -f4) #Número do Lab
NB=$(grep "$2" $arquivo | cut -d";" -f5) #Número da bancada no Lab
LB=$(grep "$2" $arquivo | cut -d";" -f6) #Lado da bancada
 

PRODUCT="$ID;$CT;$NM;$NL;$DESCRICAO"

grep -Riv "$2" $arquivo > $1 #Joga a saída sem o ID a ser editado para $1

echo $PRODUCT >> $1 #Incrementa o nome certo dentro de $1
 
cat $1 > $arquivo

#echo "Para sair do arquivo a seguir, pressione a tecla q"
#read -p "Agora, pressione [enter]" ENTER

le=$(cat $arquivo)


dialog								\
	--title 'Sucesso!'					\
	--msgbox 'Nova descrição alterada com sucesso!'		\
	0 0

dialog					\
	--title "$1"			\
	--textbox $arquivo		\
	0 0


#less $arquivo

clear


verificacao_opcao $1

}



verificacao_idc(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/$1/"
cd $dir/registros/$1/
 
arquivo="$1.csv"
 
grep "$2" $arquivo

        if [[ $? == 1 ]]
                 then
                        clear

                         dialog                                                  \
                                 --title 'Erro'                                    \
                                 --msgbox "ID ($ID) inválido."                   \
                                0 0
 
                         verificacao_opcao $1
          fi



NL=$(dialog      --stdout          	                                        \
                 --title 'AMBIENTE'                                             \
                --inputbox 'Entre com o novo nome do ambiente do item: '	\
                 0 0)
 
 
if [[ $? == "1" ]]
                then
                        cd $1

                         source editar.sh $1
fi
 
 
 
ID=$(grep "$2" $arquivo | cut -d";" -f1)
 
CT=$(grep "$2" $arquivo | cut -d";" -f2)

NM=$(grep "$2" $arquivo | cut -d";" -f3)

#NL=$(grep "$2" $arquivo | cut -d";" -f4) #Número do Lab
 
DC=$(grep "$2" $arquivo | cut -d";" -f5)

PRODUCT="$ID;$CT;$NM;$NL;$DC"

grep -Riv "$2" $arquivo > $1 #Joga a saída sem o ID a ser editado para $1

echo $PRODUCT >> $1 #Incrementa o nome certo dentro de $1

cat $1 > $arquivo
 
le=$(cat $arquivo)

dialog                                                          \
        --title 'Sucesso!'                                      \
         --msgbox 'Nova descrição alterada com sucesso!'         \
        0 0

dialog                                  \
         --title "$1"                    \
         --textbox $arquivo              \
        0 0


clear
 
verificacao_opcao $1

}



verificacao_opcao(){
clear

#dir="/home/vinicius/Projeto/Invent-rio/registros/$1/"
cd $dir/registros/$1/

OPCAO=$(dialog	--stdout					\
	--title 'ITEM'						\
	--menu 'Escolha uma opção: '				\
	0 0 0							\
	"1" 'Editar descrição do item'				\
	"2" 'Editar ambiente do item'				\
	"3" 'Editar apelido do item'				\
	"4" 'Transferir item para outra localidade'		\
	"5" 'Voltar'						)


if [[ $? == "1" ]]
                then
                        cd $dir

                        source menu.sh $1
fi


	if [[ $OPCAO == 1 ]]
		then
			OP=11
			source log.sh $OP

			ID=$(dialog	--stdout								\
				--title 'ID'									\
				--inputbox 'Entre com o ID do item para a alteração da descrição do item: '	\
				0 0)


				if [[ $? == "1" ]]
         			       then
                        			cd $dir

                        			source editar.sh $1
				fi


			if [[ $ID == "" ]]
                                         then
                                                 cd $dir
 
                                                 dialog                          \
                                                 --title 'Erro'                  \
                                                --msgbox 'ID inválido.'         \
                                                 0 0

                                                source editar.sh $1
                                 fi



			verificacao_ida $1 $ID
			
	elif [[ $OPCAO == 2 ]]
			then
				OP=12
				source log.sh $OP

				ID=$(dialog --stdout								\
					--title 'ID'								\
					--inputbox 'Entre com o ID para a alteração do nome do ambiente: '	\
					0 0)

				if [[ $? == "1" ]]
					then
						cd $dir
						
						source editar.sh $1
				fi


				if [[ $ID == "" ]]
                                         then
                                                cd $dir
 
                                                dialog                          \
                                                 --title 'Erro'                 \
                                                --msgbox 'ID inválido.'         \
                                                0 0
 
                                                source editar.sh $1
                                 fi



			verificacao_idc $1 $ID

	elif [[ $OPCAO == 3 ]]
		then
			OP=13
			source log.sh $OP

			ID=$(dialog --stdout								\
				--title 'ID'								\
				--inputbox 'Entre com a ID do item para a alteração do apelido: '	\
				0 0)


				if [[ $? == "1" ]]
                			then
                       				 cd $dir

                        			 source editar.sh $1
				fi


				if [[ $ID == "" ]]
					then
						cd $dir

						dialog				\
						--title 'Erro'			\
						--msgbox 'ID inválido.'		\
						0 0

						source editar.sh $1
				fi


			verificacao_idb $1 $ID


	elif [[ $OPCAO == 4 ]]
		then
			OP=14
			source log.sh $OP

			cd $dir/registros/

			ID=$(dialog --stdout									\
				--title 'ID'									\
				--inputbox "Entre com o ID do item da localidade $1 para a transferência"	\
				0 0)

				if [[ $? == "1" ]]
					then
						cd $dir
						source editar.sh $1
			fi		

			cd $dir/registros/$1/
			arquivo="$1.csv"
		
			grep "$ID" $arquivo

				if [[ $? == 1 ]]
					then
						dialog					\
							--title 'Erro'			\
							--msgbox "ID ($ID) inválido."	\
							0 0
						cd $dir
						source editar.sh $1
						#verificacao_opcao $1
			fi

			INFO=$(grep "$ID" $arquivo)
		
					cd $dir/registros/
 
				 loc=$(for x in $(cat listagem) ; do
          			echo $x ' -' #$x ' -'
        			 done)
				 LOCALIDADE=$(dialog --stdout --title "Transferência" --menu "Escolha uma localidade:" 0 0 0 $loc)
 
					if [[ $? == "1" ]]
                  					then
                         				cd $dir

                        				source editar.sh $1
 						fi
			cd $dir/registros/$1/
			grep -Riv "$ID" $arquivo > $1 

                        cat $1 > $arquivo
 

				cd $dir/registros/$LOCALIDADE/

				echo $INFO >> $LOCALIDADE.csv

				dialog								\
					--title 'Sucesso!'					\
					--msgbox 'Transferência de item concluida com sucesso!'	\
					0 0

				dialog					\
					--title "$LOCALIDADE"		\
					--textbox $LOCALIDADE.csv	\
					0 0

				cd $dir

				source editar.sh $1



	elif [[ $OPCAO == 5 ]]
		then
			cd $dir
			source menu.sh $1

	else
		clear
		#read -p "Opção inválida! Pressione [enter] para tentar novamente." ENTER

		dialog 					\
			--title 'Erro'		\
			--msgbox 'Opção inválida!'	\
			0 0

		verificacao_opcao $1

	fi
}


editar(){
LOCALIDADE=$1


if [[ $? == "1" ]]
                then
                        cd $dir

                        source menu.sh $1
fi




if [[ $LOCALIDADE == 0 ]]
        then
                #dir="/home/vinicius/Projeto/Invent-rio/"
                cd $dir
                source menu.sh $1
         fi
 
cd $dir/registros/
 
validacao $LOCALIDADE

cd $dir/registros/$LOCALIDADE/
 
arquivo="$LOCALIDADE.csv"
 
cd $dir

verificacao_opcao $LOCALIDADE

#dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir/registros/
clear
}

editar $1
