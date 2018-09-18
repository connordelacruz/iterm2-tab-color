# ================================================================
# iTerm2 tab color functions
#
# Author: Connor de la Cruz (connor.c.delacruz@gmail.com)
# Repo: https://github.com/connordelacruz/iterm2-tab-color
# ================================================================

# Set the tab color
it2-tab-color() {
    # takes 1 hex string argument or 3 hex values for RGB
    case "$#" in
        3)
            R="$1"
            G="$2"
            B="$3"
            ;;
        1)
            hex="$1"
            # Remove leading # if present
            if [[ "${hex:0:1}" == "#" ]]; then
                hex="${hex:1}"
            fi
            # Get hex values for each channel
            R="${hex:0:2}"
            G="${hex:2:2}"
            B="${hex:4}"
            # Convert to decimal
            R="$((16#$R))"
            G="$((16#$G))"
            B="$((16#$B))"
            ;;
        *)
            echo "Usage: it2-tab-color color_hex"
            echo "          color_hex: 6 digit hex value (e.g. 1B2B34)"
            echo "       it2-tab-color r_val g_val b_val"
            echo "          *_val: values for R, G, B from 0-255 (e.g. 27 43 52)"
            return
            ;;
    esac
    echo -ne "\033]6;1;bg;red;brightness;$R\a"
    echo -ne "\033]6;1;bg;green;brightness;$G\a"
    echo -ne "\033]6;1;bg;blue;brightness;$B\a"
    unset R G B hex
}

# Reset tab color to default
it2-tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

# Check for ~/.base16_theme and set the tab color based on that
it2-b16-theme() {
    if [ -f "$HOME/.base16_theme" ]; then
        # If no argument was passed, default to color00
        if [ "$#" -lt 1 ]; then
            colornum="00"
        else
            colornum="$1"
        fi
        color="$(perl -nle "print \$& if m{color$colornum=\"\K.*(?=\")}" "$HOME/.base16_theme")"
        it2-tab-color ${color///}
        unset color colornum
    fi
}


