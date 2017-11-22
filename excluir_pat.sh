#!/bin/bash
clear

return_menu(){
if [[ $1 == 0 ]]
         then
                 dir="/home/vinicius/Projeto/Invent-rio/"
                 cd $dir
                 source menu.sh
         fi
}


verificacao_cat(){
dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

if [[ -r $1 ]]
        then
                 echo
        else
                echo "$CATEGORIA inválida!"
                del #EDITAR
        fi 
}


verificacao_pat(){
dir="/home/vinicius/Projeto/Invent-rio/registros/$1/"
cd $dir

for ((i=0; i < 1; i++))
do

str=$(cat -n register | grep -n ^ | grep ^$i: | cut -d: -f2)

if [[ $str == $2 ]]
	then
		echo "Algorítmo pra deletar linha $PATRIMONIO"
	fi

done
}



del (){

read -p "Entre com o nome da localidade do patrimônio a ser removido [0 para retornar ao menu]: " CATEGORIA
return_menu $CATEGORIA
verificacao_cat $CATEGORIA

read -p "Entre com o número do patrimônio a ser removida da localidade $CATEGORIA [0 para retornar]: " PATRIMONIO
return_menu $PATRIMONIO
verificacao_pat $CATEGORIA $PATRIMONIO

echo "Patrimônio $PATRIMONIO da localidade $CATEGORIA deletado com sucesso."
read -p "Pressione [enter] para retornar ao menu." ENTER
clear


}
del
