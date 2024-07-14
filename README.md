# maven-test-runner.nvim

This Neovim plugin, Maven Test Runner, enhances the developer's workflow by providing a streamlined interface for executing Maven tests directly from the editor.

[![asciicast](https://asciinema.org/a/C8J48tR7BHjfxHN0lViMFURC7.svg)](https://asciinema.org/a/C8J48tR7BHjfxHN0lViMFURC7)

## Default mappings ##
***
| Keybind       | Action                          |
|---------------|---------------------------------|
| `<leader>m`   | Execute Maven Test              |
| `<ESC>`       | Close Maven Test Runner UI      |
| `<CR>`        | Open Maven Test Runner UI       |


## Installation ##
* neovim 0.5.0+ required!!
* Install using your plugin manager, I'm using packer so for me it would be:

```lua
use "jkeresman01/maven-test-runner.nvim"
```

## Customization ##
If you wan't to customize the keymapings you can do so, here is an example:

```lua
local ui  = require("maven-test-runner.ui")
local mvn = require("maven-test-runner.mvn")

vim.keymap.set("n", "<leader>u", function() ui.open() end)          --  Open Maven Test Runner UI  
vim.keymap.set("n", "<ESC>", function() ui.close() end)             --  Close Maven Test Runner UI
vim.keymap.set("n", "<leader>r", function() mvn.execute() end)      --  Execute Maven Test|Tests  
```

## Note ##
 
This is still work in progress, next things, detect class name from current buffer, add field in UI to pass VM options, execute suite ....
