-- HOHO HUB UI LIBRARY


local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/hoho_lib.lua", true))()

local win = lib:Window("Nexa Hub","Blox Fruits",Color3.new(0.333333, 0.666667, 1))

local tab = win:Tab("Main")
local label = tab:Label("Auto Farm", properties) --properties: {["Visible"] = flase}
tab:Line()

tab:Dropdown("Select Weapon:", {"Melee", "Sword", "Blox Fruit"}, function(val)
    _G.Weapon = val
end)

tab:Toggle("Auto Farm", false, function(val)
    _G.AutoFarm = val
end)

tab:Label("Farm Settings", properties)
tab:Line()

tab:Toggle("Fast Attack", true, function(val)
    _G.FastAttack = val
end)

tab:Toggle("Bring Mob", true, function(val)
    _G.BringMob = val
end)

tab:Toggle("Auto Click", false, function(val)
    _G.AutoClick = val
end)

tab:Toggle("Auto Haki", true, function(val)
    _G.AutoHaki = val
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AutoHaki then
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.BringMob then
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Name == y.Name then
                    v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                    v.HumanoidRootPart.Transparency = 0.5
                    y.HumanoidRootPart.Transparency = 0.5
                    v.Humanoid.WalkSpeed = 0
                    y.Humanoid.WalkSpeed = 0
                    v.Humanoid.JumpPower = 0
                    y.Humanoid.JumpPower = 0
                    if sethiddenproperty then
                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                    end
                end
            end
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AutoClick then
        pcall(function()
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end)
    end
end)

function EquipTool(Tool)
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(Tool))
    end)
end

task.spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		pcall(function()
			if _G.Weapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.RealWeapon = v.Name
						end
					end
				end
			elseif _G.Weapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.RealWeapon = v.Name
						end
					end
				end
			elseif _G.Weapon == "Blox Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.RealWeapon = v.Name
						end
					end
				end
			else
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.RealWeapon = v.Name
						end
					end
				end
			end
		end)
	end)
end)

coroutine.wrap(function()
local StopCamera = require(game.ReplicatedStorage.Util.CameraShaker)StopCamera:Stop()
    for v,v in pairs(getreg()) do
        if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework then
             for v,v in pairs(debug.getupvalues(v)) do
                if typeof(v) == "table" then
                    spawn(function()
                        game:GetService("RunService").RenderStepped:Connect(function()
                            if _G.FastAttack then
                                 pcall(function()
                                     v.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                                     v.activeController.attacking = false
                                     v.activeController.increment = 4
                                     v.activeController.blocking = false   
                                     v.activeController.hitboxMagnitude = 9999
    		                         v.activeController.humanoid.AutoRotate = true
    	                      	     v.activeController.focusStart = 0
    	                      	     v.activeController.currentAttackTrack = 0
                                     sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRaxNerous", math.huge)
                                 end)
                             end
                         end)
                    end)
                end
            end
        end
    end
end)();

