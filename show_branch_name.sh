#!/bin/bash

color_echo_lib="$HOME/bash_lib/color_echo.sh"

[[ -f ${color_echo_lib} ]] && . ${color_echo_lib}

readarray -t proj_array < <(ls src/)

for proj in "${proj_array[@]}"; do
    if [[ -d "src/${proj}" ]] && [[ "uos_depend" != "${proj}" ]]; then
        cd "src/${proj}"
        echo "------------------------------------------------------------"
        cecho "BLUE" "Enter project src/${proj}"
        branch_name=$(git rev-parse --abbrev-ref HEAD)
        cecho "CYAN" "Current branch: ${branch_name}"
        cd ~-
    fi
done

exit 0
