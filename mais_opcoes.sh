#!/bin/bash

dir="/usr/share/Invent-rio"

enviar_email(){

cd $dir

ARQ=(cat mensagem)
echo $3 > mensagem


sendemail -l logemail -f "bufferd132@gmail.com"		\
-u "Dialog"							\
-t "bufferd132@gmail.com"					\
-m "$2\n$3"							\
-cc "$2"							\
-s "smtp.gmail.com:587"						\
-o tls=yes							\
-xu "bufferd132@gmail.com"				\
-xp "monadav132" >> logemail


	dialog								\
		--title 'Sucesso'					\
		--msgbox "Email enviado!\nAguarde o nosso contato"	\
		0 0

	mais_opcoes $1
}


validacao(){

	if [[ $OPCAO == 1 ]]
		then
			OP=24
			source log.sh $OP

			clear


			le=$(less sys_log)

			#tail -f sys_log > out &
			dialog					\
			--title 'Sistema de log'		\
			--textbox sys_log			\
			0 0

			mais_opcoes $2

	elif [[ $OPCAO == 2 ]]
		then
			OP=25
			source log.sh $OP
			clear

			#echo "Abrir documentação"
			#sleep 3

			dialog					\
				--title 'Documentação'		\
				--textbox documentacao		\
				0 0
			mais_opcoes $2


	elif [[ $OPCAO == 3 ]]
		then
			OP=26
			source log.sh $OP
exec 3>&1
VALUES=$(dialog --ok-label "Entrar"             \
        --backtitle "Linux User Managment"      \
         --title "Login"                         \
         --form "Inventário"                     \
         15 50 0                                 \
         "Email     :" 1 1 "" 1 10 64 0             \
         "Mensagem  :" 2 1 "" 2 10 1000 0             \
         2>&1 1>&3)

         if [[ $? == 1 || $? == "255" ]]
                 then
 
                        mais_opcoes $2
fi

         exec 3>&-

i=1
IFSold=$IFS
export IFS="
"
 
for valores in $VALUES;do
case $i in
1)EMAIL_USER="$valores" ;;
2)MENSAGEM="$valores" ;;

esac
i=`expr $i + 1`
done
export IFS="$IFSold"

	if [[ $EMAIL_USER == "" || $MENSAGEM == "" ]]
		then
			dialog							\
				--title 'Erro'					\
				--msgbox 'Nenhum campo pode ficar vazio'	\
				0 0

				mais_opcoes $2
fi

		cd $dir
 
sendemail -l logemail -f "bufferd132@gmail.com"         \
-u "Dialog"                                                     \
-t "bufferd132@gmail.com"                                       \
-m "$EMAIL_USER\n$MENSAGEM"                                                     \
-cc "$EMAIL_USER"                                                        \
-s "smtp.gmail.com:587"                                         \
-o tls=yes                                                      \
-xu "bufferd132@gmail.com"                              \
-xp "monadav132" >> logemail
 
 

         dialog                                                          \
                 --title 'Sucesso'                                       \
                 --msgbox "Email enviado!\nAguarde o nosso contato"      \
                 0 0
 
          mais_opcoes $2 #Alterei aqui para $2




	elif [[ $OPCAO == 4 ]]
		then
			clear
			source menu.sh $2

	else
		#read -p "Opção inválida! Pressione [enter] para voltar." ENTER

		dialog				\
		--title 'Inválido!'		\
		--msgbox 'Opção inválida!'	\  
		0 0

		mais_opcoes $2

		fi
}


mais_opcoes(){
cd $dir


OPCAO=$(dialog --stdout						\
	--title 'MAIS OPÇÕES'					\
	--menu 'Escolha uma opção: '				\
	0 0 0							\
	"1" 'Listar log'					\
	"2" 'Ajuda'						\
	"3" 'Entre em contato conosco'				\
	"4" 'Voltar')

if [[ $? == "1" || $? == "255" ]]
                 then
                        cd $dir
 
                        source menu.sh $1
fi

validacao $OPCAO $1
}


mais_opcoes $1
