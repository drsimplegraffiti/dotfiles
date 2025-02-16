print("hello")

local name = "james"
age = 89

print(name, age)
print(true)

if age > 90 then
    print("old man")
elseif name == "james" then
    print("dunno")
else
    print("done")
end


i = 1

while i < 3 do 
    print(i)
    i = i + 1
end

function greet(name)
    return "Hello " ..name
end

print(greet("james"))


fruits = {"pickle", "mango"}
print(fruits[1])

shout = "yay"
io.write("size of yay is: ", #shout, "\n")
