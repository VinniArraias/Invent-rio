#!/bin/bash
clear

opcoes(){
echo
<<<<<<< HEAD
echo "  . . . . . . . . . . . . . . . . . . . . . . . . . .  ."
echo "  .                                                    ." 
echo "  .                      MENU                          ."
echo "  . . . . . . . . . . . . . . . . . . . . . . . . . .  ."
echo "  .  Digite [1] para Listar registros de uma localidade."
echo "  .  Digite [2] para Cadastrar um novo patrimônio      ."
echo "  .X Digite [3] para Editar um patrimônio existente    ."
echo "  .  Digite [4] para Deletar uma localidade existente  ."
echo "  .X Digite [5] para Deletar um patrimônio existente  ."
echo "  .  Digite [6] para Cadastrar uma nova localidade     ."
echo "  .X Digite [7] para Abrir o sistema de Log            ."
echo "  .X Digite [8] para Ajuda                             ."
echo "  .  Digite [9] para Deslogar                          ."
echo "  . . . . . . . . . . . . . . . . . . . . . . . . . .  ." 
=======
echo "  . . . . . . . . . . . . . . . . . . . . . . . . . . ."
echo "  .                                                   ." 
echo "  .                      MENU                         ."
echo "  . . . . . . . . . . . . . . . . . . . . . . . . . . ."
echo "  .  Digite [1] para Listar registros                 ."
echo "  .  Digite [2] para Cadastrar um novo patrimônio     ."
echo "  .  Digite [3] para Editar um patrimônio existente   ."
echo "  .  Digite [4] para Excluir uma categoria existente  ."
echo "  .  Digite [5] para Excluir um patrimônio existente  ."
echo "  .  Digite [6] para Cadastrar uma nova categoria     ."
echo "  .  Digite [7] para Ajuda                            ."
echo "  .  Digite [8] para Deslogar                         ."
echo "  . . . . . . . . . . . . . . . . . . . . . . . . . . ." 
>>>>>>> e25350f95e307c9471ab2e8f886119dd2af4eac6
echo

}

invalido(){
<<<<<<< HEAD
clear
=======
>>>>>>> e25350f95e307c9471ab2e8f886119dd2af4eac6

echo "Opção inválida! Tente novamente."
read -p "Pressione [enter] para retornar ao menu." ENTER
clear

}

menu(){
opcoes

read -p "Digite sua opção: " OPCAO
case $OPCAO in
	1) source listar.sh ;;
	2) source adicionar_eq.sh ;; #Fazer cadastrar patrimonio
	3) source editar.sh ;;
	4) source excluir_cat.sh ;;
	5) source excluir_pat.sh ;;
	6) source novo.sh ;;
<<<<<<< HEAD
	7) source logg.sh ;;
       #8) source manual.sh ;;
	9) source deslogar.sh ;;
	*) invalido ; menu ;;
esac

menu $OPCAO
=======
	8) source deslogar.sh ;;
	*) invalido ; menu ;;
esac

menu
>>>>>>> e25350f95e307c9471ab2e8f886119dd2af4eac6

}

menu
