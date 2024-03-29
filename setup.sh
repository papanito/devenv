#!/bin/bash
FORCE=""
APPLY="--check"
RUNPLAY=false
UPGRADE=false
TAGS=""

SITE_YML="main.yml"

# Function: Print a help message.
usage() {
    cat <<EOF
   Usage: $0 [ -p ] [ -a ] [ -f ] [ -t ]
   We are using ansible thus first ensure to have all requirements on your machine
   -a apply changes for play $SITE_YML, works only with -p
   -p runs playbook ($SITE_YML) in dry run
   -f forced installation of dependecies
   -u do system upgrade
   -t TAGS only execute TAGS
EOF
}

# Function: Exit with error.
exit_abnormal() {
    usage
    exit 1
}

if [ "$#" -ne 1 ]; then
    exit_abnormal
fi

while getopts "pasfcb:ut:" option; do
    case ${option} in
    a)
        APPLY=""
        ;;
    f)
        FORCE="--force-with-deps --force"
        ;;
    p)
        RUNPLAY=true
        ;;
    u)
        UPGRADE=true
        ;;
    t)
        TAGS="--tags ${OPTARG}"
        ;;
    \?)
        exit_abnormal
        ;;
    *)
        exit_abnormal
        ;;
    esac
done

ansible-galaxy install -r requirements.yml $FORCE

if ($RUNPLAY); then
    echo "---------------------------------------------------"
    echo "Run ansible play '$SITE_YML' with '$APPLY'"
    echo "---------------------------------------------------"
    ansible-playbook $SITE_YML $APPLY --ask-become-pass $TAGS
fi

if ($UPGRADE); then
    echo "---------------------------------------------------"
    echo "Do system upgrade running 'upgrade.yml' with '$APPLY'"
    echo "---------------------------------------------------"
    #ansible-playbook upgrade.yml $APPLY
fi
