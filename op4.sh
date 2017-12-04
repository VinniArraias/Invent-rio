#!/bin/bash

dir="/usr/share/Invent-rio"


opcao(){

clear


OPCAO=$(dialog	--stdout			\
	--title 'Deletação'			\
	--menu 'Entre com uma opção : '		\
	0 0 0					\
	"1" 'Deletar localidade'		\
	"2" 'Deletar item'			\
	"3" 'Deletar usuário'			\
	"4" 'Voltar'				)

if [[ $? == "1" ]]
                then
                        cd $dir

                        source menu.sh $1
fi



	if [[ $OPCAO == 1 ]]
		then
			OP=16
			source log.sh $OP
			source excluir_cat.sh $1

	elif [[ $OPCAO == 2 ]]
		then
			OP=17
			source log.sh $OP
			source excluir_pat.sh $1

	elif [[ $OPCAO == 3 ]]
		then
			OP=18
			source log.sh $OP

			remover(){
clear
 
cd $dir/registros/


loc=$(for x in $(cat users) ; do
          echo $x ' -'
        done)
USUARIO=$(dialog --stdout --title "Deletação de usuário" --menu "Escolha um usário a ser removido" 0 0 0 $loc)
 
if [[ $? == "1" ]]
                 then
                        cd $dir
 
                         opcao $1
 fi
 
 
        if [[ $USUARIO == "admin" ]]
                then
                         #echo "Você não pode remover o admin."
                         #read -p "Pressione [enter] para continuar" ENTER
 
                         dialog                                                  \
                                 --title 'Permissão negada'                      \
                                 --msgbox 'Você não pode remover o admin.'       \
                                0 0
 
                        #opcao $1
			remover $1
        fi
 
 
         if [[ $USUARIO == "" ]]
                 then
                        #echo "Usuário inválido!"
                         #read -p "Pressione [enter] para continuar" ENTER

                       dialog                                                    \
                                 --title 'Erro'	                                 \
 				 --msgbox 'Usuário inválido.'                    \
                                0 0

                        opcao $1

        fi

cd $dir/registros/

US=$(cat user_atual.sh)

	if [[ $USUARIO == $US ]]
		then
			dialog									\
			--title 'Erro'								\
			--msgbox 'Você não pode se remover logado no programa; deslogue-se'	\
			0 0

			#opcao $1
			remover $1
fi

grep "$USUARIO" users

         if [[ $? == 1 ]]
                 then
                         dialog                                                  \
                                --title 'Erro'                              \
                                 --msgbox "Este usuário ($USUARIO) não existe."  \
                                 0 0
 
                         cd $dir
                         opcao $1
 
         fi

grep -Riv "$USUARIO" users.csv > usersr.csv

cat usersr.csv > users.csv

 
 dialog                                                          \
        --title 'Sucesso!'                                      \
         --msgbox "Usuário ($USUARIO) removido com sucesso"      \
         0 0
 
 
grep -Riv "$USUARIO" users > usersr2.csv
 
cat usersr2.csv > users
 
cd $dir

opcao $1

}
	remover $1

	elif [[ $OPCAO == 4 ]]
		then
			source menu.sh $1

	else
		dialog							\
		--title 'Erro'					\
		--msgbox 'Opção inválida!'				\
		0 0
fi

}

opcao $1
