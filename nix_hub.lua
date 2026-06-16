-- NIX HUB - CLEAN VERSION
print('Loading NIX HUB...')

if getgenv().NixHubLoaded then return end
getgenv().NixHubLoaded = true

-- Wait for everything to be ready
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local player = game.Players.LocalPlayer
if not player then print('No player') return end

local playerGui = player:WaitForChild('PlayerGui')
if not playerGui then print('No PlayerGui') return end

-- CREATE KEY SYSTEM SCREEN
local screenGui = Instance.new('ScreenGui')
screenGui.Name = 'NixKeySystem'
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main frame
local frame = Instance.new('Frame')
frame.Name = 'KeyFrame'
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = frame

-- Title
local title = Instance.new('TextLabel')
title.Name = 'Title'
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.Text = '🔐 NIX HUB'
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Input box
local inputBox = Instance.new('TextBox')
inputBox.Name = 'KeyInput'
inputBox.Size = UDim2.new(0, 350, 0, 50)
inputBox.Position = UDim2.new(0.5, -175, 0, 80)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
inputBox.TextColor3 = Color3.new(1, 1, 1)
inputBox.TextSize = 16
inputBox.PlaceholderText = 'Paste your key here'
inputBox.ClearTextOnFocus = false
inputBox.Parent = frame

-- Verify button
local verifyBtn = Instance.new('TextButton')
verifyBtn.Name = 'VerifyButton'
verifyBtn.Size = UDim2.new(0, 350, 0, 50)
verifyBtn.Position = UDim2.new(0.5, -175, 0, 150)
verifyBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
verifyBtn.TextColor3 = Color3.new(0, 0, 0)
verifyBtn.Text = 'VERIFY'
verifyBtn.TextSize = 18
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.Parent = frame

verifyBtn.MouseButton1Click:Connect(function()
    local key = inputBox.Text
    print('Key entered: ' .. key)
    
    if string.len(key) == 10 then
        print('✅ Valid key!')
        screenGui:Destroy()
        wait(0.5)
        loadHub()
    else
        inputBox.PlaceholderText = 'Invalid key! Must be 10 characters'
        inputBox.Text = ''
    end
end)

function loadHub()
    print('Loading HUB...')
    
    local hubGui = Instance.new('ScreenGui')
    hubGui.Name = 'NixHub'
    hubGui.ResetOnSpawn = false
    hubGui.Parent = playerGui
    
    local hubFrame = Instance.new('Frame')
    hubFrame.Name = 'HubFrame'
    hubFrame.Size = UDim2.new(0, 600, 0, 500)
    hubFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
    hubFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    hubFrame.BorderSizePixel = 0
    hubFrame.Parent = hubGui
    
    local hubCorner = Instance.new('UICorner')
    hubCorner.CornerRadius = UDim.new(0, 15)
    hubCorner.Parent = hubFrame
    
    local hubTitle = Instance.new('TextLabel')
    hubTitle.Name = 'Title'
    hubTitle.Size = UDim2.new(1, 0, 0, 60)
    hubTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    hubTitle.Text = '⚔️ NIX HUB'
    hubTitle.TextColor3 = Color3.fromRGB(255, 100, 200)
    hubTitle.TextSize = 24
    hubTitle.Font = Enum.Font.GothamBold
    hubTitle.BorderSizePixel = 0
    hubTitle.Parent = hubFrame
    
    local hubCorner2 = Instance.new('UICorner')
    hubCorner2.CornerRadius = UDim.new(0, 15)
    hubCorner2.Parent = hubTitle
    
    -- Button function
    local function createButton(name, text, position, callback)
        local btn = Instance.new('TextButton')
        btn.Name = name
        btn.Size = UDim2.new(0, 140, 0, 50)
        btn.Position = position
        btn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Text = text
        btn.TextSize = 14
        btn.Font = Enum.Font.GothamBold
        btn.Parent = hubFrame
        
        local btnCorner = Instance.new('UICorner')
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        
        btn.MouseButton1Click:Connect(callback)
        return btn
    end
    
    -- AIMBOT
    local aimbotActive = false
    createButton('Aimbot', '🎯 AIMBOT', UDim2.new(0, 20, 0, 80), function()
        aimbotActive = not aimbotActive
        print(aimbotActive and '✅ AIMBOT ON' or '❌ AIMBOT OFF')
    end)
    
    -- SPEED
    local speedActive = false
    createButton('Speed', '⚡ SPEED', UDim2.new(0.35, 0, 0, 80), function()
        speedActive = not speedActive
        if speedActive and player.Character then
            player.Character.Humanoid.WalkSpeed = 50
            print('✅ SPEED ON')
        elseif player.Character then
            player.Character.Humanoid.WalkSpeed = 16
            print('❌ SPEED OFF')
        end
    end)
    
    -- GOD MODE
    local godActive = false
    createButton('GodMode', '🛡️ GOD MODE', UDim2.new(0.7, 0, 0, 80), function()
        godActive = not godActive
        print(godActive and '✅ GOD MODE ON' or '❌ GOD MODE OFF')
    end)
    
    -- WALLHACK
    createButton('Wallhack', '👁️ WALLHACK', UDim2.new(0, 20, 0, 150), function()
        print('👁️ WALLHACK toggled')
    end)
    
    -- ESP
    createButton('ESP', '🔍 ESP', UDim2.new(0.35, 0, 0, 150), function()
        print('🔍 ESP toggled')
    end)
    
    -- TELEPORT
    createButton('Teleport', '📍 TELEPORT', UDim2.new(0.7, 0, 0, 150), function()
        print('📍 TELEPORT toggled')
    end)
    
    -- CLOSE BUTTON
    local closeBtn = Instance.new('TextButton')
    closeBtn.Name = 'CloseButton'
    closeBtn.Size = UDim2.new(0, 140, 0, 50)
    closeBtn.Position = UDim2.new(0.5, -70, 1, -70)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.Text = '❌ CLOSE'
    closeBtn.TextSize = 14
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = hubFrame
    
    local closeCorner = Instance.new('UICorner')
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        hubGui:Destroy()
    end)
    
    print('✅ HUB LOADED!')
end

print('✅ NIX HUB READY - Waiting for key...')
