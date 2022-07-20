set -lx prefix "[ConvallariaInstaller]"
set -x cols
set -x lines
set -x tz
set -x pwd
set -x install_opt
set -x install_root
set -x install_boot
set -x mirror
set -x efi
switch $argv[1]
    case config
    case '*'
        guide
end
