#!/bin/bash
while :; do
	clear
	echo "-----------------------------------"
	echo " Main Menu "
	echo "-----------------------------------"
	echo "1. Create histogram"
	echo "2. Encryption"
	echo "3. Delete oldest"
	echo "4. Convert numbers"
	echo "5. Organized files"
	echo "6. Exit"

	echo "==================================="
	echo -n "Enter your choice [1-6]: "
	read choice
	case $choice in
	1)
		printf "\n******&& CREATE HISTOGRAM &&******\n"
		echo "Enter an argument to create a histogram:"
		read choice1
		./q1.sh $choice1
		printf "\nPress a key to return menu."
		read
		;;

	2)
		printf "\n******&& ENCRYPTION &&******\n"
		echo "Enter a string and number to be converted."
		read choice2
		./q2.sh $choice2
		printf "\nPress a key to return menu."
		read
		;;
	3)
		printf "\n******&& DELETE OLDEST &&******\n"
		echo "You may enter a pathname to delete the oldest file."
		read choice3
		./q3.sh $choice3
		printf "\nPress a key to return menu."
		read
		;;

	4)
		printf "\n******&& CONVERT NUMBERS &&******\n"
		echo "Enter a file name to convert numbers:"
		read choice4
		./q4.sh "$choice4"
		printf "\nPress a key to return menu."
		read
		;;

	5)
		printf "\n******&& ORGANIZED FILES &&******\n"
		echo "You may enter -R option with and/or an optional path (or leave it as empty):"
		echo "For example: '-R pathname' or 'pathname'."
		read choice5
		./q5.sh $choice5
		printf "\nPress a key to return menu."
		read
		;;

	6)
		printf "\n******&& EXIT &&******\n"
		exit 0
		;;

	*)
		echo "Invalid choice."
		echo -n "Enter your choice [1-6]: "

		read
		;;
	esac
done
