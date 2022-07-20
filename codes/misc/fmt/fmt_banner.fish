function fmt_banner
    set fmt_banner_text "|$argv|"
    set fmt_banner_text_count (echo -n "$fmt_banner_text" | wc -m)
    fmt_reset
    set fmt_banner_raw (printf '=%.0s' (seq 1 (math "($cols-$fmt_banner_text_count)/2")))
    echo "$fmt_banner_raw$fmt_banner_text$fmt_banner_raw"
end
