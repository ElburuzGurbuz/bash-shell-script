#The first command-line input is assigned to filename
filename="$1"

#Check's if there is a input
if [ -z "$1" ]; then

	#Inform the user give a file name as parameter
	echo "Please give a filename as a parameter."

	#End of script
	exit 0
fi

#Check's if there are more than 1 input
if [ $# -gt 1 ]; then
	echo "Too many arguments entered."
	echo "Syntax should be: ./q1.sh filename.txt ."
	exit 1
fi

#Check the existence of the file
if ! [ -f "$1" ]; then
	echo "$1 doesn't exist. Enter another filename that exists."
	exit 2
fi

counter=0

#Array creation
declare -a array

#While loop to check each line of the file
while read -r line; do
	number=$line

	#Checks whether numbers have been entered in the correct range
	if ! ([[ $number =~ ^[\-0-9]+$ ]] && ((number > 0)) && ((number < 9))); then
		echo "You have \"$number\" in your file. Please give a proper number between 0-9."
		exit 3
	fi

	#Fills the array
	array[$counter]=$number

	#Increments the counter value by one
	counter=$((counter + 1))

	#End of the while loop
done <"$filename"

#Searches for the number in the array and prints an asterisk each time it encounters
for ((i = 0; i < 10; i++)); do
	printf "$i "
	for ((j = 0; j < $counter; j++)); do

		if [ $i == ${array[j]} ]; then
			printf "*"
		fi
	done
	echo ""
done
