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
	--title 'MENU'				\
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
 
                        source login.sh $1
fi


case $OPCAO in
	1) source log.sh $OPCAO ; source op1.sh $1 ;; #Cadastrar
	2) source log.sh $OPCAO ; source op2.sh $1 ;; #Fazer cadastrar patrimonio
	3) source log.sh $OPCAO ; source editar.sh $1 ;; #Editar
	4) source log.sh $OPCAO ; source op4.sh $1 ;;
	5) source log.sh $OPCAO ; source alterar_loc.sh $1 ;;
	6) source log.sh $OPCAO ; source deslogar.sh $1 ;;
	7) source log.sh $OPCAO ; source mais_opcoes.sh $1 ;;
	*) invalido ; menu ;;
esac

menu

}

menu $1
