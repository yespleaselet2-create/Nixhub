-- NIX HUB WITH DETAILED ERROR LOGGING
print('=== NIX HUB STARTING ===')

local function safeExecute(name, func)
    local success, err = pcall(func)
    if not success then
        warn('❌ ERROR in ' .. name .. ': ' .. tostring(err))
        return false
    end
    print('✅ ' .. name .. ' loaded')
    return true
end

local function setup()
    print('[1/3] Getting player...')
    local player = game:GetService('Players').LocalPlayer
    if not player then
        error('Player not found!')
    end
    print('✅ Player: ' .. player.Name)
    
    print('[2/3] Waiting for PlayerGui...')
    local playerGui = player:WaitForChild('PlayerGui', 10)
    if not playerGui then
        error('PlayerGui timeout after 10 seconds')
    end
    print('✅ PlayerGui found')
    
    print('[3/3] Creating loading screen...')
    
    -- CREATE LOADING SCREEN
    local loadGui = Instance.new('ScreenGui')
    loadGui.Name = 'LoadingScreen'
    loadGui.ResetOnSpawn = false
    
    local bg = Instance.new('Frame')
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    bg.BorderSizePixel = 0
    bg.Parent = loadGui
    print('  ✓ Background created')
    
    local container = Instance.new('Frame')
    container.Size = UDim2.new(0, 300, 0, 300)
    container.Position = UDim2.new(0.5, -150, 0.5, -150)
    container.BackgroundTransparency = 1
    container.Parent = bg
    print('  ✓ Container created')
    
    local logo = Instance.new('Frame')
    logo.Size = UDim2.new(0, 150, 0, 150)
    logo.Position = UDim2.new(0.5, -75, 0.2, 0)
    logo.BackgroundColor3 = Color3.fromRGB(255, 100, 200)
    logo.BorderSizePixel = 0
    logo.Parent = container
    print('  ✓ Logo frame created')
    
    local logoCorner = Instance.new('UICorner')
    logoCorner.CornerRadius = UDim.new(1, 0)
    logoCorner.Parent = logo
    print('  ✓ Logo corner created')
    
    local bolt = Instance.new('TextLabel')
    bolt.Size = UDim2.new(1, 0, 1, 0)
    bolt.BackgroundTransparency = 1
    bolt.Text = '⚡'
    bolt.TextColor3 = Color3.new(1, 1, 1)
    bolt.TextSize = 80
    bolt.Font = Enum.Font.GothamBold
    bolt.Parent = logo
    print('  ✓ Bolt text created')
    
    local loadText = Instance.new('TextLabel')
    loadText.Size = UDim2.new(1, 0, 0, 50)
    loadText.Position = UDim2.new(0, 0, 0.6, 0)
    loadText.BackgroundTransparency = 1
    loadText.Text = 'NIX HUB'
    loadText.TextColor3 = Color3.fromRGB(255, 100, 200)
    loadText.TextSize = 28
    loadText.Font = Enum.Font.GothamBold
    loadText.Parent = container
    print('  ✓ Load text created')
    
    local barBg = Instance.new('Frame')
    barBg.Size = UDim2.new(1, 0, 0, 8)
    barBg.Position = UDim2.new(0, 0, 0.8, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    barBg.BorderSizePixel = 0
    barBg.Parent = container
    print('  ✓ Bar background created')
    
    local barFill = Instance.new('Frame')
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(255, 100, 200)
    barFill.BorderSizePixel = 0
    barFill.Parent = barBg
    print('  ✓ Bar fill created')
    
    -- Set parent LAST
    loadGui.Parent = playerGui
    print('✅ Loading screen created and shown')
    
    print('[ANIMATING] Starting animation loop...')
    local rotation = 0
    local fillAmount = 0
    local animating = true
    local loopCount = 0
    
    while animating do
        loopCount = loopCount + 1
        
        rotation = (rotation + 5) % 360
        logo.Rotation = rotation
        
        if fillAmount < 100 then
            fillAmount = fillAmount + 0.5
            barFill.Size = UDim2.new(fillAmount / 100, 0, 1, 0)
        end
        
        if loopCount % 50 == 0 then
            print(string.format('  Loading: %.0f%%', fillAmount))
        end
        
        if fillAmount >= 100 then
            wait(0.5)
            animating = false
            print('✅ Animation complete')
        end
        
        wait(0.016)
    end
    
    wait(0.5)
    loadGui:Destroy()
    print('✅ Loading screen destroyed')
    
    -- KEY SYSTEM
    print('[4/4] Creating key system...')
    local screenGui = Instance.new('ScreenGui')
    screenGui.Name = 'NixKeySystem'
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    print('  ✓ ScreenGui created')
    
    local frame = Instance.new('Frame')
    frame.Size = UDim2.new(0, 350, 0, 200)
    frame.Position = UDim2.new(0.5, -175, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    frame.Parent = screenGui
    print('  ✓ Frame created')
    
    local corner = Instance.new('UICorner')
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame
    print('  ✓ Corner created')
    
    local title = Instance.new('TextLabel')
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Text = '🔐 KEY SYSTEM'
    title.TextColor3 = Color3.fromRGB(255, 100, 200)
    title.TextSize = 22
    title.Font = Enum.Font.GothamBold
    title.Parent = frame
    print('  ✓ Title created')
    
    local input = Instance.new('TextBox')
    input.Size = UDim2.new(0, 300, 0, 40)
    input.Position = UDim2.new(0.5, -150, 0.3, 0)
    input.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    input.TextColor3 = Color3.new(1, 1, 1)
    input.PlaceholderText = 'Paste key'
    input.Parent = frame
    print('  ✓ Input box created')
    
    local btn = Instance.new('TextButton')
    btn.Size = UDim2.new(0, 300, 0, 40)
    btn.Position = UDim2.new(0.5, -150, 0.65, 0)
    btn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    btn.Text = 'VERIFY'
    btn.TextColor3 = Color3.new(0, 0, 0)
    btn.Parent = frame
    print('  ✓ Button created')
    print('✅ KEY SYSTEM READY')
    
    btn.MouseButton1Click:Connect(function()
        print('[KEY CHECK] Entered: ' .. input.Text .. ' (length: ' .. string.len(input.Text) .. ')')
        if string.len(input.Text) == 10 then
            print('✅ KEY VALID - Destroying GUI')
            screenGui:Destroy()
            print('✅ HUB UNLOCKED')
        else
            print('❌ KEY INVALID - Must be 10 characters')
            input.PlaceholderText = 'Invalid! Must be 10 chars'
        end
    end)
end

-- RUN WITH ERROR HANDLING
local success, err = pcall(setup)
if not success then
    warn('==============================')
    warn('FATAL ERROR:')
    warn(err)
    warn('==============================')
else
    print('==============================')
    print('✅ NIX HUB FULLY LOADED')
    print('==============================')
end
