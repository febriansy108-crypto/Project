--[[
╔══════════════════════════════════════════╗
║   ESCAPE TSUNAMI FOR BRAINROT - CHEAT MENU  ║
║        Fitur Lengkap Tsunami Edition        ║
╚══════════════════════════════════════════╝
]]

-- Configuration
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/swiftshix2/ETFB/refs/heads/main/lua"))() or loadstring(game:HttpGet("https://pastebin.com/raw/XYZ12345"))()

-- Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local virtualUser = game:GetService("VirtualUser")

-- Main GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TabHolder = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- GUI Setup
ScreenGui.Name = "TsunamiCheat"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true

-- Rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Title
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌊 TSUNAMI BRAINROT HUB 🌊"
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.TextSize = 20
Title.BorderSizePixel = 0

-- Title corners
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

-- Tab Holder
TabHolder.Name = "TabHolder"
TabHolder.Parent = MainFrame
TabHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TabHolder.BorderSizePixel = 0
TabHolder.Position = UDim2.new(0, 0, 0.08, 0)
TabHolder.Size = UDim2.new(1, 0, 0, 35)

-- Scrolling Frame for buttons
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 0, 0.15, 0)
ScrollingFrame.Size = UDim2.new(1, 0, 0.85, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 8

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- Function to create buttons
local function createButton(name, callback, color)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Parent = ScrollingFrame
    Button.BackgroundColor3 = color or Color3.fromRGB(45, 45, 55)
    Button.Size = UDim2.new(0.95, 0, 0, 40)
    Button.Font = Enum.Font.Gotham
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 16
    Button.AutoButtonColor = false
    Button.BorderSizePixel = 0
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button
    
    Button.MouseButton1Click:Connect(callback)
    
    return Button
end

-- Function to create toggle
local function createToggle(name, callback, default)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Parent = ScrollingFrame
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    ToggleFrame.Size = UDim2.new(0.95, 0, 0, 40)
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 6)
    ToggleCorner.Parent = ToggleFrame
    
    local Label = Instance.new("TextLabel")
    Label.Parent = ToggleFrame
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Font = Enum.Font.Gotham
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 16
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Position = UDim2.new(0.02, 0, 0, 0)
    
    local Toggle = Instance.new("TextButton")
    Toggle.Parent = ToggleFrame
    Toggle.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    Toggle.Size = UDim2.new(0.25, 0, 0.7, 0)
    Toggle.Position = UDim2.new(0.73, 0, 0.15, 0)
    Toggle.Font = Enum.Font.Gotham
    Toggle.Text = "OFF"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 14
    Toggle.BorderSizePixel = 0
    
    local ToggleCorner2 = Instance.new("UICorner")
    ToggleCorner2.CornerRadius = UDim.new(0, 4)
    ToggleCorner2.Parent = Toggle
    
    local enabled = default or false
    
    Toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        Toggle.BackgroundColor3 = enabled and Color3.fromRGB(70, 255, 70) or Color3.fromRGB(255, 70, 70)
        Toggle.Text = enabled and "ON" or "OFF"
        callback(enabled)
    end)
    
    return ToggleFrame
end

-- ============================================
-- 🌪️ FITUR TSUNAMI UTAMA
-- ============================================

-- Auto Farm & Collect
createButton("⚡ AUTO GRAB BRAINROTS", function()
    getgenv().AutoGrab = not getgenv().AutoGrab
    
    if getgenv().AutoGrab then
        createButton("⚡ AUTO GRAB BRAINROTS (AKTIF)", nil, Color3.fromRGB(70, 255, 70))
        
        spawn(function()
            while getgenv().AutoGrab do
                pcall(function()
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Part") and v.Name:find("Brainrot") then
                            firetouchinterest(player.Character.HumanoidRootPart, v, 0)
                            wait(0.1)
                        end
                    end
                end)
                wait(0.5)
            end
        end)
    else
        createButton("⚡ AUTO GRAB BRAINROTS", nil, Color3.fromRGB(45, 45, 55))
    end
end)

-- God Mode
createToggle("🛡️ GOD MODE", function(state)
    getgenv().GodMode = state
    
    if state then
        spawn(function()
            while getgenv().GodMode do
                pcall(function()
                    player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
                    
                    -- Anti Tsunami damage
                    if player.Character:FindFirstChild("TouchedTsunami") then
                        player.Character.TouchedTsunami:Destroy()
                    end
                end)
                wait(0.1)
            end
        end)
    end
end)

