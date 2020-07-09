--// idfk anymore
local Zypher = game:GetService("CoreGui"):FindFirstChild("Zypher")
if Zypher then 
    Zypher:Destroy()
end

--// Other Important Stuff
local library = loadstring(game:HttpGet("https://zypher.wtf/UI-Lib"))()
local main = library:CreateMain("Zypher")
local players = game.Players:GetPlayers()
local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local rs = RunService.RenderStepped
local VirtualUser = game:GetService("VirtualUser")
local WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local JumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower

--// Categories
local pets = main:CreateCategory("Pets")
local settings = main:CreateCategory("Settings")

local petexp = pets:CreateSection("Pet Level Farm")
local epets = pets:CreateSection("Give Exotic Pets")
local lpets = pets:CreateSection("Give Legendary Pets")
local expets = pets:CreateSection("Give Epic Pets")
local rpets = pets:CreateSection("Give Rare Pets")
local cpets = pets:CreateSection("Give Common Pets")

local ssection = settings:CreateSection("UI Stuff")
local csection = settings:CreateSection("Character")

petexp:Create(
    "Toggle",
    "Collect All Gems",
    function(State)
        if State then
            _G.Enabled = true
        else
            _G.Enabled = false
        end
    end,
    {
        default = false,
    }
)

for i,v in pairs(game:GetService("ReplicatedStorage").PetLibrary.Pets:GetChildren()) do
    if v.Settings.Rarity.Value == "Exotic" then
        epets:Create(
            "Button",
            v.Name,
            function()
                local args = {
                    [1] = game:GetService("Players").LocalPlayer,
                    [2] = v.Name,
                    [3] = "Toxic",
                    [4] = true,
                }
                
                game:GetService("ReplicatedStorage").RemoteEvents.RebirthShopUI:FireServer(unpack(args))
            end,
            {
                animated = true,
            }
        )
    end
end
for i2,v2 in pairs(game:GetService("ReplicatedStorage").PetLibrary.Pets:GetChildren()) do
    if v2.Settings.Rarity.Value == "Legendary" then
        lpets:Create(
            "Button",
            v2.Name,
            function()
                local args = {
                    [1] = game:GetService("Players").LocalPlayer,
                    [2] = v2.Name,
                    [3] = "Toxic",
                    [4] = true,
                }
                
                game:GetService("ReplicatedStorage").RemoteEvents.RebirthShopUI:FireServer(unpack(args))
            end,
            {
                animated = true,
            }
        )
    end
end
for i3,v3 in pairs(game:GetService("ReplicatedStorage").PetLibrary.Pets:GetChildren()) do
    if v3.Settings.Rarity.Value == "Epic" then
        expets:Create(
            "Button",
            v3.Name,
            function()
                local args = {
                    [1] = game:GetService("Players").LocalPlayer,
                    [2] = v3.Name,
                    [3] = "Toxic",
                    [4] = true,
                }
                
                game:GetService("ReplicatedStorage").RemoteEvents.RebirthShopUI:FireServer(unpack(args))
            end,
            {
                animated = true,
            }
        )
    end
end
for i4,v4 in pairs(game:GetService("ReplicatedStorage").PetLibrary.Pets:GetChildren()) do
    if v4.Settings.Rarity.Value == "Rare" then
        rpets:Create(
            "Button",
            v4.Name,
            function()
                local args = {
                    [1] = game:GetService("Players").LocalPlayer,
                    [2] = v4.Name,
                    [3] = "Toxic",
                    [4] = true,
                }
                
                game:GetService("ReplicatedStorage").RemoteEvents.RebirthShopUI:FireServer(unpack(args))
            end,
            {
                animated = true,
            }
        )
    end
end
for i5,v5 in pairs(game:GetService("ReplicatedStorage").PetLibrary.Pets:GetChildren()) do
    if v5.Settings.Rarity.Value == "Common" then
        cpets:Create(
            "Button",
            v5.Name,
            function()
                local args = {
                    [1] = game:GetService("Players").LocalPlayer,
                    [2] = v5.Name,
                    [3] = "Toxic",
                    [4] = true,
                }
                
                game:GetService("ReplicatedStorage").RemoteEvents.RebirthShopUI:FireServer(unpack(args))
            end,
            {
                animated = true,
            }
        )
    end
end

csection:Create(
  "Slider",
  "WalkSpeed",
  function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(value)
  end,
  {
      min = WalkSpeed,
      max = 150,
      -- Optional
      default = WalkSpeed,
      precise = true,
      changablevalue = true
  }
)
csection:Create(
  "Slider",
  "JumpPower",
  function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(value)
  end,
  {
      min = JumpPower,
      max = 250,
      -- Optional
      default = JumpPower,
      precise = true, -- ex: 0.1, 0.2, 0.3
      changablevalue = true
  }
)
ssection:Create(
    "KeyBind",
    "Toggle UI", 
    function()
        if game:GetService("CoreGui").Zypher.Enabled == true then
            game:GetService("CoreGui").Zypher.Enabled = false
        else
            game:GetService("CoreGui").Zypher.Enabled = true
        end
    end,
    {
        default = Enum.KeyCode.Q
    }
)
ssection:Create(
    "Button",
    "Destroy UI",
    function()
        game:GetService("CoreGui"):FindFirstChild("Zypher"):Destroy()
    end,
    {
        animated = true,
    }
)

spawn(function()
    while wait(5) do
        if _G.Enabled then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "XPorb" then
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)
