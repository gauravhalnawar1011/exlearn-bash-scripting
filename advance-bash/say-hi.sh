#!/usr/bin/env bash

. lib/greeting.sh || exit 1  # this also works same as source command
greet AWS
greet AZURE
greet GCP
