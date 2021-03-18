#!/usr/bin/env bash

source /usr/local/bin/co-configure/functions.sh

function_print_banner "supervisor";
apt-get install -qq -y supervisor

function_end_build
