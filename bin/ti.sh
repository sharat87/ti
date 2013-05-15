#!/bin/bash

if [[ -z $SHEET_FILE ]]; then
    SHEET_FILE=~/.ti-sheet
fi

if [[ -z $SHEET_CURRENT_FILE ]]; then
    SHEET_CURRENT_FILE="$SHEET_FILE-current"
fi

if [[ -z $TI_CONF_DIR ]]; then
    TI_CONF_DIR=~/.ti
fi

main () {
    load-plugins
    action "$@"
    return $?
}

#-------------------------------------------------------------------------------
# Core library functions
#-------------------------------------------------------------------------------

action () {
    matching_actions="$(expand-action-name "$1")"
    match_count="$(echo "$matching_actions" | wc -l | sed 's/^\s*//')"
    if [[ -z $matching_actions ]]; then
        echo "No action '$1' found" >&2
    elif [[ $match_count == 1 ]]; then
        shift
        "action-$matching_actions" "$@"
        return $?
    else
        echo "Ambiguous action name (found $match_count actions):" >&2
        echo "$matching_actions" | sed 's/^/  /' >&2
    fi
    return 1
}

read-time () {
    when="$@"
    if [[ -z $when ]]; then
        when=now
    fi
    date --date="$when"
}

is-working? () {
    [[ -f $SHEET_CURRENT_FILE ]]
    return $?
}

ensure-working! () {
    if ! is-working?; then
        echo "For all I know, you aren't working on anything. I don't know what to do." >&2
        echo "Use $0 on <project-name> [description]" >&2
        exit 1
    fi
}

list-actions () {
    compgen -A function action- | sed 's/^action-//'
}

load-plugins () {
    [[ -d "$TI_CONF_DIR" ]] || return
    for fname in "$TI_CONF_DIR"/*; do
        if [[ $fname = *.ti || $fname = *.ti.sh ]]; then
            source "$fname"
        fi
    done
}

expand-action-name () {
    list-actions | grep "^$1"
}

#-------------------------------------------------------------------------------
# Core actions
#-------------------------------------------------------------------------------

action-on () {
    if [[ -f $SHEET_CURRENT_FILE ]]; then
        echo 'You are already working on a project. Stop it or use a different sheet.' >&2
        return 1
    fi
    project_name="$1"
    if [[ -z $project_name ]]; then
        echo 'No projct name given. Doing nothing.' >&2
        return 1
    fi
    shift
    start_time="$(read-time "$@")"
    echo "$project_name [$start_time]" >> $SHEET_CURRENT_FILE
    echo "Start working on $project_name."
}

action-fin () {
    ensure-working!
    stop_time="$(read-time "$@")"
    if [[ -s $SHEET_FILE ]]; then
        echo >> $SHEET_FILE
    fi
    project="$(head -1 $SHEET_CURRENT_FILE | sed 's/ \[.\+$//')"
    head -1 $SHEET_CURRENT_FILE | sed "s^\]^] to [$stop_time]^" >> $SHEET_FILE
    cat $SHEET_CURRENT_FILE | awk 'NR != 1' >> $SHEET_FILE
    echo "So you stopped working on $project."
    rm $SHEET_CURRENT_FILE
}

action-note () {
    ensure-working!
    desc="$*"
    if [[ -z $desc && -z $_NON_INTERACTIVE ]]; then
        "$EDITOR" "$SHEET_CURRENT_FILE"
    elif [[ ! -z $desc ]]; then
        echo "  $desc" >> $SHEET_CURRENT_FILE
    fi
}

action-tag () {
    ensure-working!
    if [[ $# = 0 ]]; then
        echo "Please give a tag to apply to current activity." >&2
        return 1
    fi
    temp_file="/tmp/$RANDOM"
    for tag in $*; do
        # Ensure there is one and only one # char at the start of the tag name
        tag="#${tag#\#}"
        cat "$SHEET_CURRENT_FILE" | sed "1s/$/ $tag/" > "$temp_file"
        cat "$temp_file" > "$SHEET_CURRENT_FILE"
    done
    rm "$temp_file"
}

action-status () {
    ensure-working!
    pline="$(head -1 $SHEET_CURRENT_FILE)"
    project="$(echo $pline | sed 's/ \[.\+$//')"
    from_time="$(echo $pline | sed -e 's/^.\+\[//' -e 's/\].*$//')"
    if hash dtime 2>&-; then
        echo "You have been working on $project for $(dtime "$from_time")."
    else
        echo "You are working on $project since $from_time."
    fi
}

action-edit () {
    "$EDITOR" "$SHEET_FILE"
}

#-------------------------------------------------------------------------------
# Additional actions
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Start the main function
#-------------------------------------------------------------------------------

main "$@"
