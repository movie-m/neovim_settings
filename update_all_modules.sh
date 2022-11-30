#!/bin/bash

path_to_color_echo="$HOME/bash_lib/color_echo.sh"
[[ -f ${path_to_color_echo} ]] && . ${path_to_color_echo}

proj_array=(uos_3rdparty uos_base uos_core uos_io uos_lidar uos_lidar_base uos_lidar_framework
    uos_lidar_sensor uos_mot uos_rcslib  uos_utility)

src_tree="$HOME/workspace/uos_ws/src/"

cd "${src_tree}"

cecho "BLUE" "The source tree is ${PWD}"

PS3=$'Is the current source tree correct? \n'
select is_scr_tree_right in yes no; do
    if [[ "no" = ${is_scr_tree_right} ]]; then
        cecho "RED" "Please change to the correct source tree in this script!"
        exit -1
    fi
    break
done

time="$(date +%F_%T)"
expect_ret="No local changes to save"
base_branch="dev-brd-22q3"

unmerged_proj=()
unrebased_proj=()

for proj in "${proj_array[@]}"; do
    echo "---------------------------------------------------------------"
    cecho "YELLOW" "update module ${proj} ..."

    cd ${proj}
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    # stash local un-committed chagnes
    stash_ret=$(git stash save "${proj} at branch ${current_branch}: $time")
    cecho "PURPLE" "$stash_ret"

    git fetch --all
	git checkout "${base_branch}"

    git_pull=(git pull)

    if "${git_pull[@]}"; then
        cecho "GREEN" "git pull succeeded on project ${proj}"
    else
        unmerged_branch+=(${proj})
    fi

	# scp -p -P 29418 zyt10592@192.168.100.20:hooks/commit-msg .git/hooks
    # mw10635

	git checkout $current_branch
    git_rebase=(git rebase "${base_branch}")

    if "${git_rebase[@]}"; then
        cecho "GREEN" "git rebase succeeded on project ${proj}"
    else
        unrebased_proj+=(${proj})
    fi

	if [ "$expect_ret" != "$stash_ret" ];then
		git stash apply   # re-apply but keep changes in the stash for further re-applying
        stash_show=$(git stash show)
        cecho "PURPLE" "git stash apply"
        cecho "PURPLE" "${stash_show}"
	fi

    cecho  "BLUE" "update ${proj} finished!"

    # change back to src_tree
    cd "${src_tree}"
done

cd "${src_tree}/uos_depend"
echo "---------------------------------------------------------------"
cecho "YELLOW" "update uos_depend ..."
svn update .

if [[ ${#unmerged_proj[@]} -gt 0 ]]; then
    cecho "RED" "Unmerged projects: ${unmerged_proj[@]}"
else
    cecho "GREEN" "No projects failed to merge!"
fi

if [[ ${#unrebased_proj[@]} -gt 0 ]]; then
    cecho "RED" "The following projects failed to rebase: "
    cecho "RED" "${unrebased_proj[@]}"
else
    cecho  "GREEN" "All projects succeed in rebasing!"
fi
exit 0
