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
  ["rewards"] = false,
  ["Swing2"] = false
} -- :)

local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local self = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")
local island = {"Ground"}
local handleegg = {}
local petHandler = {}
local training = {}
local event = Instance.new("BindableEvent")
event.Name = "Turtle Script handler"
event.Parent = self

lib:AddTable(workspace["islandUnlockParts"],island)
lib:AddTable(game:GetService("ReplicatedStorage")["crystalChances"],handleegg)
lib:AddTable(game:GetService("ReplicatedStorage")["cPetShopFolder"],petHandler)

for i,set in pairs(game:GetService("ReplicatedStorage")["Dark Skills"]["Ground"]:GetChildren()) do
	if set.Name:find("Training Area") then
		table.insert(training,set.Name)
	end
end

for i,set in pairs(game:GetService("ReplicatedStorage")["Light Skills"]["Ground"]:GetChildren()) do
	if set.Name:find("Training Area") then
		table.insert(training,set.Name)
	end
end

local function childTemplate(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

event.Event:Connect(function(...)
    local args = {...}
    if args[1] == "msg" then
	lib:notify(args[2],10)
    elseif args[1] == "getPlayers" then
	for i,v in pairs(game.Players:GetPlayers()) do
		if (string.sub(string.lower(v.DisplayName),1,string.len(args[2]))) == string.lower(args[2]) and type(args[3]) == "function" then
			args[3](v)
		end
	end
    elseif args[1] == "getPlayersPosition" then
	for i,v in pairs(game.Players:GetPlayers()) do
		if (string.sub(string.lower(v.DisplayName),1,string.len(args[2]))) == string.lower(args[2]) and type(args[3]) == "function" then
			args[3](v.Character.HumanoidRootPart.Position)
		end
	end
     elseif args[1] == "checkPlayers" then
	for i,v in pairs(game.Players:GetPlayers()) do
		if (string.sub(string.lower(v.DisplayName),1,string.len(args[2]))) == string.lower(args[2]) and type(args[3]) == "function" then
			lib:notify("Player found.",10)
			args[3](v.Name)
		else
			lib:notify("Player not found",10)
		end
	end
     elseif args[1] == "convert" then
	game:GetService("ReplicatedStorage")["rEvents"]["zenMasterEvent"]:FireServer("convertGems",args[2])
     elseif args[1] == "spin" then
	game:GetService("ReplicatedStorage")["rEvents"]["openFortuneWheelRemote"]:InvokeServer("openFortuneWheel",workspace["Fortune Wheel"])
     elseif args[1] == "equip_all_sword" then
	childTemplate(game:GetService("ReplicatedStorage").Weapons,function(v)
		childTemplate(v,function(i)
			self["ninjaEvent"]:FireServer("equipSword",i.Name)
		end)
	end)
    end
end)

local function getPlayers(funct)
  for i,v in pairs(game.Players:GetPlayers()) do
    funct(v)
  end
end

local function sellPets(path)
  childTemplate(path,function(v)
    game:GetService("ReplicatedStorage")["rEvents"]["sellPetEvent"]:FireServer("sellPet",v)
  end)
end

local function SpecificPetsSell(intgr,name)
  childTemplate(self.petsFolder,function(attach)
      childTemplate(attach,function(inject)
	if intgr == "Specific" then
          if inject.Name == name then
            game:GetService("ReplicatedStorage")["rEvents"]["sellPetEvent"]:FireServer("sellPet",inject)
          end
	elseif intgr == "Exception" then
	  if inject.Name ~= name then
            game:GetService("ReplicatedStorage")["rEvents"]["sellPetEvent"]:FireServer("sellPet",inject)
          end
	end
      end)
  end)
end

local function chams(str)
  local esp = Instance.new("Highlight")
  esp.Name = "X-RAY"
  esp.FillColor = Color3.new(0,1,0)
  esp.OutlineColor = Color3.new(1,1,1)
  esp.FillTransparency = 0
  esp.OutlineTransparency = 1
  esp.Adornee = str
  esp.Parent = str
  esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end

local function fastswing()
	childTemplate(self.Backpack,function(v)
		if v:FindFirstChild("attackTime") then
			v.attackTime.Value = 0
		end
	end)
end

--[[
T1:Toggle("Auto good-karma",false,function(value)
    MainAuto["Good Karma"] = value
end)

T1:Toggle("Auto bad-karma",false,function(value)
    MainAuto["Bad Karma"] = value
end)
]]

T1:Toggle("Auto swing",false,function(value)
    MainAuto["Swing"] = value
    fastswing()
end)

if self.Name == "Rivanda_Cheater" then
T1:Toggle("Auto swing ( with animation )",false,function(value)
    MainAuto["Swing2"] = value
    fastswing()
    while wait() do
      if MainAuto["Swing2"] == false then break end
	childTemplate(self.Character,function(v)
		if v:IsA("Tool") then
			fastswing()
			v:Activate()
		end
	end)
    end
end)
end

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
    fastswing()
end)

