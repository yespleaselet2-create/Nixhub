local player = game.Players.LocalPlayer
local gui = player.PlayerGui

local screen = Instance.new('ScreenGui')
screen.Parent = gui

local frame = Instance.new('Frame')
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.Parent = screen

local title = Instance.new('TextLabel')
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = 'NIX KEY'
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 20
title.Parent = frame

local input = Instance.new('TextBox')
input.Size = UDim2.new(0, 280, 0, 35)
input.Position = UDim2.new(0.5, -140, 0.3, 0)
input.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = 'Paste key from Discord'
input.Parent = frame

local btn = Instance.new('TextButton')
btn.Size = UDim2.new(0, 280, 0, 35)
btn.Position = UDim2.new(0.5, -140, 0.65, 0)
btn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
btn.Text = 'VERIFY'
btn.TextColor3 = Color3.new(0, 0, 0)
btn.Parent = frame

btn.MouseButton1Click:Connect(function()
    if string.len(input.Text) == 10 then
        print('KEY VERIFIED')
        screen:Destroy()
    else
        input.PlaceholderText = 'Invalid (needs 10 chars)'
    end
end)

print('Waiting for key...')
