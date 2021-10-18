#!/bin/bash

directory='./compressed_files/'

#build directories
mkdir ${directory}zip
mkdir ${directory}rar
mkdir ${directory}tar.gz
mkdir ${directory}unknown


#get list for students with files
echo "Getting list of students with homeworks....."
ls -l ${directory}P????????.*  | cut -d '.' -f 2 | cut -c 19-27 > homework_list

#using grep -v for missing list
echo "Dumping missing_list"
grep -v -f homework_list student_id > missing_list1

#move correct files
echo "Decompressing files to corresponding directories..."
#mv ${directory}*.zip ${directory}zip 
#mv ${directory}*.rar ${directory}rar
#mv ${directory}*.tar.gz ${directory}tar.gz
unzip ${directory}\*.zip -d ${directory}zip && rm ${directory}*.zip
unrar e ${directory}\*.rar ${directory}rar  && rm ${directory}*.rar

#Tar is a special issue
for file in ${directory}*.tar.gz
  do tar -zxf ${file} -C ${directory}tar.gz
done
rm ${directory}*.tar.gz



#get wronglist from 'unknown' fold
echo "Build wrong_list and moving files...."
ls -l ${directory}P????????.*  | cut -d '.' -f 2 | cut -c 19-27 > wrong_list
mv ${directory}P????????.* ${directory}unknown

echo "Done!!"





