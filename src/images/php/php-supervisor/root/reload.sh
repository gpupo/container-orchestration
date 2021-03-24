#!/usr/bin/env bash
printf "\n>> Supervisor Reload config \n";
supervisorctl reread;
supervisorctl update;
printf "Done\n";