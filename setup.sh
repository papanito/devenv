#!/bin/bash
FORCE=""
# Function: Print a help message.
usage() {
  echo "Usage: $0 [ -f ]" 1>&2 
}

# Function: Exit with error.
exit_abnormal() {
  usage
  exit 1
}

while getopts "f" option; do
   case ${option} in
      f )
         echo "Forced installation of requirements"
         FORCE="--force-with-deps --force"
         ;;
      \? )
         exit_abnormal
      ;;
      *)
         exit_abnormal
      ;;
    esac
done

ansible-galaxy install -r requirements.yml $FORCE
ansible-playbook main.yml --ask-become-pass