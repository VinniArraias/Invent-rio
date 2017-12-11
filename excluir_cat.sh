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

if [[ $? == "1" || $? == "255" ]]
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
		--title 'Erro'														  \
		--msgbox 'Você não pode deletar esta categoria porque está logada nela; deslogue-se desta categoria para deletá-la '	  \
			0 0

			del $1

	fi


	dialog								\
		--title 'Confirmação'					\
		--yesno 'Deseja realmente deletar esta localidade?'	\
		0 0

	
		if [[ $? == 1 ]]
			then
				del $1

	fi



cd $dir/registros/


rm -rf $CATEGORIA

grep -Riv $CATEGORIA listagem > listag

cat listag > listagem


dialog									\
	--title 'Sucesso!'						\
	--msgbox "Localidade ($CATEGORIA) excluída com sucesso!"	\
	0 0

clear

#dir="/home/vinicius/Projeto/Invent-rio/"
cd $dir

del $1
}

del $1
