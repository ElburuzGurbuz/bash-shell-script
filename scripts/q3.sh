#The first command-line input is assigned to filename
filename="$1"

#Check whether the number of arguments is equal to 1
if [ $# == 1 ]; then

	#Checks whether the argument entered exists or not
	if ! [ -d "$1" ]; then
		echo "$1 doesn't exist. Enter another folder name that exists."
		exit 0
	fi
fi

#Check if there is more than one argument
if [ $# -gt 1 ]; then
	echo "Too many arguments entered."
	echo "Syntax should be: ./q3.sh pathName ."
	exit 1
fi

#It is checked whether the argument exists or not,
#if there is an argument then we assigned pwd to path to get the current directory.
if [ -z "$1" ]; then
	path=$(pwd)

#If there is an argument, we need to add this filename to the directory we are in.
elif ! [ -z "$1" ]; then
	newPath="$(pwd)/$filename"
	path=$newPath
fi

mkdir -p oldest

#Command that finds and prints the oldest file in the directory
oldestFile=$(find $path -maxdepth 1 -type f -printf '%T+%p\n' | sort | head -n 1)
oldestFileName="${oldestFile##*/}"
echo "Do you want to delete $oldestFileName (y/n) : "

#Gets input from the user
read yesOrNo

#If yes, permanently deletes the file in the directory
if [[ "$yesOrNo" == "y" ]]; then
	echo "$oldestFileName is deleted."
	rm $path/$oldestFileName

#If the answer is no, only an information message is written
elif [[ "$yesOrNo" == "n" ]]; then
	echo "$oldestFileName is not deleted."
fi
