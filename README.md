# iTerm 2 Tab Color Functions

Functions for setting the iTerm 2 tab/title bar color using their [proprietary
escape codes](https://www.iterm2.com/documentation-escape-codes.html).

**Note:** iTerm2 title bar color changing doesn't work on High Sierra
([source](https://gitlab.com/gnachman/iterm2/issues/4080#note_43758478)), but
is [available again in Mojave](https://www.patreon.com/posts/20684577). Tab
color changing should be available regardless of OS version.

## Contents

<!-- vim-markdown-toc GFM -->

* [Setup](#setup)
* [Usage](#usage)
    * [Set Tab Color](#set-tab-color)
    * [Reset Tab Color](#reset-tab-color)
    * [Base16 Shell Support](#base16-shell-support)
* [Environment Variables](#environment-variables)
* [Set Tab Color Automatically On Startup](#set-tab-color-automatically-on-startup)
* [Create Aliases for Quick Color Switching](#create-aliases-for-quick-color-switching)

<!-- vim-markdown-toc -->


## Setup

Source `functions.sh` in your `.bashrc` file.  

e.g. if you clone this repo into `~/.iterm2-tab-color`, add this line to your
`.bashrc`:

```
. ~/.iterm2-tab-color/functions.sh
```

## Usage

### Set Tab Color

To set the tab color:

```
it2-tab-color <hex value>
it2-tab-color <R value> <G value> <B value>
```

- `<hex value>` 6 digit hex code for the color (optionally starting with '#')  
    - Ex: `it2-tab-color 1B2B34`
- `<R value> <G value> <B value>` decimal values for RGB (0-255)  
    - Ex: `it2-tab-color 27 43 52`


### Reset Tab Color

To reset the tab color:

```
it2-tab-reset
```


### Base16 Shell Support

If you're using [base16-shell](https://github.com/chriskempson/base16-shell),
you can use `it2-b16-theme` to set it to a color specified in `~/.base16_theme`:

```
it2-b16-theme 
it2-b16-theme <color number>
```

- Providing no arguments sets it to `color00` (the terminal background)
- `<color number>` is a 2 digit number corresponding to one of the color
  variables in `~/.base16_theme` 
    - Ex: `it2-b16-theme 04`
  
(**Note:** some colors may not work correctly if `~/.base16_theme` assigns it to
a local variable)


## Environment Variables

When `it2-tab-color` or `it2-b16-theme` are called, they will set the
environment variable `IT2_SESSION_COLOR` to the RGB values of the current tab
color. `functions.sh` checks this variable at runtime and will restore the color
if set. This allows the tab color to be maintained if `exec bash` is called, for
example.

When `it2-tab-reset` is called, `IT2_SESSION_COLOR` will be unset.


## Set Tab Color Automatically On Startup

To automatically set the tab color on startup, add something like the following
to your `.bashrc`:

```bash
# Source iTerm2 tab color functions
. ~/.iterm2-tab-color/functions.sh

# Set the color on startup
it2-tab-color 1B2B34
```

Note that this will *always* set it to the same color, disregarding the value of
the `IT2_SESSION_COLOR` variable. To set the color automatically at the start of
a session and keep track of changes to the session color, add something like the
following to your `.bashrc`:

```bash
# Source iTerm2 tab color functions
. ~/.iterm2-tab-color/functions.sh

# Set the color on startup
if [ -z "$IT2_SESSION_COLOR" ]; then
    it2-tab-color 1B2B34
fi
```

This will only set the tab color if `IT2_SESSION_COLOR` isn't set, allowing you
to change the tab color and maintain the new color if `exec bash` is called.


## Create Aliases for Quick Color Switching

If you have go-to tab colors, you may want to consider creating aliases for them
in your `.bashrc` for quick color switching.

**Example:**

```bash
# Example palette: https://coolors.co/ff6d77-34d1bf-1f01b9-71a9f7-fcbf49
alias it2-coral='it2-tab-color FF6D77'
alias it2-turquoise='it2-tab-color 34D1BF'
alias it2-blue='it2-tab-color 1F01B9'
alias it2-yellow='it2-tab-color FCBF49'
alias it2-lavendar='it2-tab-color 71A9F7'
```

