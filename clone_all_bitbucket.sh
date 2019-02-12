#!/usr/bin/env bash

usage="$(basename "$0") [bitbucket_username] -- tool for new team members to clone all Bitbucket projects"

if [[ $# -eq 0 ]] || [[ "$1" == "help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "$usage"
    exit 1
fi

BITBUCKET_USERNAME=${1}

create_cloning_directory() {
    DIRECTORY_NAME=~/<PROJECT_DIRECTORY>

    if [[ -d ${DIRECTORY_NAME} ]]
    then
        echo -e "${DIRECTORY_NAME} already exists, creating ~/<TEMP_PROJECT_DIRECTORY> instead (please consolidate all your local project repos into ~/<PROJECT_DIRECTORY> at some point…)\n"
        echo -e "Moving into ~/<TEMP_PROJECT_DIRECTORY>…\n"
        mkdir ~/<TEMP_PROJECT_DIRECTORY> && cd ~/<TEMP_PROJECT_DIRECTORY>/
    else
        echo -e "Creating ${DIRECTORY_NAME}…\n"
        echo -e "Moving into ${DIRECTORY_NAME}…\n"
        mkdir ${DIRECTORY_NAME} && cd ${DIRECTORY_NAME}
    fi
}

clone_all() {
	local REMOTE_REPOSITORIES=(
	"https://${BITBUCKET_USERNAME}@bitbucket.org/<REPOSITORY-NAME>.git"
	)

	for repo in ${REMOTE_REPOSITORIES[*]};
	do
		echo "Cloning ${repo} via https..."
		(git clone ${repo})
	done
}

create_cloning_directory
clone_all
