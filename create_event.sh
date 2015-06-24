#!/bin/bash
#
# usage: ./$0 <new_branch_name> <email_address>
#
#

usage(){
   echo
   echo "usage: $0 <new_branch_name> <email_address>"
   echo
   exit 1
}

[[ -z $2 ]] && usage
BRANCH_NAME=$1
EMAIL_ADDRESS=$2
REPO_LOCATION=~/repos/
REPO_NAME=event-in-a-box
REPO_URL=git@github.com:mary-grace/event-in-a-box.git


cd $REPO_LOCATION/$REPO_NAME
#cd $REPO_LOCATION || (echo "repo location doesn't exit" && exit 2)
#cd $REPO_URL || git clone $REPO_URL
git fetch
git pull
git checkout master
git branch $BRANCH_NAME
touch .$BRANCH_NAME-marker
git add .$BRANCH_NAME-marker
git commit -m 'adding marker for new branch $BRANCH_NAME'
git push origin $BRANCH_NAME

echo; echo ; echo; echo
echo $EMAIL_ADDRESS
echo 'Your event in a box is ready!'
echo "Congratulations!!! please go see and edit your checklist at https://github.com/jerm/event-in-a-box/tree/$BRANCH_NAME and save this link!

Thanks

Your awesomesauce community builder

GRRRR!!!

-m"


