function fmt_center
        set fmt_center_text "$argv"
        set fmt_center_text_count (printf "$fmt_center_text" | wc -m)
        fmt_reset
        set fmt_center_raw (printf ' %.0s' (seq 1 (math "($cols-$fmt_center_text_count)/2")))
        echo "$fmt_center_raw$fmt_center_text$fmt_center_raw"
end