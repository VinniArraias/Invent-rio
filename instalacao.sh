#!/bin/bash
#Criar opção para desinstalar

usuario(){
dir="/usr/share/Invent-rio/"
cd $dir

exec 3>&1
  
VALUES=$(dialog --ok-label "Cadastrar"                                          \
        --title "CADASTRAR"                                                     \
        --form "Preencha todos os campos do novo usuário a seguir:"             \
        15 50 0                                                                \
        "Nome                    :" 1 1 "" 1 26 19 0                            \
        "Senha                   :" 2 1 "" 2 26 19 0                            \
        "Digite a senha novamente:" 3 1 "" 3 26 19 0                            \
         2>&1 1>&3)

#################################################################################
	if [[ $? == 1 ]]
                 then
                        dialog                                                  \
                        --title 'Sair'                                          \
                        --yesno 'Tem certeza que deseja sair do programa?'      \
                        0 0

                        if [[ $? == 0 ]]
                                 then
                                        clear
                                         echo "Good-bye..."
                                        exit 0
                 fi
fi
#################################################################################
exec 3>&-
 
i=1
IFSold=$IFS
 export IFS="
"
for valores in $VALUES;do
 case $i in
1)NOME="$valores";;
2)SENHA="$valores";;
3)SSENHA="$valores";;
esac
i=`expr $i + 1`
done
export IFS="$IFSold"


if echo "$NOME" | egrep ' ' >/dev/null
                 then
                        dialog                                                                  \
                                --title 'Erro'                                                  \
                                --msgbox 'Nome do usuário não pode conter espaço!'      \
                                0 0
 
                                usuario
fi

	if [[ $NOME == "" ]]
       	       then

                        dialog                                  \
                                --title 'Erro'              \
                                  --msgbox 'Nome inválido'        \
                                0 0
 
			usuario
fi
 

	if [[ $SENHA == "" ]]
                then
                         dialog                                  \
                               --title 'Erro'                  \
                                --msgbox 'Senha inválida'       \
                                0 0
			usuario

fi


         if [[ $SENHA != $SSENHA ]]
                 then
                         #echo "Senhas não conferem"
                         #read -p "Pressione [enter] para retornar" ENTER
 
                        dialog                               \
                                --title 'Erro'               \
                              --msgbox 'Senhas não conferem.' \
                                 0 0
                         usuario

fi

HASH_PASS=$(echo $SENHA | sha256sum | cut -d" " -f1)

TIPO_USER="A"

INFO="$NOME;$HASH_PASS;$TIPO_USER"

cd $dir/registros/

echo $INFO >> users.csv

echo $NOME >> users



dialog								\
	--title 'Sucesso'					\
	--msgbox "Usuário ($NOME) cadastrado com sucesso!"	\
	0 0


dialog													\
	--title 'INVENTÁRIO'										\
	--msgbox 'Para inicializar o programa, digite "Inventario" e pressione enter no seu terminal.'	\
	0 0

clear
exit 0
}


cadastra_usuario(){

dialog																	\
	--title 'INVENTÁRIO'														\
	--msgbox "A instalação foi um sucesso!\nAgora, você cadastrará um usuário administrador para que você possa administrar tudo."	\
	0 0

usuario




}


install_dialog(){

apt-get update
apt-get install dialog -y
apt-get install sendemail -y

}


install_local(){

cd ..
cp -R Invent-rio/ /usr/share
ln -s /usr/share/Invent-rio/login.sh /usr/bin/Inventario &>/dev/null

}


install_arquivo(){
dir="/usr/share/Invent-rio"
cd $dir

touch sys_log
touch logemail #log do email para o sendemail

chmod 777 *

mkdir registros
chmod 777 registros/

cd $dir/registros/

touch categ.csv
touch catg.csv
touch gerados.sh
touch listag
#echo "Padrão" > listag

touch listagem
#echo "Padrão" > listagem

touch user_atual.sh
#echo "admin" > user_atual.sh

touch users
#echo "admin" > users

touch users.csv

#touch usersr2.csv
#echo "admin" > usersr2.csv

#touch usersr.csv
#echo "admin;fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7" > usersr.csv

chmod 777 *

echo "Padrão" > listag

echo "Padrão" > listagem

#echo "admin" > user_atual.sh

#echo "admin" > users

#echo "admin" > usersr2.csv

#echo "admin;fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7;A" > users.csv

#echo "admin;fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7;A" > usersr.csv


mkdir Padrão

chmod 777 *


cd $dir/registros/Padrão/

touch baixas.csv
touch cat.csv
touch catg.csv
touch Padrão
touch Padrão.csv

chmod 777 *
cd $dir

#clear

#echo "A instalação foi concluída com sucesso!"
#echo
#echo "Para iniciar o inventário, digite Inventario e pressione enter."
#echo "Obrigado por confiar em nossa equipe!"
}


info(){

clear

echo "Bem-vindo ao setup de instalação do inventário"
echo
echo "O setup instalará e configurará o inventário por completo em seu computador."
echo "Esta instalação necessitará de uma conexão com a internet."
read -p "Deseja instalar o inventário em seu sistema [S/N]?: " OPCAO
echo

	if [[ $OPCAO == "s" || $OPCAO == "S" ]]
		then
			echo "O programa começará a instalação em: "
			sleep 2

			echo "5 segundos..."
			sleep 1
			echo "4 segundos..."
			sleep 1
			echo "3 segundos..."
			sleep 1
			echo "2 segundos..."
			sleep 1
			echo "1 segundo..."
			sleep 1
			echo
			sleep 2
			clear

	elif [[ $OPCAO == "n" || $OPCAO == "N" ]]
		then
			clear
			echo "Instalação cancelada"
			exit 0

	else
		clear
		echo "Opção inválida!"
		read -p "Pressione [enter] para continuar" ENTER
		info
fi


}

info
install_dialog
install_local
install_arquivo
cadastra_usuario
