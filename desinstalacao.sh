#!/bin/bash

desinstall(){

dialog									\
	--title 'DESINSTALAÇÃO'						\
	--yesno 'Tem certeza que deseja desinstalar este programa?'	\
	0 0

		if [[ $? == 0 ]]
			then
				clear
				cd /usr/share/
				rm -rf Invent-rio/

				cd
				rm -f Invent-rio/

			dialog										\
				--title 'SUCESSO'							\
				--msgbox 'O programa foi desinstalado com êxito do seu computador!'	\
				0 0
			fi

clear
exit 0
}

desinstall
