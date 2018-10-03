# iTerm 2 Tab Color Functions

Functions for setting the iTerm 2 tab/title bar color using their [proprietary
escape codes](https://www.iterm2.com/documentation-escape-codes.html).

## TODO

- Document various ways of setting color automatically at startup

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


