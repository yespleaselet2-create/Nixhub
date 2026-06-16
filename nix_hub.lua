print('Starting...')

local player = game.Players.LocalPlayer
local gui = player.PlayerGui

local screen = Instance.new('ScreenGui')
screen.Parent = gui

local bg = Instance.new('Frame')
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
bg.Parent = screen

local logo = Instance.new('Frame')
logo.Size = UDim2.new(0, 150, 0, 150)
logo.Position = UDim2.new(0.5, -75, 0.5, -75)
logo.BackgroundColor3 = Color3.fromRGB(255, 100, 200)
logo.Parent = bg

local text = Instance.new('TextLabel')
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = '⚡'
text.TextSize = 80
text.TextColor3 = Color3.new(1, 1, 1)
text.Parent = logo

wait(2)
screen:Destroy()

print('✅ DONE')
