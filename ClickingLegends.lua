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
local PetList = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Pets.Holder.PetHolder.List
local WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local JumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower

--// Categories
local stuff = main:CreateCategory("Farming")
local pets = main:CreateCategory("Pets")
local settings = main:CreateCategory("Settings")

--// Sections
local rselect = stuff:CreateSection("Selector")
local farming = stuff:CreateSection("Farming Section")
local pselect = pets:CreateSection("Selector")
local openeggs = pets:CreateSection("Pet Open Section")
local deletepets = pets:CreateSection("Pet Delete Section")
local ssection = settings:CreateSection("UI Stuff")
local csection = settings:CreateSection("Character")

--// Farming Tab
farming:Create(
    "Toggle",
    "Auto Click",
    function(ClickState)
        if ClickState then
            _G.Click = true
        else
            _G.Click = false
        end
    end,
    {
        default = false,
    }
)

farming:Create(
    "Toggle",
    "Auto Rebirth",
    function(RebirthState)
        if RebirthState then
            _G.autorebirth = true
        else
            _G.autorebirth = false
        end
    end,
    {
        default = false,
    }
)

rselect:Create(
  "Dropdown",
  "Rebirth Selector",
  function(RebOption)
    if RebOption == "1 Rebirth" then
        _G.SRebirth = 1
    elseif RebOption == "5 Rebirths" then
        _G.SRebirth = 5
    elseif RebOption == "15 Rebirths" then
        _G.SRebirth = 15
    elseif RebOption == "50 Rebirths" then
        _G.SRebirth = 50
    elseif RebOption == "100 Rebirths" then
        _G.SRebirth = 100
    elseif RebOption == "250 Rebirths" then
        _G.SRebirth = 250
    elseif RebOption == "750 Rebirths" then
        _G.SRebirth = 750
    elseif RebOption == "2,750 Rebirths" then
        _G.SRebirth = 2750
    elseif RebOption == "10,500 Rebirths" then
        _G.SRebirth = 10500
    elseif RebOption == "25,250 Rebirths" then
        _G.SRebirth = 25250
    elseif RebOption == "52,520 Rebirths" then
        _G.SRebirth = 52520
    elseif RebOption == "75,950 Rebirths" then
        _G.SRebirth = 75,950
    elseif RebOption == "105,250 Rebirths" then
        _G.SRebirth = 105250
    end
end,
{
  options = {
      "Rebirth Selector",
      "1 Rebirth",
      "5 Rebirths",
      "15 Rebirths",
      "50 Rebirths",
      "100 Rebirths",
      "250 Rebirths",
      "750 Rebirths",
      "2,750 Rebirths",
      "10,500 Rebirths",
      "25,250 Rebirths",
      "52,520 Rebirths",
      "75,950 Rebirths",
      "105,250 Rebirths",
  },
  default = "Rebirth Selector",
  search = false,
}
)

--// Egg Tab
pselect:Create(
  "Dropdown",
  "Egg Selector",
  function(Option)
    if Option == "Common Egg" then
        _G.SEGG = "Common Egg"
    elseif Option == "Jagged Egg" then
        _G.SEGG = "Jagged Egg"
    elseif Option == "Candy Egg" then
        _G.SEGG = "Candy Egg"
    elseif Option == "Space Egg" then
        _G.SEGG = "Space Egg"
    elseif Option == "Frozen Egg" then
        _G.SEGG = "Frozen Egg"
    elseif Option == "Water Egg" then
        _G.SEGG = "Water Egg"
    elseif Option == "Patriotic Egg" then
        _G.SEGG = "Patriotic Egg"
    end
end,
{
  options = {
      "Egg Selector",
      "Common Egg",
      "Jagged Egg",
      "Candy Egg",
      "Space Egg",
      "Frozen Egg",
      "Water Egg",
      "Patriotic Egg",
  },
  default = "Egg Selector",
  search = false,
}
)

openeggs:Create(
    "Toggle",
    "Auto Open 1 Egg",
    function(EggState)
        if EggState then
            _G.eggyopen = true
        else
            _G.eggyopen = false
        end
    end,
    {
        default = false,
    }
)
openeggs:Create(
    "Toggle",
    "Auto Open 3 Eggs",
    function(Egg3State)
        if Egg3State then
            _G.eggy3open = true
        else
            _G.eggy3open = false
        end
    end,
    {
        default = false,
    }
)

deletepets:Create(
    "Toggle",
    "Auto Delete All Unlocked Pets (Not legendary's)",
    function(DelState)
        if DelState then
            _G.delete = true
        else
            _G.delete = false
        end
    end,
    {
        default = false,
    }
)

deletepets:Create(
    "Toggle",
    "Auto Delete Patriotic Wisp",
    function(Del2State)
        if Del2State then
            _G.delete2 = true
        else
            _G.delete2 = false
        end
    end,
    {
        default = false,
    }
)

--// Setting Tab
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
        default = Enum.KeyCode.P
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

--// Functions
spawn(function()
    while rs:wait() do
        if _G.Click then
            local args = {
                [1] = "Click",
            }
            
            game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait(.5) do
        if _G.autorebirth then
            local argso = {
            [1] = "Rebirth",
            [2] = _G.SRebirth,
            }

            game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer(unpack(argso))
        end
    end
end)
spawn(function()
    while wait(.25) do
        if _G.eggyopen then
            local args = {
                [1] = "OpenEgg",
                [2] = "Single",
                [3] = _G.SEGG,
            }
            
            game:GetService("ReplicatedStorage").Modules.Network.RemoteFunction:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait(.25) do
        if _G.eggy3open then
            local args = {
                [1] = "OpenEgg",
                [2] = "Triple",
                [3] = _G.SEGG,
            }
            
            game:GetService("ReplicatedStorage").Modules.Network.RemoteFunction:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.delete then
            game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer("DeleteAllUnlocked")
        end
    end
end)
spawn(function()
    while wait(2.5) do
        if _G.delete2 then
            for i, v in pairs(PetList:GetChildren("Template")) do
                if v.ClassName == "ImageButton" then
                    if v.itemName.Text == "Patriotic Wisp" then
                        local args = {
                            [1] = "DeletePet",
                            [2] = v.ID.Value,
                        }
                        
                        game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer(unpack(args))
                    end
                end
            end
        end
    end
end)

--// Anti Afk
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