T1:Toggle("Auto eternal boss",false,function(value)
    MainAuto["EBoss"] = value
    fastswing()
end)

T1:Toggle("Auto ancient boss",false,function(value)
    MainAuto["ABoss"] = value
    fastswing()
end)

T1:Toggle("Auto chi",false,function(value)
    MainAuto["Chi"] = value
end) --["rewards"]

T1:Toggle("Auto hoops",false,function(value)
    MainAuto["Hoop"] = value
    while wait() do
      if MainAuto["Hoop"] == false then break end
        for _,v in pairs(workspace.Hoops:GetDescendants()) do
           if v.ClassName == "MeshPart" then
              v.touchPart.CFrame = self.Character.HumanoidRootPart.CFrame
           end
        end
      end
end)

T1:Toggle("Auto collect all chest rewards",false,function(value)
    MainAuto["rewards"] = value
    while wait() do
      if MainAuto["rewards"] == false then break end
      for i,v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetChildren()) do
        game:GetService("ReplicatedStorage")["rEvents"]["checkChestRemote"]:InvokeServer(v.Name)
      end
    end
end)

local tab2flags = {
  Sword = false,
  belt = false,
  rank = false,
  skill = false,
  shuriken = false,
  zone = island[1],
  elements = ""
}

local T2 = wndw:Tab("Buy")

T2:Dropdown("Choose an island to buy a rank",island,function(value)
    tab2flags.zone = value
end)

T2:Toggle("Auto buy sword",false,function(value) -- AutoBuy.flags.Sword
    tab2flags.Sword = value
end)

--local Belt = AutoBuy:Toggle("Auto-Belt", {flag = "Belt"}) AutoBuy.flags.Belt
T2:Toggle("Auto buy belt",false,function(value)
    tab2flags.belt = value
end)

--local Rank = AutoBuy:Toggle("Auto-Rank", {flag = "Rank"}) AutoBuy.flags.Rank
T2:Toggle("Auto buy rank [ Selected island ]",false,function(value)
    tab2flags.rank = value
end)

--local Skill = AutoBuy:Toggle("Auto-Skills", {flag = "Skill"}) AutoBuy.flags.Skill
T2:Toggle("Auto buy skill",false,function(value)
    tab2flags.skill = value
end)

--local Shuriken = AutoBuy:Toggle("Auto-Shurikens", {flag = "Shurikens"}) AutoBuy.flags.Shurikens
T2:Toggle("Auto buy shuriken",false,function(value)
    tab2flags.shuriken = value
end)

T2:Toggle("Auto unlock all elements ",false,function(value)
    tab2flags.elements = value
	while wait() do
		if tab2flags.elements == false then break end
			childTemplate(game:GetService("ReplicatedStorage")["Elements"],function(v)
				game:GetService("ReplicatedStorage")["rEvents"]["elementMasteryEvent"]:FireServer(v.Name)
			end)
	end
end)

--[[_G.Enabled = AutoBuy.flags.Purchase
_G.Sword = AutoBuy.flags.Sword
_G.Belt = AutoBuy.flags.Belt
_G.Rank = AutoBuy.flags.Rank
_G.Skill = AutoBuy.flags.Skill]]

-- Misc
local T3 = wndw:Tab("Crystal")
--T3:Label("--== PETS ==--")
local tab3flags = {
  pets = {
    egg = "Blue Crystal",
    openegg = false,
    evolve = false,
    eternalise = false,
    immortalize = false,
    legend = false,
    evolve2 = false
  },
  other = {
    fast = false,
    hitbox = false, -- no
    invis = false, -- no
    maxj = false, -- no
    corbs = false,
    fast2 = false,
    esp = true,
    orbtype = "All",
    tp = false,
    spin = false,
    convert10m = false,
    convert10k = false
  },
  sell = {
    basic = false,
    advanced = false,
    rare = false,
    epic = false,
    unique = false,
    omega = false,
    elite = false,
    infinity = false,
    awakened = false,
    ["master legend"] = false,
    beast = false,
    skystorm = false,
    ["soul master"] = false,
    ["rising hero"] = false,
    ["q-strike"] = false,
    skyblade = false,
    sp = false,
    name = petHandler[1],
    exc = false
  }
}

