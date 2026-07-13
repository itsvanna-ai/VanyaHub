local Fluent = loadstring(game:HttpGet("https://github.com/StyearX/Fluent-Modded/releases/download/Fluent/FluentPro"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local Window = Fluent:CreateWindow({
    Title = "Vanya Hub",
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

butut:AddButton({
    Title = "Fly Gui",
    Icon = "solar/ufo-3-bold",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/itsvanna-ai/VanyaHub/refs/heads/main/Fly%20Gui%20VanyaHub.lua"))()
    end,
})

butut:AddButton({
    Title = "Fling Gui",
    Icon = "solar/black-hole-3-bold",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/itsvanna-ai/VanyaHub/refs/heads/main/FlingGui%20VanyaHub.lua"))()
    end,
})
