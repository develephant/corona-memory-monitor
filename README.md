# Corona Memory Monitor
A super simple memory monitor for Corona development. Displays memory and texture memory.

## Usage

```lua
require("memory").new([delay, fill, x, y])
```

Tap the monitor text to toggle it on or off.

### Parameters

_All parameters are optional._

|Name|Description|
|:----|:-----------|
|delay|Pass 0 to run on every frame. Pass milliseconds value to delay update. Default: 0|
|fill|A table with the preferred text color values. Default: {1,1,1}.|
|x|The x position of the monitor. Default is top left of the viewable screen.|
|y|The y position of the monitor. Default is top left of the viewable screen.|

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