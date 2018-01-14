#!/bin/bash
clear
dir="/usr/share/Invent-rio"


incorrect(){

dialog								   \
	--title 'Erro'						\
	--msgbox 'Usuário ou senha incorretos! \n Tente novamente!' \
	0 0


login
}



correct(){

cd $dir/registros/

loc=$(for x in $(cat listagem) ; do
         echo $x ' -'
        done)
OPCAO=$(dialog --stdout --title "LOCALIDADE" --menu "Escolha uma localidade:" 0 0 0 $loc)

if [[ $? == "1" || $? == 255 ]]
                 then
                        #cd /home/vinicius/Projeto/Invent-rio/
			cd $dir

                        login
fi

cd $dir/registros/


TIPO_USER=$(grep ^"$1;" users.csv | cut -d";" -f3)


	if [[ $TIPO_USER == "A" ]]
		then
			#Ele é admin		
			cd $dir
			source menu.sh $OPCAO

	elif [[ $TIPO_USER == "B" ]]
		then
			#Ele é usuário comum
			cd $dir
			source menu_user.sh $OPCAO
else
		echo "Erro de parâmetros"	
fi

}


login(){
#cd /home/vinicius/Projeto/Invent-rio/
cd $dir

exec 3>&1
VALUES=$(dialog --ok-label "Entrar"		\
	--backtitle "Linux Inventário"		\
	--title "Login"				\
	--form "Inventário"			\
	15 50 0					\
	"Usuário:" 1 1 "" 1 10 40 0 		\
	"Senha  :" 2 1 "" 2 10 40 0 		\
	2>&1 1>&3)

	if [[ $? == 1 || $? == 255 ]]
		then
			dialog							\
			--title 'Sair'						\
			--yesno 'Tem certeza que deseja sair do programa?'	\
			0 0
			
			if [[ $? == 0 || $? == 255 ]]
				then
					clear
					echo "Good-bye..."
					exit 0
		fi		

login
fi
	exec 3>&-

i=1
IFSold=$IFS
export IFS="
"
LOGIN=""
SENHA=""

for valores in $VALUES;do
case $i in
1)LOGIN="$valores";;
2)SENHA="$valores";;

esac
i=`expr $i + 1`
done
export IFS="$IFSold"


if [[ $LOGIN == "" ]]
	then

		if [[ $SENHA == "" ]]
			then

				dialog							\
					--title 'Login'					\
					--msgbox 'Usuário ou senha inválidos'		\
					0 0
				login
		fi
login
fi

SHASENHA=$(echo $SENHA | sha256sum | cut -d" " -f1)

#cd /home/vinicius/Projeto/Invent-rio/registros/
cd $dir/registros/


for x in $(cat users)
	do
		if [[ $x == $LOGIN ]]
			then
				SHAUSER=$(grep ^"$x;" users.csv | cut -d";" -f2) #coloquei -x


					if [[ $SHASENHA == $SHAUSER ]]
						then
							cd $dir/registros/
							echo $LOGIN > user_atual.sh

							cd $dir
							

							correct $LOGIN
	
						else

						echo

					fi

fi

done
incorrect
}

MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]


OPÇÕES:
  -h, --help		Exibe informações sobre o programa
  -V, --version		Exibe a versão do programa
"


case "$1" in
	-h | --help) echo "$MENSAGEM_USO"
		     exit 0

		;;

	-V | --version)	echo "Inventário Versão 2.1"
		     exit 0

		;;

	pass) login

		;;
	*)
	   if test -n "$1"
		then
			echo "Opção inválida: $1"
			exit 1
	fi

;;

esac

login
