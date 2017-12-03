#!/bin/bash
clear

dir="/usr/share/Invent-rio"

verificacao(){
#dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir/registros/

if [[ -r $1 ]]
	then
		echo
	else
		#echo "$CATEGORIA inválida!"
		dialog				\
			--title 'Inválida'	\
			--msgbox "$1 inválida"	\
			0 0

		del $1
	fi

}


del(){

cd $dir/registros/


loc=$(for x in $(cat listagem) ; do
          echo $x ' -'
        done)
CATEGORIA=$(dialog --stdout --menu "Escolha uma localidade a se deletada:" 0 0 0 $loc)

if [[ $? == "1" ]]
                 then
                        cd $dir
 
                        source op4.sh $1
fi


if [[ $OPCAO == 0 ]]
	then
		#dir="/home/vinicius/Projeto/Invent-rio/"
		cd $dir

		source op4.sh $1
fi

CATEGORIAA=$1

	if [[ $CATEGORIA == $CATEGORIAA ]]
		then
			dialog														  \
			--title 'Localideade'												  \
			--msgbox 'Você não pode deletar esta categoria porque está logada nela; deslogue-se desta categoria pare deletar '\
			0 0

			del $1

	fi

cd $dir/registros/

#verificacao $CATEGORIA

rm -rf $CATEGORIA

grep -Riv $CATEGORIA listagem > listag

cat listag > listagem

#echo "Localidade ($CATEGORIA) excluída com sucesso!"

#read -p "Pressione [enter] para retornar ao menu." ENTER

dialog									\
	--title 'Sucesso!'						\
	--msgbox "Localidade ($CATEGORIA) excluída com sucesso!"	\
	0 0

clear

#dir="/home/vinicius/Projeto/Invent-rio/"
cd $dir
}

del $1
