--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script
    Author: OYB
    YouTube: https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ
    
    [ TERMS AND CONDITIONS ]
    - You ARE allowed to use and modify this script for your own games.
    - You ARE NOT allowed to re-upload, redistribute, or claim 
      ownership of this script.
    - Removing or altering these credits is strictly prohibited.
    
    Copyright (c) 2026 OYB. All rights reserved.
    ================================================================
]]

-- ⚠️ IMPORTANT: Put this code at the VERY TOP of your Main Script (before obfuscating) ⚠️

local ProtectionConfig = {
    -- 🔴 CRITICAL: This MUST exactly match the 'Secret' value in your Key System's Config!
    -- If your Key System has: Secret = "Test"
    -- Then this must also be: SecretKey = "Test"
    SecretKey = "saturnus",
    
    -- The name of your Hub (shown in the kick message if they try to bypass)
    HubName = "Saturnium"
}

-- Anti-Bypass Logic: Checks if the Key System successfully set the global variable
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return -- Stops the rest of the script from loading!
end

-------------------------------------------------------------------------------
-- 👇 YOUR MAIN SCRIPT CODE STARTS HERE 👇
-------------------------------------------------------------------------------

print(ProtectionConfig.HubName .. " Loaded Successfully!")

local Fluent = loadstring(game:HttpGet("https://github.com/StyearX/Fluent-Modded/releases/download/Fluent/FluentPro"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Camera = workspace.CurrentCamera
local Root = Character.HumanoidRootPart
local Flying = false
getgenv().Speed = 150
local Keys = {}
getgenv().Key = Enum.KeyCode.G

local Window = Fluent:CreateWindow({
    Title = "Saturnium",
    SubTitle = "by its_vanna",
    Version = "release 1.0.0",
    TabWidth = 130,
    Size = UDim2.fromOffset(480, 460),
    Acrylic = true,
    Theme = "AMOLED",
    MinimizeKey = Enum.KeyCode.LeftControl,
    Search = true,
    Icons = "solar/planet-bold",
    UserInfoTop = true,
    UserInfoTitle = "Welcome",
    UserInfoSubtitle = LocalPlayer.DisplayName,
    UserInfoColor = Color3.fromRGB(180, 10, 20),
})

Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "solar/widget-4-bold" }),
    Player = Window:AddTab({ Title = "Player", Icon = "solar/user-bold" }),
    Utility = Window:AddTab({ Title = "Utility", Icon = "solar/slash-square-bold" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "solar/settings-bold" }),
}

local mainbutton = Tabs.Main:AddSection("Buttons", "solar/mouse-minimalistic-bold")

local maindrop = Tabs.Main:AddSection("Dropdowns", "solar/list-down-minimalistic-bold")

local maininp = Tabs.Main:AddSection("Inputs", "solar/text-field-focus-bold")

maindrop:AddDropdown("Disable Isolation", {
    Title = "Disable Isolation",
    Icon = "solar/list-bold",
    Values = {"White Team", "Red Team", "Black Team", "Blue Team", "Green Team", "Purple Team", "Yellow Team"},
    Default = nil,
    Callback = function(v)
        if v == "White Team" then
            workspace.WhiteZone.Lock.Part:Destroy()
        elseif v == "Red Team" then
            workspace["Really redZone"].Lock.Part:Destroy()
        elseif v == "Black Team" then
            workspace.BlackZone.Lock.Part:Destroy()
        elseif v == "Blue Team" then
            workspace["Really blueZone"].Lock.Part:Destroy()
        elseif v == "Green Team" then
            workspace.CamoZone.Lock.Part:Destroy()
        elseif v == "Purple Team" then
            workspace.MagentaZone.Lock.Part:Destroy()
        elseif v == "Yellow Team" then
            workspace["New YellerZone"].Lock.Part:Destroy()
        end
    end,
})

mainbutton:AddButton({
    Title = "Disable Water Damage",
    Icon = "solar/shield-minimalistic-bold",
    Callback = function()
        for i,v in pairs(game:GetDescendants()) do
            if v.Name == "Water" then
                v:Destroy()
            end
        end
    end,
})

maininp:AddInput("Delete Player's Blocks", {
    Title = "Delete Player's Blocks",
    Icon = "solar/user-bold",
    Placeholder = "Enter a name",
    Default = "",
    Description = "(Anti-Lag)",
    Callback = function(v)
        local target = workspace.Blocks:WaitForChild(v)

        target:Destroy()
    end,
})

local plrSlider = Tabs.Player:AddSection("Sliders", "solar/slider-horizontal-bold")

plrSlider:AddSlider("WalkSpeed", {
    Title = "Walk Speed",
    Icon = "solar/running-bold",
    Min = 1, Max = 1000, Default = 16, Rounding = 0,
    Callback = function(v)
        local chr = LocalPlayer.Character
        if chr and chr:FindFirstChild("Humanoid") then chr.Humanoid.WalkSpeed = v end
    end,
})

plrSlider:AddSlider("JumpPower", {
    Title = "Jump Power",
    Icon = "solar/arrow-up-bold",
    Min = 1, Max = 500, Default = 50, Rounding = 0,
    Callback = function(v)
        local chr = LocalPlayer.Character
        if chr and chr:FindFirstChild("Humanoid") then chr.Humanoid.JumpPower = v end
    end,
})

local butut = Tabs.Utility:AddSection("Buttons", "solar/mouse-minimalistic-bold")

local fly = Tabs.Utility:AddSection("Fly (G To Toggle)", "solar/ufo-bold")

fly:AddInput("Fly Speed", {
    Title = "Fly Speed",
    Icon = "solar/user-bold",
    Placeholder = "Enter a Speed",
    Default = "150",
    Callback = function(v)
        getgenv().Speed = v
    end,
})



butut:AddButton({
    Title = "Fling Gui",
    Icon = "solar/black-hole-3-bold",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/itsvanna-ai/Saturnium/refs/heads/main/Saturnium%20Multi-Fling.lua"))()
    end,
})

local setdd = Tabs.Settings:AddSection("DropDowns", "solar/list-bold")

setdd:AddDropdown("Theme", {
    Title = "Theme",
    Icon = "solar/list-bold",
    Values = {"AMOLED", "Ash Gray", "Blood Red", "Cyanic", "Amber Glow", "Deep Violet", "Neon Cyber", "Neon Purple", "Royal Blue", "Deep Ocean", "RGB", "Orange", "Charcoal", "Pearl White", "Midnight Blue", "Galaxy Purple", "Cosmic Violet", "Cotton Candy"},
    Default = nil,
    Callback = function(v)
        Fluent:SetTheme(v)
    end,
})

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == getgenv().Key then
        Flying = not Flying
        Root.Anchored = Flying
    else
        Keys[input.KeyCode] = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    Keys[input.KeyCode] = false
end)

while true do
    local delta = RunService.RenderStepped:wait()
    if Flying then
        local drc = Vector3.zero

        if Keys[Enum.KeyCode.W] then
            drc += Camera.CFrame.LookVector
        end
        if Keys[Enum.KeyCode.S] then
            drc -= Camera.CFrame.LookVector
        end
        if Keys[Enum.KeyCode.D] then
            drc += Camera.CFrame.RightVector
        end
        if Keys[Enum.KeyCode.A] then
            drc -= Camera.CFrame.RightVector
        end
        Root.CFrame += drc * delta * getgenv().Speed
    end
end
