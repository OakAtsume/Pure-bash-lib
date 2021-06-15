#Made by: Oak Atsume
s.trim() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: trim trailing/leading white-space from string"
        echo "Usage: ${FUNCNAME[0]} '   Hello,      World       '"
        echo "Output: Hello, World"
    else
        : "${1#"${1%%[![:space:]]*}"}"
        : "${_%"${_##*[![:space:]]}"}"
        printf '%s\n' "$_"
    fi
}
ws.trim() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: trim white-space from string and truncate spaces"
        echo "Usage: ${FUNCNAME[0]} '    Hello,    World    '"
        echo "Output: Hello, World"
    else
        set -f
        set -- $*
        printf '%s\n' "$*"
        set +f
    fi
}
split() {
    if [[ -z "${1}" || -z $"{2}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Split a string on a delimiter"
        echo "Usage: ${FUNCNAME[0]} 'cats,dogs,rats,bunnys' ','"
        echo "Output: cats dogs rats bunnys"
    else
        IFS=$'\n' read -d "" -ra arr <<<"${1//$2/$'\n'}"
        printf '%s\n' "${arr[@]}"
    fi
}
s.lower() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Change a string to lowercase"
        echo "Usage: ${FUNCNAME[0]} HELLO WORLD"
        echo "Output: hello world"
    else
        printf '%s\n' "${1,,}"
    fi
}
s.upper() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Change a string to uppercase"
        echo "Usage: ${FUNCNAME[0]} hello world"
        echo "Output: HELLO WORLD"
    else
        printf '%s\n' "${1^^}"
    fi
}
s.reverse() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Reverse a string case"
        echo "Usage: ${FUNCNAME[0]} hello"
        echo "Output: HELLO"
        echo "Usage-2: ${FUNCNAME[0]} HELLO"
        echo "Output-2: hello"
        echo "Usage-3: ${FUNCNAME[0]} Hello"
        echo "Output-3: hELLO"
    else
        printf '%s\n' "${1~~}"
    fi
}
strip.all() {
    if [[ -z "${1}" || -z "${2}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Strip all instances of pattern from string"
        echo "Usage: ${FUNCNAME[0]} 'The Quick Brown Fox" "[aeiou]'"
        echo "Output: Th Qck Brwn Fx"
    else
        printf '%s\n' "${1//$2/}"
    fi
}
strip.f() {
    if [[ -z "${1}" || -z "${2}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Strip first occurrence of pattern from string"
        echo "Usage: ${FUNCNAME[0]} 'The Quick Brown Fox" "[aeiou]'"
        echo "Output: Th Quick Brown Fox"
    else
        printf '%s\n' "${1/$2/}"
    fi
}

strip.f2() {
    if [[ -z "${1}" || -z "${2}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Strip pattern from start of string"
        echo "Usage: ${FUNCNAME[0]} 'The Quick Brown Fox' 'The '"
        echo "Output: Quick Brown Fox"
    else
        printf '%s\n' "${1##$2}"
    fi
}
strip.last() {
    if [[ -z "${1}" || -z "${2}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Strip pattern from start of string"
        echo "Usage: ${FUNCNAME[0]} 'The Quick Brown Fox' 'Fox'"
        echo "Output: The Quick Brown"
    else
        printf '%s\n' "${1%%$2}"
    fi
}