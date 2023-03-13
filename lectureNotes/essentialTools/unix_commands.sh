#!/bin/bash

## First example for the Unix command-line:
echo "hello world"

## if using a Mac try this one (!!)
say "hello world" 

## In Unix, the concept of a current location is indispensable. We refer to this as the working directory. We use the print working directory command to find our current location:
pwd

## To see the content of your home directory use:
ls

## You can also add options ('-' and '--'),  arguments, and wild cards ('*') to change function behavior: 
ls -l
ls -a
ls -t
ls -r
ls -lart
ls -l *.txt

## To create and remove directories, use the mkdir and rmdir functions (use ls in between to see the directory come and go): 
mkdir projects
mkdir junk
rmdir projects

## Note: rmdir does not work if the directory is not empty

## To change the working directory use the cd command, which stands for change directory. For example:
cd projects

## To check that it worked, use pwd. Now try to figure out the following (use pwd to help you!): 
cd .
cd ..
cd ../..
cd /
cd ~
cd ~/projects
cd ../junk

## Pro tip 1: The up arrow retrieves your previous commands.
## Pro tip 2: You can auto-complete by hitting tab.
 
## In Unix, we move files from one directory using the mv command: mv path-to-file path-to-destination-directory
## Warning: mv will not ask "are you sure?" if your move results in overwriting a file. Some \texttt{mv} examples: 

mkdir ~/junk ~/projects/resumes
touch ~/projects/resumes/cv.tex
mv ~/projects/resumes/cv.tex ../../
mv ~/cv.tex ~/mycv.tex
mv ~/projects/mycv.tex junk/
mv ~/junk/mycv.tex ../projects/resumes/

## The command cp behaves similar to mv except instead of moving, we copy the file.
cp ~/projects/resumes/mycv.tex ~/mycv.tex

## In all the mv examples above, you can switch mv to cp and they will copy instead of move. However to copy entire directories, add the recursive (-r) option:
cp -r ~/projects/resumes ~/junk/

## In Unix, we remove files (and directories) with the rm command. 
## Warning: Unlike throwing files into the trash or recycle bin, \texttt{rm} is permanent. Be careful! Note the following: 
rm mycv.tex
rm junk/*.tex
rm -r projects junk

## Unix uses an extreme version of abbreviations, which makes it hard to guess how to call commands. 
## However, Unix includes complete help files or {\bf man pages} (man is short for manual). 
## In most systems, you can type 'man' followed by the command name to get help. For example:
man ls

## This command is not available in some of compact implementations of Unix (e.g., Git Bash). Alternatively, we can type the command followed by --help: 
ls --help


