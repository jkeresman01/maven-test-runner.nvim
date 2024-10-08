# maven-test-runner.nvim

Neovim plugin that allows you to execute tests from Neovim using maven.

[![asciicast](https://asciinema.org/a/1KoRnOYpVkXmZmzgD9deN2Fyz.svg)](https://asciinema.org/a/1KoRnOYpVkXmZmzgD9deN2Fyz)

## Default mappings ##
***
| Keybind       | Action                          |
|---------------|---------------------------------|
| `<leader>m`   | Open Maven Test Runner UI       |
| `<leader>c`   | Close Maven Test Runner UI      |
| `<CR>`        | Execute Maven test              |


## Installation ##
* neovim 0.5.0+ required :exclamation:
* Dependecies: treesiter
* Install using your plugin manager

`Packer`  
```lua
use 'jkeresman01/maven-test-runner.nvim'
```

`Vim-Plug`  
```lua
Plug 'jkeresman01/maven-test-runner.nvim'
```

`dein`  
```lua
call dein#add('jkeresman01/maven-test-runner.nvim')
```

`paq`  
```lua
'jkeresman01/maven-test-runner.nvim';
```

`layz.nvim`  
```lua
-- plugins/maven-test-runner.lua:
return {
     'jkeresman01/maven-test-runner.nvim'
}
```

## Customization ##
If you wan't to customize the keymapings you can do so, here is an example:

```lua
local ui  = require("maven-test-runner.ui")
local mvn = require("maven-test-runner.mvn")

vim.keymap.set("n", "<leader>u", function() ui.open() end)          --  Open Maven Test Runner UI  
vim.keymap.set("n", "<leader>c", function() ui.close() end)         --  Close Maven Test Runner UI
vim.keymap.set("n", "<leader>m", function() mvn.execute() end)      --  Execute Maven Test|Tests  
```
