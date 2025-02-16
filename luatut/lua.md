### install lua
```bash
sudo apt remove --purge lua5.* -y
sudo apt autoremove -y
sudo apt install lua5.4 -y
```

## Lua Tutorial for Beginners

_Lua is a lightweight, fast, and powerful scripting language often used for game development, embedded systems, and automation. This tutorial will cover the basics to help you get started._

### Installing Lua
Before you begin coding, you need to install Lua on your system.

- Windows: Download Lua from LuaBinaries or use WSL if you're on Windows.
- Linux/macOS: You can install it via the package manager:
- Ubuntu/Debian: `sudo apt install lua5.3`
- macOS: `brew install lua`
To check if Lua is installed, run:

```bash
lua -v
```

### Running Lua Code
You can run Lua in two ways:

- Interactive Mode: Type `lua` in the terminal and enter Lua commands.
- Script Mode: Save a file as script.lua and run it with:
```bash
lua script.lua
```

### Hello, World!
The first program in any language:

```lua
print("Hello, World!")
```
Run this in a Lua file or the interactive shell.

### Variables and Data Types
Lua has dynamic typing, meaning you don’t need to declare variable types.

```lua
name = "Lua"     -- String
age = 25         -- Number
isAwesome = true -- Boolean
score = nil      -- Nil (absence of value)
```

### Conditional Statements
Use if, elseif, and else for decision-making.

```lua
x = 10
if x > 0 then
    print("Positive number")
elseif x < 0 then
    print("Negative number")
else
    print("Zero")
end
```

### Loops in Lua
While Loop
```lua
i = 1
while i <= 5 do
    print(i)
    i = i + 1
end

```

For Loop
```lua
for i = 1, 5 do
    print(i)
end
```

Repeat Until (Similar to Do-While Loop)
```lua
i = 1
repeat
    print(i)
    i = i + 1
until i > 5
```

### Functions
Functions help organize code into reusable blocks.

```lua
function greet(name)
    return "Hello, " .. name
end

print(greet("John"))  -- Output: Hello, John
```

### Tables (Lua’s Data Structure)
Tables are similar to arrays or dictionaries in other languages.

```lua
-- Array-like table
fruits = {"Apple", "Banana", "Cherry"}
print(fruits[1]) -- Lua indexes start at 1

-- Key-value table
person = {name = "Alice", age = 30}
print(person.name)
```

### Metatables (Advanced Feature)
Metatables allow custom behavior for tables.

```lua
t = {10, 20, 30}
mt = {
    __add = function(a, b)
        return a[1] + b[1]
    end
}
setmetatable(t, mt)
print(t + t)  -- Output: 20
```

### Object-Oriented Programming (OOP) in Lua
Lua doesn’t have classes, but you can use tables and metatables for OOP.

```lua
Person = {}
Person.__index = Person

function Person:new(name, age)
    local obj = {name = name, age = age}
    setmetatable(obj, self)
    return obj
end

function Person:show()
    print("Name: " .. self.name .. ", Age: " .. self.age)
end

p1 = Person:new("John", 25)
p1:show()
```

### Working with Files

Lua provides simple file-handling capabilities.

```lua
file = io.open("test.txt", "w")
file:write("Hello, Lua!")
file:close()
```

### Error Handling
Use pcall (protected call) to handle errors.

```lua
status, err = pcall(function()
    error("Something went wrong!")
end)

print(err)  -- Output: Something went wrong!
```

### Using Modules
Modules help in organizing code.

```lua
-- mymodule.lua
local mymodule = {}

function mymodule.sayHello()
    return "Hello from module!"
end

return mymodule
```

```lua
-- main.lua
local mymodule = require("mymodule")
print(mymodule.sayHello())
```

### Coroutines (Lightweight Threads)
Coroutines allow cooperative multitasking.

```lua
co = coroutine.create(function()
    for i = 1, 5 do
        print(i)
        coroutine.yield()  -- Pause execution
    end
end)

coroutine.resume(co)  -- Runs first iteration
coroutine.resume(co)  -- Runs second iteration
``` 


### io.write
```bash

shout = "yay"
io.write("size of yay is: ", #shout, "\n")
```
