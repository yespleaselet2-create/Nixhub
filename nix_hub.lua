-- NIX HUB LOADING SCREEN
print('Loading...')

local player = game:GetService('Players').LocalPlayer
local playerGui = player:WaitForChild('PlayerGui')

-- CREATE LOADING SCREEN
local loadGui = Instance.new('ScreenGui')
loadGui.Name = 'LoadingScreen'
loadGui.ResetOnSpawn = false
loadGui.Parent = playerGui

-- Background
local bg = Instance.new('Frame')
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
bg.BorderSizePixel = 0
bg.Parent = loadGui

-- Center container
local container = Instance.new('Frame')
container.Size = UDim2.new(0, 300, 0, 300)
container.Position = UDim2.new(0.5, -150, 0.5, -150)
container.BackgroundTransparency = 1
container.Parent = loadGui

-- Logo circle (PINK)
local logo = Instance.new('Frame')
logo.Size = UDim2.new(0, 150, 0, 150)
logo.Position = UDim2.new(0.5, -75, 0.2, 0)
logo.BackgroundColor3 = Color3.fromRGB(255, 100, 200)
logo.BorderSizePixel = 0
logo.Parent = container

local logoCorner = Instance.new('UICorner')
logoCorner.CornerRadius = UDim.new(1, 0)
logoCorner.Parent = logo

-- Inner logo design (lightning bolt style)
local bolt = Instance.new('TextLabel')
bolt.Size = UDim2.new(1, 0, 1, 0)
bolt.BackgroundTransparency = 1
bolt.Text = '⚡'
bolt.TextColor3 = Color3.new(1, 1, 1)
bolt.TextSize = 80
bolt.Font = Enum.Font.GothamBold
bolt.Parent = logo

-- Loading text
local loadText = Instance.new('TextLabel')
loadText.Size = UDim2.new(1, 0, 0, 50)
loadText.Position = UDim2.new(0, 0, 0.6, 0)
loadText.BackgroundTransparency = 1
loadText.Text = 'NIX HUB'
loadText.TextColor3 = Color3.fromRGB(255, 100, 200)
loadText.TextSize = 28
loadText.Font = Enum.Font.GothamBold
loadText.Parent = container

-- Loading bar background
local barBg = Instance.new('Frame')
barBg.Size = UDim2.new(1, 0, 0, 8)
barBg.Position = UDim2.new(0, 0, 0.8, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
barBg.BorderSizePixel = 0
barBg.Parent = container

-- Loading bar fill
local barFill = Instance.new('Frame')
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 100, 200)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

-- ANIMATION LOOP
local rotation = 0
local fillAmount = 0
local animating = true

while animating do
    -- Rotate logo
    rotation = (rotation + 5) % 360
    logo.Rotation = rotation
    
    -- Fill loading bar
    if fillAmount < 100 then
        fillAmount = fillAmount + 0.5
        barFill.Size = UDim2.new(fillAmount / 100, 0, 1, 0)
    end
    
    -- When loaded
    if fillAmount >= 100 then
        wait(0.5)
        animating = false
    end
    
    wait(0.016) -- 60 FPS
end

-- FADE OUT
wait(0.5)
loadGui:Destroy()

-- SHOW KEY SYSTEM
local screenGui = Instance.new('ScreenGui')
screenGui.Name = 'NixKeySystem'
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local frame = Instance.new('Frame')
frame.Size = UDim2.new(0, 350, 0, 200)
frame.Position = UDim2.new(0.5, -175, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.Parent = screenGui

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new('TextLabel')
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = '🔐 KEY SYSTEM'
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = frame

local input = Instance.new('TextBox')
input.Size = UDim2.new(0, 300, 0, 40)
input.Position = UDim2.new(0.5, -150, 0.3, 0)
input.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = 'Paste key'
input.Parent = frame

local btn = Instance.new('TextButton')
btn.Size = UDim2.new(0, 300, 0, 40)
btn.Position = UDim2.new(0.5, -150, 0.65, 0)
btn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
btn.Text = 'VERIFY'
btn.TextColor3 = Color3.new(0, 0, 0)
btn.Parent = frame

btn.MouseButton1Click:Connect(function()
    if string.len(input.Text) == 10 then
        screenGui:Destroy()
        print('✅ KEY VERIFIED')
    else
        input.PlaceholderText = 'Invalid key!'
    end
end)

print('✅ Ready')
