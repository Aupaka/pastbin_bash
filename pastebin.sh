#!/bin/bash

# TODO
# change api_paste_private
# 0 = Public
# 1 = Unlisted
# 2 = Private
#
# change api_paste_expire_date
# N = Never
# 10M = 10 Minutes
# 1H = 1 Hour
# 1D = 1 Day
# 1W = 1 Week
# 2W = 2 Weeks
# 1M = 1 Month

function howto {
    echo "Usage: [ -f file ] [ -p name ] [ -t format ] -a -h -l
        -a -> anonymous mode
        -h -> help
        -l -> list"
    exit
}

file=""
pname=""
format=""
anonymous=""
username=""
password=""
api_key=""
list=""

declare -A extensions_name

extensions_name=( ["py"]="python" ["php"]="php" ["sh"]="bash" ["c"]="c" ["cpp"]="cpp")

while getopts "f:p:t:lah" arg; do
    case $arg in
        f)
            file=$OPTARG
            ;;
        p)
            pname=$OPTARG
            ;;
        t)
            format=$OPTARG
            ;;
        l)
            list="ok"
            ;;
        a)
            anonymous="ok"
            ;;
        h)
            howto
            ;;
        *)
            howto
            ;;
    esac
done

conf_filename="$HOME/.pastbin.cnf"

if [ -f $conf_filename ]; then
    echo "load config file"
    source $conf_filename
else
    echo "Please create configuration file: $conf_filename"
    exit
fi

if [[ ! -n "$username" || ! -n "$password" || ! -n "$api_key" ]]; then
    echo "Invalid configuration file"
    exit
fi

if [[ ! -n "$anonymous" ]]; then
    echo "get user api key"
    #uk=$(curl -d api_dev_key="$api_key" -d api_user_name="$username" -d api_user_password="$password" http://pastebin.com/api/api_login.php)
fi

if [[ -n "$list" ]];
then
    curl -s -d api_dev_key="$api_key" -d api_user_key="$uk" -d api_user_name="$username" -d api_user_password="$password" -d api_option="list" http://pastebin.com/api/api_post.php
else
    # if [ -z "${s}" ] || [ -z "${p}" ];
    if [[ ! -n "$file" ]]; then
        howto
        exit
    fi
    if [[ ! -n "$pname" ]]; then
        pname=$(basename $file)
    fi

    extension=${pname##*.}

    for key in ${!extensions_name[@]}; do
        if [[ "${key}" == "${extension}" ]]; then
            format=${extensions_name[${key}]}
        fi
    done

    if [[ ! -n "$format" ]]; then
        echo "Can't get file format. Please specify it with -t option"
        exit
    fi

    if [[ ! -f $file ]]; then
        echo "$file: This file does not exists."
        exit
    fi
    pc=$(cat $file)

    if [[ ! -n "$pc" ]]; then
        exit
    fi

    #res=$(curl -s -d api_dev_key="$api_key" -d api_user_key="$uk" -d api_user_name="$username" -d api_user_password="$password" -d api_option="paste" -d api_paste_code="$pc" -d api_paste_name="$pname" -d api_paste_format="$format" http://pastebin.com/api/api_post.php)
    echo ""
    if [ "$res" == "Bad API request, invalid api_paste_format" ]; then
        echo "The -t option is invalid"
    else
        echo $res
    fi
fi

echo ""
# END
