
SCRIPT_DIR=$(dirname $0)

WALLPAPERS_DIR="${SCRIPT_DIR}/../wallpapers"

which feh &> /dev/null || exit 1

IMAGE_FILE=$(ls $WALLPAPERS_DIR | sort -R | tail -1)
feh --bg-center $WALLPAPERS_DIR/$IMAGE_FILE