--local price = T3:Label(lib:ColorFonts("Error ReturnValue","Red"))
T3:Dropdown("Eggs",handleegg,function(value)
    tab3flags.pets.egg = value
end)

--local Eggs = Misc:Toggle("Open Eggs", {flag = "TEgg"}) -- Misc.flags.TEgg
T3:Toggle("Open eggs",false,function(value)
    tab3flags.pets.openegg = value
end)

--local Evolve = Misc:Toggle("Auto-Evolve", {flag = "Evolve"}) -- Misc.flags.TEgg
T3:Toggle("Auto evolve every single pets",false,function(value)
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

T3:Toggle("Auto instant evolve",false,function(value)
    tab3flags.pets.evolve2 = value
    while wait() do
      if tab3flags.pets.evolve2 == false then break end
      game:GetService("ReplicatedStorage")["rEvents"]["autoEvolveRemote"]:InvokeServer("autoEvolvePets")
    end
end)

--T3:Label("--== OTHER STUFF ==--")
local T8 = wndw:Tab("Other stuff")

--local FastThing = Misc:Toggle("Fast Shuriken", {flag = "Fast"}) -- AutoBuy.flags.Belt

T8:Toggle("Big head all",false,function(value)
    tab3flags.other.hitbox = value
    while wait() do
      if tab3flags.other.hitbox == false then break end
        for _, v in pairs(game:GetService("Players"):GetPlayers()) do
         if v.Name ~= self.Name then
          v.Character.Head.CanCollide = false
          v.Character.Head.Size = Vector3.new(5,5,5)
          v.Character.Head.Transparency = 0
        end
       end
      end
end)

T8:Button("Hide name",function()
    workspace[self.Name].Head.nameGui:Destroy()
end)

T8:Toggle("Invisibility",false,function(value)
    tab3flags.other.invis = value
    while wait() do
    if tab3flags.other.invis == false then break end
        self.ninjaEvent:FireServer("goInvisible")
    end
end)

T8:Toggle("Max jump",false,function(value)
    tab3flags.other.maxj = value
    while wait() do
      if tab3flags.other.maxj == false then break end
       self.multiJumpCount.Value = 999999999999
    end
end)

local T4 = wndw:Tab("Island")
T4:Button("Unlock islands",function()
    for array = 1,#island do
       self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts[island[array]].CFrame
       wait(.7)
    end
end)

self.PlayerGui.statEffectsGui.Enabled = false
self.PlayerGui.hoopGui.Enabled = false
T8:Toggle("Toggle popups",false,function(value)
    self.PlayerGui.statEffectsGui.Enabled = value
    self.PlayerGui.hoopGui.Enabled = value
end)

T8:Toggle("Auto spin",false,function(value)
	tab3flags.other.spin = value
	while wait() do
		if tab3flags.other.spin == false then break end
			event:Fire("spin")
	end
end)

T8:Toggle("Auto convert 10m gems",false,function(value)
	tab3flags.other.convert10m = value
	while wait() do
		if tab3flags.other.convert10m == false then break end
			event:Fire("convert",10000000)
	end
end)

T8:Toggle("Auto convert 10k gems",false,function(value)
	tab3flags.other.convert10k = value
	while wait() do
		if tab3flags.other.convert10k == false then break end
			event:Fire("convert",10000)
	end
end)

T8:Button("Equip current sword",function()
	event:Fire("equip_all_sword")
end)

-- Teleports
local T6 = wndw:Tab("Teleports")
--T6:Label("--== Utilitys ==--")
  
T6:Button("Shop",function()
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").shopAreaCircle5.circleInner.CFrame
end)

T6:Button("King Of The Hill",function()
    self.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").kingOfTheHillPart.CFrame
end)

T6:Button("Pet Cloner",function()
    self.Character.HumanoidRootPart.CFrame = CFrame.new(4569,130,1430)
end)

T6:Button("Altar of Elements",function()
    self.Character.HumanoidRootPart.CFrame = CFrame.new(771,132,-6037)
end)

local T9 = wndw:Tab("Island")

for inject = 1,#island do
T9:Button(island[inject],function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts[island[inject]].CFrame
end)
end
--[[
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
]]
local T10 = wndw:Tab("Training areas")

local tareas = {
	karma = 0,
	type = "null",
	name = "null"
}

function addNumber(typev)
	if typev == "Dark" then
		tareas.karma = game:GetService("ReplicatedStorage")["Dark Skills"]["Ground"][tareas.name]["karmaPrice"].Value
	elseif typev == "Light" then
		tareas.karma = game:GetService("ReplicatedStorage")["Light Skills"]["Ground"][tareas.name]["karmaPrice"].Value
	else
		lib:notify(lib:ColorFonts("Invalid skill type","Red"),10)
	end
end

function getAreastype(name)
	local success,haha = pcall(function()
		if game:GetService("ReplicatedStorage")["Dark Skills"]["Ground"][name]["karmaPrice"].Value:sub(1,1) == "-" then
			tareas.type = "Bad karma"
			addNumber("Dark")
		else
			tareas.type = "Good karma"
			addNumber("Light")
		end
	end)
	if not success then
		if game:GetService("ReplicatedStorage")["Light Skills"]["Ground"][name]["karmaPrice"].Value:sub(1,1) ~= "-" then
			tareas.type = "Good karma"
			addNumber("Light")
		else
			tareas.type = "Bad karma"
			addNumber("Dark")
		end
	end
end

T10:Dropdown("Choose area",training,function(value)
    tareas.name = value
    getAreastype(value)
end)

T10:Button("Teleport",function()
    if tareas.name == "Training Area: Mystical Water" then
	self.Character.HumanoidRootPart.CFrame = CFrame.new(347.74881,8824.53809,114.271019)
elseif tareas.name == "Training Area: Sword of Legends" or tareas.name == "Training Area: Sword Of Legends" then
	self.Character.HumanoidRootPart.CFrame = CFrame.new(1834.15967,38.704483,-141.375641)
elseif tareas.name == "Training Area: Lava Pit" then
	self.Character.HumanoidRootPart.CFrame = CFrame.new(-116.631485,12952.5381,271.14624)
elseif tareas.name == "Training Area: Tornado" then
	self.Character.HumanoidRootPart.CFrame = CFrame.new(325.641174,16872.0938,-9.9906435)
elseif tareas.name == "Training Area: Fallen Infinity Blade" then
	self.Character.HumanoidRootPart.CFrame = CFrame.new(1852,40,-6807)
elseif tareas.name == "Training Area: Zen Master's Blade" then
	self.Character.HumanoidRootPart.CFrame = CFrame.new(5046,40,1588)
else
	lib:notify(lib:ColorFonts("ERROR! UNKNOWN AREA POSITION ( error : load_selected_area_position )","Red"),10)
end
end)

local T7 = wndw:Tab("Shurikens")
local shursys = {
  aimbot = false,
  inf = false,
  range = 150,
  userange = true,
  boss = false,
  plr = "",
  splayer = false
}
--getPlayers(funct
--checkPlayers
T7:Slider("Aimbot range ( the default is 150 )",0,1000,shursys.range,function(value)
    shursys.range = tonumber(value)
end)

T7:Textbox("Insert player DisplayName",false,function(value)
	event:Fire("checkPlayers",value,function(v)
		shursys.plr = v
	end)
end)

if self.Name == "Rivanda_Cheater" then
T7:Toggle("Use range",shursys.userange,function(value)
    shursys.userange = value
end)
end

T7:Toggle("Selected player",false,function(value)
    shursys.splayer = value
end)

T7:Toggle("Auto throw + tracking + fast ( Range )",false,function(value)
    shursys.aimbot = value
    tab3flags.other.fast = value
    if value == true then
      lib:notify("Tracking activated.",10)
    else
      lib:notify("Tracking deactivated.",10)
    end
    
    while wait() do
      if shursys.aimbot == false then break end
	if shursys.splayer == true then
		event:Fire("getPlayersPosition",shursys.plr,function(v)
			self["ninjaEvent"]:FireServer("attackShuriken",v)
		end)
	else
		getPlayers(function(v)
			if v.Name ~= self.Name then
				if shursys.userange == true then
					if (v.Character.HumanoidRootPart.Position - self.Character.HumanoidRootPart.Position).Magnitude < shursys.range then
						self["ninjaEvent"]:FireServer("attackShuriken",v.Character.HumanoidRootPart.Position)
					end
				else
					self["ninjaEvent"]:FireServer("attackShuriken",v.Character.HumanoidRootPart.Position)
				end
			end
		end)
	end
    end
end)
--workspace.bossFolder
T7:Toggle("Auto throw to nearest boss",false,function(value)
	shursys.boss = value
	tab3flags.other.fast = value
	if value == true then
		lib:notify("Boss Tracking activated.",10)
	else
		lib:notify("Boss Tracking deactivated.",10)
	end
		
	while wait() do
	if shursys.boss == false then break end
		childTemplate(workspace.bossFolder,function(boss)
			if (self.Character.HumanoidRootPart.Position - boss.HumanoidRootPart.Position).Magnitude < 150 then
				self["ninjaEvent"]:FireServer("attackShuriken",boss.HumanoidRootPart.Position)
			end
		end)
	end
end)

T7:Toggle("Auto fast throw shuriken",false,function(value)
    tab3flags.other.fast2 = value
end)

T7:Toggle("infinite shurikens",false,function(value)
    shursys.inf = value
    while wait() do
      if shursys.inf == false then break end
      self.maxShurikenAmmo.Value = "5000"
      self.shurikenAmmoCount.Value = "5000"
    end
end)

local T11 = wndw:Tab("Sell pets")

local cnull = T11:Dropdown("Choose a pet",petHandler,function(value)
    tab3flags.sell.name = value
end)

T11:Toggle("Sell selected pet",false,function(value)
    tab3flags.sell.sp = value
    while wait() do
      if tab3flags.sell.sp == false then break end
      SpecificPetsSell("Specific",tab3flags.sell.name)
    end
end)

T11:Toggle("Sell all pets ( except selected pet )",false,function(value)
    tab3flags.sell.exc = value
	if tab3flags.sell.name ~= petHandler[1] then
		lib:notify("Selling all pets ( except '" .. lib:ColorFonts(tab3flags.sell.name,"Red") .. "' )",10)
		while wait() do
		if tab3flags.sell.exc == false then break end
			SpecificPetsSell("Exception",tab3flags.sell.name)
		end
	else
		lib:notify(lib:ColorFonts("runtime error : selected pet is null, choose 1 pet and try again","Red"),10)
		cnull:EditText(lib:ColorFonts("Choose a pet - null","Red"))
		wait(0.2)
		cnull:EditText(lib:ColorFonts("Choose a pet - null","White"))
		wait(0.2)
		cnull:EditText(lib:ColorFonts("Choose a pet - null","Red"))
		wait(0.2)
		cnull:EditText(lib:ColorFonts("Choose a pet - null","White"))
		wait(0.2)
		cnull:EditText(lib:ColorFonts("Choose a pet - null","Red"))
		wait(0.2)
		cnull:EditText(lib:ColorFonts("Choose a pet - null","White"))
	end
end)

T11:Toggle("Sell basics",false,function(value)
    tab3flags.sell.basic = value
end)

T11:Toggle("Sell advanced",false,function(value)
    tab3flags.sell.advanced = value
end)

T11:Toggle("Sell rare",false,function(value)
    tab3flags.sell.rare = value
end)

T11:Toggle("Sell epic",false,function(value)
    tab3flags.sell.epic = value
end)

T11:Toggle("Sell unique",false,function(value)
    tab3flags.sell.unique = value
end)

T11:Toggle("Sell omega",false,function(value)
    tab3flags.sell.omega = value
end)
--sellPets(path)
T11:Toggle("Sell elite",false,function(value)
    tab3flags.sell.elite = value
    while wait() do
      if tab3flags.sell.elite == false then break end
      sellPets(self.petsFolder.Elite)
    end
end)

T11:Toggle("Sell infinity",false,function(value)
    tab3flags.sell.infinity = value
    while wait() do
      if tab3flags.sell.infinity == false then break end
      sellPets(self.petsFolder.Infinity)
    end
end)

T11:Toggle("Sell awakened",false,function(value)
    tab3flags.sell.awakened = value
    while wait() do
      if tab3flags.sell.awakened == false then break end
      sellPets(self.petsFolder.Awakened)
    end
end)

T11:Toggle("Sell master legend",false,function(value)
    tab3flags.sell["master legend"] = value
    while wait() do
      if tab3flags.sell["master legend"] == false then break end
      sellPets(self.petsFolder["Master Legend"])
    end
end)

T11:Toggle("Sell beast",false,function(value)
    tab3flags.sell.beast = value
    while wait() do
      if tab3flags.sell.beast == false then break end
      sellPets(self.petsFolder.Beast)
    end
end)

T11:Toggle("Sell skystorm",false,function(value)
    tab3flags.sell.skystorm = value
    while wait() do
      if tab3flags.sell.skystorm == false then break end
      sellPets(self.petsFolder.Skystorm)
    end
end)

T11:Toggle("Sell soul master",false,function(value)
    tab3flags.sell["soul master"] = value
    while wait() do
      if tab3flags.sell["soul master"] == false then break end
      sellPets(self.petsFolder["Soul Master"])
    end
end)

T11:Toggle("Sell rising hero",false,function(value)
    tab3flags.sell["rising hero"] = value
    while wait() do
      if tab3flags.sell["rising hero"] == false then break end
      sellPets(self.petsFolder["Rising Hero"])
    end
end)

T11:Toggle("Sell Q-STRIKE",false,function(value)
    tab3flags.sell["q-strike"] = value
    while wait() do
      if tab3flags.sell["q-strike"] == false then break end
      sellPets(self.petsFolder["Q-STRIKE"])
    end
end)

T11:Toggle("Sell skyblade",false,function(value)
    tab3flags.sell.skyblade = value
    while wait() do
      if tab3flags.sell.skyblade == false then break end
      sellPets(self.petsFolder.Skyblade)
    end
end)

local T12 = wndw:Tab("Pet Cloner")
local clone = {
	cloner = false,
	clonename = petHandler[1],
	renamepet = false,
	renamestr = "ALYA"
}

T12:Dropdown("Choose a pet",petHandler,function(value)
    clone.clonename = value
end)

T12:Textbox("Input name",false,function(value)
    clone.renamestr = value
end)

T12:Toggle("Auto clone [ Chi ]",false,function(value)
    clone.cloner = value
    while wait() do
      if clone.cloner == false then break end
      --if self:FindFirstChild(clonename) then
        game:GetService("ReplicatedStorage")["rEvents"]["petCloneEvent"]:FireServer("clonePet",self[clonename])
      --else
      --  lib:notify("Failed to find a pet with the name '" .. lib:ColorFonts(clonename,"Red") .. "'",10)
      --end
    end
end)

T12:Toggle("Auto rename",false,function(value)
    clone.renamepet = value
    while wait() do
      if clone.renamepet == false then break end
      game:GetService("ReplicatedStorage")["rEvents"]["renameRemote"]:InvokeServer(renamestr,self[clonename])
    end
end)

local T13 = wndw:Tab("Orbs")

T13:Dropdown("Select orb type",{"All","Good","Bad"},function(value)
    tab3flags.other.orbtype = value
end)

T13:Toggle("Teleport",false,function(value)
	tab3flags.other.tp = value
end)

local function orbCollect(a)
	if tab3flags.other.tp == true then
		if a:FindFirstChild("isGoodKarma") and tab3flags.other.orbtype == "Good" then
			self.Character.HumanoidRootPart.CFrame = a.CFrame + Vector3.new(0,5,0)
			self["ninjaEvent"]:FireServer("collectSoul",a)
		elseif not a:FindFirstChild("isGoodKarma") and tab3flags.other.orbtype == "Bad" then
			self.Character.HumanoidRootPart.CFrame = a.CFrame + Vector3.new(0,5,0)
			self["ninjaEvent"]:FireServer("collectSoul",a)
		elseif tab3flags.other.orbtype == "All" then
			self.Character.HumanoidRootPart.CFrame = a.CFrame + Vector3.new(0,5,0)
			self["ninjaEvent"]:FireServer("collectSoul",a)
		end
	else
		if a:FindFirstChild("isGoodKarma") and tab3flags.other.orbtype == "Good" then
			self["ninjaEvent"]:FireServer("collectSoul",a)
		elseif not a:FindFirstChild("isGoodKarma") and tab3flags.other.orbtype == "Bad" then
			self["ninjaEvent"]:FireServer("collectSoul",a)
		elseif tab3flags.other.orbtype == "All" then
			self["ninjaEvent"]:FireServer("collectSoul",a)
		end
	end
end

T13:Toggle("Auto collect all orbs",false,function(value)
    tab3flags.other.corbs = value
    while wait() do
      if tab3flags.other.corbs == false then break end
       for i,v in pairs(workspace["soulPartsFolder"]:GetChildren()) do
	orbCollect(v)
      end
    end
end)

--local T14 = wndw:Tab("User Information")
--local info = T14:Label(lib:ColorFonts("Failed to load information","Red"))
--[[
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
]]

spawn(function()
while wait() do
if tab3flags.pets.openegg == true then
game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal",tab3flags.pets.egg)
end
end
end)

--[[
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
  ["Hoop"] = false
}
]]

spawn(function()
	while wait() do
		if MainAuto["Swing"] == true then
			if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then 
					self.ninjaEvent:FireServer("swingKatana")
					self.ninjaEvent:FireServer("swingKatana")
					self.ninjaEvent:FireServer("swingKatana")
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
while wait() do
if MainAuto["Sell"] == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
wait()
game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Workspace.Part.CFrame
end
end
end
end)

spawn(function()
while wait() do
if MainAuto["Full Sell"] == true then 
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if self.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
wait()
game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Workspace.Part.CFrame
end
end
end
end
end)


--[[spawn(function()
while wait(0.4) do
if Farming.flags.GK then
loadstring(game:HttpGet(('https://pastebin.com/raw/AaqHqPyw'),true))()
end
end
end)]]

spawn(function()
while wait() do
if MainAuto["L"] == true then
for _,v in pairs(workspace.Hoops:GetDescendants()) do
if v.ClassName == "MeshPart" then
v.touchPart.CFrame = self.Character.HumanoidRootPart.CFrame
end
end
end
end
end)


--[[spawn(function()
while wait(0.4) do
if Farming.flags.BK then
loadstring(game:HttpGet(('https://pastebin.com/raw/wEEB3nQt'),true))()  
end
end
end)]]

spawn(function()
while wait() do
if MainAuto["Boss"] == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if game:GetService("Workspace").bossFolder:WaitForChild("RobotBoss"):WaitForChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.bossFolder.RobotBoss.HumanoidRootPart.CFrame
if self.Character:FindFirstChildOfClass("Tool") then
self.Character:FindFirstChildOfClass("Tool"):Activate()
else
for i,v in pairs(self.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
v.attackTime.Value = 0
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
while wait() do
if MainAuto["EBoss"] == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if game:GetService("Workspace").bossFolder:WaitForChild("EternalBoss"):WaitForChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.bossFolder.EternalBoss.HumanoidRootPart.CFrame
if self.Character:FindFirstChildOfClass("Tool") then
self.Character:FindFirstChildOfClass("Tool"):Activate()
else
for i,v in pairs(self.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
v.attackTime.Value = 0
self.Character.Humanoid:EquipTool(v)
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
while wait() do
if MainAuto["ABoss"] == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if game:GetService("Workspace").bossFolder:WaitForChild("AncientMagmaBoss"):WaitForChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.bossFolder.AncientMagmaBoss.HumanoidRootPart.CFrame
if self.Character:FindFirstChildOfClass("Tool") then
self.Character:FindFirstChildOfClass("Tool"):Activate()
else
for i,v in pairs(self.Backpack:GetChildren()) do
if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
v.attackTime.Value = 0
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

--[[
local tab2flags = {
  Sword = false,
  belt = false,
  rank = false,
  skill = false,
  shuriken = false
}
]]

local oh2 = {"Ground","Astral Island","Space Island","Tundra Island","Eternal Island","Sandstorm","Thunderstorm","Ancient Inferno Island"}
spawn(function()
while wait() do
if tab2flags.Sword == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i = 1,#island do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllSwords",island[i])
end
end
end
end
end)

spawn(function()
while wait() do
if tab2flags.belt == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i = 1,#island do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllBelts",island[i])
end
end
end
end
end)

spawn(function()
while wait() do
if tab2flags.skill == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i = 1,#island do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllSkills",island[i])
end
end
end
end
end)

            

spawn(function()
while wait() do
if tab2flags.rank == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("ReplicatedStorage").Ranks[tab2flags.zone]:GetChildren()) do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyRank",v.Name)
end
end
end
end
end)

spawn(function()
while wait() do
if tab2flags.shuriken == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i = 1,#island do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllShurikens",island[i])
end
end
end
end
end)

--[[
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
  ["Hoop"] = false
}
]]

spawn(function()
while wait() do 
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
if MainAuto["Chi"] == true then
for i,v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
if v.Name == "Blue Chi Crate" then 
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait()
end
end
end
end
end
end)

--[[
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
tab3flags.other.fast
]]

spawn(function()
while wait() do
if tab3flags.pets.evolve == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet",x.Name)
end
end
end
end
end
end)

spawn(function()
while wait() do
if tab3flags.pets.eternalise == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
game:GetService("ReplicatedStorage").rEvents.petEternalizeEvent:FireServer("eternalizePet",x.Name)
end
end
end
end
end
end)

spawn(function()
while wait() do
if tab3flags.pets.immortalize == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
game:GetService("ReplicatedStorage").rEvents.petImmortalizeEvent:FireServer("immortalizePet",x.Name)
end
end
end
end
end
end)

spawn(function()
while wait() do
if tab3flags.pets.legend == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game:GetService("Players").LocalPlayer.petsFolder:GetChildren()) do
for i,x in pairs(v:GetChildren()) do
game:GetService("ReplicatedStorage").rEvents.petLegendEvent:FireServer("legendPet",x.Name)
end
end
end
end
end
end)

spawn(function() 
while wait() do 
if tab3flags.sell.basic == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Basic:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet",v)
end
end
end
end
end)

spawn(function() 
while wait() do 
if tab3flags.sell.advanced == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Advanced:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait() do 
if tab3flags.sell.rare == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Rare:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait() do 
if tab3flags.sell.epic == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Epic:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait() do 
if tab3flags.sell.unique == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Unique:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait() do 
if tab3flags.sell.omega == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for i,v in pairs(game.Players.LocalPlayer.petsFolder.Omega:GetChildren()) do
game.ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", v)
end
end
end
end
end)

spawn(function() 
while wait() do 
if tab3flags.other.fast == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for _,p in pairs(workspace.shurikensFolder:GetChildren()) do
if p.Name == "Handle" then
if p:FindFirstChild("BodyVelocity") then
local bv = p:FindFirstChildOfClass("BodyVelocity")
getPlayers(function(v)
if v.Name ~= self.Name then
if shursys.userange == true then
      if (v.Character.HumanoidRootPart.Position - self.Character.HumanoidRootPart.Position).Magnitude < shursys.range then
          bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
          bv.Velocity = (v.Character.HumanoidRootPart.Position - self.Character.HumanoidRootPart.Position).unit * 9e9
      end
else
      bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
      bv.Velocity = (v.Character.HumanoidRootPart.Position - self.Character.HumanoidRootPart.Position).unit * 9e9
end
end
end)
end
end
end
end
end
end
end) --Mouse.Hit.lookVector

spawn(function() 
while wait() do 
if tab3flags.other.fast2 == true then
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
for _,p in pairs(workspace.shurikensFolder:GetChildren()) do
if p.Name == "Handle" then
if p:FindFirstChild("BodyVelocity") then
local bv = p:FindFirstChildOfClass("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
bv.Velocity = self:GetMouse().Hit.lookVector * 1000
end
end
end
end
end
end
end) --Mouse.Hit.lookVector
--v:FindFirstChild("isGoodKarma")

workspace["soulPartsFolder"].ChildAdded:Connect(function(verse)
    if tab3flags.other.esp == true then
      chams(verse)
      if #workspace["soulPartsFolder"]:GetChildren() < 2 then
        lib:notify("1 orb detected",5)
      else
        lib:notify(#workspace["soulPartsFolder"]:GetChildren() .. " orbs detected",5)
      end
    end
end)

--[[task.spawn(function()
	lib:runtime(function()
		price:EditLabel("Egg name : " .. lib:ColorFonts(tab3flags.pets.egg,"Red") .. "\nPrice : " .. lib:ColorFonts(game.ReplicatedStorage.crystalPrices[tab3flags.pets.egg,game].price.Value,"Red") .. "\nCurrency type : " .. lib:ColorFonts(game.ReplicatedStorage.crystalPrices[tab3flags.pets.egg,game].priceType.Value,"Red"))
		info:EditLabel("Current rank : " .. lib:ColorFonts(self.equippedRank.Value,"Red") .. "\nCurrent belt : " .. lib:ColorFonts(self.equippedBelt.Value,"Red") .. "\nCurrent sword : " .. lib:ColorFonts(self.equippedSword.Value,"Red"))
	end)
end)
]]

lib.DeveloperEncrypt(wndw)

event:Fire("msg","Turtle service is unavailable... try again")
local vu = game:GetService("VirtualUser")
self.Idled:connect(function()
lib:notify("Player is afk... manipulating server detection.",10)
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
