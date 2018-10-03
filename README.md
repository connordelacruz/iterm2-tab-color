# iTerm 2 Tab Color Functions

Functions for setting the iTerm 2 tab/title bar color using their [proprietary
escape codes](https://www.iterm2.com/documentation-escape-codes.html).


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

