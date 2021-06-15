code.url.encode() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Percent-encode a string"
        echo "Usage: ${FUNCNAME[0]} https://google.com"
        echo "Output: https%3A%2F%2Fgoogle.com"
    else
        local LC_ALL=C
        for ((i = 0; i < ${#1}; i++)); do
            : "${1:i:1}"
            case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
                ;;
            *)
                printf '%%%02X' "'$_"
                ;;
            esac
        done
        printf '\n'
    fi
}
code.url.decode() {
    if [[ -z "${1}" ]]; then
        echo -e "[${FUNCNAME[0]}]: Error Line: (${BASH_LINENO[0]}) Missing value"
    elif [[ ${1} == help ]]; then
        echo "Info: Decode a percent-encoded string"
        echo "Usage: ${FUNCNAME[0]} https%3A%2F%2Fgoogle.com"
        echo "Output: https://google.com"
    else
        : "${1//+/ }"
        printf '%b\n' "${_//%/\\x}"
    fi
}