-- Fly Mode
createToggle("🦅 FLY MODE", function(state)
    local flying = state
    local speed = 50
    local bodyVelocity = Instance.new("BodyVelocity")
    local bodyGyro = Instance.new("BodyGyro")
    
    if flying then
        bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * math.huge
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyGyro.MaxTorque = Vector3.new(1, 1, 1) * math.huge
        bodyGyro.CFrame = player.Character.HumanoidRootPart.CFrame
        bodyGyro.P = 1000
        
        bodyVelocity.Parent = player.Character.HumanoidRootPart
        bodyGyro.Parent = player.Character.HumanoidRootPart
        
        player.Character.Humanoid.PlatformStand = true
        
        spawn(function()
            while flying do
                wait()
                local moveDirection = Vector3.new(0, 0, 0)
                
                if userInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveDirection = moveDirection + workspace.CurrentCamera.CFrame.LookVector
                end
                if userInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveDirection = moveDirection - workspace.CurrentCamera.CFrame.LookVector
                end
                if userInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveDirection = moveDirection - workspace.CurrentCamera.CFrame.RightVector
                end
                if userInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveDirection = moveDirection + workspace.CurrentCamera.CFrame.RightVector
                end
                if userInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveDirection = moveDirection + Vector3.new(0, 1, 0)
                end
                if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveDirection = moveDirection - Vector3.new(0, 1, 0)
                end
                
                if moveDirection.Magnitude > 0 then
                    moveDirection = moveDirection.Unit * speed
                end
                
                bodyVelocity.Velocity = moveDirection
                bodyGyro.CFrame = workspace.CurrentCamera.CFrame
            end
        end)
    else
        if bodyVelocity and bodyGyro then
            bodyVelocity:Destroy()
            bodyGyro:Destroy()
        end
        player.Character.Humanoid.PlatformStand = false
    end
end)

-- Speed Boost
createButton("💨 SPEED BOOST", function()
    local speed = 100
    player.Character.Humanoid.WalkSpeed = speed
    createButton("💨 SPEED: " .. speed .. " (AKTIF)", nil, Color3.fromRGB(70, 255, 70))
end)

-- Reset Speed
createButton("🐢 RESET SPEED", function()
    player.Character.Humanoid.WalkSpeed = 16
    createButton("💨 SPEED BOOST", nil, Color3.fromRGB(45, 45, 55))
end)

