#!/bin/bash

dir="/usr/share/Invent-rio"

alterar(){

cd $dir/registros/

loc=$(for x in $(cat listagem) ; do
         echo $x ' -'
        done)
OPCAO=$(dialog --stdout --menu "Escolha uma localidade" 0 0 0 $loc)

if [[ $? == "1" ]]
                 then
                        cd $dir
 
                        source menu.sh $1
fi

cd $dir
source menu.sh $OPCAO


}

alterar $1
