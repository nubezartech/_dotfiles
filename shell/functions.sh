function cdd() {
	cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function j() {
	fname=$(declare -f -F _z)

	[ -n "$fname" ] || source "$DOTLY_PATH/modules/z/z.sh"

	_z "$1"
}

function recent_dirs() {
	# This script depends on pushd. It works better with autopush enabled in ZSH
	escaped_home=$(echo $HOME | sed 's/\//\\\//g')
	selected=$(dirs -p | sort -u | fzf)

	cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

gclone(){
    if [ "$#" -eq "0" ]; then
        echo -e "\e[1;34mError:\e[0m Debe indicar el repo a copiar. Formato: \e[1;34gclone\e[0m \e[1;35m<org/repo>\e[0m"
    else
        CONTADOR=0
        for i in "$@"
        do
            let CONTADOR=$CONTADOR+1
            echo "Repo $CONTADOR: $i"
            gh repo clone $i
            cd @i
            FILE_ENV=.env.example
            if test -f "$FILE_ENV"; then
                echo "\n $FILE_ENV exist, copying to .env"
                cp .env.example .env
            fi
            FILE_COMPOSER=composer.json
            if test -f "$FILE_COMPOSER"; then
                echo "$FILE_COMPOSER exist, installing composer dependencies\n"
                composer install --no-interaction
            fi
            FILE_NPM=package.json
            if test -f "$FILE_COMPOSER"; then
                echo "$FILE_COMPOSER exist, installing npm/yarn dependencies\n"
                npm install -y 
            fi
        done
    fi
}

vps(){
    if [ "$#" -eq "0" ]; then
        echo -e "Debe indicar el usuario para conectarse. Formato: \e[1;34mvps\e[0m \e[1;35m<usuario>\e[0m \n"
    elif [ "$#" -eq "1" ]; then
        ssh -i ~/.ssh/id_rsa $1@vps.nubezartech.space
	else
		echo -e "\e[1;34mHa indicado demasiados parámetros.\e[0m Formato: \e[1;34mvps\e[0m \e[1;35m<usuario>\e[0m \n"
    fi
}