-- Infinite Jump
createToggle("🦘 INFINITE JUMP", function(state)
    if state then
        userInputService.JumpRequest:Connect(function()
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
end)

-- ============================================
-- 💰 FITUR MUTATION & COLLECT
-- ============================================

-- Instant Mutation (God, Secret, Legendary)
createButton("👑 INSTANT GOD MUTATION", function()
    for i = 1, 8 do
        local args = {
            [1] = "God"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimMutation"):InvokeServer(unpack(args))
        wait(0.1)
    end
    createButton("✓ GOD MUTATION CLAIMED (8x)", nil, Color3.fromRGB(70, 255, 70))
end)

createButton("🔮 INSTANT SECRET MUTATION", function()
    for i = 1, 8 do
        local args = {
            [1] = "Secret"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimMutation"):InvokeServer(unpack(args))
        wait(0.1)
    end
    createButton("✓ SECRET MUTATION CLAIMED (8x)", nil, Color3.fromRGB(70, 255, 70))
end)

createButton("✨ INSTANT LEGENDARY", function()
    for i = 1, 8 do
        local args = {
            [1] = "Legendary"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimMutation"):InvokeServer(unpack(args))
        wait(0.1)
    end
    createButton("✓ LEGENDARY CLAIMED (8x)", nil, Color3.fromRGB(70, 255, 70))
end)

-- Token Multiplier
createButton("💰 TOKEN MULTIPLIER 10x", function()
    local args = {
        [1] = "TokenMultiplier",
        [2] = 10
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseUpgrade"):InvokeServer(unpack(args))
    createButton("✓ TOKEN 10x AKTIF", nil, Color3.fromRGB(70, 255, 70))
end)

-- ============================================
-- 🏃 FITUR AUTO FARM
-- ============================================

-- Auto Buy Upgrade
createToggle("🔄 AUTO BUY SPEED 10x", function(state)
    getgenv().AutoBuySpeed = state
    
    if state then
        spawn(function()
            while getgenv().AutoBuySpeed do
                pcall(function()
                    local args = {
                        [1] = "Speed",
                        [2] = 10
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseUpgrade"):InvokeServer(unpack(args))
                end)
                wait(1)
            end
        end)
    end
end)

createToggle("📦 AUTO BUY CARRY", function(state)
    getgenv().AutoBuyCarry = state
    
    if state then
        spawn(function()
            while getgenv().AutoBuyCarry do
                pcall(function()
                    local args = {
                        [1] = "Carry"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseUpgrade"):InvokeServer(unpack(args))
                end)
                wait(1)
            end
        end)
    end
end)

-- Auto Rebirth
createToggle("🔄 AUTO REBIRTH", function(state)
    getgenv().AutoRebirth = state
    
    if state then
        spawn(function()
            while getgenv().AutoRebirth do
                pcall(function()
                    local args = {
                        [1] = "Rebirth"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseUpgrade"):InvokeServer(unpack(args))
                end)
                wait(5)
            end
        end)
    end
end)

-- Auto Upgrade Brainrot
createToggle("📈 AUTO UPGRADE BRAINROT (ALL)", function(state)
    getgenv().AutoUpgrade = state
    
    if state then
        spawn(function()
            while getgenv().AutoUpgrade do
                pcall(function()
                    local args = {
                        [1] = "All"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeBrainrot"):InvokeServer(unpack(args))
                end)
                wait(0.5)
            end
        end)
    end
end)

-- ============================================
-- 🌟 FITUR SPECIAL
-- ============================================

-- Instant Spawn
createButton("⚡ INSTANT SPAWN", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
    createButton("✓ SPAWNED!", nil, Color3.fromRGB(70, 255, 70))
end)

-- NoClip
createToggle("🚪 NOCLIP", function(state)
    getgenv().NoClip = state
    
    if state then
        spawn(function()
            while getgenv().NoClip do
                pcall(function()
                    for _, part in pairs(player.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end)
                wait(0.1)
            end
        end)
    else
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

-- Infinite Zoom
createButton("🔍 INFINITE ZOOM", function()
    workspace.CurrentCamera.MaxZoomDistance = math.huge
    workspace.CurrentCamera.MinZoomDistance = 0
    createButton("✓ INFINITE ZOOM AKTIF", nil, Color3.fromRGB(70, 255, 70))
end)

-- VIP Unlock
createButton("💎 UNLOCK VIP", function()
    local args = {
        [1] = "VIP"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseGamepass"):InvokeServer(unpack(args))
    createButton("✓ VIP UNLOCKED!", nil, Color3.fromRGB(255, 215, 0))
end)

-- ============================================
-- 🎯 FITUR TELEPORT
-- ============================================

-- Teleport to Zones
createButton("🏁 TELEPORT TO EPIC ZONE", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 50, 0) -- Adjust coordinates
    createButton("✓ TELEPORTED TO EPIC", nil, Color3.fromRGB(70, 255, 70))
end)

createButton("🌟 TELEPORT TO LEGENDARY ZONE", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(2000, 50, 0) -- Adjust coordinates
    createButton("✓ TELEPORTED TO LEGENDARY", nil, Color3.fromRGB(70, 255, 70))
end)

createButton("👑 TELEPORT TO MYTHIC ZONE", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 50, 0) -- Adjust coordinates
    createButton("✓ TELEPORTED TO MYTHIC", nil, Color3.fromRGB(70, 255, 70))
end)

-- ============================================
-- 🧹 CLEANUP & CLOSE
-- ============================================

-- Close GUI
createButton("❌ CLOSE MENU", function()
    ScreenGui:Destroy()
end, Color3.fromRGB(200, 50, 50))

-- Anti-Afk
spawn(function()
    while true do
        wait(300)
        pcall(function()
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

-- Update CanvasSize
spawn(function()
    while true do
        wait(0.5)
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
    end
end)

print("✅ Tsunami Brainrot Cheat Loaded!")