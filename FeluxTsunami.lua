--[[
╔══════════════════════════════════════════╗
║   ESCAPE TSUNAMI FOR BRAINROT - CHEAT MENU  ║
║        Fitur Lengkap Tsunami Edition        ║
╚══════════════════════════════════════════╝
]]


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
local RunService = game:GetService("RunService")

local Enabled = false
local Backup = {}
local Connection

local function getVIP()
    local map = workspace:FindFirstChild("DefaultMap_SharedInstances", true)
    if not map then return end
    return map:FindFirstChild("VIPWalls")
end

local function backupVIP(vip)
    Backup = {}
    for _, v in ipairs(vip:GetChildren()) do
        table.insert(Backup, v:Clone())
    end
end

local function restoreVIP(vip)
    vip:ClearAllChildren()
    for _, v in ipairs(Backup) do
        v:Clone().Parent = vip
    end
end

local function enableVIP()
    local vip = getVIP()
    if not vip then return end

    if #Backup == 0 then
        backupVIP(vip)
    end

    Connection = RunService.Heartbeat:Connect(function()
        for _, v in ipairs(vip:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
            if v:IsA("GuiObject")
            or v:IsA("Decal")
            or v:IsA("Texture")
            or v.Name:lower():match("vip") then
                pcall(function()
                    v:Destroy()
                end)
            end
        end
    end)
end

local function disableVIP()
    if Connection then
        Connection:Disconnect()
        Connection = nil
    end

    local vip = getVIP()
    if vip and #Backup > 0 then
        restoreVIP(vip)
    end
end

x2:AddButton({
    Title = "Unlock Vip And Vip+",
    Callback = function()
        Enabled = not Enabled

        if Enabled then
            Lexs("VIP Walls Disabled")
            enableVIP()
        else
            Lexs("VIP Walls Restored")
            disableVIP()
        end
    end
})

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
