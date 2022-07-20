function fmt_stage
    fmt_reset
    set stage $argv[1]
    if test -z $stage
        set_color red
        echo "$prefix x Unknown stage, abort"
        set_color normal
        exit 128
    end
    set fmt_stage_front (printf '=%.0s' (seq 0 (math "($cols-25)*$stage")))
    set fmt_stage_precent $(math -s0 "$stage*100")%
    set fmt_stage_back (printf ' %.0s' (seq 0 (math "($cols-25)-(($cols-25)*$stage)-1")))
    echo "[$fmt_stage_front>$fmt_stage_back] Current Stage: $fmt_stage_precent"
end
