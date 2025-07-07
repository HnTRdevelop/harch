PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/cuda/bin:/opt/cuda/nsight_compute:/opt/cuda/nsight_systems/bin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_per:/home/hntr/.local/bin

export XCURSOR_SIZE=24
export XCURSOR_THEME="Capitaine Cursors (Gruvbox)"

export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export LIBVA_DRIVER_NAME=nvidia
export __GL_GSYNC_ALLOWED=1
export __GL_VRR_ALLOWED=0

export GTK_THEME=Colloid-Yellow-Dark-Compact-Gruvbox

export GDK_BACKEND=wayland,x11,*
export SDL_VIDEODRIVER=wayland,x11,windows
export CLUTTER_BACKEND=wayland

export QT_STYLE_OVERRIDE=Adwaita-Dark
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM="wayland"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME=qt5ct

export HOST_LANG=ru_RU.UTF-8
export HOST_LC_ALL=en_US.UTF-8

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

if [[ "$(tty)" == "/dev/tty1" ]]
  then
    exec Hyprland
fi