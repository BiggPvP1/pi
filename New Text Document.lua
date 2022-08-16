--Credits:
--Bigg#6727 - original owner and coder for some most of the things
--KohayLo#8128 - Helped me fixing the script and coded some of the things in it
--xHeptc u fucktards - Ui lib 

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("BiggHook", "Ocean")
-- Variables
local themes = {
    'LightTheme',
    'DarkTheme',
    'GrapeTheme',
    'BloodTheme',
    'Ocean',
    'Midnight',
    'Sentinel',
    'Synapse',
}
local Highlight = Instance.new('Highlight')

local Player = game:GetService("Players")

local LocalPlayer = Player.LocalPlayer

local MainStuff = Window:NewTab("Main Stuff")

local Visuals = Window:NewTab('Visuals')

local Tab = Window:NewTab("Settings")

-- Visuals
local chams = Visuals:NewSection('Highlight Chams')
chams:NewToggle('Highlights', 'Adds highlight to existing players', function(state)
    for i = 1, 2 do
    if state then
        for i, x in pairs(Player:GetPlayers()) do
            if x.Character.Humanoid.Health == 100 then
                for i, v in pairs(x.Character:GetChildren()) do
                    if v:isA('Part') then
                    local HighlightClone = Highlight:Clone()
                    HighlightClone.Parent = v
                    HighlightClone.Adornee = v
                end
              end
            end 
          end
  else
    for i, x in pairs(Player:GetPlayers()) do
    if x.Character.Humanoid.Health == 0 then
        for i,v in pairs(x.Character:GetChildren()) do
            if v:isA('Part') then
                v.HighlightClone:Destroy()
            end
        end
   end
end
    end
end
end)

-- Main Stuff
local new = MainStuff:NewSection("Bubbly Animation")
new:NewButton("Click Here", "Gives you the Bubbly animation", function()
    LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
    LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
    LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
    LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
    LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
    LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
    LocalPlayer.Character.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
    LocalPlayer.Character.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
end)

local Section = MainStuff:NewSection('Teleports To all existing People')
Section:NewButton('Teleport', 'Teleports', function()
     for i, v in pairs(Player:GetPlayers()) do
       LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        wait()
         LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
end
end)

local Section = MainStuff:NewSection("Random Speed")
Section:NewButton("Click Here", "Gives you a random WalkSpeed", function()
   LocalPlayer.Character.Humanoid.WalkSpeed = math.random(1,100000)
end)
local Section = MainStuff:NewSection("Random JumpPower")
Section:NewButton("Click Here", "Gives you a random Jumppower", function()
   LocalPlayer.Character.Humanoid.JumpPower = math.random(1,100)
end)
local Section = MainStuff:NewSection("Speed")
Section:NewSlider("Changer", "Changes your Walkspeed", 1000, 0, function(s)
    LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
local Section = MainStuff:NewSection("JumpPower")
Section:NewSlider("Changer", "Changes your Jumppower", 500, 0, function(s)
   LocalPlayer.Character.Humanoid.JumpPower = s
end)
local Section = Tab:NewSection("Settings")
Section:NewButton("Coming Soon", "Not Out Yet", function()
    print("Not out yet")
end)


local Section = Tab:NewSection("Rejoin")
Section:NewButton("Rejoin", "Rejoins the game (NOT SERVERHOP)", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end)
local Section = Tab:NewSection("UI Toggle")
Section:NewKeybind("Toggle UI", "Toggles the UI", Enum.KeyCode.Z, function()
	Library:ToggleUI()
end)