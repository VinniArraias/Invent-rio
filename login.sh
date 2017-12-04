#!/bin/bash
clear
dir="/usr/share/Invent-rio"

incorrect(){

dialog								   \
	--title 'Erro'						\
	--msgbox 'Usuário ou senha incorretos! \n Tente novamente!' \
	0 0

#echo
#echo "Usuário ou senha incorretos! Tente novamente."
#echo

login
}



correct(){

cd $dir/registros/

loc=$(for x in $(cat listagem) ; do
         echo $x ' -'
        done)
OPCAO=$(dialog --stdout --title "LOCALIDADE" --menu "Escolha uma localidade:" 0 0 0 $loc)

if [[ $? == "1" ]]
                 then
                        #cd /home/vinicius/Projeto/Invent-rio/
			cd $dir

                        login
fi

#cd /home/vinicius/Projeto/Invent-rio/
cd $dir

source menu.sh $OPCAO


}




login(){
#cd /home/vinicius/Projeto/Invent-rio/
cd $dir

exec 3>&1
VALUES=$(dialog --ok-label "Entrar"		\
	--backtitle "Linux User Managment"	\
	--title "Login"				\
	--form "Inventário"			\
	15 50 0					\
	"Usuário:" 1 1 "" 1 10 40 0 		\
	"Senha  :" 2 1 "" 2 10 40 0 		\
	2>&1 1>&3)

	if [[ $? == 1 ]]
		then
			dialog					\
			--title 'Erro'				\
			--msgbox 'Usuário ou senha inválidos.'	\
			0 0

			login
fi
	exec 3>&-

i=1
IFSold=$IFS
export IFS="
"

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
				SHAUSER=$(grep $x users.csv | cut -d";" -f2)


					if [[ $SHASENHA == $SHAUSER ]]
						then
							cd $dir/registros/
							echo $LOGIN > user_atual.sh

							cd $dir
							

							correct
	
						else

						echo

					fi

fi

done
incorrect
}

login
