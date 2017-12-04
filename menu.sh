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
	0 0 0					\
	"1" 'Listar'				\
	"2" 'Cadastrar' 			\
	"3" 'Editar'				\
	"4" 'Deletar'				\
	"5" 'Alterar localidade atual'		\
	"6" 'Sair'				\
	"7" 'Mais opções')

if [[ $? == "1" ]]
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
	1) source log.sh $OP1 ; source op1.sh $1 ;; #Cadastrar
	2) source log.sh $OP2 ; source op2.sh $1 ;; #Fazer cadastrar patrimonio
	3) source log.sh $OP3 ; source editar.sh $1 ;; #Editar
	4) source log.sh $OP4 ; source op4.sh $1 ;;
	5) source log.sh $OP5 ; source alterar_loc.sh $1 ;;
	6) source log.sh $OP6 ; source deslogar.sh $1 ;;
	7) source log.sh $OP7 ; source mais_opcoes.sh $1 ;;
	*) invalido ; menu ;;
esac

menu

}

menu $1
