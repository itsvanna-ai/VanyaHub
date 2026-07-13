local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("VanyaHub", "RJTheme1")

local Main = Window:NewTab("Main")

local World = Main:NewSection("World")

World:NewButton("Disable Water Damage", "0 Damage From Water", function()
    for i,v in pairs(game:GetDescendants()) do
       if v.Name == "Water" then
          v:Destroy()
       end
    end
end)

World:NewDropdown("Disable Isolation", "Disable Isolation", {"White Team", "Red Team", "Black Team", "Blue Team", "Green Team", "Purple Team", "Yellow Team"}, function(click)
    if click == "White Team" then
       workspace.WhiteZone.Lock.Part:Destroy()
    end
    if click == "Red Team" then
       workspace["Really redZone"].Lock.Part:Destroy()
    end
    if click == "Black Team" then
       workspace.BlackZone.Lock.Part:Destroy()
    end
    if click == "Blue Team" then
       workspace["Really blueZone"].Lock.Part:Destroy()
    end
    if click == "Green Team" then
       workspace.CamoZone.Lock.Part:Destroy()
    end
    if click == "Purple Team" then
       workspace.MagentaZone.Lock.Part:Destroy()
    end
    if click == "Yellow Team" then
       workspace["New YellerZone"].Lock.Part:Destroy()
    end
end)

local Player = Window:NewTab("Player")

local Modifiers = Player:NewSection("Modifiers")
 
Modifiers:NewSlider("WalkSpeed", "Player Speed", 1000, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Modifiers:NewSlider("JumpPower", "Player jumppower", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local Utilities = Window:NewTab("Utility")

local Utility = Utilities:NewSection("Utility")

Utility:NewButton("Fly Gui", "Fly", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/itsvanna-ai/VanyaHub/refs/heads/main/Fly%20Gui%20VanyaHub.lua"))()
end)

Utility:NewButton("Fling Gui", "Fling Players", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/itsvanna-ai/VanyaHub/refs/heads/main/FlingGui%20VanyaHub.lua"))()
end)
