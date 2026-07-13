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

local PlayerStats = Player:NewSection("PlayerStats")

PlayerStats:NewSlider("WalkSpeed", "Player Speed", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerStats:NewSlider("JumpPower", "Player jumppower", 300, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
