-- Distribution by Cheat.gg

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local MainAuto = {
  ["Good Karma"] = false,
  ["Bad Karma"] = false,
  ["Swing"] = false,
  ["Sell"] = false,
  ["Full Sell"] = false,
  ["L"] = false,
  ["Boss"] = false,
  ["EBoss"] = false,
  ["ABoss"] = false,
  ["Chi"] = false,
  ["Hoop"] = false,
  
}
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local self = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

T1:Toggle("Auto good-karma",false,function(value)
    MainAuto["Good Karma"] = value
end)

T1:Toggle("Auto bad-karma",false,function(value)
    MainAuto["Bad Karma"] = value
end)

T1:Toggle("Auto swing",false,function(value)
    MainAuto["Swing"] = value
end)

T1:Toggle("Auto sell",false,function(value)
    MainAuto["Sell"] = value
end)

T1:Toggle("Auto Full sell",false,function(value)
    MainAuto["Full Sell"] = value
end)

T1:Toggle("Auto Pet levels",false,function(value)
    MainAuto["L"] = value
end)

T1:Toggle("Auto robot boss",false,function(value)
    MainAuto["Boss"] = value
end)

T1:Toggle("Auto eternal boss",false,function(value)
    MainAuto["EBoss"] = value
end)

T1:Toggle("Auto ancient boss",false,function(value)
    MainAuto["ABoss"] = value
end)

T1:Toggle("Auto chi",false,function(value)
    MainAuto["Chi"] = value
end)

T1:Toggle("Auto hoops",false,function(value)
    MainAuto["Hoop"] = value
    while wait() do
      if MainAuto["Hoop"] == false then break end
    for i = 1,#workspace.Hoops:getChildren() do
      if MainAuto["Hoop"] == true then
          for i = 1, 10 do
             stuff[i].touchPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
          end
        end
      end
      end
end)

local tab2flags = {
  Sword = false,
  belt = false,
  rank = false,
  skill = false,
  shuriken = false
}

local T2 = wndw:Tab("Buy")

T2:Toggle("Auto sword",false,function(value) -- AutoBuy.flags.Sword
    tab2flags.Sword = value
end)

--local Belt = AutoBuy:Toggle("Auto-Belt", {flag = "Belt"}) AutoBuy.flags.Belt
T2:Toggle("Auto belt",false,function(value)
    tab2flags.belt = value
end)

--local Rank = AutoBuy:Toggle("Auto-Rank", {flag = "Rank"}) AutoBuy.flags.Rank
T2:Toggle("Auto rank",false,function(value)
    tab2flags.rank = value
end)

--local Skill = AutoBuy:Toggle("Auto-Skills", {flag = "Skill"}) AutoBuy.flags.Skill
T2:Toggle("Auto skills",false,function(value)
    tab2flags.skill = value
end)

--local Shuriken = AutoBuy:Toggle("Auto-Shurikens", {flag = "Shurikens"}) AutoBuy.flags.Shurikens
T2:Toggle("Auto shuriken",false,function(value)
    tab2flags.shuriken = value
end)

--[[_G.Enabled = AutoBuy.flags.Purchase
_G.Sword = AutoBuy.flags.Sword
_G.Belt = AutoBuy.flags.Belt
_G.Rank = AutoBuy.flags.Rank
_G.Skill = AutoBuy.flags.Skill]]

-- Misc
local T3 = wndw:Tab("Misc")
T3:Label("--== PETS ==--")
local tab3flags = {
  pets = {
    egg = "Blue Crystal",
    openegg = false,
    evolve = false,
    eternalise = false,
    immortalize = false,
    legend = false
  },
  other = {
    fast = false,
    hitbox = false, -- no
    invis = false, -- no
    maxj = false -- no
  },
  sell = {
    basic = false,
    advanced = false,
    rare = false,
    epic = false,
    unique = false,
    omega = false
  }
}

T3:Dropdown("Eggs",{"Blue Crystal","Purple Crystal","Orange Crystal","Enchanted Crystal","Astral Crystal","Golden Crystal","Inferno Crystal","Galaxy Crystal","Frozen Crystal","Eternal Crystal","Storm Crystal","Thunder Crystal","Legends Crystal","Eternity Crystal"},function(value)
    tab3flags.pets.egg = value
end)

