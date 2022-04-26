1#!/usr/bin/env bash

DIR="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh"`)

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
        polybar -q main -c "$DIR/$style/config.ini" &
}

case $1 in
  --tran)
    echo -e "Executing tran style..."
    style="tran"
    launch_bar
  ;;
  *)
    clear
    echo -e "Usage: launch.sh --theme\n"
    echo -e "Available themes: \n"
    for theme in ${themes[@]}; do
      echo -e "--$theme"
    done;
  ;;
esac