function CheckLevel()
      local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
          if Lv == 1 or Lv <= 9 or SelectMonster == "Bandit [Lv. 5]" then -- Bandit
              Ms = "Bandit [Lv. 5]"
              NameQuest = "BanditQuest1"
              QuestLv = 1
              NameMon = "Bandit"
              CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
              CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
          elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey [Lv. 14]" then -- Monkey
              Ms = "Monkey [Lv. 14]"
              NameQuest = "JungleQuest"
              QuestLv = 1
              NameMon = "Monkey"
              CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
              CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
          elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
              Ms = "Gorilla [Lv. 20]"
              NameQuest = "JungleQuest"
              QuestLv = 2
              NameMon = "Gorilla"
              CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
              CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
          elseif Lv == 30 or Lv <= 39 or SelectMonster == "Pirate [Lv. 35]" then -- Pirate
              Ms = "Pirate [Lv. 35]"
              NameQuest = "BuggyQuest1"
              QuestLv = 1
              NameMon = "Pirate"
              CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
              CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
          elseif Lv == 40 or Lv <= 59 or SelectMonster == "Brute [Lv. 45]" then -- Brute
              Ms = "Brute [Lv. 45]"
              NameQuest = "BuggyQuest1"
              QuestLv = 2
              NameMon = "Brute"
              CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
              CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
          elseif Lv == 60 or Lv <= 74 or SelectMonster == "Desert Bandit [Lv. 60]" then -- Desert Bandit
              Ms = "Desert Bandit [Lv. 60]"
              NameQuest = "DesertQuest"
              QuestLv = 1
              NameMon = "Desert Bandit"
              CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
              CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
          elseif Lv == 75 or Lv <= 89 or SelectMonster == "Desert Officer [Lv. 70]" then -- Desert Officer
              Ms = "Desert Officer [Lv. 70]"
              NameQuest = "DesertQuest"
              QuestLv = 2
              NameMon = "Desert Officer"
              CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
              CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
          elseif Lv == 90 or Lv <= 99 or SelectMonster == "Snow Bandit [Lv. 90]" then -- Snow Bandit
              Ms = "Snow Bandit [Lv. 90]"
              NameQuest = "SnowQuest"
              QuestLv = 1
              NameMon = "Snow Bandit"
              CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
              CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
          elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman [Lv. 100]" then -- Snowman
              Ms = "Snowman [Lv. 100]"
              NameQuest = "SnowQuest"
              QuestLv = 2
              NameMon = "Snowman"
              CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
              CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
          elseif Lv == 120 or Lv <= 149 or SelectMonster == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
              Ms = "Chief Petty Officer [Lv. 120]"
              NameQuest = "MarineQuest2"
              QuestLv = 1
              NameMon = "Chief Petty Officer"
              CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
              CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
          elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
              Ms = "Sky Bandit [Lv. 150]"
              NameQuest = "SkyQuest"
              QuestLv = 1
              NameMon = "Sky Bandit"
              CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
              CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
          elseif Lv == 175 or Lv <= 249 or SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
              Ms = "Dark Master [Lv. 175]"
              NameQuest = "SkyQuest"
              QuestLv = 2
              NameMon = "Dark Master"
              CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
              CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
          elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior [Lv. 250]" then -- Toga Warrior
              Ms = "Toga Warrior [Lv. 250]"
              NameQuest = "ColosseumQuest"
              QuestLv = 1
              NameMon = "Toga Warrior"
              CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
              CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
          elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
              Ms = "Gladiator [Lv. 275]"
              NameQuest = "ColosseumQuest"
              QuestLv = 2
              NameMon = "Gladiator"
              CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
              CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
          elseif Lv == 300 or Lv <= 329 or SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
              Ms = "Military Soldier [Lv. 300]"
              NameQuest = "MagmaQuest"
              QuestLv = 1
              NameMon = "Military Soldier"
              CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
              CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
          elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
              Ms = "Military Spy [Lv. 325]"
              NameQuest = "MagmaQuest"
              QuestLv = 2
              NameMon = "Military Spy"
              CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
              CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
          elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior 
              Ms = "Fishman Warrior [Lv. 375]"
              NameQuest = "FishmanQuest"
              QuestLv = 1
              NameMon = "Fishman Warrior"
              CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
              CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
              end
          elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
              Ms = "Fishman Commando [Lv. 400]"
              NameQuest = "FishmanQuest"
              QuestLv = 2
              NameMon = "Fishman Commando"
              CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
              CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
              end
          elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
              Ms = "God's Guard [Lv. 450]"
              NameQuest = "SkyExp1Quest"
              QuestLv = 1
              NameMon = "God's Guard"
              CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
              CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
              end
          elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda [Lv. 475]" then -- Shanda
              Ms = "Shanda [Lv. 475]"
              NameQuest = "SkyExp1Quest"
              QuestLv = 2
              NameMon = "Shanda"
              CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
              CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
              end
          elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
              Ms = "Royal Squad [Lv. 525]"
              NameQuest = "SkyExp2Quest"
              QuestLv = 1
              NameMon = "Royal Squad"
              CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
              CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
          elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
              Ms = "Royal Soldier [Lv. 550]"
              NameQuest = "SkyExp2Quest"
              QuestLv = 2
              NameMon = "Royal Soldier"
              CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
              CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
          elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
              Ms = "Galley Pirate [Lv. 625]"
              NameQuest = "FountainQuest"
              QuestLv = 1
              NameMon = "Galley Pirate"
              CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
              CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
          elseif Lv >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
              Ms = "Galley Captain [Lv. 650]"
              NameQuest = "FountainQuest"
              QuestLv = 2
              NameMon = "Galley Captain"
              CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
              CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
          end
          if Lv == 700 or Lv <= 724 or SelectMonster == "Raider [Lv. 700]" then -- Raider
              Ms = "Raider [Lv. 700]"
              NameQuest = "Area1Quest"
              QuestLv = 1
              NameMon = "Raider"
              CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
              CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
          elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
              Ms = "Mercenary [Lv. 725]"
              NameQuest = "Area1Quest"
              QuestLv = 2
              NameMon = "Mercenary"
              CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
              CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
          elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
              Ms = "Swan Pirate [Lv. 775]"
              NameQuest = "Area2Quest"
              QuestLv = 1
              NameMon = "Swan Pirate"
              CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
              CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
          elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff
              Ms = "Factory Staff [Lv. 800]"
              NameQuest = "Area2Quest"
              QuestLv = 2
              NameMon = "Factory Staff"
              CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
              CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
          elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
              Ms = "Marine Lieutenant [Lv. 875]"
              NameQuest = "MarineQuest3"
              QuestLv = 1
              NameMon = "Marine Lieutenant"
              CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
              CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
          elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
              Ms = "Marine Captain [Lv. 900]"
              NameQuest = "MarineQuest3"
              QuestLv = 2
              NameMon = "Marine Captain"
              CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
              CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
          elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie [Lv. 950]" then -- Zombie
              Ms = "Zombie [Lv. 950]"
              NameQuest = "ZombieQuest"
              QuestLv = 1
              NameMon = "Zombie"
              CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
              CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
          elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire [Lv. 975]" then -- Vampire
              Ms = "Vampire [Lv. 975]"
              NameQuest = "ZombieQuest"
              QuestLv = 2
              NameMon = "Vampire"
              CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
              CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
          elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
              Ms = "Snow Trooper [Lv. 1000]"
              NameQuest = "SnowMountainQuest"
              QuestLv = 1
              NameMon = "Snow Trooper"
              CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
              CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
          elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
              Ms = "Winter Warrior [Lv. 1050]"
              NameQuest = "SnowMountainQuest"
              QuestLv = 2
              NameMon = "Winter Warrior"
              CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
              CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
          elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
              Ms = "Lab Subordinate [Lv. 1100]"
              NameQuest = "IceSideQuest"
              QuestLv = 1
              NameMon = "Lab Subordinate"
              CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
              CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
          elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
              Ms = "Horned Warrior [Lv. 1125]"
              NameQuest = "IceSideQuest"
              QuestLv = 2
              NameMon = "Horned Warrior"
              CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
              CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
          elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
              Ms = "Magma Ninja [Lv. 1175]"
              NameQuest = "FireSideQuest"
              QuestLv = 1
              NameMon = "Magma Ninja"
              CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
              CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
          elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
              Ms = "Lava Pirate [Lv. 1200]"
              NameQuest = "FireSideQuest"
              QuestLv = 2
              NameMon = "Lava Pirate"
              CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
              CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
          elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
              Ms = "Ship Deckhand [Lv. 1250]"
              NameQuest = "ShipQuest1"
              QuestLv = 1
              NameMon = "Ship Deckhand"
              CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
              CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
              end
          elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
              Ms = "Ship Engineer [Lv. 1275]"
              NameQuest = "ShipQuest1"
              QuestLv = 2
              NameMon = "Ship Engineer"
              CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
              CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
              end
          elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
              Ms = "Ship Steward [Lv. 1300]"
              NameQuest = "ShipQuest2"
              QuestLv = 1
              NameMon = "Ship Steward"
              CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
              CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
              end
          elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
              Ms = "Ship Officer [Lv. 1325]"
              NameQuest = "ShipQuest2"
              QuestLv = 2
              NameMon = "Ship Officer"
              CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
              CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
              end
          elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
              Ms = "Arctic Warrior [Lv. 1350]"
              NameQuest = "FrostQuest"
              QuestLv = 1
              NameMon = "Arctic Warrior"
              CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
              CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
              if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
              end
          elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
              Ms = "Snow Lurker [Lv. 1375]"
              NameQuest = "FrostQuest"
              QuestLv = 2
              NameMon = "Snow Lurker"
              CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
              CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
          elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
              Ms = "Sea Soldier [Lv. 1425]"
              NameQuest = "ForgottenQuest"
              QuestLv = 1
              NameMon = "Sea Soldier"
              CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
              CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
          elseif Lv >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
              Ms = "Water Fighter [Lv. 1450]"
              NameQuest = "ForgottenQuest"
              QuestLv = 2
              NameMon = "Water Fighter"
              CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
              CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
          end
          if Lv == 1500 or Lv <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
              Ms = "Pirate Millionaire [Lv. 1500]"
              NameQuest = "PiratePortQuest"
              QuestLv = 1
              NameMon = "Pirate Millionaire"
              CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
              CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
          elseif Lv == 1525 or Lv <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
              Ms = "Pistol Billionaire [Lv. 1525]"
              NameQuest = "PiratePortQuest"
              QuestLv = 2
              NameMon = "Pistol Billionaire"
              CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
              CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
          elseif Lv == 1575 or Lv <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
              Ms = "Dragon Crew Warrior [Lv. 1575]"
              NameQuest = "AmazonQuest"
              QuestLv = 1
              NameMon = "Dragon Crew Warrior"
              CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
              CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
          elseif Lv == 1600 or Lv <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
              Ms = "Dragon Crew Archer [Lv. 1600]"
              NameQuest = "AmazonQuest"
              QuestLv = 2
              NameMon = "Dragon Crew Archer"
              CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
              CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
          elseif Lv == 1625 or Lv <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander
              Ms = "Female Islander [Lv. 1625]"
              NameQuest = "AmazonQuest2"
              QuestLv = 1
              NameMon = "Female Islander"
              CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
              CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
          elseif Lv == 1650 or Lv <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander
              Ms = "Giant Islander [Lv. 1650]"
              NameQuest = "AmazonQuest2"
              QuestLv = 2
              NameMon = "Giant Islander"
              CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
              CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
          elseif Lv == 1700 or Lv <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
              Ms = "Marine Commodore [Lv. 1700]"
              NameQuest = "MarineTreeIsland"
              QuestLv = 1
              NameMon = "Marine Commodore"
              CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
              CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
          elseif Lv == 1725 or Lv <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
              Ms = "Marine Rear Admiral [Lv. 1725]"
              NameQuest = "MarineTreeIsland"
              QuestLv = 2
              NameMon = "Marine Rear Admiral"
              CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
              CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
          elseif Lv == 1775 or Lv <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
              Ms = "Fishman Raider [Lv. 1775]"
              NameQuest = "DeepForestIsland3"
              QuestLv = 1
              NameMon = "Fishman Raider"
              CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
              CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
          elseif Lv == 1800 or Lv <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
              Ms = "Fishman Captain [Lv. 1800]"
              NameQuest = "DeepForestIsland3"
              QuestLv = 2
              NameMon = "Fishman Captain"
              CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
              CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
          elseif Lv == 1825 or Lv <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
              Ms = "Forest Pirate [Lv. 1825]"
              NameQuest = "DeepForestIsland"
              QuestLv = 1
              NameMon = "Forest Pirate"
              CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
              CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
          elseif Lv == 1850 or Lv <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
              Ms = "Mythological Pirate [Lv. 1850]"
              NameQuest = "DeepForestIsland"
              QuestLv = 2
              NameMon = "Mythological Pirate"
              CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
              CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
          elseif Lv == 1900 or Lv <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
              Ms = "Jungle Pirate [Lv. 1900]"
              NameQuest = "DeepForestIsland2"
              QuestLv = 1
              NameMon = "Jungle Pirate"
              CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
              CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
          elseif Lv == 1925 or Lv <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
              Ms = "Musketeer Pirate [Lv. 1925]"
              NameQuest = "DeepForestIsland2"
              QuestLv = 2
              NameMon = "Musketeer Pirate"
              CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
              CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
          elseif Lv == 1975 or Lv <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
              Ms = "Reborn Skeleton [Lv. 1975]"
              NameQuest = "HauntedQuest1"
              QuestLv = 1
              NameMon = "Reborn Skeleton"
              CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
              CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
          elseif Lv == 2000 or Lv <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
              Ms = "Living Zombie [Lv. 2000]"
              NameQuest = "HauntedQuest1"
              QuestLv = 2
              NameMon = "Living Zombie"
              CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
              CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
          elseif Lv == 2025 or Lv <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
              Ms = "Demonic Soul [Lv. 2025]"
              NameQuest = "HauntedQuest2"
              QuestLv = 1
              NameMon = "Demonic Soul"
              CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
              CFrameMon = CFrame.new(-9709.30762, 204.695892, 6044.04688, -0.845798075, -3.4587876e-07, -0.533503294, -4.46235369e-08, 1, -5.77571257e-07, 0.533503294, -4.64701827e-07, -0.845798075)
          elseif Lv == 2050 or Lv <= 2074 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
              Ms = "Posessed Mummy [Lv. 2050]"
              NameQuest = "HauntedQuest2"
              QuestLv = 2
              NameMon = "Posessed Mummy"
              CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
              CFrameMon = CFrame.new(-9554.11035, 65.6141663, 6041.73584, -0.877069294, 5.33355795e-08, -0.480364174, 2.06420765e-08, 1, 7.33423562e-08, 0.480364174, 5.44105987e-08, -0.877069294)
          elseif Lv == 2075 or Lv <= 2099 or SelectMonster == "Peanut Scout [Lv. 2075]" then
              Ms = "Peanut Scout [Lv. 2075]"
              NameQuest ="NutsIslandQuest"
              QuestLv = 1
              NameMon = "Peanut Scout"
              POSQ = CFrame.new(-2102.74268, 38.1297836, -10192.501, 0.75739336, -4.93203451e-08, 0.65295893, 2.07778754e-08, 1, 5.14325187e-08, -0.65295893, -2.53875481e-08, 0.75739336)
              CFrameMon = CFrame.new(-1983.2562255859375, 38.12957000732422, -10588.0263671875)
          elseif Lv == 2100 or Lv <= 2124 or SelectMonster == "Peanut President [Lv. 2100]" then
              Ms = "Peanut President [Lv. 2100]"
              NameQuest ="NutsIslandQuest"
              QuestLv = 2
              NameMon = "Peanut President"
              POSQ = CFrame.new(-2102.74268, 38.1297836, -10192.501, 0.75739336, -4.93203451e-08, 0.65295893, 2.07778754e-08, 1, 5.14325187e-08, -0.65295893, -2.53875481e-08, 0.75739336)
              CFrameMon = CFrame.new(-1983.2562255859375, 38.12957000732422, -10588.0263671875)
          elseif Lv == 2125 or Lv <= 2149 or SelectMonster == "Ice Cream Chef [Lv. 2125]" then
              Ms = "Ice Cream Chef [Lv. 2125]"
              NameQuest ="IceCreamIslandQuest"
              QuestLv = 1
              NameMon = "Ice Cream Chef"
              POSQ = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
              CFrameMon = CFrame.new(-855.2096557617188, 65.8453598022461, -10910.7177734375)
          elseif Lv == 2150 or Lv <= 2199 or SelectMonster == "Ice Cream Commander [Lv. 2150]" then
              Ms = "Ice Cream Commander [Lv. 2150]"
              NameQuest ="IceCreamIslandQuest"
              QuestLv = 2
              NameMon = "Ice Cream Commander"
              POSQ = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
              CFrameMon = CFrame.new(-855.2096557617188, 65.8453598022461, -10910.7177734375)
              elseif Lv == 2200 or Lv <= 2224 or SelectMonster == "Cookie Crafter [Lv. 2200]" then
              Ms = "Cookie Crafter [Lv. 2200]"
              NameQuest = "CakeQuest1"
              QuestLv = 1
              NameMon = "Cookie Crafter"
              CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
              CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
          elseif Lv == 2225 or Lv <= 2249 or SelectMonster == "Cake Guard [Lv. 2225]" then
              Ms = "Cake Guard [Lv. 2225]"
              NameQuest = "CakeQuest1"
              QuestLv = 2
              NameMon = "Cake Guard"
              CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
              CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
          elseif Lv == 2250 or Lv <= 2274 or SelectMonster == "Baking Staff [Lv. 2250]" then
              Ms = "Baking Staff [Lv. 2250]"
              NameQuest = "CakeQuest2"
              QuestLv = 1
              NameMon = "Baking Staff"
              CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
              CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
          elseif Lv >= 2275 or SelectMonster == "Head Baker [Lv. 2275]" then
              Ms = "Head Baker [Lv. 2275]"
              NameQuest = "CakeQuest2"
              QuestLv = 2
              NameMon = "Head Baker"
              CFrameQ = CFrame.new(-2307.778076171875, 105.85140228271484, -12931.0146484375)
              CFrameMon = CFrame.new(-2307.778076171875, 105.85140228271484, -12931.0146484375)
          end
