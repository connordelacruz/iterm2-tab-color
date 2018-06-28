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

To set the tab color:

```
it2-tab-color <hex value>
it2-tab-color <R value> <G value> <B value>
```

- `<hex value>` 6 digit hex code for the color (optionally starting with '#')  
- `<R value> <G value> <B value>` decimal values for RGB (0-255)

To reset the tab color:

```
it2-tab-reset
```

If you're using [base16-shell](https://github.com/chriskempson/base16-shell),
you can use `it2-b16-theme` to set it to a color specified in `~/.base16_theme`:

```
it2-b16-theme 
it2-b16-theme <color number>
```

- Providing no arguments sets it to `color00` (the terminal background)
- `<color number>` is a 2 digit number corresponding to one of the color
  variables in `~/.base16_theme` (**Note:** some colors may not work correctly
  if `~/.base16_theme` assigns it to a local variable)

