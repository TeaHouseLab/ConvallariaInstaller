function fmt_bottom
    set fmt_bottom_text "$argv"
    fmt_reset
    tput sc
    tput cup (math "$lines-2") 0
    echo "$fmt_bottom_text"
end