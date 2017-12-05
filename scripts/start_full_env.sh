#!/bin/bash -x

scrtype="fullenv"

own_fullpath="$(realpath $0)"
own_dir="$(dirname $own_fullpath)"
own_dir=${own_dir%/}
topdir="$(realpath ${own_dir}/../)"

DATA_MOUNT="${topdir}/mounts/${scptype}/data"
DOCKERNAME="linkitenv"

usage() {
    echo "Usage: $0 [options]"
    echo ""
    echo "[options]:"
    echo -e "-d <path>\t- data mount point"
    echo -e "-n <name>\t- docker image name"
    echo ""
}

exec_or_die() {
    $* > /dev/null
    local _ret=$?
    if [ $_ret -ne 0 ]; then
        echo "Failed executing '$*'"
        cd ${topdir}
        exit $_ret
    fi

    return 0
}

while getopts ":d:n:" o; do
    case "${o}" in
        s)
            DATA_MOUNT="${OPTARG}"
            ;;
        n)
            DOCKERNAME="${OPTARG}"
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z $DATA_MOUNT ]; then
    echo "Please specify correct mount points"
    usage
    exit 1
fi

if [ ! -d $DATA_MOUNT ]; then
    exec_or_die "mkdir -p $DATA_MOUNT"
fi

if [ ! -d "${topdir}/openwrt" ]; then
    echo "Cloning openwrt to ${topdir}/openwrt"
    exec_or_die "git clone git://git.openwrt.org/15.05/openwrt.git ${topdir}/openwrt/"
else
    exec_or_die "cd ${topdir}/openwrt"
    exec_or_die "git pull"
    exec_or_die "cd ${topdir}"
fi

exec_or_die "cd ${topdir}/openwrt"
exec_or_die "cp feeds.conf.default feeds.conf"
exec_or_die "echo src-git linkit https://github.com/MediaTek-Labs/linkit-smart-7688-feed.git >> feeds.conf"
echo "Done preapring openwrt at ${topdir}/openwrt"

echo "Running docker using sudo"
cd ${topdir}
sudo docker build -f Dockerfile_full_env -t ${DOCKERNAME} . --build-arg DATA_MOUNT=${DATA_MOUNT} --build-arg BUILD_MOUNT="${topdir}/openwrt/"

exit 0
