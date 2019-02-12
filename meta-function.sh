#!/usr/bin/env bash

usage="$(basename "$0") <command> [arguments] -- meta command line tool

available commands:

    clone_all <bitbucket_username>                          Clone all repositories from Bitbucket into current directory
    E.g. meta-function clone_all blair_nangle         Note: it is recommended to run this while in ~/<PROJECT_DIRECTORY>

    pull_all                                                        Update all local repositories in <PROJECT_DIRECTORY>
    "

if [[ $# -eq 0 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "help" ]] || [[ "$1" == "--help" ]]; then
    echo "${usage}"
    exit 1
fi

clone_all_bitbucket() {
    BITBUCKET_USERNAME=${1}
    ./clone_all_bitbucket.sh ${BITBUCKET_USERNAME}
}

pull_all() {
    ./pull_all.sh
}

function run {
    exec 3>&1 4>&2
    TIMEFORMAT=%R
    duration=$( { time $1 ${@:2} 1>&3 2>&4; } 2>&1 )  # Captures real time only.
    exit_code=$?
    exec 3>&- 4>&-
    record-execution-time $1 ${@:2}
    if [[ ${exit_code} != 0 ]]; then
        echo ">>>>>>>>>>>>>>>>>>>>>>>FAILURE<<<<<<<<<<<<<<<<<<<<<<<<<"
        echo -e "Command $1 ${@:2} completed with exit code: $exit_code\n"
        if [[ ${exit_code} == 127 ]]; then echo "$usage"; fi
        exit ${exit_code}
    fi
}

function record-execution-time {
    echo "$@=$duration at $(date)">>${time_file}
}

time_file=execution_times.data

run $1 ${@:2}
