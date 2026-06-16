print('🔐 NIX HUB STARTING')

if getgenv().NixHubLoaded then 
    warn('Already loaded')
    return 
end
getgenv().NixHubLoaded = true

local player = game:GetService('Players').LocalPlayer
local playerGui = player:WaitForChild('PlayerGui')

-- KEY SYSTEM GUI
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
title.Text = '🔐 NIX HUB'
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

local verified = false

btn.MouseButton1Click:Connect(function()
    if string.len(input.Text) == 10 then
        verified = true
        screenGui:Destroy()
        showHub()
    else
        input.PlaceholderText = 'Invalid!'
    end
end)

function showHub()
    print('✅ HUB LOADED')
    
    local hubGui = Instance.new('ScreenGui')
    hubGui.Name = 'NixHub'
    hubGui.ResetOnSpawn = false
    hubGui.Parent = playerGui
    
    local hubFrame = Instance.new('Frame')
    hubFrame.Size = UDim2.new(0, 500, 0, 400)
    hubFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    hubFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    hubFrame.Parent = hubGui
    
    local hubCorner = Instance.new('UICorner')
    hubCorner.CornerRadius = UDim.new(0, 12)
    hubCorner.Parent = hubFrame
    
    local hubTitle = Instance.new('TextLabel')
    hubTitle.Size = UDim2.new(1, 0, 0, 50)
    hubTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    hubTitle.Text = '⚔️ NIX HUB'
    hubTitle.TextColor3 = Color3.fromRGB(255, 100, 200)
    hubTitle.TextSize = 20
    hubTitle.Font = Enum.Font.GothamBold
    hubTitle.Parent = hubFrame
    
    -- AIMBOT BUTTON
    local aimbotBtn = Instance.new('TextButton')
    aimbotBtn.Size = UDim2.new(0, 180, 0, 50)
    aimbotBtn.Position = UDim2.new(0.1, 0, 0.15, 0)
    aimbotBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    aimbotBtn.Text = '🎯 AIMBOT'
    aimbotBtn.TextColor3 = Color3.new(0, 0, 0)
    aimbotBtn.Parent = hubFrame
    
    aimbotBtn.MouseButton1Click:Connect(function()
        print('AIMBOT toggled')
    end)
    
    -- SPEED BUTTON
    local speedBtn = Instance.new('TextButton')
    speedBtn.Size = UDim2.new(0, 180, 0, 50)
    speedBtn.Position = UDim2.new(0.55, 0, 0.15, 0)
    speedBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    speedBtn.Text = '⚡ SPEED'
    speedBtn.TextColor3 = Color3.new(1, 1, 1)
    speedBtn.Parent = hubFrame
    
    speedBtn.MouseButton1Click:Connect(function()
        player.Character.Humanoid.WalkSpeed = 50
        print('SPEED ON')
    end)
    
    -- GOD MODE BUTTON
    local godBtn = Instance.new('TextButton')
    godBtn.Size = UDim2.new(0, 180, 0, 50)
    godBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
    godBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 100)
    godBtn.Text = '🛡️ GOD MODE'
    godBtn.TextColor3 = Color3.new(1, 1, 1)
    godBtn.Parent = hubFrame
    
    godBtn.MouseButton1Click:Connect(function()
        print('GOD MODE toggled')
    end)
end

print('✅ NIX HUB READY')