--local Eggs = Misc:Toggle("Open Eggs", {flag = "TEgg"}) -- Misc.flags.TEgg
T3:Toggle("Open eggs",false,function(value)
    tab3flags.pets.openegg = value
end)

--local Basic = Misc:Toggle("Sell Basic", {flag = "SBasic"}) --Misc.flags.SBasic
T3:Toggle("Sell basics",false,function(value)
    tab3flags.sell.basic = value
end)

--local Advanced = Misc:Toggle("Sell Advanced", {flag = "SAdvanced"}) --Misc.flags.SAdvanced
T3:Toggle("Sell advanced",false,function(value)
    tab3flags.sell.advanced = value
end)

--local Rare = Misc:Toggle("Sell Rare", {flag = "SRare"}) --Misc.flags.SRare
T3:Toggle("Sell rare",false,function(value)
    tab3flags.sell.rare = value
end)

--local Epic = Misc:Toggle("Sell Epic", {flag = "SEpic"}) --Misc.flags.SEpic
T3:Toggle("Sell epic",false,function(value)
    tab3flags.sell.epic = value
end)

--local Unique = Misc:Toggle("Sell Unique", {flag = "SUnique"})
T3:Toggle("Sell unique",false,function(value)
    tab3flags.sell.unique = value
end)

--local IPB = Misc:Toggle("Sell Omega", {flag = "SIPB"})
T3:Toggle("Sell advanced",false,function(value)
    tab3flags.sell.omega = value
end)

--local Evolve = Misc:Toggle("Auto-Evolve", {flag = "Evolve"}) -- Misc.flags.TEgg
T3:Toggle("Auto evolve",false,function(value)
    tab3flags.pets.evolve = value
end)

--local Eternalise = Misc:Toggle("Auto-Eternalise", {flag = "Eternalise"}) -- Misc.flags.Eternalise
T3:Toggle("Auto eternalise",false,function(value)
    tab3flags.pets.evolve = value
end)
--local Immortalize = Misc:Toggle("Auto-Immortalize", {flag = "Immortalize"}) -- Misc.flags.Eternalise
T3:Toggle("Auto immortalize",false,function(value)
    tab3flags.pets.immortalize = value
end)

--local Legend = Misc:Toggle("Auto-Legend", {flag = "Legend"}) -- Misc.flags.Eternalise
T3:Toggle("Auto legend",false,function(value)
    tab3flags.pets.legend = value
end)

T3:Label("--== OTHER STUFF ==--")

--local FastThing = Misc:Toggle("Fast Shuriken", {flag = "Fast"}) -- AutoBuy.flags.Belt
T3:Toggle("Auto fast shuriken",false,function(value)
    tab3flags.other.fast = value
end)

T3:Toggle("Big head all",false,function(value)
    tab3flags.other.hitbox = value
    while wait() do
      if tab3flags.other.hitbox == false then break end
        for _, v in pairs(game:GetService("Players"):GetPlayers()) do
         if v.Name ~= game:GetService("Players").LocalPlayer.Name then
          v.Character.Head.CanCollide = false
          v.Character.Head.Size = Vector3.new(5, 5, 5)
          v.Character.Head.Transparency = 0
        end
       end
      end
end)

T3:Button("Hide name",function()
    workspace[self.Name].Head.nameGui:Destroy()
end)

T3:Toggle("Invisibility",false,function(value)
    tab3flags.other.invis = value
    while wait() do
    if tab3flags.other.invis == false then break end
        self.ninjaEvent:FireServer("goInvisible")
    end
end)

T3:Toggle("Max jump",false,function(value)
    tab3flags.other.maxj = value
    while wait() do
      if tab3flags.other.maxj == false then break end
       self.multiJumpCount.Value = "50"
    end
end)

local T4 = wndw:Tab("Island")
T4:Button("Unlock islands",function()
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Enchanted Island"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Astral Island"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Mystical Island"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Space Island"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Tundra Island"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Eternal Island"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Sandstorm"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Thunderstorm"].CFrame
    wait(.7)
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Ancient Inferno Island"].CFrame
end)

local T5 = wndw:Tab("Popups")

T5:Toggle("Toggle popups",false,function(value)
    self.PlayerGui.statEffectsGui.Enabled = value
    self.PlayerGui.hoopGui.Enabled = value
end)

