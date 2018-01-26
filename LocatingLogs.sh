#!/bin/bash
if [ "$1" == "" ]
then
	echo "			================================
			    _     ______   _ ____  _____ 
			   / \   |__  / | | |  _ \| ____|
			  / _ \    / /| | | | |_) |  _|  
			 / ___ \  / /_| |_| |  _ <| |___ 
			/_/   \_\/____|\___/|_| \_\_____|
			                                 
			================================
"
	echo "Parametros :
	Filtrado por ip, organizado, acessos e sem repetição. (ex : $0 -ioar )
	
	Filtrado por ip, organizado e acessos em um ip só. (ex : $0 -ioq )
	
	Filtrando um determinado ip. (ex : $0 -i )
	
	Filtrando ip, procurando por determinada ferramenta ou diretório. (ex : $0 -id )
	"
	echo "ex : $0 opição"

	elif [ "$1" == "-ioar" ]
		then
		echo "Nome do Arquivo (ex : access.log)"
		read arquivo
		cat $arquivo | cut -d " " -f1 | sort | uniq -c | sort -un
		echo "Deseja gerar um arquivo ? ( S ou N )"
		read esc
			if [ "$esc" == "S" ]
				then
				echo "Nome do arquivo ?"
				read name
				cat $arquivo | cut -d " " -f1 | sort | uniq -c | sort -un > $name
			else
				echo "Saindo.."
				exit
			fi
	elif [ "$1" == "-ioq" ]
		then
		echo "Nome do Arquivo (ex : access.log)"
		read arquivo
		cat $arquivo | cut -d " " -f1 | sort | uniq -c
		echo "Deseja gerar um arquivo ? ( S ou N )"
		read esc
			if [ "$esc" == "S" ]
				then
				echo "Nome do arquivo ?"
				read name
				cat $arquivo | cut -d " " -f1 | sort | uniq -c > $name
			else
				echo "Saindo.."
				exit
			fi
	elif [ "$1" == "-i" ]
		then
		echo "Nome do Arquivo (ex : access.log)"
		read arquivo
		echo "Ip"
		read ip
		cat $arquivo | grep "$ip"
		echo "Deseja gerar um arquivo ? ( S ou N )"
		read esc
			if [ "$esc" == "S" ]
				then
				echo "Nome do arquivo ?"
				read name
				cat $arquivo | grep "$ip" > $name
			else
				echo "Saindo.."
				exit
			fi
	elif [ "$1" == "-id" ]
		then
		echo "Nome do Arquivo (ex : access.log)"
		read arquivo
		echo "IP"
		read ip
		echo "Ferramenta ou Diretório"
		read f
		cat $arquivo | grep "$ip" | grep "$f"
		echo "Deseja gerar um arquivo ? ( S ou N )"
		read esc
			if [ "$esc" == "S" ]
				then
				echo "Nome do arquivo ?"
				read name
				cat $arquivo | grep "$ip" | grep "$f" > $name
			else
				echo "Saindo.."
				exit
			fi
fi
