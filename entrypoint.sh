#!/bin/bash -e

/git-credentials.sh

exec git "$@"
