#!/bin/bash
clear

dir="/usr/share/Invent-rio"

validacao(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir/registros/

if [[ -r $1 ]]
	then
		echo
	else
		dialog						\
			 --title 'Localidade'
			 --msgbox 'Localidade inválida!'	\
			0 0

		listar
	fi
}

verificacao_opcao(){

clear

direc="$1"

cd $dir

OPCAO=$(dialog --stdout						\
	--title 'LISTAR'					\
	--menu 'Escolha uma opção: '				\
	0 0 0							\
	"1" 'Listar tudo'					\
	"2" 'Listar com base na categoria'			\
	"3" 'Voltar'						)

if [[ $? == "1" ]]
                 then
			cd $dir

                        source op1.sh $1
fi



if [[ $OPCAO == 1 ]]
	then

	#cd /home/vinicius/Projeto/Invent-rio/registros/$direc/
	cd $dir/registros/$direc/

	arquivo="$direc.csv"
	
	
	le=$(cat $arquivo)
	INF=$(wc -l $arquivo | cut -d" " -f1)
	INFx=$(echo "$INF itens cadastrados")

	#tail -f $arquivo > out &
	dialog				\
		--title "$1 | $INFx"	\
		--textbox $arquivo	\
		0 0

	#less $arquivo
	clear

	verificacao_opcao $direc $1

elif [[ $OPCAO == 2 ]]
	then
		#cd /home/vinicius/Projeto/Invent-rio/registros/$direc/
		cd $dir/registros/$direc

		chmod 777 *
		arquivo="$direc.csv"
		

		aw=$(awk 'BEGIN{FS=";"}{print $2}' $arquivo | sort -u)
		#awk 'BEGIN{FS=";"}{print $2}' SENAI.csv | sort -u | nl

		touch catg.csv
		chmod 777 catg.csv
	
		echo > catg.csv
		
		echo >> catg.csv	
		echo "$aw" >> catg.csv

		#le=$(cat catg.csv)

loc=$(for x in $(cat catg.csv) ; do
         echo $x ' -'
         done)
OPCAO=$(dialog --stdout --title "CATEGORIAS" --menu "Escolha uma categoria:" 0 0 0 $loc)

 
 if [[ $? == "1" ]]
                  then
                        #cd /home/vinicius/Projeto/Invent-rio/
			cd $dir
 
                        verificacao_opcao $direc $1
fi

#categ=$(echo $categg | tr 'A-Z' 'a-z')

                arquivo="$direc.csv"
                arquivo2="categ.csv"
                #grep $categ $arquivo

                #echo > cat.csv
 
                 echo > $arquivo2
                 grep "$OPCAO" $arquivo >> $arquivo2
 
                #echo $gr > cat.csv
 
                 #echo "Para sair do arquivo a seguir, pressione a tecla q"
                #read -p "Agora, pressione [enter]" ENTER
 
              le=$(cat $arquivo2)
 
               #tail -f $arquivo2 > out &
                dialog                         \
                       --title "$OPCAO"        \
                       --textbox $arquivo2     \
                 0 0



		clear

		verificacao_opcao $direc $1


elif [[ $OPCAO == 3 ]]
	then
			source op1.sh $1


else
	clear

		dialog 					\
			--title 'Inválido!'		\
			--msgbox 'Opção inválida!'	\
			0 0

	
	clear
	verificacao_opcao $direc $1
fi

}


listar(){


CATEGORIA=$1

if [[ $CATEGORIA == 0 ]]
	then
		#dir="/home/vinicius/Projeto/Invent-rio/"
		cd $dir
		source op1.sh
	fi

cd $dir/registros/

validacao $CATEGORIA

cd $dir/registros/$CATEGORIA/

arquivo="$CATEGORIA.csv"

cd $dir

verificacao_opcao $CATEGORIA

#less $arquivo

#less $CATEGORIA.csv

#dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir/registros/

clear
listar $1
}

listar $1
