# Corona Memory Monitor
A super simple memory monitor for Corona development

## Usage

Require the memory monitor on top of the display list:

```lua
require("memory").new([delay, fill, x, y])
```

Tap the monitor text to toggle.

### Parameters

All parameters are optional.

- __delay__ : Pass 0 or nil to run on every enterFrame event. Pass milliseconds value to update on a delay. Default: nil.

- __fill__: A table with the fill color. Default: {1,1,1}.

- __x__: The x position of the monitor. Default is top left of the viewable screen.

- __y__: The y position of the monitor. Default is top left of the viewable screen.

### Examples

_Update every frame_:

```lua
require("memory").new()
```

_Update every second_:

```lua
require("memory").new(1000)
```

_Update every frame, black text_:

```lua
require("memory").new(0, {0,0,0})
```

### Tips

Require the monitor in your __main.lua__ at the top of the display list.