end

function TP(P1)
      Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
      if Distance < 250 then
          Speed = 600
      elseif Distance < 500 then
          Speed = 400
      elseif Distance < 1000 then
          Speed = 350
      elseif Distance >= 1000 then
          Speed = 400
      end
      tween = game:GetService("TweenService"):Create(
          game.Players.LocalPlayer.Character.HumanoidRootPart,
          TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
          {CFrame = P1})
      tween:Play()
      if _G.AutoFarm == false then
          tween:Cancel()
      end
  end

spawn(function()
      game:GetService("RunService").RenderStepped:Connect(function()
          if _G.AutoFarm then
              if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                  _G.BringMob = false
                  CheckLevel()
                  TP(CFrameQ)
                  if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                      wait(1.1)
                      CheckLevel()
                      if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                      else
                          TP(CFrameQ)
                      end
                  end
              elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                  pcall(function()
                      CheckLevel()
                      if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                          for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                              if v.Name == Ms and v:FindFirstChild("Humanoid") then
                                  if v.Humanoid.Health > 0 then
                                      repeat game:GetService("RunService").Heartbeat:wait()
                                          if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                              if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                                  EquipTool(_G.RealWeapon)
                                                  TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                                  v.HumanoidRootPart.CanCollide = false
                                                  v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                  game:GetService("VirtualUser"):CaptureController()
                                                  game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                                  PosMon = v.HumanoidRootPart.CFrame
                                                  _G.BringMob = true
                                              else
                                                  _G.BringMob = false    
                                                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                              end
                                          else
                                              _G.BringMob = false
                                              CheckLevel()
                                              TP(CFrameMon)
                                          end
                                      until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFarm == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                  end
                              end
                          end
                      else
                          _G.BringMob = false
                          CheckLevel()
                          TP(CFrameMon)
                      end
                  end)
              end
          end
      end)
  end)
  