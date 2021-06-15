array.flip() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Reverse an array"
        echo "Usage: ${FUNCNAME[0]} 1 2 3 4 5 6 7 8 9"
        echo "Output: 9 8 7 6 5 4 3 2 1"
        echo "Usage-2: ${FUNCNAME[0]} $/{array[@]} #array = 9 8 7 6 5 4 3 2 1"
        echo "Output-2: 1 2 3 4 5 6 7 8 9"
    else
        shopt -s extdebug
        f() (printf '%s\n' "${BASH_ARGV[@]}")
        f "$@"
        shopt -u extdebug
    fi
}
array.remove.dup() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Remove duplicate array elements"
        echo "Usage: ${FUNCNAME[0]} 1 1 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 5"
        echo "Output: 1 2 3 4 5"
    else
        declare -A tmp_array

        for i in "$@"; do
            [[ $i ]] && IFS=" " tmp_array["${i:- }"]=1
        done
        printf '%s\n' "${!tmp_array[@]}"
    fi
}
array.random() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Random array element"
        echo "Usage: ${FUNCNAME[0]} $/{array[@]} array = yellow blue red"
        echo "Output: yellow or blue or red #RANDOM"
    else
        local arr=("$@")
        printf '%s\n' "${arr[RANDOM % $#]}"
    fi
}
array.clycle() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Cycle through an array"
        echo "Usage: ${FUNCNAME[0]} $/{array[@]} array = yellow blue red"
        echo "Output: yellow -> blue -> red [LOOP]"
    else
        printf '%s ' "${arr[${i:=0}]}"
        ((i = i >= ${#arr[@]} - 1 ? 0 : ++i))
    fi
}
