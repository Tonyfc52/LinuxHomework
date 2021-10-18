#!/bin/bash

directory='./compressed_files/'

#Reset the list files

if [ -f missing_list1 ]
then 
    rm missing_list1
fi

if [ -f wrong_list1 ]
then 
    rm wrong_list1
fi

if [ ! -d ${directory}zip ]
then 
    mkdir ${directory}zip
fi

if [ ! -d ${directory}rar ]
then 
    mkdir ${directory}rar
fi

if [ ! -d ${directory}tar.gz ]
then
    mkdir ${directory}tar.gz
fi

if [ ! -d ${directory}unknown ]
then 
    mkdir ${directory}unknown
fi

#get list for students with files
echo "Getting list of students with homeworks....."
ls -l ${directory}P????????.*  | cut -d '.' -f 3 | cut -c 1-9 > homework_list

#using grep -v for missing list
echo "Dumping missing_list"
grep -v -f homework_list student_id > missing_list1

#move correct files
echo "Moving files to corresponding directories..."
mv ${directory}*.zip ${directory}zip
mv ${directory}*.tar.gz ${directory}tar.gz
mv ${directory}*.rar ${directory}rar
mv ${directory}P????????.* ${directory}unknown

#get wronglist from 'unknown' fold
ls -l ${directory}unknown/P????????.*  | cut -d '.' -f 3 | cut -c 1-9 > wrong_list1


