#!/bin/bash
clear

dir="/usr/share/Invent-rio"

return_menu(){
if [[ $1 == 0 ]]
         then
                 #dir="/home/vinicius/Projeto/Invent-rio/"
                 cd $dir
                 source menu.sh $1
         fi
}


verificacao_cat(){
#dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir/registros/

if [[ -r $1 ]]
        then
                 echo
        else
                #echo "$CATEGORIA inválida!"
		dialog				\
		--title 'Inválido!'		\
		--msgbox "$CATEGORIA inválida!"	\
		0 0

                del $1#EDITAR
        fi 
}

verificacao_id(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/$1/"
cd $dir/registros/$1/
 
arquivo="$1.csv"
N="$2;"
grep "$N" $arquivo

         if [[ $? == 1 ]]
                then
			clear

			dialog						\
				--title 'ID'				\
				-msgbox "ID ($ID) inválido"		\
				0 0

                        verificacao_opcao $1
        fi
 
NOME=$(grep "$N" $arquivo | cut -d";" -f3)
 
grep -Riv "$N" $arquivo > $1 #Joga a saída sem o ID a ser editado para $1
grep "$N" $arquivo >> baixas.csv

cat $1 > $arquivo

clear


dialog						\
	--title 'Sucesso!'			\
	--msgbox "$NOME deletado com sucesso!"	\
	0 0

#echo "Para sair do arquivo a seguir, pressione a tecla q"
#read -p "Agora, pressione [enter]" ENTER


le=$(cat $arquivo)

dialog				\
	--title "$arquivo"	\
	--textbox $arquivo	\
	0 0

clear

#verificacao_opcao $1
source op4.sh $1
}


del (){

#read -p "Entre com o nome da localidade do patrimônio a ser removido [0 para retornar ao menu]: " CATEGORIA

#CATEGORIA=$(dialog	--stdout												\
#	--title 'Localidade'											\
#	--inputbox 'Entre com o nome da localidade do patrimônio a ser removido [0 para retornar ao menu]: '	\
#	0 0)

CATEGORIA=$1


if [[ $? == "1" ]]
                then
                        cd $dir

                        source op4.sh $1
fi


return_menu $CATEGORIA
verificacao_cat $CATEGORIA

#read -p "Entre com o número do patrimônio a ser removida da localidade $CATEGORIA [0 para retornar]: " PATRIMONIO

PATRIMONIO=$(dialog	--stdout										\
		--title 'ID'											\
		--inputbox "Entre com o número do ID do item a ser removido da localidade $CATEGORIA"	\
		0 0)

if [[ $? == "1" ]]
                then
                        cd $dir

                        source op4.sh $1
fi



return_menu $PATRIMONIO

verificacao_id $CATEGORIA $PATRIMONIO


clear

del $1
}

del $1
