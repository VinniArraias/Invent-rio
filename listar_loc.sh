#!/bin/bash

dir="/usr/share/Invent-rio"

listar(){
clear

cd $dir/registros/


dialog					\
	--title 'Listagem'		\
	--textbox listagem		\
	0 0


clear

cd $dir

source op1.sh $1

}

listar $1 
