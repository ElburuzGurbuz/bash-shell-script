#This variable holds the first argument.
firstArg="$1"
#This variable holds the second argument.
secArg="$2"
#This variable will location of filename in arguments
location=0

#If more than 2 arguments are entered,
#an error message is displayed and the program is stopped.
if [ $# -gt 2 ]; then
  echo "Too many arguments entered."
  echo "Syntax should be: ./q5.sh -R filename."
  exit 1
fi

#The argument is checking whether it has been entered.
#If no arguments are entered, an error message is shown and execution is stopped.
if [ -z "$1" ]; then
  echo "Please enter an argument as a parameter."
  exit 2

#If 1 argument is entered and it is different from "-R",
#this argument is assigned as filename. The file location is defined as 1.
elif (! [ "$firstArg" == "-R" ] && [ -z "$2" ]); then
  filename=$firstArg
  location="1"

#If two arguments are entered and the first is not "-R",
#the program is stopped with an error message.
elif ([ "$firstArg" != "-R" ] && ! [ -z "$2" ]); then
  echo "Please enter a valid argument for first one."
  exit 3

#If the file name is not entered,
#an error message is displayed and the program stops.
elif [ -z "$2" ]; then
  echo "Please enter a second argument as a file name."
  exit 4
#The syntax of the part outside of the controlled
#situations is correct, such as "-R file.txt".
#In this condition, filename is defined as the given argument.
#filename location is changed to 2.
#because it contains "-R" in the argument.
else
  filename=$secArg
  location="2"
fi

#this operation removes quotes of arg
filename="${filename:1:${#filename}-2}"

#When the filename position is 1, the code is executed without recursive.
if [ $location == "1" ]; then
  # removing quotes of argument
  checkIf=($1)
  checkIf="${checkIf:1:${#checkIf}-2}"

  #Checks whether the argument entered exists or not
  if ! [ -f $checkIf ]; then

    echo "$filename doesn't exist. Enter another folder name that exists."
    exit 5
  fi

  #makes a dir named copied
  mkdir -p copied
  #Copies all files that match the wildcard to the copied folder.
  cp -R $filename $(pwd)/copied

#When the filename position is 1, the code is executed recursive.
elif [ $location == "2" ]; then

  #All sub-directories in pwd are found and the $ dir
  #variable is defined in the loop and processed.
  #Since it is run with the recursive command,
  #subfolders are also checked in this process.
  find $(pwd) -type d -print0 |
    while IFS= read -rd '' dir; do

      #File names are examined one by one in the loop.
      for file in $filename; do

        #Checks if a match is found with the wildcard.
        if ! [ $file == "$2" ]; then
          #The wildcard is hold as a string.
          files=($2)

          #If the first element of the matches
          #is not wildcard representation, then copy
          #is done This process is done to avoid getting errors.
          #(Example: wildcard is "c * .txt",
          #while files variable car.txt and cat.txt are kept.
          #C * .txt in files variable means that no match is found.
          #Since there is no equivalence, the copying step is continued.)
          if ! [ "\"$file\"" == $files ]; then
            #makes a dir named copied
            mkdir -p copied
            #Copied the matching file to the copied folder.
            cp -R $file $(pwd)/copied
          fi
        fi
        #The director is entered.

      done
      cd $dir

    done
fi
