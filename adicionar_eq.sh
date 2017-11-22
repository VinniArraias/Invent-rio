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

verificacao_categoria(){

dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

if [[ -r $1 ]]
         then
                 echo
 
         else #Se a categoria ($1) não existir, então 
                echo "Esta localidade ($1) não existe; tente novamente."
 		add_equip1
fi
}


add_equip1(){

dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

read -p "Entre com a localidade do novo equipamento [0 para retornar ao menu]: " LOCALIDADE
echo

return_menu $LOCALIDADE

verificacao_categoria $LOCALIDADE
}


add_equip2(){

dir="/home/vinicius/Projeto/Invent-rio/registros/$LOCALIDADE/"
cd $dir

#read -p "Entre com a categoria do novo produto da localidade $LOCALIDADE"

read -p "Entre com o nome da categoria [0 para retornar ao menu]: " CATEGORIA
echo
return_menu $CATEGORIA

read -p "Entre com o nome do produto [0 para retornar ao menu]: " NOME_PRODUTO
echo
return_menu $NOME_PRODUTO


read -p "Entre com o número do laboratório [0 para retornar ao menu]: " NUMERO_LAB
echo
return_menu $NUMERO_LAB


read -p "Entre com o número da bancada [0 para retornar ao menu]: " NUMERO_BANK
echo
return_menu $NUMERO_BANK


read -p "Entre com o lado da bancada [00 para esquerdo / 01 para direito / 0 para retornar ao menu]: " LADO_BANK
return_menu $LADO_BANK

echo

if [[ $LADO_BANK != 00 ]]
	then

			if [[ $LADO_BANK != 01 ]]
				then
					echo "Lado inválido. Digite novamente: "
					add_equip2
			fi
		fi

read -p "Entre com a descrição do produto: " DESCRICAO

	arquivo="/home/vinicius/Projeto/Invent-rio/registros/$LOCALIDADE/$LOCALIDADE.csv"

NUMBER="$NUMERO_LAB$NUMERO_BANK$LADO_BANK"

INFO="$NUMBER;$CATEGORIA;$NOME_PRODUTO;$NUMERO_LAB;$NUMERO_BANK;$LADO_BANK;$DESCRICAO"
#NUMERO_LAB NUMERO_BANK LADO_BANK

echo $INFO >> $arquivo 

if [[ $? == 1 ]]
	then
		echo "Algum erro aconteceu durante o cadastro; tente novamente."
		add_equip2
	else
		echo "Cadastrado com sucesso!"

fi

dir="/home/vinicius/Projeto/Invent-rio/"

cd $dir

source menu.sh
}

add_equip1
add_equip2
