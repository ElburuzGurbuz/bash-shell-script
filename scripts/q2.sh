#The first command-line input is assigned to str
str="$1";

#The second command-line input is assigned to num
num="$2";

#Check's if there is a first argument
if [ -z "$1" ]; then

	#Inform the user give a file name as parameter
	echo "Please give two arguments as ./q2.sh string number."
	
	#End of script
	exit 0
fi

#Check's if there is a second argument
if [ -z "$2" ]; then
	echo "Please give two arguments as ./q2.sh string number."
	exit 1
fi

#Check's if there are more than 2 argument
if [ $# -gt 2 ]; then
	echo "Too many arguments entered."
	echo "Syntax should be: ./q2.sh string number."
	exit 2
fi

#Check whether the first argument is a alphanumeric character
if [[ $str =~ [^a-zA-Z] ]]; then
	echo "First arg is not valid. Please use alphanumeric characters."
	exit 3
fi

#Check whether the second argument is a number
if ! ([[ $num =~ ^[0-9]+$ ]]); then
	echo "Second arg is not valid. Please use numeric characters."
	exit 4
fi

#The length of the expression entered in the first argument is assigned to lengthStr
lengthStr=${#str};

#The length of the expression entered in the second argument is assigned to lengthNum
lengthNum=${#num};

#It is checked whether the two values are equal to each other 
#or if the two values are not equal, check whether the length of the second value is only one.
if ! ([[ $lengthStr == $lengthNum ]] || (( $lengthNum == 1)) ); then
	echo "The length of args do not match.";
	exit 5
fi

#Array creation
declare -a strArray
declare -a numArray

#Expression is splitted character by character 
#and each character is sequentially assigned to element of the array
for (( i=0 ; i < ${#str} ; i++ )) 
{
	strArray[$i]=${str:i:1}
}

for (( i=0 ; i < ${#num} ; i++ )) 
{
	numArray[$i]=${num:i:1}
}

#The task of this for loop is to arrange letters appropriately using the elements of both arrays.
for (( i=0 ; i < ${#str} ; i++ )) 
{
	char=${strArray[$i]};
	#The integer value of the character is assigned to numAscii
	printf -v numAscii '%d' "'$char";
    	j=$i;
    	
	if (( $lengthNum==1)); then
		j=$1;
	fi
	
	#The numerical value of the letter is increased appropriately
	numAscii=$[$numAscii+$[numArray[$j]]];
    
    	#We did a special check for the letter Z because we have to go back to the beginning of the alphabet
    	if (( numAscii > 122)); then
		numAscii=$[numAscii-122+97-1];
	fi
	
	#The letter corresponding to the integer is assigned to char_value
	printf -v char_value "\\$(printf %o $numAscii)"
    
	printf "%s" "${char_value}";
}
echo
