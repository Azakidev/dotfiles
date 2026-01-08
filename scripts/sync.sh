#!/usr/bin/env bash
#
# Sync and flatten media in a deeply nested folder structure
#
# Author: Azakidev <zazaguichi@outlook.com>
# Date: 08/01/2026
# License: MIT

ART_PATH="$HOME/Pictures/Art"
OUT_PATH="$HOME/Pictures/Share"
declare -a EXTENSIONS=("png" "gif" "avif" "jpeg" "jpg")

usage() {
	local prog=${0##*/}
	cat <<-EOF
Usage: $prog [options]
 
Sync and flatten media in a deeply nested folder structure

Options:
    -r  Regenerate the whole sync
    -d  Start as daemon, listening in the background for changes
    -s  Single run
EOF
}

sync-file() {
    while IFS= read -r -d $'\0' line; do
        local file=${line##*/}
        # This works well until two folders of the same name 
        # have files with also the same name
        # A recursive apprach should be done, 
        # but I am too lazy and this should not happen regardless
        if [[ -f "$OUT_PATH/$file" ]]; then
            # If both files are the same, do nothing
            # If they're different, correct the name
            if [[ $(md5sum "$line" "$OUT_PATH/$file" | md5sum --check) ]]; then
                :
            else
                # $HOME/Pictures/.../Dir
                local dir=$(dirname "$line")
                # Dir
                local dir_name=${dir##*/}
                # Dir-File.ext
                local new_name="$dir_name-$file"

                echo "Saving $file as $new_name"

                rsync -at "$line" "$OUT_PATH/$new_name"
            fi
        else
            rsync -at "$line" $OUT_PATH
        fi
    done
}

export -f sync-file

walk-tree() {
    export -f sync-file 
    local type
    for type in ${EXTENSIONS[@]}; do
       sync-file < <(find $ART_PATH -type f -name "*.$type" -print0)
    done
}

regenerate() {
    rm -f $OUT_PATH/*;
    walk-tree 
}

daemon-run() {
    while true; do
        inotifywait -r -e modify,create,delete $ART_PATH
        walk-tree
    done
}

main() {
    mkdir -p $OUT_PATH

    local opt OPTIND OPTARG
    while getopts 'rdsh' opt; do
        case $opt in
            r) regenerate ;;
            d) daemon-run ;;
            s) walk-tree ;;
            h) usage ; return 0;;
            *) usage >&2; return 1;;
        esac
    done
    shift "$((OPTIND - 1))"

    "$@"
}

main "$@"