-- Teleports
local T6 = wndw:Tab("Teleports")
T6:Label("--== Utilitys ==--")
  
T6:Button("Shop",function()
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").shopAreaCircle5.circleInner.CFrame
end)

T6:Button("KOTH",function()
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").kingOfTheHillPart.CFrame
end)

T6:Label("--== Worlds ==--")

T6:Button("Enchanted island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Enchanted Island"].CFrame
end)

T6:Button("Astral island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Astral Island"].CFrame
end)

T6:Button("Mystical island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Mystical Island"].CFrame
end)

T6:Button("Space island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Space Island"].CFrame
end)

T6:Button("Tundra island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Tundra Island"].CFrame
end)

T6:Button("Eternal island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Eternal Island"].CFrame
end)

T6:Button("Sandstorm",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Sandstorm"].CFrame
end)

T6:Button("Thunderstorm island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Thunderstorm"].CFrame
end)

T6:Button("Ancient island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Ancient Inferno Island"].CFrame
end)


T6:Label("--== Training Areas ==--")

T6:Button("Myatical Water ( Good )",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(347.74881, 8824.53809, 114.271019)
end)

T6:Button("Sword of Legend ( Good )",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1834.15967, 38.704483, -141.375641)
end)

T6:Button("Lava Pit ( Bad )",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-116.631485, 12952.5381, 271.14624)
end)

T6:Button("Tornado ( Bad )",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(325.641174, 16872.0938, -9.9906435)
end)


spawn(function()
while wait(.01) do
if Misc.flags.TEgg then
local oh1 = "openCrystal"
local oh2 = _G.Egg
print("Purchased", _G.Egg)
game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(oh1, oh2)
end
end
end)

spawn(function()
while wait() do
if Farming.flags.Swing then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then 
game.Players.LocalPlayer.ninjaEvent:FireServer("swingKatana")
else
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
if v.ClassName == "Tool" and v:FindFirstChild("attackShurikenScript") then 
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
wait()
if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then 
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)                            
end
end
end
end
end
end
end
end)

spawn(function()
while wait(0.01) do
if Farming.flags.Sell then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
wait(.05)
game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Workspace.Part.CFrame
end
end
end
end)

spawn(function()
while wait(0.01) do
if Farming.flags.FullSell then 
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if player.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
wait(.05)
game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Workspace.Part.CFrame
end
end
end
end
end)


spawn(function()
while wait(0.4) do
if Farming.flags.GK then
loadstring(game:HttpGet(('https://pastebin.com/raw/AaqHqPyw'),true))()
end
end
end)

spawn(function()
while wait(0.00011) do
if Farming.flags.L then
local plr = game.Players.LocalPlayer
for _,v in pairs(workspace.Hoops:GetDescendants()) do
if v.ClassName == "MeshPart" then
v.touchPart.CFrame = plr.Character.HumanoidRootPart.CFrame
end
end
end
end
end)


spawn(function()
while wait(0.4) do
if Farming.flags.BK then
loadstring(game:HttpGet(('https://pastebin.com/raw/wEEB3nQt'),true))()  
end
end
end)

