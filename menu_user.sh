#!/bin/bash
clear

dir="/usr/share/Invent-rio"

opcoes(){

echo

}

invalido(){
clear

dialog								\
	--msgbox 'Pressione [enter] para voltar ao menu.'	\
	0 0


}

menu(){
cd $dir

OPCAO=$(dialog --stdout				\
	--title "MENU - $1"			\
	--menu 'Escolha uma opção:'		\
	0 0 0						\
	"1" 'Listar'				\
	"2" 'Cadastrar' 			\
	"3" 'Alterar localidade atual'		\
	"4" 'Sair'				\
	"5" 'Mais opções')

if [[ $? == "1" || $? == "255" ]]
                then
			cd $dir
			clear
			exit 0
                        #source login.sh $1
fi

OP1=1
OP2=6
OP3=10
OP4=15
OP5=19
OP6=20
OP7=23


case $OPCAO in
	1) source log.sh $OP1 ; source op1_user.sh $1 ;; #Cadastrar
	2) source log.sh $OP2 ; source op2_user.sh $1 ;; #Fazer cadastrar patrimonio
	3) source log.sh $OP5 ; source alterar_loc_user.sh $1 ;;
	4) source log.sh $OP6 ; source deslogar_user.sh $1 ;;
	5) source log.sh $OP7 ; source mais_opcoes_user.sh $1 ;;
	*) invalido ; menu ;;
esac

menu $1 #adicionei o $1

}

menu $1
