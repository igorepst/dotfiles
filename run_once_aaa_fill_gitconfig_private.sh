#!/bin/sh

fname=~/.gitconfig-private
printf "Filling $fname:\n"
printf "Name?\n"
read name
printf "Email?\n"
read mail
rm $fname
touch $fname
chmod 600 $fname
echo "[User]" > $fname
echo "name = $name" >> $fname
echo "email = $mail" >> $fname
