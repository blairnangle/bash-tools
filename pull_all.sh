#!/usr/bin/env bash

function pull_all {
	local REPOSITORIES=(
	"<LIST OF REPOSITORIES>"
	)

	for repo in ${REPOSITORIES[*]};
	do
		echo "Pulling ${repo}..."
		(cd ~/<PROJECT_HOME>/${repo} && git pull --rebase)
	done
}

pull_all
