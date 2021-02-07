#The first command-line input is assigned to filename
filename="$1"

#Check's if there is a input
if ! [ $# == 1 ]; then
	echo "You should enter 1 filename as q4.sh filename ."
	exit 0
fi

if ! [ -f "$1" ]; then

	if [ -d "$1" ]; then
		echo "You entered directory name."
		echo "Please give a filename as a parameter."
		exit 1
	fi

	echo "$1 doesn't exist. Enter another filename that exists."
	exit 2
fi

IFS=''
#Text is read character by character. With the sed command,
#we replace the desired characters with another character set.
while read -n1 c; do
	if ([[ $c =~ ^[0-9]+$ ]]); then
		case $c in
		"0") sed -i "s/0/zero/" $filename ;;
		"1") sed -i "s/1/one/" $filename ;;
		"2") sed -i "s/2/two/" $filename ;;
		"3") sed -i "s/3/three/" $filename ;;
		"4") sed -i "s/4/four/" $filename ;;
		"5") sed -i "s/5/five/" $filename ;;
		"6") sed -i "s/6/six/" $filename ;;
		"7") sed -i "s/7/seven/" $filename ;;
		"8") sed -i "s/8/eight/" $filename ;;
		"9") sed -i "s/9/nine/" $filename ;;
		*) printf "$c" ;;
		esac
	fi

done <$filename
