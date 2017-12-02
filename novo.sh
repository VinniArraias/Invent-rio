#!/bin/bash
clear

dir="/usr/share/Invent-rio"


verificacao_categoria1(){

if [[ $1 == "" ]]
	then
		dialog										\
			--title 'Localidade'							\
			--msgbox 'Impossível criar localidade vazia; tente novamente.'		\
			0 0

		#echo "Impossível criar localidade vazia; tente novamente."
		novoa $2
	fi
}


novoa(){

CATEGORIA=$(dialog --stdout											\
		--title 'Localidade'										\
		--inputbox 'Entre com o nome da sua nova localidade, sem espaço [0 para retornar ao menu]: '	\
		0 0)



		if [[ $? == "1" ]]
                	then
                        	cd $dir

                        	source op2.sh $1
fi

if [[ $CATEGORIA == "" ]]
	then
		dialog							\
			--title 'Erro'					\
			--msgbox 'Impossível criar localidade vazia'	\
			0 0
			novoa $1
fi

	if [[ $CATEGORIA == 0 ]]
		then
			cd $dir
			source menu.sh $1
fi


	if echo "$CATEGORIA" | egrep ' ' >/dev/null
		then
        		dialog									\
				--title 'Erro'							\
				--msgbox 'Nome da nova localidade não pode conter espaço!'	\
				0 0

				novoa $1
fi



verificacao_categoria1 $CATEGORIA $1


#dir="/home/vinicius/Projeto/Invent-rio/registros/"

cd $dir/registros/

mkdir $CATEGORIA

if [[ $? == 1 ]]
	then
		dialog						\
		--title 'Localidade'				\
		--msgbox "Localidade ($CATEGORIA) já existe."   \
		0 0

		novoa $1
	fi


cd $dir/registros/$CATEGORIA/

touch catg.csv
chmod 777 catg.csv

touch $CATEGORIA
touch cat.csv
touch baixas.csv

chmod 777 *

cd $dir/registros/

echo $CATEGORIA >> listagem

cd $dir


dialog 								\
	--title 'Sucesso!'					\
	--msgbox "Localidade ($CATEGORIA) criada com sucesso!"	\
	0 0


source menu.sh $1

}

novoa $1
