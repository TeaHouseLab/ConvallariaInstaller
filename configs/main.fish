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
    case install
        installer $argv[2..-1]
    case v version
        logger 1 "Joshua@build1"
    case '*'
        guide
end
