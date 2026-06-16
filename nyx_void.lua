-- NYX VOID - Xeno Compatible (Safe like Infinite Yield)
print('NYX VOID Loading...')

if getgenv().NyxVoidLoaded then
    print('NYX VOID already loaded')
    return
end
getgenv().NyxVoidLoaded = true

-- Safe PlayerGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui", 10)

local sg = Instance.new("ScreenGui")
sg.Name = "NyxVoid"
sg.ResetOnSpawn = false
sg.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 280)
frame.Position = UDim2.new(0.5, -225, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "NYX VOID"
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 26
title.Font = Enum.Font.GothamBold
title.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 1, -80)
status.Position = UDim2.new(0, 0, 0, 50)
status.BackgroundTransparency = 1
status.Text = "Loaded Successfully on Xeno\nMinimal Safe Version"
status.TextColor3 = Color3.new(1,1,1)
status.TextSize = 18
status.Parent = frame

print("✅ NYX VOID Loaded Successfully on Xeno")

local unload = Instance.new("TextButton")
unload.Size = UDim2.new(0, 130, 0, 40)
unload.Position = UDim2.new(0.5, -65, 1, -55)
unload.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
unload.Text = "UNLOAD"
unload.TextColor3 = Color3.new(1,1,1)
unload.Parent = frame

unload.MouseButton1Click:Connect(function()
    sg:Destroy()
    getgenv().NyxVoidLoaded = nil
    print("NYX VOID Unloaded")
end)
