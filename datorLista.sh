#!/bin/bash

# Funktion som används för att låta användaren bekräfta borttagning av dator eller hela listan med ett "y" eller "yes"
confirm() {

	echo -e "\033[0;31mKommer $1. Säker? (y/n)\033[0m"
	read yn

	if [[ $yn == "y" || $yn == "yes"  ]]; then

		true

	else

		false	

	fi

}

# Funktion för att kolla om en dator finns i listan (SN)
computerExists() {

row=`grep -w "SN: $1" datorLista.txt`

	if [[ $row != "" ]]; then
		true
	else
		false
	fi

}

# Funktion för att lista datorer
list() {

	# Kolla om filen existerar eller ej
	if [ ! -e datorLista.txt ]; then

		echo -e  "\033[0;31mDu har inga datorer sparade ännu\033[0m"

	# Filen finns
	else
		echo "*********************************"
		cat datorLista.txt
		echo "*********************************"
	fi


}

# Funktion för att lägga till dator
add() {


	echo -n "SN: "
	read sn

	# Kolla så användaren skrev in ett serienummer
	if [[ $sn == "" ]]; then

		echo -e "\033[0;31mSN krävs!\033[0m"

	else
		# Kolla om datorn (SN) redan finns, om inte fortsätt fråga...
		if computerExists $sn; then

			echo -e "\033[0;31mEn dator med SN $sn finns redan!\033[0m"
		else

			echo -n "Märke: "
			read brand

			echo -n "Modell: "
			read model

			echo -n "RAM (GB): "
			read ram

			echo -n "Lagring: "
			read storage

			echo -n "OS: "
			read os
			

			echo -e "\033[0;32mDator tillagd!\033[0m"
			echo "Märke: $brand, Modell: $model, RAM: $ram, Lagring: $storage, OS: $os, SN: $sn" >> datorLista.txt
		fi

	fi


}

# Funktion som tar bort dubletter (datorer med samma serienummer)
removeDuplicates() {

	sort datorLista.txt | uniq | cat > .nyDatorLista.txt
	cat .nyDatorLista.txt > datorLista.txt
	rm .nyDatorLista.txt

}

# Funktion för att importera datorer från fil
importFromFile() {

	echo -n "Fil att importera ifrån? "
	read filename

	if [[ ! -e $filename ]]; then
		
		echo -e "\033[0;31mKunde inte hitta filen!\033[0m"
	else
		cat $filename >> datorLista.txt	
		removeDuplicates
		echo -e "\033[0;32mKlart!\033[0m"
	fi

}

# Funktion för att ta bort dator
removeComputer() {

	if [ ! -e datorLista.txt ]; then

		echo -e "\033[0;31mIngen dator tillagd!\033[0m"
	else

		echo -n "SN på datorn du vill ta bort: "
		read rmSN

		
		if computerExists $rmSN; then

			echo -e "\033[0;31mTa bort:\033[0m"
			echo $row

			if confirm "ta bort dator med SN $rmSN"; then

				sed -i "/SN: $rmSN/d" ./datorLista.txt	
				echo -e "\033[0;32mBorttagen!\033[0m"
			fi
		else
	
			echo -e "\033[0;31mKunde inte hitta dator\033[0m"

		fi

	fi


}

# Funktion för att ta bort listan
removeList() {

	if [ ! -e datorLista.txt ]; then

		echo -e "\033[0;31mFil finns inte!\033[0m"
	else

		if confirm "ta bort hela listan"; then
 
			rm datorLista.txt
		fi
	fi


}

while true; do

echo "Vad vill du göra?"
echo "1) Lista datorer 2) Lägg till dator 3) Importera dator(er) från fil 4) Ta bort dator 5) Ta bort listan 6) Avsluta"

read val

case $val in

# Användaren väljer att lista datorerna i filen
"1")
	list
;;

# Användaren väljer att lägga till dator i filen
"2")
	add
;;

# Användaren väljer att importera från fil 
"3")
	importFromFile	
;;

"4")
	removeComputer
;;

"5")

	removeList
;;

"6")
	exit

;;
esac


done


