##### First create a lua file  in your init.lua file

```lua
function Todo()
    print("Hello world")
end
```

- Then you can source the file
```bash
:so %
```

##### Invoke the function
```bash
:lua Todo()
```

### Create lua triggers
```lua
function Todo()
    print("Hello world")
end

vim.api.nvim_create_user_command("Todo", Todo, {})

```

#### Source the file again
```bash
:so %
```

Then you can call the funciton directly in the command mode
```lua
:Todo
```

Create auto_cmd when an events fires
```lua
vim.api.nvim_create_autocmd("CursorHold", {callback = Todo})
```

### Create keymap 
```lua
vim.keymap.set("n", "<leader>u", Todo)
```


### Create a plugin
```bash
mkdir xyborg/
cd xyborg
mkdir lua
cd lua
nvim <nameof plugin>.lua # e.g nvim xyborg.lua
```

Then write the plugin
```lua
-- Create an empty lua table 
local M = {}

M.todo = function()
    print("i just wrote a function")
end


return M
```

You can push this to github and people will install this.

### Local development
To use this locally, run
```bash
nvim --cmd "set rtp+=." lua/xyborg.lua
```