spawn(function()
while wait(.001) do
if Farming.flags.Boss then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if game:GetService("Workspace").bossFolder:WaitForChild("RobotBoss"):WaitForChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.bossFolder.RobotBoss.HumanoidRootPart.CFrame
if player.Character:FindFirstChildOfClass("Tool") then
player.Character:FindFirstChildOfClass("Tool"):Activate()
else
for i,v in pairs(player.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
v.attackTime.Value = 0.2
player.Character.Humanoid:EquipTool(v)
if attackfar then
for i,v in pairs(player.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackShurikenScript") then
player.Character.Humanoid:EquipTool(v)
end
end
end            
end
end
end
end
end
end
end
end)


spawn(function()
while wait(.001) do
if Farming.flags.EBoss then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if game:GetService("Workspace").bossFolder:WaitForChild("EternalBoss"):WaitForChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.bossFolder.EternalBoss.HumanoidRootPart.CFrame
if player.Character:FindFirstChildOfClass("Tool") then
player.Character:FindFirstChildOfClass("Tool"):Activate()
else
for i,v in pairs(player.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
v.attackTime.Value = 0.2
player.Character.Humanoid:EquipTool(v)
if attackfar then
for i,v in pairs(player.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackShurikenScript") then
player.Character.Humanoid:EquipTool(v)
end
end
end      
end      
end
end
end
end
end
end
end)

spawn(function()
while wait(.001) do
if Farming.flags.ABoss then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if game:GetService("Workspace").bossFolder:WaitForChild("AncientMagmaBoss"):WaitForChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.bossFolder.AncientMagmaBoss.HumanoidRootPart.CFrame
if player.Character:FindFirstChildOfClass("Tool") then
player.Character:FindFirstChildOfClass("Tool"):Activate()
else
for i,v in pairs(player.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
v.attackTime.Value = 0.2
player.Character.Humanoid:EquipTool(v)
if attackfar then
for i,v in pairs(player.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackShurikenScript") then
player.Character.Humanoid:EquipTool(v)
end
end
end      
end      
end
end
end
end
end
end
end)

spawn(function()
while wait(0.5) do
if AutoBuy.flags.Sword then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
local oh1 = "buyAllSwords"
local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island"}
for i = 1,#oh2 do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
end
end
end
end
end)

spawn(function()
while wait(0.5) do
if AutoBuy.flags.Belt then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
local oh1 = "buyAllBelts"
local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island"}
for i = 1,#oh2 do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
end
end
end
end
end)

spawn(function()
while wait(0.5) do
if AutoBuy.flags.Skill then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
local oh1 = "buyAllSkills"
local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island"}
for i = 1,#oh2 do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
end
end
end
end
end)

            

spawn(function()
while wait(0.5) do
if AutoBuy.flags.Rank then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
local oh1 = "buyRank"
local oh2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
for i = 1,#oh2 do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i].Name)
end
end
end
end
end)

spawn(function()
while wait(0.5) do
if AutoBuy.flags.Shurikens then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
local oh1 = "buyAllShurikens"
local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island"}
for i = 1,#oh2 do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
end
end
end
end
end)

spawn(function()
while wait(0.033) do 
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if Farming.flags.Chi then
for i,v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
if v.Name == "Blue Chi Crate" then 
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
wait(.16)
end
end
end
end
end
end)



spawn(function()
while wait(3) do
if Misc.flags.Evolve then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
local oh1 = "evolvePet"
local oh2 = x.Name
game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(oh1, oh2)
end
end
end
end
end
end)
spawn(function()
while wait(3) do
if Misc.flags.Eternalise then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
local oh1 = "eternalizePet"
local oh2 = x.Name
game:GetService("ReplicatedStorage").rEvents.petEternalizeEvent:FireServer(oh1, oh2)
end
end
end
end
end
end)

spawn(function()
while wait(3) do
if Misc.flags.Immortalize then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
local oh1 = "immortalizePet"
local oh2 = x.Name
game:GetService("ReplicatedStorage").rEvents.petImmortalizeEvent:FireServer(oh1, oh2)
end
end
end
end
end
end)

spawn(function()
while wait(3) do
if Misc.flags.Legend then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
local oh1 = "legendPet"
local oh2 = x.Name
game:GetService("ReplicatedStorage").rEvents.petLegendEvent:FireServer(oh1, oh2)
end
end
end
end
end
end)

spawn(function() 
while wait(1) do 
if Misc.flags.SBasic then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Basic:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait(1) do 
if Misc.flags.SAdvanced then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Advanced:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait(1) do 
if Misc.flags.SRare then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Rare:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait(1) do 
if Misc.flags.SEpic then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Epic:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait(1) do 
if Misc.flags.SUnique then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Unique:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait(1) do 
if Misc.flags.SOmega then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Omega:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait(.001) do 
if Misc.flags.Fast then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
local plr = game.Players.LocalPlayer
local Mouse = plr:GetMouse()
local velocity = 1000
for _,p in pairs(game.Workspace.shurikensFolder:GetChildren()) do
if p.Name == "Handle" then
if p:FindFirstChild("BodyVelocity") then
local bv = p:FindFirstChildOfClass("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
bv.Velocity = Mouse.Hit.lookVector * velocity
end
end
end
end
end
end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
function()
vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)