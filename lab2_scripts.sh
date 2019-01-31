#!/bin/bash
# Author : Peter Martin & Max Macaluso
# Date: 1/31/2019

#This is mostly self explanatory:
echo "Enter a regular expression: "
read regEx
echo "Enter a filename:"
read filename

#Running through a grep, as asked
echo "Running the thing for you:"
#Takes regular expression and runs through filename.
grep $regEx $filename

echo "Now counting number of phone numbers:"
#Same structure as previous.  
#Regular expression looks for digits [0-9] three times \{3\}, followed by a hyphen, etc.
#-c prints the count of regular expression
grep "[0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}" "./regex_practice.txt" -c

echo "Now counting number of emails:"
#All emails contain @, so we just use an @ for regular expression
#Same structure as previous
grep "@" "./regex_practice.txt" -c

echo "Now printing phone numbers of 303 area code into phone_results.txt."
#Similar structure to line 20, but now we start with "303-".
#Uses > to output to file.  Otherwise, similar structure.
grep "303-[0-9]\{3\}-[0-9]\{4\}" "./regex_practice.txt" > "phone_results.txt"

echo "Now printing emails from @geocities.com into email_results.txt"
#Similar structure to line 25, but we want the @geocities section included.
#> used to output to file.
grep "@geocities.com" "./regex_practice.txt" > "email_results.txt"

echo "Now printing results from custom expression into command_results.txt"
#Now looks for original regular expression in the regex_practice.txt
#but now, outputs to command_results.txt
grep regEx "./regex_practice.txt" > "command_results.txt"

echo "All done!"