#!/bin/bash

echo "please enter the number of days ago"

read $1

git log --since="$1" --pretty=format:"%h" > /home/vishwas/Documents/commiterID.txt
git log --since="$1" --pretty=format:"%cn" > /home/vishwas/Documents/commitername.txt
git log --since="$1" --pretty=format:"%ce" > /home/vishwas/Documents/commiteremail.txt
git log --since="$1" --pretty=format:"%cd" > /home/vishwas/Documents/commiterdate.txt

echo "<html>
<TABLE>

      <TH COLSPAN=2>
         <H3><BR>Log Utility</H3>
      </TH>
<tr>
    <th>Commiter ID</th>
    <th>Commiter Name</th>
    <th>Commiter Email</th>
    <th>Commit date</th>
</tr>" > /home/vishwas/index.html

file_one=/home/vishwas/Documents/commiterID.txt
file_two=/home/vishwas/Documents/commitername.txt
file_three=/home/vishwas/Documents/commiteremail.txt
file_four=/home/vishwas/Documents/commiterdate.txt

exec 5<$file_one
exec 6<$file_two
exec 7<$file_three
exec 8<$file_four

while  read -r line1 <&5
       read -r line2 <&6
       read -r line3 <&7
       read -r line4 <&8
do
echo "<tr>
<td>$line1<td>
<td>$line2<td>
<td>$line3</td>
<td>$line4</td>
</tr>" >> /home/vishwas/index.html
done
echo "</TABLE>
</html>" >> /home/vishwas/index.html
