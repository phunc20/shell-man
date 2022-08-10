## QnA
1. Which way to run through the lines of a file is the best?
   ```bash
   for line in <(./telephones.txt); do
       # do sth
   done

   for line in $(cat ./telephones.txt); do
       # do sth
   done

   while read line; do
       # do sth
   done < ./telephones.txt
   ```
