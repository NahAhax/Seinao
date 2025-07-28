-- // Hanzo hub "FOLLOW 7A27677 ON ROBLOX"
local IceHub = loadstring(game:HttpGet("https://pastebin.com/raw/1KXhRdNS"))()

-- // Tabs
local Tab_House = MainUI:NewTab("House")
local House = Tab_House:NewSection("House")

local Tab_Avatar = MainUI:NewTab("Avatar")
local Avatar = Tab_Avatar:NewSection("Avatar")

local Tab_Car = MainUI:NewTab("Vehicles")
local Car = Tab_Car:NewSection("Vehicles")

local Tab_Fun = MainUI:NewTab("Fun")
local Fun = Tab_Fun:NewSection("Fun")

local Tab_Spam = MainUI:NewTab("Spam")
local Spam = Tab_Spam:NewSection("Spam")

local Tab_Itens = MainUI:NewTab("Build")
local Itens = Tab_Itens:NewSection("Build")

local Tab_Tools = MainUI:NewTab("Tools")
local Tools = Tab_Tools:NewSection("Tools")

local Tab_Map = MainUI:NewTab("Map")
local Map = Tab_Map:NewSection("Map")

local Tab_Visual = MainUI:NewTab("Visual")
local Visual = Tab_Visual:NewSection("Visual")

local Tab_Premium = MainUI:NewTab("Premium")
local Premium = Tab_Premium:NewSection("Premium")

local Tab_Others = MainUI:NewTab("Others")
local Others = Tab_Others:NewSection("Others")

local Tab_Teleportes = MainUI:NewTab("Teleport")
local Teleportes = Tab_Teleportes:NewSection("Teleport")

local Tab_Misc = MainUI:NewTab("Misc")
local Misc = Tab_Misc:NewSection("Misc")

local Tab_Kill = MainUI:NewTab("Kill")
local Kill = Tab_Kill:NewSection("Kill")

local Tab_Scripts = MainUI:NewTab("Scripts")
local Scripts = Tab_Scripts:NewSection("Scripts")

House:NewLabel("House Bio Section")

--// House Features - Hanzo (English Version - Optimized)

do
    -- Bio Text - Custom House Name
    House:NewTextBox("House Bio Text", "", function(value)
        do
            local args = {
                [1] = "BusinessName",
                [2] = value
            }
            game:GetService("ReplicatedStorage").RE["1RPHous1eEven1t"]:FireServer(unpack(args))
        end
    end)
end

do
    -- Rainbow House Bio - Color loop for house bio text
    local running = false

    House:NewToggle("Rainbow House Bio", function(state)
        do
            running = state
            if state then
                task.spawn(function()
                    do
                        while running do
                            local success, errorMessage = pcall(function()
                                do
                                    local players = game:GetService("Players")
                                    local replicatedStorage = game:GetService("ReplicatedStorage")
                                    local localPlayer = players.LocalPlayer
                                    local colorEvent = replicatedStorage.RE["1RPHous1eEven1tColo1r"]
                                    local colorFrames = localPlayer.PlayerGui.MainGUIHandler.HouseControl.HomeBus.HomeText.Picks.Frame:GetChildren()

                                    for _, frame in ipairs(colorFrames) do
                                        if not running then break end
                                        if frame:IsA("GuiObject") and frame:FindFirstChild("Color") then
                                            local args = {
                                                [1] = "PickingBusinessNameColor",
                                                [2] = frame.Color
                                            }
                                            colorEvent:FireServer(unpack(args))
                                            task.wait(0.7)
                                        end
                                    end

                                    task.wait(1)
                                end
                            end)

                            if not success then
                                task.wait(5)
                            end
                        end
                    end
                end)
            end
        end
    end)
end

House:NewLabel("House Design")

do
    -- Rainbow House Exterior
    local remote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
    local runningRainbow = false
    local duration = 3

    local function getRandomColor()
        do
            return Color3.new(
                math.random(50, 255) / 255,
                math.random(50, 255) / 255,
                math.random(50, 255) / 255
            )
        end
    end

    local function lerpColor(a, b, t)
        do
            return Color3.new(
                a.R + (b.R - a.R) * t,
                a.G + (b.G - a.G) * t,
                a.B + (b.B - a.B) * t
            )
        end
    end

    local function smoothColorTransition()
        do
            local currentColor = getRandomColor()
            local targetColor = getRandomColor()

            while runningRainbow do
                local startTime = tick()
                while tick() - startTime < duration do
                    if not runningRainbow then return end
                    local alpha = (tick() - startTime) / duration
                    remote:FireServer("ColorPickHouse", lerpColor(currentColor, targetColor, alpha))
                    task.wait(0.1)
                end

                currentColor = targetColor
                targetColor = getRandomColor()
            end
        end
    end

    House:NewToggle("Rainbow House Exterior", function(state)
        do
            runningRainbow = state
            if state then
                task.spawn(smoothColorTransition)
            end
        end
    end)
end

House:NewLabel("House Settings")

do
    -- House Finder System
    local selectedHouse
    local selectedPlayer

    local function getExistingHouses()
        do
            local houses = {}
            for _, v in pairs(workspace["001_Lots"]:GetChildren()) do
                if string.find(v.Name, "House") and v:FindFirstChild("HousePickedByPlayer") then
                    table.insert(houses, {
                        FullName = v.Owner.Value,
                        HouseNumber = v.Number.Number.Value,
                        Model = v
                    })
                end
            end
            return houses
        end
    end

    local function findHouseByName(partialName)
        do
            partialName = partialName:lower()
            for _, data in pairs(getExistingHouses()) do
                if string.find(data.FullName:lower(), partialName) then
                    return data
                end
            end
        end
    end

    House:NewTextBox("Target Player", "", function(txt)
        do
            local result = findHouseByName(txt)
            if result then
                selectedHouse = result.HouseNumber
                selectedPlayer = result.FullName
            else
                selectedHouse = nil
                selectedPlayer = nil
            end
        end
    end)

    House:NewButton("Teleport to House", function()
        do
            if not selectedHouse then return end
            for _, v in pairs(workspace["001_Lots"]:GetChildren()) do
                if v.Name ~= "DontDelete" and v.Number.Number.Value == selectedHouse then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.WorldPivot.Position)
                    break
                end
            end
        end
    end)

    House:NewButton("Teleport to Vault", function()
        do
            if not selectedHouse then return end
            for _, v in pairs(workspace["001_Lots"]:GetChildren()) do
                if v.Name ~= "DontDelete" and v.Number.Number.Value == selectedHouse then
                    local safe = v.HousePickedByPlayer.HouseModel["001_Safe"]
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(safe.WorldPivot.Position)
                    break
                end
            end
        end
    end)

    House:NewToggle("Noclip House Door", function(state)
        do
            if not selectedHouse then return end
            for _, v in pairs(workspace["001_Lots"]:GetChildren()) do
                if v.Name ~= "DontDelete" and v.Number.Number.Value == selectedHouse then
                    pcall(function()
                        do
                            for _, part in pairs(v.HousePickedByPlayer.HouseModel["001_HouseDoors"].HouseDoorFront:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = not state
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end
    end)

    House:NewToggle("Spam Doorbell", function(state)
        do
            getgenv().AutoSpamDoorbell = state
            task.spawn(function()
                do
                    while getgenv().AutoSpamDoorbell do
                        if not selectedHouse then break end
                        for _, v in pairs(workspace["001_Lots"]:GetChildren()) do
                            if v.Name ~= "DontDelete" and v.Number.Number.Value == selectedHouse then
                                fireclickdetector(v.HousePickedByPlayer.HouseModel["001_DoorBell"].TouchBell.ClickDetector)
                                break
                            end
                        end
                        task.wait(0.5)
                    end
                end
            end)
        end
    end)

    House:NewToggle("Spam Knock", function(state)
        do
            getgenv().AutoSpamKnock = state
            task.spawn(function()
                do
                    while getgenv().AutoSpamKnock do
                        if not selectedHouse then break end
                        for _, v in pairs(workspace["001_Lots"]:GetChildren()) do
                            if v.Name ~= "DontDelete" and v.Number.Number.Value == selectedHouse then
                                fireclickdetector(v.HousePickedByPlayer.HouseModel["001_HouseDoors"].HouseDoorFront.Knock.TouchBell.ClickDetector)
                                break
                            end
                        end
                        task.wait(0.5)
                    end
                end
            end)
        end
    end)
end

House:NewLabel("Player House Settings")

do
    local remote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")

    House:NewButton("Activate House Fire", function()
        do
            remote:FireServer("PlayerWantsFireOnFirePassNotShowingAnyone")
        end
    end)

    local lockLoop = false
    local function lockDoorsLoop()
        do
            while lockLoop do
                remote:FireServer("LockDoors")
                task.wait(1.5)
            end
        end
    end

    House:NewToggle("Spam Door Lock", function(state)
        do
            lockLoop = state
            if state then
                spawn(lockDoorsLoop)
            end
        end
    end)

    local poolLoop = false
    local function poolToggleLoop()
        do
            while poolLoop do
                remote:FireServer("PoolOnOff")
                task.wait(2)
            end
        end
    end

    House:NewToggle("Spam Pool", function(state)
        do
            poolLoop = state
            if state then
                spawn(poolToggleLoop)
            end
        end
    end)

    local garageLoop = false
    House:NewToggle("Spam Garage", function(state)
        do
            garageLoop = state
            if state then
                spawn(function()
                    do
                        while garageLoop do
                            remote:FireServer("GarageDoor")
                            task.wait(0.5)
                        end
                    end
                end)
            end
        end
    end)

    local curtainsLoop = false
    House:NewToggle("Spam Curtains", function(state)
        do
            curtainsLoop = state
            if state then
                spawn(function()
                    do
                        while curtainsLoop do
                            remote:FireServer("Curtains")
                            task.wait(0.5)
                        end
                    end
                end)
            end
        end
    end)

    local babyLoop = false
    House:NewToggle("Spam Baby Stuff", function(state)
        do
            babyLoop = state
            if state then
                spawn(function()
                    do
                        while babyLoop do
                            remote:FireServer("BabyOptionYes")
                            task.wait(0.5)
                            remote:FireServer("BabyOptionNo")
                            task.wait(0.5)
                        end
                    end
                end)
            end
        end
    end)

    House:NewButton("Unban House (AntiBlock)", function()
        do
            loadstring(game:HttpGet('https://pastebin.com/raw/17dSEXCP'))()
        end
    end)
end

do -- Normal Name Section
    Avatar:NewLabel("Normal Name Section")
    
    do -- RP Name TextBox
        Avatar:NewTextBox("RP Name", "", function(value)
            do
                local args = {
                    [1] = "RolePlayName",
                    [2] = value
                }
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
            end
        end)
    end
    
    do -- Rainbow Name Buttons
        local trocandoCores = false
        
        Avatar:NewButton("Rainbow Name", function()
            do
                if trocandoCores then return end
                trocandoCores = true

                task.spawn(function()
                    while trocandoCores do
                        local hue = (tick() % 10) / 10
                        local color = Color3.fromHSV(hue, 1, 1)

                        local args = {
                            [1] = "PickingRPNameColor",
                            [2] = color
                        }

                        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("RE"):FindFirstChild("1RPNam1eColo1r")
                        if remote then
                            remote:FireServer(unpack(args))
                        end

                        task.wait(0.15)
                    end
                end)
            end
        end)

        Avatar:NewButton("Off Rainbow Name", function()
            do
                trocandoCores = false
            end
        end)
    end
end

do -- Normal Bio Section
    Avatar:NewLabel("Normal Bio")
    
    do -- RP Bio TextBox
        Avatar:NewTextBox("RP Bio", "", function(value)
            do
                local args = {
                    [1] = "RolePlayBio",
                    [2] = value
                }
                local event = game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t")
                if event then
                    event:FireServer(unpack(args))
                else
                    warn("Evento não encontrado!")
                end
            end
        end)
    end
    
    do -- Rainbow Bio Buttons
        local trocandoCores = false
        
        Avatar:NewButton("Rainbow Bio", function()
            do
                if trocandoCores then return end
                trocandoCores = true

                task.spawn(function()
                    while trocandoCores do
                        local hue = (tick() % 10) / 10
                        local color = Color3.fromHSV(hue, 1, 1)

                        local args = {
                            [1] = "PickingRPBioColor",
                            [2] = color
                        }

                        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("RE"):FindFirstChild("1RPNam1eColo1r")
                        if remote then
                            remote:FireServer(unpack(args))
                        end

                        task.wait(0.15)
                    end
                end)
            end
        end)

        Avatar:NewButton("Off Rainbow Bio", function()
            do
                trocandoCores = false
            end
        end)
    end
end

Avatar:NewLabel("FE Avatar Copier")

local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local lastValidTarget = nil
local copyType = "Brookhaven"
local Target = nil

local function Wear(id)
    pcall(function()
        Rep.Remotes.Wear:InvokeServer(id)
    end)
end

local function WearShirt(id)
    pcall(function()
        Rep.Remotes.WearShirt:InvokeServer(id)
    end)
end

local function WearPants(id)
    pcall(function()
        Rep.Remotes.WearPants:InvokeServer(id)
    end)
end

local function RESETBLOCK()
    pcall(function()
        local args = {
            {
                0, 0, 0, 0, 0, 0
            }
        }
        Rep.Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function ApplySkinToneFromUserId(userId)
    pcall(function()
        local info = Players:GetCharacterAppearanceInfoAsync(userId)
        if info.bodyColors and info.bodyColors.HeadColor then
            Rep.Remotes.ChangeBodyColor:FireServer(tostring(info.bodyColors.HeadColor))
        end
    end)
end

local function CopyClothing(desc)
    local items = {
        desc.Shirt,
        desc.Pants,
        desc.GraphicTShirt,
        desc.Face
    }
    for _, id in ipairs(items) do
        if tonumber(id) and id ~= 0 then
            if tostring(id):find("shirt") then
                WearShirt(id)
            elseif tostring(id):find("pants") then
                WearPants(id)
            else
                Wear(id)
            end
            task.wait(0.1)
        end
    end
end

local function CopyAccessories(desc)
    pcall(function()
        for _, v in ipairs(desc:GetAccessories(true)) do
            if v.AssetId then
                Wear(v.AssetId)
                task.wait(0.1)
            end
        end
    end)
end

local function CopyBodyParts(desc, source)
    pcall(function()
        local args = {
            {
                tonumber(desc.Torso),
                tonumber(desc.RightArm),
                tonumber(desc.LeftArm),
                tonumber(desc.RightLeg),
                tonumber(desc.LeftLeg),
                tonumber(desc.Head)
            }
        }
        Rep.Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function CopyAnimations(desc)
    local anims = {
        desc.IdleAnimation,
        desc.WalkAnimation,
        desc.RunAnimation,
        desc.JumpAnimation,
        desc.FallAnimation,
        desc.SwimAnimation
    }
    for _, animId in ipairs(anims) do
        if tonumber(animId) and animId ~= 0 then
            Wear(animId)
            task.wait(0.1)
        end
    end
end

local function CopyBrookhaven(targetPlayer)
    local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local desc = humanoid:GetAppliedDescription()
    local bodyColors = targetPlayer.Character:FindFirstChildOfClass("BodyColors")
    if bodyColors and bodyColors.HeadColor then
        Rep.Remotes.ChangeBodyColor:FireServer(tostring(bodyColors.HeadColor))
    end
    pcall(function()
        CopyAccessories(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription())
        RESETBLOCK()
        CopyAccessories(desc)
        task.wait(0.1)
        CopyBodyParts(desc, "Hanzo hub")
        CopyClothing(desc)
        CopyAnimations(desc)
    end)
end

local function CopyOriginalAvatar(userId)
    pcall(function()
        local desc = Players:GetHumanoidDescriptionFromUserId(userId)
        CopyAccessories(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription())
        RESETBLOCK()
        CopyAccessories(desc)
        task.wait(0.1)
        CopyBodyParts(desc, "Hanzo hub")
        CopyClothing(desc)
        CopyAnimations(desc)
        ApplySkinToneFromUserId(userId)
    end)
end

local function findPlayerByName(partialName)
    if not partialName or partialName == "" then return nil end
    partialName = partialName:lower()
    local foundPlayers = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Name:lower():find(partialName, 1, true) then
            table.insert(foundPlayers, player)
        end
    end
    table.sort(foundPlayers, function(a, b)
        local aStart = a.Name:lower():sub(1, #partialName) == partialName
        local bStart = b.Name:lower():sub(1, #partialName) == partialName
        if aStart and not bStart then return true end
        if not aStart and bStart then return false end
        return #a.Name < #b.Name
    end)
    return foundPlayers[1]
end

Avatar:NewTextBox("Target Player", "type name..", function(text)
    if text == "" then
        if lastValidTarget then
            text = lastValidTarget
        else
            return
        end
    end
    local targetPlayer = findPlayerByName(text)
    if targetPlayer then
        Target = targetPlayer
        lastValidTarget = targetPlayer.Name
    end
end)

Avatar:NewDropdown("Copy Method", {"Brookhaven", "Original Avatar"}, function(option)
    copyType = option
end)

Avatar:NewButton("Copy Avatar", function()
    if not Target then return end
    if copyType == "Brookhaven" then
        CopyBrookhaven(Target)
    else
        CopyOriginalAvatar(Target.UserId)
    end
end)

Avatar:NewButton("Copy Avatar Nearest", function()
    local closest, dist = nil, math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local mag = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if mag < dist then
                closest = player
                dist = mag
            end
        end
    end
    if closest then
        if copyType == "Brookhaven" then
            CopyBrookhaven(closest)
        else
            CopyOriginalAvatar(closest.UserId)
        end
    end
end)

Avatar:NewButton("Copy Avatar Random", function()
    local candidates = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(candidates, player)
        end
    end
    if #candidates > 0 then
        local target = candidates[math.random(1, #candidates)]
        if copyType == "Brookhaven" then
            CopyBrookhaven(target)
        else
            CopyOriginalAvatar(target.UserId)
        end
    end
end)

do -- Avatar Section
    Avatar:NewLabel("Avatar")

    Avatar:NewButton("Old R6 Animation", function()
        do
            loadstring(game:HttpGet('https://gist.githubusercontent.com/Imperador950/f9e54330eb4a92331204aae37ec11aef/raw/db18d1c348beb8a79931346597137518966f2188/Byshelby'))()
        end
    end)

    Avatar:NewButton("Old R15 Animation", function()
        do
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")

            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                track:Stop()
                track:Destroy()
            end

            for _, descendant in ipairs(character:GetDescendants()) do
                if descendant:IsA("Animation") then
                    descendant:Destroy()
                end
            end

            for _, obj in ipairs(character:GetDescendants()) do
                if obj:IsA("Tool") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                    for _, child in ipairs(obj:GetDescendants()) do
                        if child:IsA("Animation") then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end)
end

do -- Job Section
    Avatar:NewLabel("Job Section")

    do -- Job Loop Functionality
        local ChangeJobLoopEnabled = false

        local function changeJobLoop()
            do
                while ChangeJobLoopEnabled do
                    local args = { [1] = "Dancer" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "Grocery Store" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "Police" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "Hospital" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "Fire House" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "Teacher" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "Student" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "Bank" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()
                    
                    args = { [1] = "S.W.A.T." }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                    wait()                   
                    
                    args = { [1] = "Agency" }
                    game:GetService("ReplicatedStorage").Remotes.GiveJobUIMenu:FireServer(unpack(args))
                end
            end
        end

        Avatar:NewToggle("Loop Jobs", function(Value)
            do
                if Value then
                    ChangeJobLoopEnabled = true
                    changeJobLoop()
                else
                    ChangeJobLoopEnabled = false
                end
            end
        end)
    end
end

do -- Character Settings
    Avatar:NewLabel("Character Settings")

    do -- Movement Settings
        local StarterGui = game:GetService("StarterGui")
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        local function getHumanoid()
            do
                character = player.Character or player.CharacterAdded:Wait()
                return character:FindFirstChildOfClass("Humanoid")
            end
        end

        local function notify(title, text, duration)
            do
                StarterGui:SetCore("SendNotification", {
                    Title = title,
                    Text = text,
                    Duration = duration or 3
                })
            end
        end

        Avatar:NewTextBox("Speed", "", function(text)
            do
                local value = tonumber(text)
                local humanoid = getHumanoid()
                if humanoid and value then
                    humanoid.WalkSpeed = value
                    notify("Velocidade Alterada", "Nova velocidade: " .. value)
                else
                    warn("Valor inválido para velocidade")
                    notify("Erro", "Valor inválido para velocidade")
                end
            end
        end)

        Avatar:NewTextBox("Jump", "", function(text)
            do
                local value = tonumber(text)
                local humanoid = getHumanoid()
                if humanoid and value then
                    humanoid.JumpPower = value
                    notify("Salto Alterado", "Novo salto: " .. value)
                else
                    warn("Valor inválido para salto")
                    notify("Erro", "Valor inválido para salto")
                end
            end
        end)

        Avatar:NewButton("Reset Walkspeed/Jumppower", function()
            do
                local humanoid = getHumanoid()
                if humanoid then
                    humanoid.WalkSpeed = 16
                    humanoid.JumpPower = 50
                    notify("Valores Restaurados", "Velocidade e salto padrão aplicados.")
                else
                    warn("Humanoid não encontrado!")
                    notify("Erro", "Humanoid não encontrado!")
                end
            end
        end)
    end

    do -- Avatar Management
        Avatar:NewButton("Refresh Avatar", function()
            do
                game:GetService("ReplicatedStorage").Remotes.ResetCharacterAppearance:FireServer()
            end
        end)

        Avatar:NewButton("Reset 1", function()
            do
                local character = game.Players.LocalPlayer.Character
                local humanoid = character:FindFirstChild("Humanoid")

                for _, part in pairs(character:GetChildren()) do  
                    if part:IsA("Part") or part:IsA("BasePart") or part:IsA("MeshPart") then  
                        if part.Anchored then  
                            part.Anchored = false  
                        end  
                    end  
                end  

                if humanoid then  
                    humanoid.Health = 0  
                end
            end
        end)

        Avatar:NewButton("Reset 2", function()
            do
                local character = game.Players.LocalPlayer.Character
                if not character then return end

                for _, part in pairs(character:GetChildren()) do  
                    if part:IsA("Part") or part:IsA("BasePart") or part:IsA("MeshPart") then  
                        if part.Anchored then  
                            part.Anchored = false  
                        end  
                    end  
                end  

                local upperTorso = character:FindFirstChild("UpperTorso")  
                if upperTorso then  
                    upperTorso:Destroy()  
                end
            end
        end)
    end
end

do -- Character Appearance
    Avatar:NewLabel("Character Appearance")

    do -- Fire Effects
        Avatar:NewButton("Fire Avatar", function()
            do
                local player = game.Players.LocalPlayer
                local character = player.Character
                if not character then return end

                local house = workspace:FindFirstChild("001_Lots") and workspace["001_Lots"]:FindFirstChild(player.Name .. "House")
                local mall = house
                    and house:FindFirstChild("HousePickedByPlayer")
                    and house.HousePickedByPlayer:FindFirstChild("HouseModel")
                    and house.HousePickedByPlayer.HouseModel:FindFirstChild("001_BBQ")
                    and house.HousePickedByPlayer.HouseModel["001_BBQ"]:FindFirstChild("CatchFire")

                local hrp = character:FindFirstChild("HumanoidRootPart")

                if mall and hrp then
                    firetouchinterest(hrp, mall, 0)
                    task.wait()
                    firetouchinterest(hrp, mall, 1)
                else
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Erro",
                        Text = "Você Precisa Ter uma House Spawnada com uma churrasqueira para utilizar dessa função.",
                        Duration = 4
                    })
                end
            end
        end)

        local FireLoopAtivo = false

        local function toggleFireLoop(ativo)
            do
                local player = game.Players.LocalPlayer
                FireLoopAtivo = ativo
                notify("Loop Fire", ativo and "Ativado" or "Desativado")

                if ativo then
                    task.spawn(function()
                        while FireLoopAtivo do
                            local character = player.Character
                            local house = workspace:FindFirstChild("001_Lots") and workspace["001_Lots"]:FindFirstChild(player.Name .. "House")
                            local mall = house
                                and house:FindFirstChild("HousePickedByPlayer")
                                and house.HousePickedByPlayer:FindFirstChild("HouseModel")
                                and house.HousePickedByPlayer.HouseModel:FindFirstChild("001_BBQ")
                                and house.HousePickedByPlayer.HouseModel["001_BBQ"]:FindFirstChild("CatchFire")

                            local hrp = character and character:FindFirstChild("HumanoidRootPart")

                            if mall and hrp then
                                firetouchinterest(hrp, mall, 0)
                                task.wait()
                                firetouchinterest(hrp, mall, 1)
                            else
                                game:GetService("StarterGui"):SetCore("SendNotification", {
                                    Title = "Erro",
                                    Text = "Você Precisa Ter uma House Spawnada com uma churrasqueira para utilizar dessa função.",
                                    Duration = 4
                                })
                                break
                            end
                            task.wait(1)
                        end
                    end)
                end
            end
        end

        Avatar:NewToggle("Loop Fire Avatar", function(state)
            do
                toggleFireLoop(state)
            end
        end)
    end

    do -- Smoke Effects
        Avatar:NewButton("Smoke Avatar", function()
            do
                local player = game.Players.LocalPlayer
                local mall = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_Mall")
                mall = mall and mall:FindFirstChild("001_Pizza") and mall["001_Pizza"]:FindFirstChild("CatchFire")
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if mall and hrp then
                    firetouchinterest(hrp, mall, 0)
                    task.wait()
                    firetouchinterest(hrp, mall, 1)
                end
            end
        end)

        local SmokeLoopAtivo = false

        local function toggleSmokeLoop(ativo)
            do
                SmokeLoopAtivo = ativo
                notify("Loop Smoke", ativo and "Ativado" or "Desativado")

                if ativo then
                    local player = game.Players.LocalPlayer
                    task.spawn(function()
                        while SmokeLoopAtivo do
                            local mall = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_Mall")
                            mall = mall and mall:FindFirstChild("001_Pizza") and mall["001_Pizza"]:FindFirstChild("CatchFire")
                            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                            if mall and hrp then
                                firetouchinterest(hrp, mall, 0)
                                task.wait()
                                firetouchinterest(hrp, mall, 1)
                            end
                            task.wait(1)
                        end
                    end)
                end
            end
        end

        Avatar:NewToggle("Loop Smoke Avatar", function(state)
            do
                toggleSmokeLoop(state)
            end
        end)
    end
end

do -- Body Section
    Avatar:NewLabel("Body Section")
    
    Avatar:NewButton("FE Faceless", function()
        do
            local head = game.Players.LocalPlayer.Character:WaitForChild("Head")
            local face = head:FindFirstChildOfClass("Decal")
            if face then
                face.Texture = "rbxassetid://0"
            end
        end
    end)

    Avatar:NewButton("FE Naked", function()
        do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()

            local shirt = character:FindFirstChildOfClass("Shirt")  
            if shirt then shirt:Destroy() end  

            local pants = character:FindFirstChildOfClass("Pants")  
            if pants then pants:Destroy() end
        end
    end)

    Avatar:NewButton("Refresh Avatar", function()
        do
            game:GetService("ReplicatedStorage").Remotes.ResetCharacterAppearance:FireServer()
        end
    end)
end

do -- Custom Items Section
    Avatar:NewLabel("Custom Hats, Hairs, and some...")

    Avatar:NewTextBox("Id Box", "", function(Value)
        do
            local args = {
                [1] = Value
            }
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
        end
    end)

    Avatar:NewButton("Refresh Avatar", function()
        do
            game:GetService("ReplicatedStorage").Remotes.ResetCharacterAppearance:FireServer()
        end
    end)
end

 Car:NewLabel("Target Car Player Section")

local Vehicles = workspace:FindFirstChild("Vehicles")
local Player = game.Players.LocalPlayer
local SelectCar = ""

-- Função para encontrar o primeiro carro com nome que começa com o texto digitado (case-insensitive)
local function findCarByPartialName(partialName)
    if not Vehicles then return nil end
    partialName = partialName:lower()

    for _, car in ipairs(Vehicles:GetChildren()) do
        if car:IsA("Model") and car.Name:lower():sub(1, #partialName) == partialName then
            return car.Name
        end
    end
end

Car:NewTextBox("Vehicle -", "Enter vehicle name", function(text)
    do
        if typeof(text) ~= "string" or text == "" then return end

        local matched = findCarByPartialName(text)
        if matched then
            SelectCar = matched
        end
    end
end)

Car:NewButton("Teleport to Vehicle", function()
    do
        local CarModel = Vehicles and Vehicles:FindFirstChild(SelectCar)
        if not CarModel then return end

        for _, part in ipairs(CarModel:GetDescendants()) do
            if part:IsA("BasePart") then
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(part.Position)
                break
            end
        end
    end
end)

Car:NewButton("Teleport to Seat", function()
    do
        local CarModel = Vehicles and Vehicles:FindFirstChild(SelectCar)
        local Character = Player.Character
        if not (CarModel and Character) then return end

        local Seat = CarModel:FindFirstChild("Body") and CarModel.Body:FindFirstChild("VehicleSeat")
                    or CarModel:FindFirstChildWhichIsA("VehicleSeat")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")

        if Seat and RootPart then
            RootPart.CFrame = Seat.CFrame + Vector3.new(0, 3, 0)
        end
    end
end)

Car:NewButton("Pull Vehicle", function()
    do
        local CarModel = Vehicles and Vehicles:FindFirstChild(SelectCar)
        local Character = Player.Character
        if not (CarModel and Character) then return end

        local Seat = CarModel:FindFirstChild("Body") and CarModel.Body:FindFirstChild("VehicleSeat")
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")

        if Seat and Humanoid and RootPart then
            if not CarModel.PrimaryPart then
                local try = CarModel:FindFirstChild("Primary") or CarModel:FindFirstChildWhichIsA("BasePart")
                if try then
                    CarModel.PrimaryPart = try
                else
                    return
                end
            end

            local OldPos = RootPart.CFrame

            repeat task.wait()
                RootPart.CFrame = Seat.CFrame
            until Humanoid.Sit

            task.wait(0.7)
            CarModel:SetPrimaryPartCFrame(OldPos)
        end
    end
end)

Car:NewLabel("Tank Section")

local player = game:GetService("Players").LocalPlayer
local spamConns = {}

local function explode(car)
    local p = car:FindFirstChild("Body") and car.Body:FindFirstChild("BodyPanels")
    local s = p and p:FindFirstChild("Shoot")
    local cd = s and s:FindFirstChildOfClass("ClickDetector")
    if cd then fireclickdetector(cd) end
end

local function toggleSpam(type, enable)
    if spamConns[type] then
        spamConns[type]:Disconnect()
        spamConns[type] = nil
    end

    if not enable then return end

    spamConns[type] = game:GetService("RunService").Heartbeat:Connect(function()
        local v = workspace:FindFirstChild("Vehicles")
        if not v then return end

        for _, car in ipairs(v:GetChildren()) do
            if car:IsA("Model") then
                if type == "Own" and car.Name == player.Name .. "Car" then
                    explode(car)
                elseif type == "All" and car.Name ~= player.Name .. "Car" then
                    explode(car)
                end
            end
        end
    end)
end

Car:NewToggle("Spam Explode Tank", function(state)
    toggleSpam("Own", state)
end)

Car:NewToggle("Spam Explode Every Tank", function(state)
    toggleSpam("All", state)
end)

Car:NewLabel("Car Settings (Premium Only) ")
 
local runningCarRainbow = false
local RunService = game:GetService("RunService")
local carRemote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r")

-- Reaproveita a função de gerar cores suaves
local function getRandomColor()
	local r = math.random(50, 255) / 255
	local g = math.random(50, 255) / 255
	local b = math.random(50, 255) / 255
	return Color3.new(r, g, b)
end

local function lerpColor(a, b, t)
	local r = a.R + (b.R - a.R) * t
	local g = a.G + (b.G - a.G) * t
	local b = a.B + (b.B - a.B) * t
	return Color3.new(r, g, b)
end

local function smoothCarColorTransition()
	local currentColor = getRandomColor()
	local targetColor = getRandomColor()
	local duration = 2.5 -- pode ajustar conforme feeling

	while runningCarRainbow do
		local startTime = tick()
		while tick() - startTime < duration do
			if not runningCarRainbow then return end
			local elapsed = tick() - startTime
			local alpha = elapsed / duration
			local newColor = lerpColor(currentColor, targetColor, alpha)

			carRemote:FireServer("PickingCarColor", newColor)

			task.wait(0.1)
		end

		currentColor = targetColor
		targetColor = getRandomColor()
	end
end

Car:NewToggle("Rainbow Car", function(state)
	runningCarRainbow = state
	if state then
		task.spawn(smoothCarColorTransition)
		
	else
		
	end
end)

Car:NewButton("Remove Wheel", function()
 args = {
    [1] = "BlowFrontLeft"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
wait()
 args = {
    [1] = "BlowFrontRight"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
wait()
 args = {
    [1] = "BlowRearRight"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
wait() 
args = {
    [1] = "BlowRearLeft"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
end)

Car:NewToggle("Spam Fire", function(state)
    runningFire = state
    if state then
        spawn(function()
            while runningFire do
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer("Fire")
                wait(0.5)
            end
        end)
        print("")
    else
        print("")
    end
end)

local runningDuke1 = false
Car:NewToggle("Spam Duke 1", function(state)
    runningDuke1 = state
    if state then
        spawn(function()
            while runningDuke1 do
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer("Duke1")
                wait(0.5)
            end
        end)
        print("")
    else
        print("")
    end
end)

local runningDuke2 = false
Car:NewToggle("Spam Duke 2", function(state)
    runningDuke2 = state
    if state then
        spawn(function()
            while runningDuke2 do
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer("Duke")
                wait(0.5)
            end
        end)
        print("")
    else
        print("")
    end
end)

Car:NewToggle("Spam Turbo", function(state)
    runningSmoke = state
    if state then
        spawn(function()
            while runningSmoke do
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer("Smoke")
                wait(0.5)
            end
        end)
        print("")
    else
        print("")
    end
end)

function playCarMusic(musicId)
    if musicId and musicId ~= "" then
        carArgs = {
            [1] = "PickingCarMusicText",
            [2] = musicId
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(carArgs))
    else
        print("")
    end
end

function playScooterMusic(musicId)
    if musicId and musicId ~= "" then
         scooterArgs = {
            [1] = "PickingScooterMusicText",
            [2] = musicId
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(scooterArgs))
    else
        print("")
    end
end

Car:NewTextBox("Car Music", "Enter id here", function(value)
            playCarMusic(value)
            playScooterMusic(value)
        end)

Car:NewLabel("Car Settings (Free) ")

local Player = game.Players.LocalPlayer
local Vehicles = workspace:FindFirstChild("Vehicles")

 function ApplyValueToCar(value)
    local car = Vehicles and Vehicles:FindFirstChild(Player.Name .. "Car")
    if car then
        local seat = car:FindFirstChild("Body") and car.Body:FindFirstChild("VehicleSeat")
        if seat then
            seat.TopSpeed.Value = value
            seat.Turbo.Value = value

             args = {
                [1] = "DriftingNumber",
                [2] = value
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))

            print("Speed =  " .. value)
        else
            print("Error sit in car first")
        end
    else
        print("Spawn a car first !")
    end
end

Car:NewTextBox("Speed Box", "Enter id here...", function(input)
        local num = tonumber(input)
        if num then
            ApplyValueToCar(num)
        else
            print("...")
        end
    end)
    
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")

-- Spam Horn
local hornActive = false
Car:NewToggle("Spam Horn", function(state)
    hornActive = state
    if state then
        spawn(function()
            while hornActive do
                remote:FireServer("Horn")
                wait(0.1)
            end
        end)
    end
end)

-- Spam Light
local lightActive = false
Car:NewToggle("Spam Light", function(state)
    lightActive = state
    if state then
        spawn(function()
            while lightActive do
                remote:FireServer("Lights")
                wait(0.1)
            end
        end)
    end
end)

-- Spam Hazards
local hazardActive = false
Car:NewToggle("Spam Hazards", function(state)
    hazardActive = state
    if state then
        spawn(function()
            while hazardActive do
                remote:FireServer("Hazards")
                wait(0.1)
            end
        end)
    end
end)

-- Spam Wheel
local wheelActive = false
Car:NewToggle("Spam Wheel", function(state)
    wheelActive = state
    if state then
        spawn(function()
            while wheelActive do
                remote:FireServer("WheelNumber")
                wait(0.1)
            end
        end)
    end
end)

local heightActive = false
Car:NewToggle("Spam Height", function(state)
    heightActive = state
    if state then
        spawn(function()
            while heightActive do
                remote:FireServer("VehicleHeight", 4)
                wait(0.1)
                remote:FireServer("VehicleHeight", 1)
                wait(0.1)
            end
        end)
    end
end)

Car:NewLabel("Bike Section")

local runningBikeRainbow = false
local bikeRemote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r")

-- Reutiliza função global se já existir
local function getRandomColor()
	local r = math.random(50, 255) / 255
	local g = math.random(50, 255) / 255
	local b = math.random(50, 255) / 255
	return Color3.new(r, g, b)
end

local function lerpColor(a, b, t)
	local r = a.R + (b.R - a.R) * t
	local g = a.G + (b.G - a.G) * t
	local b = a.B + (b.B - a.B) * t
	return Color3.new(r, g, b)
end

local function smoothBikeColorTransition()
	local currentColor = getRandomColor()
	local targetColor = getRandomColor()
	local duration = 2.5 -- ajuste de acordo com o efeito desejado

	while runningBikeRainbow do
		local startTime = tick()
		while tick() - startTime < duration do
			if not runningBikeRainbow then return end
			local elapsed = tick() - startTime
			local alpha = elapsed / duration
			local newColor = lerpColor(currentColor, targetColor, alpha)

			bikeRemote:FireServer("NoMotorColor", newColor)
			task.wait(0.1)
		end

		currentColor = targetColor
		targetColor = getRandomColor()
	end
end

Car:NewToggle("Rainbow Bike", function(state)
	runningBikeRainbow = state
	if state then
		print("Rainbow Bike ativado.")
		task.spawn(smoothBikeColorTransition)
	else
		print("Rainbow Bike desativado.")
	end
end)

Fun:NewLabel("Sign Section")
Fun:NewButton("Get Sign", function()
 args = {[1] = "PickingTools", [2] = "Sign"}		
	game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    game.Players.LocalPlayer.Backpack["Sign"].Parent = game.Players.LocalPlayer.Character
end)

 sign1 = ""
 sign2 = ""
 sign3 = ""
 sign4 = ""
 sign5 = ""
 repeatNames = false

Textbox = Fun:NewTextBox("Sign 1", "Enter text here...", function(value)
sign1 = value
end)
Textbox = Fun:NewTextBox("Sign 2", "Enter text here...", function(value)
sign2 = value
end)
Textbox = Fun:NewTextBox("Sign 3", "Enter text here...", function(value)
sign3 = value
end)
Textbox = Fun:NewTextBox("Sign 4", "Enter text here...", function(value)
sign4 = value
end)
Textbox = Fun:NewTextBox("Sign 5", "Enter text here...", function(value)
sign5 = value
end)

Fun:NewToggle("Validate", function(value)
repeatNames = value
while repeatNames do
args1 = {
    [1] = "Sign",
    [2] = "SignWords",
    [3] = sign1
}

game:GetService("Players").LocalPlayer.Character.Sign.ToolSound:FireServer(unpack(args1))
wait(0.2)
args2 = {
    [1] = "Sign",
    [2] = "SignWords",
    [3] = sign2
}

game:GetService("Players").LocalPlayer.Character.Sign.ToolSound:FireServer(unpack(args2))
wait(0.2)
args3 = {
    [1] = "Sign",
    [2] = "SignWords",
    [3] = sign3
}

game:GetService("Players").LocalPlayer.Character.Sign.ToolSound:FireServer(unpack(args3))
wait(0.2)
args4 = {
    [1] = "Sign",
    [2] = "SignWords",
    [3] = sign4
}

game:GetService("Players").LocalPlayer.Character.Sign.ToolSound:FireServer(unpack(args4))
wait(0.2)
args5 = {
    [1] = "Sign",
    [2] = "SignWords",
    [3] = sign5
}

game:GetService("Players").LocalPlayer.Character.Sign.ToolSound:FireServer(unpack(args5))
end
end)

Fun:NewLabel("Box Section")
Fun:NewButton("Get Box", function()
 args = {[1] = "PickingTools", [2] = "Box"}		
	game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    game.Players.LocalPlayer.Backpack["Box"].Parent = game.Players.LocalPlayer.Character
end)

 Box1 = ""
 Box2 = ""
 Box3 = ""
 Box4 = ""
 Box5 = ""
 repeatNames1 = false

Textbox = Fun:NewTextBox("Box 1", "Enter text here...", function(value)
Box1 = value
end)
Textbox = Fun:NewTextBox("Box 2", "Enter text here...", function(value)
Box2 = value
end)
Textbox = Fun:NewTextBox("Box 3", "Enter text here...", function(value)
Box3 = value
end)
Textbox = Fun:NewTextBox("Box 4", "Enter text here...", function(value)
Box4 = value
end)
Textbox = Fun:NewTextBox("Box 5", "Enter text here...", function(value)
Box5 = value
end)

Fun:NewToggle("Validate", function(value)
repeatNames1 = value
while repeatNames1 do
args1 = {
    [1] = "Box",
    [2] = "SignWords",
    [3] = Box1
}

game:GetService("Players").LocalPlayer.Character.Box.ToolSound:FireServer(unpack(args1))
wait(0.2)
args2 = {
    [1] = "Box",
    [2] = "SignWords",
    [3] = Box2
}

game:GetService("Players").LocalPlayer.Character.Box.ToolSound:FireServer(unpack(args2))
wait(0.2)
args3 = {
    [1] = "Box",
    [2] = "SignWords",
    [3] = Box3
}

game:GetService("Players").LocalPlayer.Character.Box.ToolSound:FireServer(unpack(args3))
wait(0.2)
args4 = {
    [1] = "Box",
    [2] = "SignWords",
    [3] = Box4
}

game:GetService("Players").LocalPlayer.Character.Box.ToolSound:FireServer(unpack(args4))
wait(0.2)
args5 = {
    [1] = "Box",
    [2] = "SignWords",
    [3] = Box5
}

game:GetService("Players").LocalPlayer.Character.Box.ToolSound:FireServer(unpack(args5))
end
end)

Fun:NewLabel("Roses Section")

-- ROSES SECTION
Fun:NewButton("Get Roses", function()
	 args = {"PickingTools", "Roses"}
	game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

	local player = game.Players.LocalPlayer
	local rose = player.Backpack:FindFirstChild("Roses")
	if rose then
		rose.Parent = player.Character
	end
end)

local toggleActive = false

function RosesColor()
	task.spawn(function()
		while toggleActive do
			local char = game.Players.LocalPlayer.Character
			if not char then break end
			local rose = char:FindFirstChild("Roses")
			if not rose then break end
			local sound = rose:FindFirstChild("ToolSound")
			if not sound then break end

			local sounds = {
				"http://www.roblox.com/asset/?id=5210399458",
				"http://www.roblox.com/asset/?id=5210414520",
				"http://www.roblox.com/asset/?id=5216708760"
			}

			for _, id in ipairs(sounds) do
				if not toggleActive then break end
				sound:FireServer("Roses", id)
				task.wait(0.2)
			end
		end
	end)
end

Fun:NewToggle("Rainbow Roses", function(value)
	toggleActive = value
	if toggleActive then
		RosesColor()
	end
end)

-- UNIVERSAL TOOL COUNTER
local function CountTool(toolName)
	local player = game.Players.LocalPlayer
	local total = 0
	for _, tool in ipairs(player.Backpack:GetChildren()) do
		if tool.Name == toolName then
			total += 1
		end
	end
	for _, tool in ipairs(player.Character:GetChildren()) do
		if tool.Name == toolName then
			total += 1
		end
	end
	return total
end

-- UNIVERSAL TOOL DUPLICATOR
local function CreateDuplicator(toolName, labelName)
	Fun:NewLabel(labelName.." Section")

	local amount = 100

	Fun:NewTextBox("Amount", "", function(value)
		local number = tonumber(value)
		if number and number > 0 then
			amount = number
		else
			warn("Enter a valid number.")
		end
	end)

	Fun:NewButton("Dupe "..labelName, function()
		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local backpack = player:WaitForChild("Backpack")
		local root = char:WaitForChild("HumanoidRootPart")

		local giveTools = workspace:FindFirstChild("WorkspaceCom")
			and workspace.WorkspaceCom:FindFirstChild("001_GiveTools")
		local toolObject = giveTools and giveTools:FindFirstChild(toolName)

		if not (toolObject and toolObject:FindFirstChildOfClass("ClickDetector")) then
			warn("Tool not found in Workspace.")
			return
		end

		local detector = toolObject:FindFirstChildOfClass("ClickDetector")
		local oldPos = root.CFrame

		task.spawn(function()
			while CountTool(toolName) < amount do
				root.CFrame = toolObject.CFrame
				fireclickdetector(detector)
				task.wait(0.01)
			end
			root.CFrame = oldPos
			print("Duplication complete: "..toolName.." x"..CountTool(toolName))
		end)
	end)
end

-- CRIANDO CADA SEÇÃO COM MESMO SISTEMA
CreateDuplicator("Taser", "Taser")
CreateDuplicator("FireX", "FireX")
CreateDuplicator("Assault", "Gun")
CreateDuplicator("Basketball", "Balls")

-- BALLS LOOPER SECTION
local ThrowActive = false
local ThrowThread

Fun:NewToggle("Balls Looper", function(state)
	ThrowActive = state

	if state then
		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()
		local char = player.Character or player.CharacterAdded:Wait()

		if not (player and mouse and char) then
			warn("Missing player, mouse or character")
			return
		end

		ThrowThread = task.spawn(function()
			while ThrowActive do
				for _, tool in ipairs(char:GetChildren()) do
					if tool.Name == "Basketball" and tool:FindFirstChild("ClickEvent") then
						tool.ClickEvent:FireServer(mouse.Hit.p)
						task.wait(0.0003)
					end
				end
				task.wait()
			end
		end)
	else
		if ThrowThread then
			task.cancel(ThrowThread)
			ThrowThread = nil
		end
	end
end)

Fun:NewLabel("Fling Click Section")

do Fun:NewButton("Fling Doors", function()
    do
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")

        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local HRP = Character:WaitForChild("HumanoidRootPart")

        do
            local BlackHole = Instance.new("Part")
            BlackHole.Size = Vector3.new(1000, 1000, 1000)
            BlackHole.Transparency = 1
            BlackHole.Anchored = true
            BlackHole.CanCollide = false
            BlackHole.Name = "BlackHoleTarget"
            BlackHole.Parent = Workspace

            local baseAttachment = Instance.new("Attachment")
            baseAttachment.Name = "HANZO_BlackHoleAttachment"
            baseAttachment.Parent = BlackHole

            RunService.Heartbeat:Connect(function()
                BlackHole.CFrame = HRP.CFrame
            end)

            local ControlledDoors = {}

            local function SetupPart(part)
                if not part:IsA("BasePart") or part.Anchored or not string.find(part.Name, "Door") then return end
                if part:FindFirstChild("SHNMAX_Attached") then return end

                part.CanCollide = false

                for _, obj in ipairs(part:GetChildren()) do
                    if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
                        obj:Destroy()
                    end
                end

                do
                    local marker = Instance.new("BoolValue")
                    marker.Name = "HANZO_Attached"
                    marker.Parent = part
                end

                do
                    local a1 = Instance.new("Attachment", part)

                    local align = Instance.new("AlignPosition", part)
                    align.Attachment0 = a1
                    align.Attachment1 = baseAttachment
                    align.MaxForce = math.huge
                    align.MaxVelocity = math.huge
                    align.Responsiveness = 6e9
                    align.Parent = part

                    local torque = Instance.new("Torque", part)
                    torque.Attachment0 = a1
                    torque.RelativeTo = Enum.ActuatorRelativeTo.World
                    torque.Torque = Vector3.new(
                        math.random(-7e1, 7e1) * 1e7,
                        math.random(-7e1, 7e1) * 1e7,
                        math.random(-7e1, 7e1) * 1e7
                    )
                    torque.Parent = part

                    table.insert(ControlledDoors, {Part = part, Align = align})
                end
            end

            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
                    SetupPart(obj)
                end
            end

            Workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
                    SetupPart(obj)
                end
            end)

            local function FlingPlayer(player)
                local char = player.Character
                if not char then return end
                local targetHRP = char:FindFirstChild("HumanoidRootPart")
                if not targetHRP then return end

                local targetAttachment = targetHRP:FindFirstChild("HANZO_TargetAttachment")
                if not targetAttachment then
                    targetAttachment = Instance.new("Attachment")
                    targetAttachment.Name = "HANZO_TargetAttachment"
                    targetAttachment.Parent = targetHRP
                end

                for _, data in ipairs(ControlledDoors) do
                    if data.Align then
                        data.Align.Attachment1 = targetAttachment
                    end
                end

                local start = tick()
                local flingDetected = false

                while tick() - start < 5 do
                    if targetHRP.Velocity.Magnitude >= 20 then
                        flingDetected = true
                        break
                    end
                    RunService.Heartbeat:Wait()
                end

                for _, data in ipairs(ControlledDoors) do
                    if data.Align then
                        data.Align.Attachment1 = baseAttachment
                    end
                end
            end

            UserInputService.TouchTap:Connect(function(touchPositions, processed)
                if processed then return end
                local pos = touchPositions[1]
                local camera = Workspace.CurrentCamera
                local unitRay = camera:ScreenPointToRay(pos.X, pos.Y)
                local raycast = Workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000)

                if raycast and raycast.Instance then
                    local hit = raycast.Instance
                    local player = Players:GetPlayerFromCharacter(hit:FindFirstAncestorOfClass("Model"))
                    if player and player ~= LocalPlayer then
                        FlingPlayer(player)
                    end
                end
            end)

            UserInputService.InputBegan:Connect(function(input, processed)
                if processed or input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                local mouse = LocalPlayer:GetMouse()
                local target = mouse.Target
                if target then
                    local player = Players:GetPlayerFromCharacter(target:FindFirstAncestorOfClass("Model"))
                    if player and player ~= LocalPlayer then
                        FlingPlayer(player)
                    end
                end
            end)
        end
    end
end) end

Fun:NewLabel("Helicopter Settings")

Dropdown = Fun:NewDropdown("Design List", {"Police", "Rescue", "Rich", "Military", "Agency", "Sheriff", "State Trooper"}, function(value)
        Callback = function(value)
            designHelico = value
             end
        end)

Fun:NewButton("Change Design", function()
if designHelico == "Police" then
 args = {
    [1] = game.Players.LocalPlayer.Name,
    [2] = "PoliceMeshID"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Max1y"):FireServer(unpack(args))
elseif designHelico == "Rescue" then
 args = {
    [1] = game.Players.LocalPlayer.Name,
    [2] = "RescueMeshID"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Max1y"):FireServer(unpack(args))
elseif designHelico == "Rich" then
 args = {
    [1] = game.Players.LocalPlayer.Name,
    [2] = "TubeTVMeshID"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Max1y"):FireServer(unpack(args))
elseif designHelico == "Military" then
 args = {
    [1] = game.Players.LocalPlayer.Name,
    [2] = "MilitaryMeshID"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Max1y"):FireServer(unpack(args))
elseif designHelico == "Agency" then
 args = {
    [1] = game.Players.LocalPlayer.Name,
    [2] = "AgencyMeshID"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Max1y"):FireServer(unpack(args))
elseif designHelico == "Sheriff" then
 args = {
    [1] = game.Players.LocalPlayer.Name,
    [2] = "SheriffMeshID"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Max1y"):FireServer(unpack(args))
elseif designHelico == "State Trooper" then
 args = {
    [1] = game.Players.LocalPlayer.Name,
    [2] = "StateTrooperMeshID"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Max1y"):FireServer(unpack(args))
  end
end)

Fun:NewLabel("Horse Section")

Fun:NewButton("Tp All Horse", function()
local players = game:GetService("Players")

for _, player in pairs(players:GetPlayers()) do
     args = {
        [1] = player
    }

    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Hors1eRemot1e"):FireServer(unpack(args))
end
  	end)

Fun:NewLabel("Modded Gun")
local function equipSniper()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player.Backpack
    local sniperTool = character:FindFirstChild("Sniper") or backpack:FindFirstChild("Sniper")

    if not sniperTool then
         args = {
            [1] = "PickingTools",
            [2] = "Sniper"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        task.wait(0.1)
        character.Humanoid:EquipTool(backpack:WaitForChild("Sniper"))
    elseif backpack:FindFirstChild("Sniper") then
        character.Humanoid:EquipTool(backpack["Sniper"])
    end
end

local function playSound(soundId)
    equipSniper()

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local sniperHandle = character:FindFirstChild("Sniper") and character.Sniper:FindFirstChild("Handle")

    if sniperHandle then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(soundId)
        sound.Volume = 0.1
        sound.Looped = false
        sound.Parent = player:WaitForChild("PlayerGui")
        sound:Play()
        sound.Ended:Connect(function()
            sound:Destroy()
        end)

         args = {
            [1] = sniperHandle,
            [2] = soundId,
            [3] = 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Gu1nSound1s"):FireServer(unpack(args))
    end
end

Fun:NewButton("Jumpscare Gun", function()
    playSound(85435253347146)
end)

Fun:NewButton("Sus Gun", function()
    playSound(6701126635)
end)
Fun:NewButton("amongus Gun", function()
    playSound(6651571134)
end)
Fun:NewButton("Troll Laugh", function()
    playSound(7816195044)
end)
Fun:NewButton("Scream Entidade666 Gun", function()
    playSound(9043346124)
end)
Fun:NewButton("Tubers93 Gun", function()
    playSound(103215672097028)
end)

Fun:NewLabel("Sounds Gun")
local soundIdFromTextBox = nil

local function equipSniper()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player.Backpack
    local sniperTool = character:FindFirstChild("Sniper") or backpack:FindFirstChild("Sniper")

    if not sniperTool then
         args = {
            [1] = "PickingTools",
            [2] = "Sniper"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        task.wait(0.1)
        character.Humanoid:EquipTool(backpack:WaitForChild("Sniper"))
    elseif backpack:FindFirstChild("Sniper") then
        character.Humanoid:EquipTool(backpack["Sniper"])
    end
end

local function playSound(soundId)
    equipSniper()

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local sniperHandle = character:FindFirstChild("Sniper") and character.Sniper:FindFirstChild("Handle")

    if sniperHandle then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(soundId)
        sound.Volume = 0.1
        sound.Looped = false
        sound.Parent = player:WaitForChild("PlayerGui")
        sound:Play()
        sound.Ended:Connect(function()
            sound:Destroy()
        end)

         args = {
            [1] = sniperHandle,
            [2] = tonumber(soundId),
            [3] = 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Gu1nSound1s"):FireServer(unpack(args))
    end
end

Fun:NewTextBox("Sounds Box", "Enter Id here...", function(text)
    local num = tonumber(text)
    if num then
        soundIdFromTextBox = num
    end
end)

Fun:NewButton("Validate", function()
    if soundIdFromTextBox then
        playSound(soundIdFromTextBox)
    end
end)

Fun:NewLabel("Admin Clear")

local messageText = "" -- vai guardar o texto da TextBox

Fun:NewTextBox("Admin Clear Message", "", function(text)
    do
        if type(text) == "string" and text ~= "" then
            messageText = text
            print("Message updated:", messageText)
        end
    end
end)

Fun:NewButton("Validate", function()
    do
        local TextChatService = game:GetService("TextChatService")
        local StarterGui = game:GetService("StarterGui")

        if TextChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then
            StarterGui:SetCore("SendNotification", {
                Title = "Not Supported",
                Text = "This game uses the legacy ROBLOX chat version. Please use the new chat version."
            })
            return
        end

        local prefix = "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r"
        local fullMessage = prefix .. messageText

        local success, err = pcall(function()
            TextChatService.TextChannels.RBXGeneral:SendAsync(fullMessage)
        end)

        if not success then
            warn("Failed to send message:", err)
        end
    end
end)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function getCharacterData()
    local char = Player.Character or Player.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart"), char:FindFirstChildOfClass("Humanoid")
end

local function TeleportToAndClick(btn)
    do
        local success = pcall(function()
            Player.Character:PivotTo(btn.CFrame)
            task.wait(0.1)
            fireclickdetector(btn:FindFirstChildOfClass("ClickDetector"))
        end)
        return success
    end
end

-- 🔍 Checa se há um veículo já longe do spawn (pronto para uso)
local function getReadyVehicle(storage, vehicleName, seatName, spawnPos)
    for _, v in pairs(storage:GetChildren()) do
        if v:IsA("Model") and v.Name == vehicleName and v.PrimaryPart then
            local seat = v:FindFirstChild(seatName)
            if seat and (seat.Position - spawnPos).Magnitude > 10 then
                return v, seat
            end
        end
    end
    return nil
end

-- 🔁 Função única para spam de qualquer veículo
local function StartSpam(toggleVar, buttonPath, storagePath, vehicleName, seatName)
    getgenv()[toggleVar] = true
    local RootPart, Humanoid = getCharacterData()

    task.spawn(function()
        while getgenv()[toggleVar] do
            task.wait(0.05)

            local button = buttonPath()
            local storage = storagePath()
            local spawnPos = button.Position

            local vehicle, seat = getReadyVehicle(storage, vehicleName, seatName, spawnPos)

            if vehicle and seat then
                repeat
                    RootPart.CFrame = seat.CFrame + Vector3.new(0, math.random(-1,1), 0)
                    task.wait()
                until Humanoid.Sit or not getgenv()[toggleVar]

                task.wait(0.15)
                RootPart.CFrame = CFrame.new(math.random(-40, 40), 5, math.random(-40, 40))
                task.wait(0.15)
                Humanoid.Sit = false
                vehicle.Name = vehicleName .. "HanzoAndEren"
            else
                TeleportToAndClick(button)
                task.wait(0.4)
            end
        end
    end)
end

-- 🚁 Helicopter Spam
Spam:NewToggle("Helicopter Spam", function(state)
    if state then
        StartSpam("Toggle", 
            function() return workspace.WorkspaceCom["001_HeliCloneButton"].Button end,
            function() return workspace.WorkspaceCom["001_HeliStorage"] end,
            "PoliceStationHeli",
            "Passenger1"
        )
    else
        getgenv().Toggle = false
    end
end)

-- ✈️ Jet Spam
Spam:NewToggle("Jet Spam", function(state)
    if state then
        StartSpam("JetToggle",
            function() return workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetCloneButton"].Button end,
            function() return workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetStorage"] end,
            "JetAirport",
            "VehicleSeat"
        )
    else
        getgenv().JetToggle = false
    end
end)

-- 🛶 Canoe Spam
Spam:NewToggle("Canoe Spam", function(state)
    if state then
        StartSpam("CanoeToggle",
            function() return workspace.WorkspaceCom["001_CanoeCloneButton"].Button end,
            function() return workspace.WorkspaceCom["001_CanoeStorage"] end,
            "Canoe",
            "VehicleSeat"
        )
    else
        getgenv().CanoeToggle = false
    end
end)

Spam:NewLabel("Lags Servers (Shutdown Risk)")

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local heartbeatConnection = nil
local selectedName = "Common"

local lagTargets = {
    ["Common"] = true,
    ["Burger Tray"] = "WorkspaceCom.001_GiveTools.BurgerTray",
    ["Bomb"] = "WorkspaceCom.001_CriminalWeapons.GiveTools.Bomb",
    ["Laptop"] = "WorkspaceCom.001_GiveTools.Laptop",
    ["Paper Bag"] = "WorkspaceCom.001_GiveTools.Paperbag",
    ["Chips"] = "WorkspaceCom.001_GiveTools.Chips",
    ["Ice Cream"] = "WorkspaceCom.001_GiveTools.Icecream",
    ["Taser"] = "WorkspaceCom.001_GiveTools.Taser",
    ["Basketball"] = "WorkspaceCom.001_GiveTools.Basketball",
    ["FireX"] = "WorkspaceCom.001_GiveTools.FireX",
    ["Ladder"] = "WorkspaceCom.001_GiveTools.Ladder",
    ["Ghost Meter"] = "WorkspaceCom.001_GiveTools.GhostMeter",
    ["Clipboard"] = "WorkspaceCom.001_GiveTools.ClipBoard",
    ["Stretcher"] = "WorkspaceCom.001_GiveTools.Stretcher",
    ["Glock"] = "WorkspaceCom.001_CriminalWeapons.GiveTools.Glock",
    ["Electric Guitar"] = "WorkspaceCom.001_GiveTools.ElectricGuitar",
    ["Guitar"] = "WorkspaceCom.001_GiveTools.Guitar",
    ["Book"] = "WorkspaceCom.001_GiveTools.Book",
    ["Box"] = "WorkspaceCom.001_GiveTools.Box",
    ["Frap Strawberry"] = "WorkspaceCom.001_GiveTools.FrapStrawberry",
    ["Bank Keycard"] = "WorkspaceCom.001_GiveTools.BankKeyCard",
    ["White Keycard"] = "WorkspaceCom.001_GiveTools.KeyCardWhite",
    ["Mop"] = "WorkspaceCom.001_GiveTools.Mop",
    ["Iphone"] = "WorkspaceCom.001_GiveTools.Iphone",
    ["Ipad"] = "WorkspaceCom.001_GiveTools.Ipad"
}

local function getTargetFromString(pathStr)
    local ok, result = pcall(function()
        local current = Workspace
        for _, part in ipairs(string.split(pathStr, ".")) do
            current = current:FindFirstChild(part)
            if not current then return nil end
        end
        return current
    end)
    return ok and result or nil
end

Spam:NewDropdown("Select Lag Target", (function()
    local options = {}
    for name in pairs(lagTargets) do
        table.insert(options, name)
    end
    table.sort(options, function(a, b) return a == "Common" or (a < b and b ~= "Common") end)
    return options
end)(), function(selected)
    selectedName = selected
end)

local function spamClickFast(obj)
    if not obj or not obj:IsA("BasePart") then return end
    local detector = obj:FindFirstChildWhichIsA("ClickDetector")
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    if detector and hrp then
        hrp.CFrame = obj.CFrame + Vector3.new(0, 1.5, 0)
        for _ = 1, 105 do
            task.spawn(function()
                pcall(fireclickdetector, detector)
            end)
        end
    end

    if obj.Name == "Basketball" then
        local tool = LocalPlayer.Character:FindFirstChild("Basketball")
        local remote = tool and tool:FindFirstChild("ClickEvent")
        if remote then
            remote:FireServer(Vector3.new(-148.004, 0.4, 79.921))
        end
    end
end

Spam:NewToggle("Enable Lag Spam", function(state)
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end

    if not state then return end

    if selectedName == "Common" then
        local list = {}
        for _, path in pairs(lagTargets) do
            if path ~= true then
                table.insert(list, path)
            end
        end
        local i = 1
        local currentObj = getTargetFromString(list[i])
        local lastSwitch = tick()

        heartbeatConnection = RunService.Heartbeat:Connect(function()
            if tick() - lastSwitch >= 0.5 then
                i = (i % #list) + 1
                currentObj = getTargetFromString(list[i])
                lastSwitch = tick()
            end
            if currentObj then spamClickFast(currentObj) end
        end)

    else
        local obj = getTargetFromString(lagTargets[selectedName])
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            if obj then spamClickFast(obj) end
        end)
    end
end)

Itens:NewLabel("Bomb Section")

do
    local quantidade = 100

    Itens:NewTextBox("Bomb Value", "Type Value Bomb", function(text)
        local n = tonumber(text)
        if n then
            quantidade = n
        end
    end)

    Itens:NewButton("Bombs", function()
        do
            local p = game.Players.LocalPlayer
            local c = p.Character
            local bp = p:FindFirstChild("Backpack")
            local pos = c.HumanoidRootPart.CFrame
            local BombPath = game.Workspace.WorkspaceCom["001_CriminalWeapons"].GiveTools.Bomb
            local RemoteEvent = game.ReplicatedStorage.RE:FindFirstChild("1Blo1wBomb1sServe1r")

            local function HasBomb()
                for _, v in pairs(c:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Bomb" then
                        return true
                    end
                end
                return false
            end

            local function EquipBombs()
                if bp then
                    for _, v in pairs(bp:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Bomb" then
                            v.Parent = c
                            task.wait()
                        end
                    end
                end
            end

            local function ActivateBombs()
                for i = 1, quantidade do
                    for _, v in pairs(c:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Bomb" then
                            v:Activate()
                        end
                    end
                    task.wait()
                end
            end

            local function FireRemote()
                for i = 1, quantidade do
                    if RemoteEvent then
                        RemoteEvent:FireServer("Bomb" .. p.Name)
                    end
                    task.wait(0.5)
                end
            end

            task.spawn(function()
                if not HasBomb() then
                    for i = 1, quantidade do
                        c.HumanoidRootPart.CFrame = BombPath.CFrame + Vector3.new(0, 3, 0)
                        fireclickdetector(BombPath.ClickDetector)
                        task.wait()
                    end
                    c.HumanoidRootPart.CFrame = pos
                end
                EquipBombs()
                ActivateBombs()
                task.wait()
                FireRemote()
            end)
        end
    end)

    do
        local loopTask = nil
        local loopRunning = false

        Itens:NewToggle("Loop Bombs", function(state)
            if state and not loopRunning then
                loopRunning = true
                loopTask = task.spawn(function()
                    local p = game.Players.LocalPlayer
                    local c = p.Character
                    local RemoteEvent = game.ReplicatedStorage.RE:FindFirstChild("1Blo1wBomb1sServe1r")
                    while loopRunning do
                        for _, v in pairs(c:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Bomb" then
                                v:Activate()
                            end
                        end
                        if RemoteEvent then
                            RemoteEvent:FireServer("Bomb" .. p.Name)
                        end
                        task.wait(0.0)
                    end
                end)
            elseif not state and loopRunning then
                loopRunning = false
                if loopTask then
                    task.cancel(loopTask)
                    loopTask = nil
                end
            end
        end)
    end
end

Itens:NewLabel("Spam Basketball Section")

local BNumber = 1000

Itens:NewToggle("Spam Basketball", function(state)
    if state then
        local Player = game.Players.LocalPlayer
        local Backpack = Player and Player:FindFirstChild("Backpack")
        local Mouse = Player and Player:GetMouse()
        local Character = Player and Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Clone = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_GiveTools") and workspace.WorkspaceCom["001_GiveTools"]:FindFirstChild("Basketball")

        -- Verificações
        if not (Player and Backpack and Mouse and Character and Humanoid and RootPart and Clone) then
            warn("Erro: alguma instância necessária não foi encontrada.")
            return
        end

        local OldPos = RootPart.CFrame

        -- Spawn de bolas
        for i = 1, BNumber do
            task.wait()
            RootPart.CFrame = Clone.CFrame
            fireclickdetector(Clone:FindFirstChildOfClass("ClickDetector"))
        end

        task.wait()
        RootPart.CFrame = OldPos

        -- Loop de arremesso
        spawn(function()
            while state do
                task.wait()
                for _, tool in ipairs(Character:GetChildren()) do
                    if tool.Name == "Basketball" then
                        task.wait(0.0003)
                         args = {
                            Mouse.Hit.p
                        }
                        tool:FindFirstChild("ClickEvent"):FireServer(unpack(args))
                    end
                end
            end
        end)
    end
end)    

Others:NewLabel("Food Section")

Others:NewButton("Get Shopping Cart", function()
           args = {
          [1] = "PickingTools",
          [2] = "ShoppingCart"
          }
                        
picktoolremote:InvokeServer(unpack(args))
wait()
local character = player.Character
        local backpack = player.Backpack
        local humanoid = character:WaitForChild("Humanoid")
        local ShoppingCart = backpack:FindFirstChild("ShoppingCart")
        
        if not character:FindFirstChildOfClass("Tool") then
            if ShoppingCart then
                ShoppingCart.Parent = character
                humanoid:EquipTool(ShoppingCart)
             end
         end
    end)

local ChangeFoodCartloopEnabled = false
 
local function changeFoodLoop()
    while ChangeFoodCartloopEnabled do
     args = {
    [1] = "Banana"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
     args = {
    [1] = "Coke"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "Bloxaide"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "BottledWater"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "GreenApple"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "Apple"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "Pizza"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "ChipsBlue"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "Chips"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
wait(0.2)
 args = {
    [1] = "Milk"
}

game:GetService("Players").LocalPlayer.Character.ShoppingCart.ToolFood:FireServer(unpack(args))
      end
 end

Others:NewToggle("Loop Food", function(Value)
        if Value then
               ChangeFoodCartloopEnabled = true
            changeFoodLoop()
        else
           ChangeFoodCartloopEnabled = false
        end
    end)
    
Others:NewLabel("Trail Section")
Others:NewButton("Enable Trail", function()
    local character = player.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end

    local oldPos = hrp.CFrame
    local firstPos = CFrame.new(-349, 5, 98)

    local poolClick = Workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_Hospital"):FindFirstChild("PoolClick")
    if poolClick and poolClick:FindFirstChild("ClickDetector") then
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0

        hrp.CFrame = firstPos
        task.wait(1)
        hrp.CFrame = poolClick.CFrame
        fireclickdetector(poolClick.ClickDetector)
        task.wait(0.7)
        hrp.CFrame = oldPos

        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50

        notify("Trail", "Trail obtido com sucesso!")
    else
        warn("PoolClick ou ClickDetector não encontrado!")
        notify("Erro", "Trail não encontrado.")
    end
end)

Others:NewButton("Disable Trail", function()
	local character = game.Players.LocalPlayer.Character
	local humanoid = character:FindFirstChild("Humanoid")

	for _, part in pairs(character:GetChildren()) do
		if part:IsA("Part") or part:IsA("BasePart") or part:IsA("MeshPart") then
			if part.Anchored then
				part.Anchored = false
			end
		end
	end

	if humanoid then
		humanoid.Health = 0
	end
end)

Others:NewLabel("Sitting Section")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local antiToolSit, antiCarSit, antiVehicleCollision = false, false, false
local conns = {}

-- Palavras-chave para colisão
local keywords = { "bomb", "soccer", "boat" }
local carKeyword = "car"
local wheelKeyword = "wheel" -- 🚫 nunca tocar nesses

-- Verifica se nome contém uma das palavras
local function containsKeyword(name, list)
	do
		if typeof(name) ~= "string" then return false end
		local lower = name:lower()
		for _, word in ipairs(list) do
			if lower:find(word) then
				return true
			end
		end
		return false
	end
end

-- ⚙️ Função de colisão com proteção para "wheel"
local function applyCollisionLogic(obj)
	do
		if not obj:IsA("BasePart") then return end

		local name = obj.Name:lower()
		if name:find(wheelKeyword) then return end -- nunca toca nas rodas

		local isKeyword = containsKeyword(name, keywords)
		local isCar = false

		local parent = obj
		while parent do
			local pname = parent.Name:lower()
			if pname:find(wheelKeyword) then return end -- proteção dupla
			if pname:find(carKeyword) then
				isCar = true
				break
			end
			parent = parent.Parent
		end

		if isCar then
			obj.CanCollide = false -- apenas remove colisão
		elseif isKeyword then
			obj.CanCollide = not antiVehicleCollision
		end
	end
end

-- Escaneia tudo
local function fullScan()
	for _, obj in ipairs(Workspace:GetDescendants()) do
		applyCollisionLogic(obj)
	end
end

-- Listener para objetos novos
local function setupWorkspaceListener()
	do
		fullScan()
		table.insert(conns, Workspace.DescendantAdded:Connect(applyCollisionLogic))
	end
end

-- Sentar
local function updateSitState()
	do
		local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum:SetStateEnabled(Enum.HumanoidStateType.Seated, not (antiToolSit or antiCarSit))
		end
	end
end

-- Quando o personagem entrar
local function onCharacterAdded(char)
	do
		local hum = char:WaitForChild("Humanoid")

		updateSitState()

		table.insert(conns, hum.StateChanged:Connect(function(_, new)
			if (antiToolSit or antiCarSit) and new == Enum.HumanoidStateType.Seated then
				hum:ChangeState(Enum.HumanoidStateType.GettingUp)
			end
		end))
	end
end

-- Início
player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
	onCharacterAdded(player.Character)
end

setupWorkspaceListener()

-- Toggles
Others:NewToggle("Anti Tool Sit", function(state)
	do
		antiToolSit = state
		updateSitState()
	end
end)

Others:NewToggle("Anti Car Sit", function(state)
	do
		antiCarSit = state
		updateSitState()
	end
end)

Others:NewToggle("Anti + Fling", function(state)
	do
		antiVehicleCollision = state
		antiToolSit = state
		antiCarSit = state
		updateSitState()
		fullScan()
	end
end)

Others:NewLabel("Airport")

Others:NewButton("Gun Detect", function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local RootPart = Character:WaitForChild("HumanoidRootPart")
    local OldPos = RootPart.CFrame

    local ToolRemote = ReplicatedStorage:FindFirstChild("RE"):FindFirstChild("1Too1l")
    local ClearRemote = ReplicatedStorage:FindFirstChild("RE"):FindFirstChild("1Clea1rTool1s")

    if ToolRemote and ClearRemote then
        local success, err = pcall(function()
            ToolRemote:InvokeServer("PickingTools", "Sniper")
            local Sniper = Player.Backpack:FindFirstChild("Sniper")
            if Sniper then
                Sniper.Parent = Character
            end

            task.wait(0.5)
            RootPart.CFrame = CFrame.new(332, 4, 73)
            task.wait(2)
            RootPart.CFrame = OldPos
            task.wait(0.1)

            ClearRemote:FireServer("PlayerWantsToDeleteTool", "Sniper")
        end)

        if not success then
            warn("Gun Detect Failed: ", err)
        end
    else
        warn("Required remotes not found in ReplicatedStorage.RE")
    end
end)

Others:NewLabel("Chat Section (Roblox ban risk)")

local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration.TargetTextChannel

function sendchat(msg)
	if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
		game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
	else
		chat:SendAsync(msg)
	end
end

Others:NewTextBox("Chat Box", "Enter text here...", function(text)
		TextSave = text
	end)

Others:NewButton("Validate", function()
		sendchat(TextSave)
	end)

local spamDelay = 1.2

Others:NewToggle("Loop Chat", function(Value)
		getgenv().HanzoSpawnText = Value
		while getgenv().HanzoSpawnText do
			sendchat(TextSave)
			task.wait(spamDelay)
		end
	end)    
	
Others:NewLabel("Commercial Section")

local function createCommercialBox(name, id, position)
    Others:NewTextBox(name, "Enter text here...", function(value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        local initialPosition = hrp.CFrame

        -- Teleporta até o destino
        hrp.CFrame = CFrame.new(position)

        task.spawn(function()
            task.wait(0.5) -- ⏳ Espera 0.5s antes de enviar os Remotes

            local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Cemeter1y")

            do
                if typeof(value) ~= "string" or value == "" then
                    return warn("Texto inválido.")
                end

                RE:FireServer("ReturningCommercialWords", id, nil, value)
                RE:FireServer("CommercialBackGround", id, Color3.new(0, 0, 0))
                RE:FireServer("CommercialWordColor", id, Color3.new(1, 0, 0.0461044))
            end

            task.wait(0.3) -- ⏳ Espera mais 0.3s antes de voltar
            hrp.CFrame = initialPosition
        end)
    end)
end

-- Cria os 3 comerciais
createCommercialBox("Commercial 1", 1, Vector3.new(444.736755, 63.137306, 512.910706))
createCommercialBox("Commercial 2", 2, Vector3.new(-634.504456, 25.402376, 362.777740))
createCommercialBox("Commercial 3", 3, Vector3.new(-238.489609, 88.522362, -549.606689))	

Teleportes:NewLabel("Teleports")

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local function safeCall(func)
    local success, err = pcall(func)
    if not success then
        warn("Erro detectado: " .. err)
    end
end

local function notify(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = "rbxthumb://type=Asset&id=122216401159246&w=150&h=150",
        Duration = 3
    })
end

local function teleportWithTween(targetPosition, nomeLocal)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    if targetPosition and humanoidRootPart then
        local goal = {CFrame = CFrame.new(targetPosition)}
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
        tween:Play()

        tween.Completed:Connect(function()
            notify("Teleporte concluído", "Você foi para " .. nomeLocal)
        end)
    else
        warn("Posição ou personagem inválido para teleporte!")
    end
end

local teleportes = {
    {"Start", Vector3.new(-26.786, 4.549, -16.025)},
    {"Burger Barn", Vector3.new(149.82, 5.549, 60.242)},
    {"Motel", Vector3.new(170.196, 5.549, 266.061)},
    {"Police Station", Vector3.new(-119.9, 4.641, 8.176)},
    {"Ice Cream Shop", Vector3.new(-130.075, 4.649, -127.652)},
    {"Arcade", Vector3.new(-168.064, 4.649, -112.339)},
    {"Hair Salon", Vector3.new(-72.252, 4.649, -122.569)},
    {"Supermarket", Vector3.new(10.353, 4.649, -115.098)},
    {"Mall", Vector3.new(153.754, 4.775, -146.444)},
    {"Cinema", Vector3.new(198.996, -33.061, -179.751)},
    {"Airport", Vector3.new(295.139, 5.549, 40.569)},
    {"Bank", Vector3.new(1.074, 4.549, 237.577)},
    {"Clothing Store", Vector3.new(-41.549, 4.549, 238.717)},
    {"Cafe", Vector3.new(-96.891, 4.549, 236.663)},
    {"Library", Vector3.new(-129.832, 4.549, 242.131)},
    {"Post Office", Vector3.new(-183.435, 4.549, 240.83)},
    {"School", Vector3.new(-301.655, 4.749, 212.338)},
    {"Hospital", Vector3.new(-304.652, 4.636, 14.17)},
    {"Town Hall", Vector3.new(-354.4, 8.555, -101.754)},
    {"Fire Department", Vector3.new(-430.852, 4.549, -103.408)},
    {"Farm Horses", Vector3.new(-765.745, 4.149, -60.722)},
    {"Farm", Vector3.new(-842.876, 4.149, -395.368)},
    {"Drone Mountain", Vector3.new(-661.048, 251.373, 753.847)},
    {"Beach", Vector3.new(-236.487, 1.136, 760.252)},
    {"Forest House", Vector3.new(-186.256, 4.149, 1067.567)},
    {"Admin Island Shelby", Vector3.new(99948.8906, 10279.7881, -336.647461, 0.998488188, -0, -0.0549663343, 0, 1, -0, 0.0549663343, 0, 0.998488188)},
}

-- Substituir AddButton por NewButton
for _, info in ipairs(teleportes) do
    local nome, pos = info[1], info[2]
    Teleportes:NewButton("Teleporte " .. nome, function()
        safeCall(function()
            teleportWithTween(pos, nome)
        end)
    end)
end    
    
Misc:NewLabel("Click Fling")

Misc:NewButton("Click Fling - By Hanzo", function()
 loadstring(game:HttpGet('https://gist.githubusercontent.com/GistsPrivate/24ee609605cfaa52a28411cf8115535d/raw/5bac79672e8f1af9f98c92e1f0e232696f7f3858/gistfile1.txt'))()
end)

Misc:NewLabel("Ant lags all others hubs")

Misc:NewButton("Ant Lag All", function()
    local itemsToRemove = {
        "Burger Tray", "Bomb", "Laptop", "Paper Bag", "Chips", "Ice Cream", "Taser",
        "Basketball", "FireX", "Ladder", "Ghost Meter", "Clipboard", "Stretcher", "Glock",
        "Electric Guitar", "Guitar", "Book", "Box", "Frap Strawberry", "Bank Keycard",
        "White Keycard", "Mop", "Iphone", "Ipad"
    }

    local removeLookup = {}
    do
        for _, name in ipairs(itemsToRemove) do
            removeLookup[name] = true
        end
    end

    local ClearDelay = 0.5

    local function destroyItemsInCharacter(character)
        do
            if not character then return end
            for _, item in ipairs(character:GetChildren()) do
                if removeLookup[item.Name] then
                    pcall(function()
                        item:Destroy()
                    end)
                end
            end
        end
    end

    local function processPlayers()
        do
            for _, player in ipairs(game.Players:GetPlayers()) do
                pcall(function()
                    if player.Character then
                        destroyItemsInCharacter(player.Character)
                    end
                end)
            end
        end
    end

    task.spawn(function()
        while task.wait(ClearDelay) do
            processPlayers()
        end
    end)
end)

Misc:NewLabel("Audio All FE")

-- Inicialização das variáveis
local ReplicatedStorage = game:GetService("ReplicatedStorage")

if not _G.audio_all_delay then
    _G.audio_all_delay = 1
end

local function Audio_All_ClientSide(ID)
    local function CheckFolderAudioAll()
        local FolderAudio = workspace:FindFirstChild("Audio all client")
        if not FolderAudio then
            FolderAudio = Instance.new("Folder")
            FolderAudio.Name = "Audio all client"
            FolderAudio.Parent = workspace
        end
        return FolderAudio
    end

    local function CreateSound(ID)
        if type(ID) ~= "number" then
            print("Insira um número válido!")
            return nil
        end

        local Folder_Audio = CheckFolderAudioAll()
        if Folder_Audio then
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. ID
            Sound.Volume = 1
            Sound.Looped = false
            Sound.Parent = Folder_Audio
            Sound:Play()
            task.wait(1) -- Tempo de espera antes de remover o som
            Sound:Destroy()
        end
    end

    CreateSound(ID)
end

local function Audio_All_ServerSide(ID)
    if type(ID) ~= "number" then
        print("Insira um número válido!")
        return nil
    end

    local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
    if GunSoundEvent then
        GunSoundEvent:FireServer(workspace, ID, 1)
    end
end

-- Lista de sons irritantes
local soundList = {
    {Name = "Xingamento", ID = 8232773326},
    {Name = "Baldi Basic's Glitch", ID = 98207961689599},
    {Name = "Sucumba", ID = 7946300950},
    {Name = "Seek Jumpscare", ID = 133358860191747},    
    {Name = "DogDay Jumpscare", ID = 132162728926958}, 
    {Name = "Springtrap Jumpscare", ID = 17609408193},
    {Name = "Foxy Jumpscare", ID = 6949978667},    
    {Name = "Laugh", ID = 140395748019933},  
    {Name = "Skull's Laugh", ID = 100609956908791},    
    {Name = "Laugh Boss", ID = 6963880809},    
    {Name = "C00lkid No Fear!", ID = 126083075694948},    
    {Name = "C00lkid Hahaha", ID = 102348131944238},    
    {Name = "SirenHead", ID = 5681392074},    
    {Name = "Tubers93", ID = 103215672097028},    
    {Name = "Audio Glitcher Sound Old", ID = 7236490488},    
    {Name = "Oof Sound", ID = 6598984092},    
    {Name = "Buuuh Sound", ID = 83788010495185},    
    {Name = "My Heart Is Pure Evil Sound", ID = 106843479364998},    
    {Name = "Laugh Sound", ID = 123106903091799},    
    {Name = "Jason..", ID = 96381698372079},    
    {Name = "Goner..", ID = 94301308694277},    
}

-- Variáveis de controle
local options = {}
local audio_all_dropdown_value = nil

for _, sound in ipairs(soundList) do
    table.insert(options, sound.Name)
end

-- Função para tocar áudio
local function playAudio(audioId)
    if not audioId then
        warn("[áudio all] Nenhum ID de áudio selecionado.")
        return
    end
    Audio_All_ServerSide(audioId)
    task.spawn(function()
        Audio_All_ClientSide(audioId)
    end)
end

-- Atualização de Dropdown
Misc:NewDropdown("Áudio ALL - Dropdown", options, function(selectedName)
    for _, sound in ipairs(soundList) do
        if sound.Name == selectedName then
            audio_all_dropdown_value = sound.ID
            break
        end
    end
    if not audio_all_dropdown_value then
        warn("[Áudio ALL] Nome selecionado inválido: " .. tostring(selectedName))
    end
end)

-- Novo botão para áudio
Misc:NewButton("AUDIO ALL - Press", function()
    if audio_all_dropdown_value then
        playAudio(audio_all_dropdown_value)
    else
        warn("[Áudio ALL] Nenhum áudio selecionado para tocar.")
    end
end)

-- Novo Toggle para loop de áudio rápido
Misc:NewToggle("AUDIO ALL - Loop (Fast)", function(state)
    getgenv().Audio_All_loop = state

    if state then
        warn("[Áudio ALL] Loop turbo iniciado. Se prepare pra rave 🔊")
        task.spawn(function()
            while getgenv().Audio_All_loop do
                if audio_all_dropdown_value then
                    for i = 1, 1 do -- 30 sons por ciclo
                        task.spawn(function()
                            playAudio(audio_all_dropdown_value)
                        end)
                    end
                else
                    warn("[Áudio ALL] Nenhum áudio válido no loop.")
                end

                task.wait(0.1) -- Intervalo entre ciclos
            end
            warn("[Áudio ALL] Loop turbo encerrado. Ouvidos agradecem.")
        end)
    else
        warn("[Áudio ALL] Loop desligado.")
    end
end)

local RunService = game:GetService("RunService")

Misc:NewToggle("Audio Glitcher - Loop (Fast)", function(state)
    getgenv().Audio_All_loop = state

    if state then
        warn("[Audio Glitcher] Loop turbo iniciado. Se prepare pra rave 🔊")

        task.spawn(function()
            while getgenv().Audio_All_loop do
                RunService.Heartbeat:Wait() -- Otimizado, sem yield lento

                local audioIDs = {
                    17518855592,
                    85271883712040,
                    7076365030,
                    577360152
                }

                for _, id in ipairs(audioIDs) do
                    task.spawn(function()
                        playAudio(id)
                    end)
                end
            end

            warn("[Audio Glitcher] Loop turbo encerrado. Ouvidos agradecem.")
        end)
    else
        warn("[Audio Glitcher] Loop desligado.")
    end
end)

Misc:NewLabel("Section Boombox FE")

Misc:NewButton("Boombox 100% FE", function()
    local player = game.Players.LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return end

    local boombox
    local sg
    local lastID = 18756289999 -- ID padrão definido

    local function playAudioAll(ID)
        if type(ID) ~= "number" then
            warn("ID inválido para playAudioAll")
            return
        end
        local rs = game:GetService("ReplicatedStorage")
        local evt = rs:FindFirstChild("1Gu1nSound1s", true)
        if evt then
            evt:FireServer(workspace, ID, 1)
        end
    end

    local function playAudioLocal(ID)
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. ID
        sound.Volume = 1
        sound.Looped = false
        sound.Parent = player.Character or workspace
        sound:Play()
        task.delay(3, function() -- evita bloquear a thread
            sound:Destroy()
        end)
    end

    local function createBoombox()
        boombox = Instance.new("Tool")
        boombox.Name = "Boombox"
        boombox.RequiresHandle = true
        boombox.Parent = player.Backpack

        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 1, 1)
        handle.CanCollide = false
        handle.Anchored = false
        handle.Transparency = 1
        handle.Parent = boombox

        -- Ao criar a tool, já chama a música padrão para "resetar"
        task.spawn(function()
            args = {[1] = 18756289999}
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
        end)

        boombox.Equipped:Connect(function()
            if sg then return end

            sg = Instance.new("ScreenGui")
            sg.Name = "ChooseSongGui"
            sg.Parent = playerGui  

            local frame = Instance.new("Frame")
            frame.Style = "RobloxRound"
            frame.Size = UDim2.new(0.25, 0, 0.25, 0)
            frame.Position = UDim2.new(0.375, 0, 0.375, 0)
            frame.Draggable = true
            frame.Active = true
            frame.Parent = sg

            local text = Instance.new("TextLabel")
            text.BackgroundTransparency = 1
            text.TextStrokeTransparency = 0
            text.TextColor3 = Color3.new(1, 1, 1)
            text.Size = UDim2.new(1, 0, 0.6, 0)
            text.TextScaled = true
            text.Text = "Lay down the beat! Put in the ID number for a song you love that's been uploaded to ROBLOX. Leave it blank to stop playing music."
            text.Parent = frame

            local input = Instance.new("TextBox")
            input.BackgroundColor3 = Color3.new(0, 0, 0)
            input.BackgroundTransparency = 0.5
            input.BorderColor3 = Color3.new(1, 1, 1)
            input.TextColor3 = Color3.new(1, 1, 1)
            input.TextStrokeTransparency = 1
            input.TextScaled = true
            input.Text = tostring(lastID)
            input.Size = UDim2.new(1, 0, 0.2, 0)
            input.Position = UDim2.new(0, 0, 0.6, 0)
            input.Parent = frame

            local button = Instance.new("TextButton")
            button.Style = "RobloxButton"
            button.Size = UDim2.new(0.75, 0, 0.2, 0)
            button.Position = UDim2.new(0.125, 0, 0.8, 0)
            button.TextColor3 = Color3.new(1, 1, 1)
            button.TextStrokeTransparency = 0
            button.Text = "Play!"
            button.TextScaled = true
            button.Parent = frame

            button.MouseButton1Click:Connect(function()
                local soundID = tonumber(input.Text)
                if soundID then
                    lastID = soundID
                    playAudioAll(soundID)
                    playAudioLocal(soundID)
                    if sg then
                        sg:Destroy()
                        sg = nil
                    end
                else
                    warn("ID inválido!")
                end
            end)
        end)

        boombox.Unequipped:Connect(function()
            if sg then
                sg:Destroy()
                sg = nil
            end
            -- Reseta para o ID padrão ao desequipar
            args = {[1] = 18756289999}
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
        end)

        boombox.AncestryChanged:Connect(function(_, parent)
            if not parent and sg then
                sg:Destroy()
                sg = nil
            end
        end)
    end

    createBoombox()
end)

Kill:NewLabel("Kill and View")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera

local viewEnabled = false
local currentTarget = nil
local characterAddedConn = nil
local lastValidTarget = nil

local notificationIconId = "rbxassetid://122216401159246"

-- Notificação com headshot
function notify(title, text, player)
    local icon = notificationIconId

    if player and Players:FindFirstChild(player.Name) then
        local success, thumb = pcall(function()
            return Players:GetUserThumbnailAsync(
                player.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size150x150
            )
        end)
        if success and thumb then
            icon = thumb
        end
    end

    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = icon,
        Duration = 4
    })
end

-- Buscar jogador
function findPlayerByName(partialName)
    if not partialName or partialName == "" then return nil end

    partialName = partialName:lower()
    local foundPlayers = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local nameMatch = player.Name:lower():find(partialName, 1, true)
            local displayNameMatch = player.DisplayName:lower():find(partialName, 1, true)

            if nameMatch or displayNameMatch then
                table.insert(foundPlayers, {
                    player = player,
                    priority = (player.Name:lower():sub(1, #partialName) == partialName or player.DisplayName:lower():sub(1, #partialName) == partialName) and 1 or 2
                })
            end
        end
    end

    table.sort(foundPlayers, function(a, b)
        if a.priority ~= b.priority then
            return a.priority < b.priority
        end
        return #a.player.Name < #b.player.Name
    end)

    return foundPlayers[1] and foundPlayers[1].player or nil
end

-- Resetar câmera
function resetCamera()
    if LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() then
        CurrentCamera.CameraSubject = LocalPlayer.Character:WaitForChild("Humanoid")
    end
end

-- Definir alvo
function setViewTarget(targetPlayer)
    if not targetPlayer or not targetPlayer:IsDescendantOf(Players) then
        notify("Erro", "Jogador inválido ou desconectado.")
        stopViewing()
        return
    end

    currentTarget = targetPlayer
    getgenv().Target = targetPlayer.Name
    lastValidTarget = targetPlayer.Name

    if characterAddedConn then
        characterAddedConn:Disconnect()
    end

    characterAddedConn = targetPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if viewEnabled and currentTarget == targetPlayer then
            local humanoid = char:WaitForChild("Humanoid", 5)
            if humanoid then
                CurrentCamera.CameraSubject = humanoid
            end
        end
    end)

    if targetPlayer.Character then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid") or targetPlayer.Character:WaitForChild("Humanoid", 2)
        if humanoid then
            CurrentCamera.CameraSubject = humanoid
        end
    end
end

-- Parar visualização
function stopViewing()
    viewEnabled = false
    currentTarget = nil
    if characterAddedConn then
        characterAddedConn:Disconnect()
        characterAddedConn = nil
    end
    resetCamera()
    notify("View", "Visualização desativada.")
end

-- Render loop
RunService.RenderStepped:Connect(function()
    if viewEnabled and currentTarget then
        if not currentTarget:IsDescendantOf(game) then
            stopViewing()
            return
        end
        if currentTarget.Character then
            local humanoid = currentTarget.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and CurrentCamera.CameraSubject ~= humanoid then
                pcall(function()
                    CurrentCamera.CameraSubject = humanoid
                end)
            end
        end
    end
end)

-- UI Elements
local PlayerTextBox = Kill:NewTextBox("Target Player", "name", function(texto)
    if texto == "" then
        if lastValidTarget then
            texto = lastValidTarget
        else
            notify("Erro", "Você precisa digitar um nome.")
            return
        end
    end

    local targetPlayer = findPlayerByName(texto)

    if targetPlayer and targetPlayer:IsDescendantOf(Players) then
        getgenv().Target = targetPlayer.Name
        lastValidTarget = targetPlayer.Name
        currentTarget = targetPlayer

        notify("Jogador Selecionado", "Alvo: " .. targetPlayer.DisplayName .. " (" .. targetPlayer.Name .. ")", targetPlayer)

        if viewEnabled then
            setViewTarget(targetPlayer)
        end
    else
        getgenv().Target = nil
        lastValidTarget = nil
        currentTarget = nil
        stopViewing()
        notify("Erro", "Nenhum jogador encontrado com: " .. texto)
    end
end)

Kill:NewToggle("View", function(state)
    viewEnabled = state
    if state and getgenv().Target then
        local targetPlayer = findPlayerByName(getgenv().Target)
        if targetPlayer and targetPlayer:IsDescendantOf(Players) then
            setViewTarget(targetPlayer)
            notify("View Ativado", "Observando " .. targetPlayer.DisplayName .. " (" .. targetPlayer.Name .. ")", targetPlayer)
        else
            notify("Erro", "Jogador não encontrado: " .. tostring(getgenv().Target))
            viewEnabled = false
        end
    else
        stopViewing()
    end
end)

Kill:NewButton("Goto", function()
    local success, err = pcall(function()
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")

        if not hrp then 
            notify("Goto", "Seu personagem não tem HumanoidRootPart.")
            return 
        end

        local targetName = getgenv().Target
        if not targetName then
            notify("Goto", "Nenhum jogador selecionado.")
            return
        end

        local targetPlayer = findPlayerByName(targetName)
        if not targetPlayer or not targetPlayer.Character then
            notify("Goto", "Jogador inválido ou offline.")
            return
        end

        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not targetHRP then
            notify("Goto", "Jogador sem HumanoidRootPart.")
            return
        end

        hrp.CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0)
        notify("Teleportado", "Você foi até " .. targetPlayer.DisplayName .. " (" .. targetPlayer.Name .. ")", targetPlayer)
    end)

    if not success then
        warn("[GOTO] Erro ao teleportar:", err)
        notify("Erro", "Falha ao teleportar: " .. tostring(err))
    end
end)

-- Alvo inicial
if getgenv().Target then
    local targetPlayer = findPlayerByName(getgenv().Target)
    if targetPlayer and targetPlayer:IsDescendantOf(Players) then
        lastValidTarget = targetPlayer.Name
    else
        getgenv().Target = nil
    end
end

Kill:NewLabel("Child")

do
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")

    local connection, messageConnection = nil, nil
    local orbitTime = 0

    Kill:NewToggle("Bring Child", function(state)
        do
            if state then
                if not getgenv().Target or type(getgenv().Target) ~= "string" then
                    warn("❌ Defina o alvo com: getgenv().Target = 'NomeDoJogador'")
                    return
                end

                local targetPlayer = Players:FindFirstChild(getgenv().Target)
                if not (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
                    warn("❌ Alvo inválido ou sem personagem carregado.")
                    return
                end

                local remoteFollow = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Bab1yFollo1w")
                if not remoteFollow then
                    warn("❌ Remote '1Bab1yFollo1w' não encontrado!")
                    return
                end

                remoteFollow:FireServer("CharacterFollowSpawnPlayer", "BabyBoy")

                task.delay(1, function() -- espera o Baby nascer
                    local myChar = Workspace:FindFirstChild(Players.LocalPlayer.Name)
                    local baby = myChar and myChar:FindFirstChild("FollowCharacter")
                    if not (baby and baby:FindFirstChild("HumanoidRootPart")) then
                        warn("❌ Baby não encontrado no seu personagem!")
                        return
                    end

                    local humanoidRootPart = baby.HumanoidRootPart
                    local targetHRP = targetPlayer.Character.HumanoidRootPart

                    local bodyGyro = Instance.new("BodyGyro")
                    bodyGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)
                    bodyGyro.P = 10000
                    bodyGyro.Parent = humanoidRootPart

                    local bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                    bodyVelocity.P = 50000
                    bodyVelocity.Parent = humanoidRootPart

                    local scaryMessages = {
                        "ERROR VOU TE ACHAR...",
                        "EU QUERO TE ENCONTRAR ...",
                        "CORRA...",
                        "INFERNO EMBAIXO DE VOCÊ?",
                        "MORRA...",
                        "NO FUNDO TODOS VÃO GRITAR...",
                        "NADA MUDA XINGAR..."
                    }

                    local textEvent = ReplicatedStorage.RE:FindFirstChild("1RPNam1eTex1t")
                    local colorEvent = ReplicatedStorage.RE:FindFirstChild("1RPNam1eColo1r")

                    messageConnection = RunService.Heartbeat:Connect(function(dt)
                        if math.random() < dt then -- chance de enviar
                            if textEvent then
                                textEvent:FireServer("RolePlayFollow", scaryMessages[math.random(#scaryMessages)])
                            end
                            if colorEvent then
                                colorEvent:FireServer("PickingRPFollowColor", Color3.fromRGB(255, 0, 0))
                            end
                        end
                    end)

                    orbitTime = 0
                    connection = RunService.Heartbeat:Connect(function(deltaTime)
                        if not (targetHRP and targetHRP.Parent) then
                            connection:Disconnect()
                            messageConnection:Disconnect()
                            bodyVelocity:Destroy()
                            bodyGyro:Destroy()
                            warn("❌ Alvo perdido. Encerrando.")
                            return
                        end

                        orbitTime += deltaTime
                        local radius, speedOrbit, speedChase = 5, 2, 250

                        local offset = Vector3.new(
                            math.cos(orbitTime * speedOrbit) * radius,
                            0,
                            math.sin(orbitTime * speedOrbit) * radius
                        )
                        local targetPos = targetHRP.Position + offset
                        local direction = (targetPos - humanoidRootPart.Position).Unit
                        bodyVelocity.Velocity = direction * speedChase
                        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, targetHRP.Position)
                    end)

                    print("✅ Orbit Scary ativado.")
                end)
            else
                if connection then connection:Disconnect() end
                if messageConnection then messageConnection:Disconnect() end

                local remoteStop = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Bab1yFollo1w")
                if remoteStop then
                    remoteStop:FireServer("DeleteFollowCharacter")
                end

                print("🛑 Orbit desativado e Baby removido.")
            end
        end
    end)
end

Kill:NewLabel("Fling Boat")

Kill:NewButton("Fling", function()
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Player = Players.LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Character:FindFirstChild("HumanoidRootPart")
	local Vehicles = workspace:FindFirstChild("Vehicles")
	local OldPos = RootPart and RootPart.CFrame

	if not Humanoid or not RootPart then return end

	local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
	if not PCar then
		RootPart.CFrame = CFrame.new(1565.3707275390625, -3.7332046031951904, 50.68533706665039)
		task.wait(0.5)
		local Remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Ca1r")
		if Remote then Remote:FireServer("PickingBoat", "PirateFree") end
		task.wait(0.5)
		PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
	end

	local timeout = 5
	while timeout > 0 and not PCar do
		task.wait(0.25)
		PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
		timeout -= 0.25
	end
	if not PCar then return end

	task.wait(0.5)
	if PCar and not Humanoid.Sit then
		local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
		if Seat then
			repeat task.wait()
				RootPart.CFrame = Seat.CFrame
			until Humanoid.Sit
		end
	end

	local function getTargetInfo()
		while true do
			local TargetPlayer = Players:FindFirstChild(getgenv().Target)
			if TargetPlayer then
				local TargetC = TargetPlayer.Character
				local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")
				local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")
				if TargetC and TargetH and TargetRP then
					return TargetC, TargetH, TargetRP
				end
			end
			task.wait(0.2)
		end
	end

	local TargetC, TargetH, TargetRP = getTargetInfo()

	-- Força no Target
	local attachment = Instance.new("Attachment", TargetRP)
	local force = Instance.new("BodyVelocity")
	force.Velocity = Vector3.new(1e9, 1e9, 1e9)
	force.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	force.P = 1e9
	force.Parent = attachment

	-- Forças no veículo
	for _, part in ipairs(PCar:GetDescendants()) do
		if part:IsA("BasePart") then
			local bv = Instance.new("BodyVelocity")
			bv.Velocity = Vector3.new(1e9, 1e9, 1e9)
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.P = 1e9
			bv.Parent = part
		end
	end

	-- Fling Attack com pulso + random Y rot
	local forward = true
	local amplitude = 10
	local function flingAttack()
		local direction = forward and amplitude or -amplitude
		forward = not forward
		local offset = TargetRP.CFrame.LookVector * direction
		local targetPos = TargetRP.Position + offset + Vector3.new(0, -5, 0)
		local randomYRotation = math.rad(math.random(0, 360))
		local rotation = CFrame.Angles(0, randomYRotation + math.pi, 0)
		PCar:SetPrimaryPartCFrame(CFrame.new(targetPos) * rotation)
	end

	local startTime = tick()
	local wasFlinged = false

	while PCar.Parent and (tick() - startTime) < 3.5 do
		task.wait()

		-- Detecção inteligente de fling
		if TargetRP.AssemblyLinearVelocity.Magnitude > 150 then
			wasFlinged = true
			break
		end

		-- Executa ataque no Target
		flingAttack()
	end

	local function clearTargetForces()
		local TargetPlayer = Players:FindFirstChild(getgenv().Target)
		if TargetPlayer and TargetPlayer.Character then
			for _, obj in ipairs(TargetPlayer.Character:GetDescendants()) do
				if obj:IsA("BodyVelocity") or obj:IsA("Attachment") then
					obj:Destroy()
				end
			end
		end
	end

	if not wasFlinged then
		local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Ca1r")
		if remote then remote:FireServer("DeleteAllVehicles") end

		if Vehicles then
			local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
			if PCar then
				for _, part in ipairs(PCar:GetDescendants()) do
					if part:IsA("BodyVelocity") or part:IsA("Attachment") then
						part:Destroy()
					end
				end
			end
		end

		local fixedReturnPos = Vector3.new(1118.81, 75.998, -1138.61)
		Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		RootPart.Anchored = true
		RootPart.CFrame = CFrame.new(fixedReturnPos)
		RootPart.AssemblyLinearVelocity = Vector3.zero
		RootPart.AssemblyAngularVelocity = Vector3.zero
		clearTargetForces()
		task.wait(0.5)
		RootPart.Anchored = false
		Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	end

	if attachment then attachment:Destroy() end
	if force then force:Destroy() end
	Humanoid.Sit = false
	task.wait()
	if OldPos then RootPart.CFrame = OldPos end
end)

Kill:NewButton("Disable Fling", function()
    local remote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r")
    if remote then
        remote:FireServer("DeleteAllVehicles")
    end

    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if not RootPart or not Humanoid then
        warn("RootPart ou Humanoid não encontrado.")
        return
    end

    local function clearTargetForces()
        local TargetPlayer = game.Players:FindFirstChild(getgenv().Target)
        if TargetPlayer and TargetPlayer.Character then
            for _, obj in ipairs(TargetPlayer.Character:GetDescendants()) do
                if obj:IsA("BodyVelocity") or obj:IsA("Attachment") then
                    obj:Destroy()
                end
            end
        end
    end

    local Vehicles = workspace:FindFirstChild("Vehicles")
    if Vehicles then
        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if PCar then
            for _, part in ipairs(PCar:GetDescendants()) do
                if part:IsA("BodyVelocity") or part:IsA("Attachment") then
                    part:Destroy()
                end
            end
        end
    end

    -- Reset do personagem com segurança
    local fixedReturnPos = Vector3.new(1118.81, 75.998, -1138.61)

    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    RootPart.Anchored = true
    RootPart.CFrame = CFrame.new(fixedReturnPos)
    RootPart.AssemblyLinearVelocity = Vector3.zero
    RootPart.AssemblyAngularVelocity = Vector3.zero

    print("Jogador teleportado para a posição segura.")
    clearTargetForces()

    task.wait(0.5)

    RootPart.Anchored = false
    Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    print("Jogador liberado com segurança.")
end)

Kill:NewLabel("Ball")

Kill:NewButton("Fling", function()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local player = Players.LocalPlayer
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer or not targetPlayer.Character then
        warn("Nenhum jogador selecionado.")
        return
    end

    -- Limpa as forças antigas da bola
    local function clearForces(ball)
        for _, obj in ipairs(ball:GetChildren()) do
            if obj:IsA("BodyForce") or obj:IsA("BodyVelocity") or obj:IsA("BodyPosition") or obj:IsA("BodyAngularVelocity") then
                obj:Destroy()
            end
        end
    end

    -- Aplica forças poderosas na bola
    local function applyFlingForces(ball)
        clearForces(ball)

        local force = Instance.new("BodyForce")
        force.Force = Vector3.new(1e6, 1e6, 1e6)
        force.Parent = ball

        local spin = Instance.new("BodyAngularVelocity")
        spin.AngularVelocity = Vector3.new(1e6, 1e6, 1e6)
        spin.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        spin.P = 1e5
        spin.Parent = ball
    end

    -- Espera até a bola estar no workspace
    local function waitForWorkspaceBall()
        local ballName = "Soccer" .. player.Name
        local ball
        repeat
            ball = workspace.WorkspaceCom["001_SoccerBalls"]:FindFirstChild(ballName)
            task.wait()
        until ball
        return ball
    end

    -- Limpa ferramentas antigas e pega a bola nova
    ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer("PlayerWantsToDeleteTool", "SoccerBall")
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")

    repeat task.wait() until player.Backpack:FindFirstChild("SoccerBall")
    local localBall = player.Backpack:FindFirstChild("SoccerBall")
    if not localBall then
        warn("Bola não encontrada na mochila.")
        return
    end

    localBall.Parent = player.Character
    task.wait(0.25) -- Aguarda a bola ser carregada na Character

    local workspaceBall = waitForWorkspaceBall()
    applyFlingForces(workspaceBall) -- garante forças logo que a bola está no workspace

    -- Tracking com bola 3 studs à frente quando o alvo andar
    local function trackAndFling()
        local char = targetPlayer.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not humanoid then return end

        local altToggle = true
        RunService.Heartbeat:Connect(function()
            if not workspaceBall or not hrp or humanoid.Health <= 0 then return end

            local speed = hrp.Velocity.Magnitude
            local direction = hrp.Velocity.Unit

            -- Reaplica forças todo frame pra garantir consistência do fling
            applyFlingForces(workspaceBall)

            if speed > 1 then
                local forwardPos = hrp.Position + direction * 3
                workspaceBall.CFrame = CFrame.new(forwardPos + Vector3.new(0, -1, 0))
            else
                local offsetY = altToggle and 1 or -3
                workspaceBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, offsetY, 0))
                altToggle = not altToggle
            end
        end)
    end

    trackAndFling()
end)

Kill:NewLabel("Couch")

Kill:NewButton("Bring", function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Backpack = Player:WaitForChild("Backpack")
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local RootPart = Character:WaitForChild("HumanoidRootPart")

    -- Função para checar se já tem o Couch
    local function HasCouch()
        return Backpack:FindFirstChild("Couch") or Character:FindFirstChild("Couch")
    end

    -- Equipar Couch, ajustar GripPos e equipar
    local function EquipCouch()
        if HasCouch() then
            local tool = Backpack:FindFirstChild("Couch") or Character:FindFirstChild("Couch")
            if tool and tool:FindFirstChild("Handle") then
                tool.GripPos = Vector3.new(2, 5, -1)
                Humanoid:EquipTool(tool)
                return true
            end
            return false
        end

        local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Too1l")
        if not remote then
            warn("Remote não encontrado.")
            return false
        end

        remote:InvokeServer("PickingTools", "Couch")

        local timeout = 5
        local start = tick()
        repeat
            task.wait(0.1)
        until HasCouch() or tick() - start > timeout

        local tool = Backpack:FindFirstChild("Couch") or Character:FindFirstChild("Couch")
        if not tool or not tool:FindFirstChild("Handle") then
            warn("Couch ou handle não encontrado.")
            return false
        end

        tool.GripPos = Vector3.new(2, 5, -1)
        Humanoid:EquipTool(tool)
        return true
    end

    -- Equipa o Couch
    if not EquipCouch() then return end

    -- Seleciona o alvo
    local TargetPlayer = Players:FindFirstChild(getgenv().Target)
    if not TargetPlayer or not TargetPlayer.Character then
        return warn("Alvo inválido ou personagem não encontrado.")
    end

    local TCharacter = TargetPlayer.Character
    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and TCharacter:FindFirstChild("HumanoidRootPart")
    local THead = TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")

    -- Salva posição original
    if RootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = RootPart.CFrame
    end

    -- Função de rotação caótica
    local function SFBasePart(BasePart)
        local TempoMax = 3
        local Inicio = tick()
        local Raio = 5
        local Angulo = 0

        repeat
            if not THumanoid or not RootPart or not BasePart then break end

            Angulo += math.random(40, 75)
            local x = math.cos(math.rad(Angulo)) * Raio
            local z = math.sin(math.rad(Angulo)) * Raio
            local offset = CFrame.new(x, 0, z)

            local rotation = CFrame.Angles(
                math.rad(math.random(-800, 800)),
                math.rad(math.random(-1200, 1200)),
                math.rad(math.random(-1000, 1000))
            )

            local finalCF = BasePart.CFrame * offset * rotation
            RootPart.CFrame = finalCF
            Character:SetPrimaryPartCFrame(finalCF)

            task.wait()
        until
            tick() > Inicio + TempoMax
            or not BasePart:IsDescendantOf(TCharacter)
            or THumanoid.Sit
            or Humanoid.Health <= 0
    end

    workspace.FallenPartsDestroyHeight = 0/0
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    if TRootPart and THead then
        if (TRootPart.Position - THead.Position).Magnitude > 5 then
            SFBasePart(THead)
        else
            SFBasePart(TRootPart)
        end
    elseif TRootPart then
        SFBasePart(TRootPart)
    elseif THead then
        SFBasePart(THead)
    elseif Handle then
        SFBasePart(Handle)
    else
        warn("Nenhuma parte válida do alvo encontrada.")
    end

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    workspace.CurrentCamera.CameraSubject = Humanoid

    -- Retorno ao ponto original com segurança
    repeat
        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
        Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        for _, part in ipairs(Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        task.wait()
    until (RootPart.Position - getgenv().OldPos.Position).Magnitude < 25

    workspace.FallenPartsDestroyHeight = getgenv().FPDH or -500
end)

Kill:NewButton("Kill", function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Backpack = Player:WaitForChild("Backpack")
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local RootPart = Character:WaitForChild("HumanoidRootPart")

    local function EquipCouch()
        local couch = Backpack:FindFirstChild("Couch") or Character:FindFirstChild("Couch")
        if not couch then
            local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Too1l")
            if remote then
                pcall(function()
                    remote:InvokeServer("PickingTools", "Couch")
                end)
                for i = 1, 50 do
                    task.wait(0.1)
                    couch = Backpack:FindFirstChild("Couch") or Character:FindFirstChild("Couch")
                    if couch then break end
                end
            end
        end
        if couch and couch:FindFirstChild("Handle") then
            couch.GripPos = Vector3.new(2, 5, -1)
            Humanoid:UnequipTools()
            task.wait()
            Humanoid:EquipTool(couch)
            return true
        end
        return false
    end

    if not EquipCouch() then return warn("Couch não equipado.") end

    local TargetPlayer = Players:FindFirstChild(getgenv().Target)
    if not TargetPlayer or not TargetPlayer.Character then return warn("Alvo inválido.") end

    local TChar = TargetPlayer.Character
    local THumanoid = TChar:FindFirstChildOfClass("Humanoid")
    local TRoot = TChar:FindFirstChild("HumanoidRootPart")
    if not THumanoid or not TRoot then return warn("RootPart ou Humanoid do alvo não encontrado.") end

    getgenv().OldPos = RootPart.CFrame
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    local function FPosOrbit(BasePart)
        local startTime = tick()
        local timeout = 6 -- tempo máximo de ataque
        local angle = 0

        repeat
            if not THumanoid or not BasePart or not BasePart:IsDescendantOf(TChar) then break end
            angle += math.random(20, 60)

            local x = math.cos(math.rad(angle)) * 5
            local z = math.sin(math.rad(angle)) * 5
            local offset = CFrame.new(x, 0, z)

            local rotation = CFrame.Angles(
                math.rad(math.random(-800, 800)),
                math.rad(math.random(-1200, 1200)),
                math.rad(math.random(-1000, 1000))
            )

            local targetCF = BasePart.CFrame * offset * rotation
            RootPart.CFrame = targetCF
            Character:SetPrimaryPartCFrame(targetCF)

            if THumanoid.Sit then return true end

            task.wait()
        until tick() - startTime > timeout or Humanoid.Health <= 0

        return false
    end

    task.spawn(function()
        local success = FPosOrbit(TRoot)
        if success then
            -- Vai pro void
            local voidCF = CFrame.new(0, -1000, 0)
            RootPart.CFrame = voidCF
            Character:SetPrimaryPartCFrame(voidCF)
            task.wait(1)

            -- Solta couch e limpa com remote
            local clear = ReplicatedStorage:FindFirstChild("RE"):FindFirstChild("1Clea1rTool1s")
            if clear then
                pcall(function()
                    clear:FireServer("ClearAllTools")
                end)
            end

            task.wait(0.4)

            -- Volta ao lugar original
            if getgenv().OldPos then
                RootPart.CFrame = getgenv().OldPos
                Character:SetPrimaryPartCFrame(getgenv().OldPos)
                Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        else
            warn("Alvo não sentou. Kill cancelado.")
        end

        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    end)
end)

Kill:NewButton("Fling", function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Backpack = Player:WaitForChild("Backpack")
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local RootPart = Character:WaitForChild("HumanoidRootPart")

    local function HasCouch()
        return Backpack:FindFirstChild("Couch") or Character:FindFirstChild("Couch")
    end

    local function EquipCouch()
        local tool = Backpack:FindFirstChild("Couch") or Character:FindFirstChild("Couch")
        if tool then
            Humanoid:EquipTool(tool)
            return tool
        end
        return nil
    end

    local function FixGrip(tool)
        if tool and tool:FindFirstChild("Handle") then
            tool.GripPos = Vector3.new(2, 5, -1)
            Humanoid:UnequipTools()
            task.wait(0.1)
            Humanoid:EquipTool(tool)
            task.wait(0.5)
        end
    end

    local couch = HasCouch() and EquipCouch()
    if not couch then
        local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Too1l")
        if remote then
            pcall(function() remote:InvokeServer("PickingTools", "Couch") end)
            for i = 1, 50 do
                task.wait(0.1)
                if HasCouch() then break end
            end
            couch = EquipCouch()
        end
    end
    if couch then FixGrip(couch) else return warn("Couch não disponível.") end

    workspace.FallenPartsDestroyHeight = 0/0
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    local BV = Instance.new("BodyVelocity")
    BV.Name = "FlingForce"
    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BV.Parent = RootPart

    local function FPos(part, offset, rotation)
        if not getgenv().AllowFling then return end
        local cf = part.CFrame * offset * rotation
        RootPart.CFrame = cf
        Character:SetPrimaryPartCFrame(cf)
        RootPart.Velocity = Vector3.new(9e8, 9e8, 9e8)
        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end

    getgenv().AllowFling = true
    local TargetPlayer = Players:FindFirstChild(getgenv().Target)
    if not TargetPlayer or not TargetPlayer.Character then return warn("Alvo inválido.") end

    local TChar = TargetPlayer.Character
    local Base = TChar:FindFirstChild("HumanoidRootPart") or TChar:FindFirstChild("Head") or TChar:FindFirstChildWhichIsA("BasePart")
    if not Base then return warn("Nenhuma parte válida para flingar.") end

    -- Oscilação frente e trás
    local directionToggle = true

    task.spawn(function()
        while getgenv().AllowFling and TargetPlayer and TargetPlayer.Parent == Players and Base:IsDescendantOf(TChar) do
            local rotX = math.rad(math.random(-900, 900))
            local rotY = math.rad(math.random(-1600, 1600))
            local rotZ = math.rad(math.random(-1100, 1100))

            -- Alterna indo para frente e para trás
            local zOffset = directionToggle and 9 or -9
            directionToggle = not directionToggle

            local offset = CFrame.new(
                math.random(-4, 4),
                math.random(-3, 3),
                zOffset
            )

            local rotation = CFrame.Angles(rotX, rotY, rotZ)

            FPos(Base, offset, rotation)
            task.wait()
        end
    end)
end)

Kill:NewButton("Disable Fling", function()
    -- Desativa flags globais
    getgenv().AllowFling = false
    getgenv().AllowReturn = false

    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if not RootPart or not Humanoid then
        warn("[Fling Disable] RootPart ou Humanoid não encontrado.")
        return
    end

    -- Remover todas as forças, BodyMovers, Constraints, Velocity manipulators
    for _, obj in ipairs(Character:GetDescendants()) do
        if obj:IsA("BodyMover") or obj:IsA("Constraint") or obj:IsA("VectorForce") 
        or obj:IsA("AlignPosition") or obj:IsA("AlignOrientation") 
        or obj:IsA("LinearVelocity") or obj:IsA("Torque") then
            pcall(function() obj:Destroy() end)
        end
    end

    -- Garantir que o BodyVelocity específico do Fling também seja removido
    local existingBV = RootPart:FindFirstChild("FlingForce")
    if existingBV then
        pcall(function() existingBV:Destroy() end)
    end

    -- Reset de física
    RootPart.Anchored = false
    Humanoid.PlatformStand = false
    Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    RootPart.Velocity = Vector3.zero
    RootPart.AssemblyLinearVelocity = Vector3.zero
    RootPart.AssemblyAngularVelocity = Vector3.zero

    -- Teleporte para posição segura no mapa
    local safePosition = Vector3.new(1118.81, 75.998, -1138.61)
    RootPart.CFrame = CFrame.new(safePosition)

    -- Pequeno freeze para garantir que a física volte ao normal
    Humanoid.PlatformStand = true
    RootPart.Anchored = true
    task.wait(0.5)

    -- Estado final pronto para o jogador voltar ao controlel
    Humanoid.PlatformStand = false
    RootPart.Anchored = false
    Humanoid:ChangeState(Enum.HumanoidStateType.Running)

    print("[Fling Disable] Reset completo, jogador liberado.")
end)

Kill:NewLabel("Vehicle")

Kill:NewButton("Fling", function()
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Player = Players.LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Character:FindFirstChild("HumanoidRootPart")
	local Vehicles = workspace:FindFirstChild("Vehicles")
	local OldPos = RootPart and RootPart.CFrame

	if not Humanoid or not RootPart then return end

	local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
	if not PCar then
		RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
		task.wait(0.5)
		local Remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Ca1r")
		if Remote then Remote:FireServer("PickingCar", "Bus") end
		task.wait(0.5)
		PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
	end

	local timeout = 5
	while timeout > 0 and not PCar do
		task.wait(0.25)
		PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
		timeout -= 0.25
	end
	if not PCar then return end

	task.wait(0.5)
	if PCar and not Humanoid.Sit then
		local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
		if Seat then
			repeat task.wait()
				RootPart.CFrame = Seat.CFrame
			until Humanoid.Sit
		end
	end

	local function getTargetInfo()
		while true do
			local TargetPlayer = Players:FindFirstChild(getgenv().Target)
			if TargetPlayer then
				local TargetC = TargetPlayer.Character
				local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")
				local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")
				if TargetC and TargetH and TargetRP then
					return TargetC, TargetH, TargetRP
				end
			end
			task.wait(0.2)
		end
	end

	local TargetC, TargetH, TargetRP = getTargetInfo()

	-- Força no Target
	local attachment = Instance.new("Attachment", TargetRP)
	local force = Instance.new("BodyVelocity")
	force.Velocity = Vector3.new(3e9, 3e9, 3e9)
	force.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	force.P = 5e9
	force.Parent = attachment

	-- Forças no veículo
	for _, part in ipairs(PCar:GetDescendants()) do
		if part:IsA("BasePart") then
			local bv = Instance.new("BodyVelocity")
			bv.Velocity = Vector3.new(3e9, 3e9, 3e9)
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.P = 5e9
			bv.Parent = part
		end
	end

	-- Fling Attack com pulso + random Y rot
	local forward = true
	local amplitude = 10
	local function flingAttack()
		local direction = forward and amplitude or -amplitude
		forward = not forward
		local offset = TargetRP.CFrame.LookVector * direction
		local targetPos = TargetRP.Position + offset + Vector3.new(0, 1, 0)
		local randomYRotation = math.rad(math.random(0, 360))
		local rotation = CFrame.Angles(0, randomYRotation + math.pi, 0)
		PCar:SetPrimaryPartCFrame(CFrame.new(targetPos) * rotation)
	end

	local startTime = tick()
	local wasFlinged = false

	while PCar.Parent and (tick() - startTime) < 3.5 do
		task.wait()

		-- Detecção inteligente de fling
		if TargetRP.AssemblyLinearVelocity.Magnitude > 150 then
			wasFlinged = true
			break
		end

		-- Executa ataque no Target
		flingAttack()
	end

	local function clearTargetForces()
		local TargetPlayer = Players:FindFirstChild(getgenv().Target)
		if TargetPlayer and TargetPlayer.Character then
			for _, obj in ipairs(TargetPlayer.Character:GetDescendants()) do
				if obj:IsA("BodyVelocity") or obj:IsA("Attachment") then
					obj:Destroy()
				end
			end
		end
	end

	if not wasFlinged then
		local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Ca1r")
		if remote then remote:FireServer("DeleteAllVehicles") end

		if Vehicles then
			local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
			if PCar then
				for _, part in ipairs(PCar:GetDescendants()) do
					if part:IsA("BodyVelocity") or part:IsA("Attachment") then
						part:Destroy()
					end
				end
			end
		end

		local fixedReturnPos = Vector3.new(1118.81, 75.998, -1138.61)
		Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		RootPart.Anchored = true
		RootPart.CFrame = CFrame.new(fixedReturnPos)
		RootPart.AssemblyLinearVelocity = Vector3.zero
		RootPart.AssemblyAngularVelocity = Vector3.zero
		clearTargetForces()
		task.wait(0.5)
		RootPart.Anchored = false
		Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	end

	if attachment then attachment:Destroy() end
	if force then force:Destroy() end
	Humanoid.Sit = false
	task.wait()
	if OldPos then RootPart.CFrame = OldPos end
end)
   
Kill:NewButton("Disable Fling", function()
    local remote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r")
    if remote then
        remote:FireServer("DeleteAllVehicles")
    end

    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if not RootPart or not Humanoid then
        warn("RootPart ou Humanoid não encontrado.")
        return
    end

    local function clearTargetForces()
        local TargetPlayer = game.Players:FindFirstChild(getgenv().Target)
        if TargetPlayer and TargetPlayer.Character then
            for _, obj in ipairs(TargetPlayer.Character:GetDescendants()) do
                if obj:IsA("BodyVelocity") or obj:IsA("Attachment") then
                    obj:Destroy()
                end
            end
        end
    end

    local Vehicles = workspace:FindFirstChild("Vehicles")
    if Vehicles then
        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if PCar then
            for _, part in ipairs(PCar:GetDescendants()) do
                if part:IsA("BodyVelocity") or part:IsA("Attachment") then
                    part:Destroy()
                end
            end
        end
    end

    -- Reset do personagem com segurança
    local fixedReturnPos = Vector3.new(1118.81, 75.998, -1138.61)

    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    RootPart.Anchored = true
    RootPart.CFrame = CFrame.new(fixedReturnPos)
    RootPart.AssemblyLinearVelocity = Vector3.zero
    RootPart.AssemblyAngularVelocity = Vector3.zero

    print("Jogador teleportado para a posição segura.")
    clearTargetForces()

    task.wait(0.5)

    RootPart.Anchored = false
    Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    print("Jogador liberado com segurança.")
end)

Kill:NewButton("Ban House", function()
    local Player = game.Players.LocalPlayer
    local Backpack = Player.Backpack
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Houses = workspace:FindFirstChild("001_Lots")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart.CFrame

    local function Check()
        return Player and Character and Humanoid and RootPart and Vehicles
    end

    if not getgenv().Target or not Check() then return end

    -- Compra a casa se necessário
    local House = Houses:FindFirstChild(Player.Name.."House")
    if not House then
        local EHouse
        for _, Lot in pairs(Houses:GetChildren()) do
            if Lot.Name == "For Sale" then
                for _, num in pairs(Lot:GetDescendants()) do
                    if num:IsA("NumberValue") and num.Name == "Number" and num.Value < 25 and num.Value > 10 then
                        EHouse = Lot
                        break
                    end
                end
                if EHouse then break end
            end
        end

        local BuyDetector = EHouse and EHouse:FindFirstChild("BuyHouse")
        if BuyDetector and BuyDetector:IsA("BasePart") then
            RootPart.CFrame = BuyDetector.CFrame + Vector3.new(0,-6,0)
            task.wait(0.5)
            local ClickDetector = BuyDetector:FindFirstChild("ClickDetector")
            if ClickDetector then
                fireclickdetector(ClickDetector)
            end
        end
    end

    task.wait(0.5)
    local PreHouse = Houses:FindFirstChild(Player.Name.."House")
    if PreHouse then
        local Number
        for _, x in pairs(PreHouse:GetDescendants()) do
            if x.Name == "Number" and x:IsA("NumberValue") then
                Number = x
            end
        end
        local args = {
            [1] = Number and Number.Value or 16,
            [2] = "031_House"
        }
        game:GetService("ReplicatedStorage").Remotes:FindFirstChild("Lot:BuildProperty"):FireServer(unpack(args))
    end

    task.wait(0.5)

    -- Pega o ônibus
    local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
    if not PCar then
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "Bus")
        task.wait(0.5)
        PCar = Vehicles:FindFirstChild(Player.Name.."Car")
    end

    task.wait(0.5)
    if PCar and not Humanoid.Sit then
        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if Seat then
            repeat task.wait()
                RootPart.CFrame = Seat.CFrame
            until Humanoid.Sit
        end
    end

    -- Fling linear com rotação aleatória de 180 graus
    local Target = game.Players:FindFirstChild(getgenv().Target)
    local TargetC = Target and Target.Character
    local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")
    local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")

    if TargetC and TargetH and TargetRP and not TargetH.Sit then
        local forward = true
        local amplitude = 10

        while not TargetH.Sit do
            task.wait()
            local dir = forward and amplitude or -amplitude
            forward = not forward

            local offset = TargetRP.CFrame.LookVector * dir
            local newPos = TargetRP.Position + offset + Vector3.new(0, 1, 0)

            local randomYRotation = math.rad(math.random(0, 360))
            local rotation = CFrame.Angles(0, randomYRotation + math.pi, 0)

            PCar:SetPrimaryPartCFrame(CFrame.new(newPos) * rotation)
        end

        -- Vai até a casa e executa BAN
        task.wait(0.2)
        local MyHouse = Houses:FindFirstChild(Player.Name.."House")
        if MyHouse then
            PCar:SetPrimaryPartCFrame(CFrame.new(MyHouse.HouseSpawnPosition.Position))
        end

        task.wait(0.2)
        local Region = Region3.new(RootPart.Position - Vector3.new(30,30,30), RootPart.Position + Vector3.new(30,30,30))
        local Parts = workspace:FindPartsInRegion3(Region, RootPart, math.huge)

        for _, v in pairs(Parts) do
            if v.Name == "HumanoidRootPart" then
                local BannedPlayer = game.Players:FindFirstChild(v.Parent.Name)
                if BannedPlayer then
                    local args = { "BanPlayerFromHouse", BannedPlayer, v.Parent }
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))

                    local argsDelete = { "DeleteAllVehicles" }
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(argsDelete))
                end
            end
        end

        Humanoid.Sit = false
        task.wait(0.1)
        RootPart.CFrame = OldPos
    end
end)

Kill:NewButton("Kill", function()
    local Target = getgenv().Target
    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart.CFrame

    if not Target or not Humanoid then return end

    local function GetCar()
        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if PCar then return PCar end

        -- Spawn o carro
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.4)
        local CarRemote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r")
        if CarRemote then
            CarRemote:FireServer("PickingCar", "Bus")
        end

        for i = 1, 30 do
            task.wait(0.2)
            PCar = Vehicles:FindFirstChild(Player.Name.."Car")
            if PCar then return PCar end
        end

        return nil
    end

    local function SitInCar(PCar)
        if not PCar then return false end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat or not Seat:IsA("VehicleSeat") then
            warn("Seat não encontrado")
            return false
        end

        for i = 1, 50 do
            -- Aproxima o jogador corretamente
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 3, 0)
            task.wait(0.1)
            if Humanoid.Sit or Seat.Occupant == Humanoid then
                return true
            end
        end

        warn("Não sentou no veículo.")
        return false
    end

    local PCar = GetCar()
    if not SitInCar(PCar) then return end

    -- ALVO
    local TargetPlayer = game.Players:FindFirstChild(Target)
    if not TargetPlayer or not TargetPlayer.Character then return end

    local TargetC = TargetPlayer.Character
    local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
    local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")

    if not TargetH or not TargetRP then return end

    local forward = true
    local amplitude = 10

    while not TargetH.Sit and TargetH.Health > 0 do
        task.wait()

        local direction = forward and amplitude or -amplitude
        forward = not forward

        local offset = TargetRP.CFrame.LookVector * direction
        local targetPos = TargetRP.Position + offset + Vector3.new(0, 1, 0)
        local rotation = CFrame.Angles(0, math.rad(math.random(0, 360)), 0)

        if PCar and PCar.PrimaryPart then
            PCar:SetPrimaryPartCFrame(CFrame.new(targetPos) * rotation)
        end
    end

    -- Kill no Void e retorna
    if PCar and PCar.PrimaryPart then
        PCar:SetPrimaryPartCFrame(CFrame.new(0, -470, 0))
    end

    task.wait(0.2)
    Humanoid.Sit = false
    task.wait(0.1)
    RootPart.CFrame = OldPos
end)

Kill:NewButton("Bring", function()
    local Target = getgenv().Target
    local Player = game.Players.LocalPlayer
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart.CFrame

    if not Target or not Humanoid then return end

    local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
    if not PCar then
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "Bus")
        task.wait(0.5)
        PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        task.wait(0.5)
        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if Seat then
            repeat task.wait()
                RootPart.CFrame = Seat.CFrame
            until Humanoid.Sit
        end
    end

    task.wait(0.5)
    PCar = Vehicles:FindFirstChild(Player.Name.."Car")
    if PCar and not Humanoid.Sit then
        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if Seat then
            repeat task.wait()
                RootPart.CFrame = Seat.CFrame
            until Humanoid.Sit
        end
    end

    local TargetPlayer = game.Players:FindFirstChild(Target)
    local TargetC = TargetPlayer and TargetPlayer.Character
    local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")
    local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")

    if TargetC and TargetH and TargetRP and not TargetH.Sit then
        local forward = true
        local amplitude = 5

        while not TargetH.Sit do
            task.wait()
            local direction = forward and amplitude or -amplitude
            forward = not forward

            local offset = TargetRP.CFrame.LookVector * direction
            local targetPos = TargetRP.Position + offset + Vector3.new(0, 1, 0)
            local randomYRotation = math.rad(math.random(0, 360))
            local rotation = CFrame.Angles(0, randomYRotation + math.pi, 0)

            PCar:SetPrimaryPartCFrame(CFrame.new(targetPos) * rotation)
        end

        task.wait(0.1)
        PCar:SetPrimaryPartCFrame(OldPos)
        task.wait(0.2)
        Humanoid.Sit = false
        task.wait(0.1)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
    end
end)

Kill:NewLabel("Others Flings")

Kill:NewButton("Fling Jet", function()
    local nome = getgenv().Target
    if not nome then return warn("Nenhum jogador definido.") end

    local alvo = game.Players:FindFirstChild(nome)
    if not alvo then return warn("Jogador não encontrado.") end

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    if humanoid.Sit then
        humanoid.Sit = false
        task.wait(0.5)
    end

    -- Clonar Jet
    local jetBtn = workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetCloneButton"].Button
    root.CFrame = jetBtn.CFrame
    task.wait(0.4)
    fireclickdetector(jetBtn.ClickDetector, 0)
    task.wait(0.4)

    local jet = workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetStorage"]:FindFirstChild("JetAirport")
    local seat = jet and jet:FindFirstChild("VehicleSeat")
    if not (jet and seat) then return warn("Jet ou assento não encontrado.") end
    if not jet.PrimaryPart then jet.PrimaryPart = seat end

    -- Sentar no Jet
    local tentativas = 0
    repeat
        char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
        task.wait(0.01)
        seat:Sit(humanoid)
        tentativas += 1
    until humanoid.Sit or tentativas > 100

    if not humanoid.Sit then return warn("Falhou em sentar no Jet.") end

    -- Configurar movimentação giratória
    local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
    local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
    local alvoHum = alvoChar:WaitForChild("Humanoid")

    local force = Instance.new("BodyForce", jet.PrimaryPart)
    local angular = Instance.new("BodyAngularVelocity", jet.PrimaryPart)
    angular.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    angular.AngularVelocity = Vector3.new(5000, 25000, 5000)
    angular.P = 1e9

    local RunService = game:GetService("RunService")
    local ativo = true
    local t = 0
    local raioMin, raioMax = 5, 20
    local frenteTrasAmp = 35
    local frenteTrasVel = 35
    local velocidadeAngular = 50

    local conn
    conn = RunService.Heartbeat:Connect(function(dt)
        if not ativo or not humanoid.Sit or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
            conn:Disconnect()
            angular:Destroy()
            force:Destroy()
            return
        end

        t += dt

        local raioAtual = raioMin + (math.sin(t * 10) * (raioMax - raioMin) / 2)
        local angle = velocidadeAngular * t
        local x = math.cos(angle) * raioAtual
        local z = math.sin(angle) * raioAtual
        local y = 5

        local frenteTrasOffset = alvoRoot.CFrame.LookVector * math.sin(t * frenteTrasVel) * frenteTrasAmp
        local targetPos = alvoRoot.Position + Vector3.new(x, y, z) + frenteTrasOffset

        jet:SetPrimaryPartCFrame(CFrame.new(targetPos, alvoRoot.Position))

        local dir = (alvoRoot.Position - jet.PrimaryPart.Position).Unit
        force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * jet.PrimaryPart:GetMass(), 0)
    end)
end)

Kill:NewButton("Disable Fling Jet", function()
    getgenv().FlingAtivo = false

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChild("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then return end

    if humanoid.Sit then
        humanoid.Sit = false
        task.wait(0.3)
    end

    -- Destruir o Jet
    local airport = workspace:FindFirstChild("WorkspaceCom")
    if airport then
        local jetStorage = airport:FindFirstChild("001_Airport")
        if jetStorage then
            local hanger = jetStorage:FindFirstChild("AirportHanger")
            if hanger and hanger:FindFirstChild("001_JetStorage") then
                local storage = hanger["001_JetStorage"]
                if storage:FindFirstChild("JetAirport") then
                    pcall(function()
                        storage.JetAirport:Destroy()
                    end)
                end
            end
        end
    end

    -- Posição de retorno padrão
    local retorno = getgenv().RetornoPos or Vector3.new(1118.81, 75.998, -1138.61)
    root.CFrame = CFrame.new(retorno)

    -- Limpa forças e attachments do alvo
    local function clearTargetForces()
        local target = game.Players:FindFirstChild(getgenv().Target)
        if target and target.Character then
            for _, obj in ipairs(target.Character:GetDescendants()) do
                if obj:IsA("BodyVelocity") or obj:IsA("Attachment") or obj:IsA("BodyForce") or obj:IsA("BodyAngularVelocity") then
                    obj:Destroy()
                end
            end
        end
    end

    -- Reset físico seguro
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    root.Anchored = true
    root.CFrame = CFrame.new(retorno)
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero

    print("Jet desativado. Jogador retornado.")
    clearTargetForces()

    task.wait(2)

    root.Anchored = false
    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    print("Jogador liberado com segurança.")
end)

Kill:NewButton("Fling Heli", function()
    do
        local nome = getgenv().Target
        if not nome then warn("Nenhum jogador definido.") return end

        local alvo = game.Players:FindFirstChild(nome)
        if not alvo then warn("Jogador não encontrado.") return end

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")

        if humanoid.Sit then
            humanoid.Sit = false
            task.wait(0.5)
        end

        root.CFrame = workspace.WorkspaceCom["001_HeliCloneButton"].Button.CFrame
        task.wait(0.4)
        fireclickdetector(workspace.WorkspaceCom["001_HeliCloneButton"].Button.ClickDetector, 0)
        task.wait(0.4)

        local heli = workspace.WorkspaceCom["001_HeliStorage"].PoliceStationHeli
        local seat = heli:FindFirstChild("VehicleSeat")
        if not heli.PrimaryPart then heli.PrimaryPart = seat end

        local tentativas = 0
        repeat
            char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
            task.wait(0.01)
            seat:Sit(humanoid)
            tentativas += 1
        until humanoid.Sit or tentativas > 100

        if not humanoid.Sit then warn("Falhou em sentar no helicóptero.") return end

        local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyForce", heli.PrimaryPart)
        local angular = Instance.new("BodyAngularVelocity", heli.PrimaryPart)
        angular.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        angular.AngularVelocity = Vector3.new(5000, 25000, 5000)
        angular.P = 1e9

        local RunService = game:GetService("RunService")
        local ativo = true
        local t = 0
        local raioMin, raioMax = 5, 20
        local frenteTrasAmp = 10
        local frenteTrasVel = 8
        local velocidadeAngular = 50

        local conn
        conn = RunService.Heartbeat:Connect(function(dt)
            if not ativo or not humanoid.Sit or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
                conn:Disconnect()
                angular:Destroy()
                force:Destroy()
                return
            end

            t += dt

            if alvoHum.SeatPart then
                local cfVoid = CFrame.new(0, -12000, 0)
                for i = 1, 30 do
                    heli:SetPrimaryPartCFrame(cfVoid)
                    char:SetPrimaryPartCFrame(cfVoid)
                    alvoChar:SetPrimaryPartCFrame(cfVoid)
                    task.wait()
                end

                if seat then
                    seat.Throttle = 0
                    seat.Steer = 0
                end
                if heli:FindFirstChild("BodyVelocity") then
                    heli.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
                if heli:FindFirstChild("BodyAngularVelocity") then
                    heli.BodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
                end

                game.StarterGui:SetCore("SendNotification", {
                    Title = "Hanzo Hub",
                    Text = alvo.Name .. " está no void!",
                    Duration = 5
                })

                if root.Position.Y < -1000 then
                    humanoid.Sit = false
                    task.wait(0.2)
                    root.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.2)
                    pcall(function()
                        if heli and heli.Parent then
                            heli:Destroy()
                        end
                    end)
                end

                ativo = false
                conn:Disconnect()
                angular:Destroy()
                force:Destroy()
                return
            end

            local raioAtual = raioMin + (math.sin(t * 10) * (raioMax - raioMin) / 2)
            local angle = velocidadeAngular * t
            local x = math.cos(angle) * raioAtual
            local z = math.sin(angle) * raioAtual
            local y = 5

            local frenteTrasOffset = alvoRoot.CFrame.LookVector * math.sin(t * frenteTrasVel) * frenteTrasAmp
            local targetPos = alvoRoot.Position + Vector3.new(x, y, z) + frenteTrasOffset

            heli:SetPrimaryPartCFrame(CFrame.new(targetPos, alvoRoot.Position))

            local dir = (alvoRoot.Position - heli.PrimaryPart.Position).Unit
            force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * heli.PrimaryPart:GetMass(), 0)
        end)
    end
end)

Kill:NewButton("Disable Fling Heli", function()
    getgenv().FlingAtivo = false

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChild("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then return end

    -- Levanta se estiver sentado
    if humanoid.Sit then
        humanoid.Sit = false
        task.wait(0.3)
    end

    -- Tenta destruir o helicóptero
    local heliArea = workspace:FindFirstChild("WorkspaceCom")
    if heliArea then
        local heliStorage = heliArea:FindFirstChild("001_HeliStorage")
        if heliStorage and heliStorage:FindFirstChild("PoliceStationHeli") then
            pcall(function()
                heliStorage.PoliceStationHeli:Destroy()
            end)
        end
    end

    -- Volta pra posição original
    local retorno = getgenv().RetornoPos or Vector3.new(1118.81, 75.998, -1138.61)
    root.CFrame = CFrame.new(retorno)

    -- Função pra limpar BodyVelocity e Attachments do alvo
    local function clearTargetForces()
        local target = game.Players:FindFirstChild(getgenv().Target)
        if target and target.Character then
            for _, obj in ipairs(target.Character:GetDescendants()) do
                if obj:IsA("BodyVelocity") or obj:IsA("Attachment") then
                    obj:Destroy()
                end
            end
        end
    end

    -- Reset físico seguro
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    root.Anchored = true
    root.CFrame = CFrame.new(retorno)
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero

    print("Jogador teleportado para a posição segura.")
    clearTargetForces()

    task.wait(2)

    root.Anchored = false
    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    print("Jogador liberado com segurança.")
end)

Kill:NewButton("Fling Canoe", function()
    do
        local nome = getgenv().Target
        if not nome then warn("Nenhum jogador definido.") return end

        local alvo = game.Players:FindFirstChild(nome)
        if not alvo then warn("Jogador não encontrado.") return end

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")

        if humanoid.Sit then
            humanoid.Sit = false
            task.wait(0.5)
        end

        root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
        task.wait(0.4)
        fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
        task.wait(0.4)

        local canoe = workspace.WorkspaceCom["001_CanoeStorage"].Canoe
        local seat = canoe:FindFirstChild("VehicleSeat")
        if not canoe.PrimaryPart then canoe.PrimaryPart = seat end

        local tentativas = 0
        repeat
            char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
            task.wait(0.01)
            seat:Sit(humanoid)
            tentativas += 1
        until humanoid.Sit or tentativas > 100

        if not humanoid.Sit then warn("Falhou em sentar no barco.") return end

        local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyForce", canoe.PrimaryPart)
        local angular = Instance.new("BodyAngularVelocity", canoe.PrimaryPart)
        angular.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        angular.AngularVelocity = Vector3.new(5000, 25000, 5000)
        angular.P = 1e9

        local RunService = game:GetService("RunService")
        local ativo = true
        local t = 0
        local raioMin, raioMax = 5, 20
        local frenteTrasAmp = 35
        local frenteTrasVel = 35
        local velocidadeAngular = 50

        local conn
        conn = RunService.Heartbeat:Connect(function(dt)
            if not ativo or not humanoid.Sit or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
                conn:Disconnect()
                angular:Destroy()
                force:Destroy()
                return
            end

            t += dt

            -- Raio para aproximação/afastamento orbital
            local raioAtual = raioMin + (math.sin(t * 10) * (raioMax - raioMin) / 2)
            local angle = velocidadeAngular * t
            local x = math.cos(angle) * raioAtual
            local z = math.sin(angle) * raioAtual
            local y = 5

            -- Movimento frente/trás (ao longo da direção do alvo)
            local frenteTrasOffset = alvoRoot.CFrame.LookVector * math.sin(t * frenteTrasVel) * frenteTrasAmp

            local targetPos = alvoRoot.Position + Vector3.new(x, y, z) + frenteTrasOffset
            canoe:SetPrimaryPartCFrame(CFrame.new(targetPos, alvoRoot.Position))

            local dir = (alvoRoot.Position - canoe.PrimaryPart.Position).Unit
            force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * canoe.PrimaryPart:GetMass(), 0)
        end)
    end
end)

Kill:NewButton("Disable Fling Canoe", function()
    getgenv().FlingAtivo = false

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChild("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then return end

    -- Levanta se estiver sentado
    if humanoid.Sit then
        humanoid.Sit = false
        task.wait(0.3)
    end

    -- Tenta destruir o barco
    local canoe = workspace:FindFirstChild("WorkspaceCom")
    if canoe then
        local canoeStorage = canoe:FindFirstChild("001_CanoeStorage")
        if canoeStorage and canoeStorage:FindFirstChild("Canoe") then
            pcall(function()
                canoeStorage.Canoe:Destroy()
            end)
        end
    end

    -- Volta pra posição original
    local retorno = getgenv().RetornoPos or Vector3.new(1118.81, 75.998, -1138.61)
    root.CFrame = CFrame.new(retorno)

    -- Função pra limpar BodyVelocity e Attachments do alvo
    local function clearTargetForces()
        local target = game.Players:FindFirstChild(getgenv().Target)
        if target and target.Character then
            for _, obj in ipairs(target.Character:GetDescendants()) do
                if obj:IsA("BodyVelocity") or obj:IsA("Attachment") then
                    obj:Destroy()
                end
            end
        end
    end

    -- Reset físico seguro
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    root.Anchored = true
    root.CFrame = CFrame.new(retorno)
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero

    print("Jogador teleportado para a posição segura.")
    clearTargetForces()

    task.wait(2)

    root.Anchored = false
    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    print("Jogador liberado com segurança.")
end)

Kill:NewLabel("Others Kills")

Kill:NewButton("Kill Jet", function()
    do
        local nome = getgenv().Target
        if not nome then warn("Nenhum jogador definido.") return end

        local alvo = game.Players:FindFirstChild(nome)
        if not alvo then warn("Jogador não encontrado.") return end

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")

        if humanoid.Sit then
            humanoid.Sit = false
            task.wait(0.5)
        end

        -- Clonar o Jet
        local jetBtn = workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetCloneButton"].Button
        root.CFrame = jetBtn.CFrame
        task.wait(0.4)
        fireclickdetector(jetBtn.ClickDetector)
        task.wait(0.4)

        local jet = workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetStorage"]:FindFirstChild("JetAirport")
        if not jet then warn("Jet não encontrado.") return end
        local seat = jet:FindFirstChild("VehicleSeat")
        if not seat then warn("Seat do jet não encontrado.") return end
        if not jet.PrimaryPart then jet.PrimaryPart = seat end

        -- Sentar no jet
        local tentativas = 0
        repeat
            char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
            task.wait(0.01)
            seat:Sit(humanoid)
            tentativas += 1
        until humanoid.Sit or tentativas > 100

        if not humanoid.Sit then warn("Falhou em sentar no jet.") return end

        -- Preparar alvo
        local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyForce", jet.PrimaryPart)
        local angular = Instance.new("BodyAngularVelocity", jet.PrimaryPart)
        angular.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        angular.AngularVelocity = Vector3.new(5000, 25000, 5000)
        angular.P = 1e9

        local RunService = game:GetService("RunService")
        local ativo = true
        local t = 0
        local raioMin, raioMax = 5, 25
        local frenteTrasAmp = 15
        local frenteTrasVel = 8
        local velocidadeAngular = 50

        local conn
        conn = RunService.Heartbeat:Connect(function(dt)
            if not ativo or not humanoid.Sit or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
                conn:Disconnect()
                angular:Destroy()
                force:Destroy()
                return
            end

            t += dt

            -- VOID Kill se alvo estiver sentado
            if alvoHum.SeatPart then
                local cfVoid = CFrame.new(0, -12000, 0)
                for i = 1, 30 do
                    jet:SetPrimaryPartCFrame(cfVoid)
                    char:SetPrimaryPartCFrame(cfVoid)
                    alvoChar:SetPrimaryPartCFrame(cfVoid)
                    task.wait()
                end

                if seat then
                    seat.Throttle = 0
                    seat.Steer = 0
                end

                game.StarterGui:SetCore("SendNotification", {
                    Title = "HanzoHub",
                    Text = alvo.Name .. " está no void!",
                    Duration = 5
                })

                if root.Position.Y < -1000 then
                    humanoid.Sit = false
                    task.wait(0.2)
                    root.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.2)
                    pcall(function()
                        if jet and jet.Parent then
                            jet:Destroy()
                        end
                    end)
                end

                ativo = false
                conn:Disconnect()
                angular:Destroy()
                force:Destroy()
                return
            end

            -- Movimento circular maluco
            local raioAtual = raioMin + (math.sin(t * 10) * (raioMax - raioMin) / 2)
            local angle = velocidadeAngular * t
            local x = math.cos(angle) * raioAtual
            local z = math.sin(angle) * raioAtual
            local y = 5

            local frenteTrasOffset = alvoRoot.CFrame.LookVector * math.sin(t * frenteTrasVel) * frenteTrasAmp
            local targetPos = alvoRoot.Position + Vector3.new(x, y, z) + frenteTrasOffset

            jet:SetPrimaryPartCFrame(CFrame.new(targetPos, alvoRoot.Position))

            local dir = (alvoRoot.Position - jet.PrimaryPart.Position).Unit
            force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * jet.PrimaryPart:GetMass(), 0)
        end)
    end
end)

Kill:NewButton("Helicopter Ban House", function()
    do
        local nome = getgenv().Target
        if not nome then warn("Nenhum jogador definido.") return end

        local alvo = game.Players:FindFirstChild(nome)
        if not alvo then warn("Jogador não encontrado.") return end

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")
        local Houses = workspace:FindFirstChild("001_Lots")
        local OldPos = root.CFrame

        if humanoid.Sit then
            humanoid.Sit = false
            task.wait(0.5)
        end

        -- Pega helicóptero
        root.CFrame = workspace.WorkspaceCom["001_HeliCloneButton"].Button.CFrame
        task.wait(0.4)
        fireclickdetector(workspace.WorkspaceCom["001_HeliCloneButton"].Button.ClickDetector, 0)
        task.wait(0.4)

        local heli = workspace.WorkspaceCom["001_HeliStorage"].PoliceStationHeli
        local seat = heli:FindFirstChild("VehicleSeat")
        if not heli.PrimaryPart then heli.PrimaryPart = seat end

        local tentativas = 0
        repeat
            char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
            task.wait(0.01)
            seat:Sit(humanoid)
            tentativas += 1
        until humanoid.Sit or tentativas > 100

        if not humanoid.Sit then warn("Falhou em sentar no helicóptero.") return end

        local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyPosition", heli.PrimaryPart)
        force.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        force.P = 1e5
        force.D = 1e3

        local RunService = game:GetService("RunService")
        local ativo = true
        local conn

        conn = RunService.Heartbeat:Connect(function()
            if not ativo or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
                conn:Disconnect()
                force:Destroy()
                return
            end

            -- Move o helicóptero para o alvo
            force.Position = alvoRoot.Position + Vector3.new(0, 5, 0)

            -- Se alvo estiver sentado, ban na casa
            if alvoHum.SeatPart then
                ativo = false
                conn:Disconnect()
                force:Destroy()

                task.wait(0.2)
                local MyHouse = Houses:FindFirstChild(player.Name.."House")
                if MyHouse then
                    heli:SetPrimaryPartCFrame(CFrame.new(MyHouse.HouseSpawnPosition.Position))
                else
                    warn("Casa não encontrada.")
                    humanoid.Sit = false
                    return
                end

                task.wait(0.2)
                local Region = Region3.new(root.Position - Vector3.new(30,30,30), root.Position + Vector3.new(30,30,30))
                local Parts = workspace:FindPartsInRegion3(Region, root, math.huge)

                for _, v in pairs(Parts) do
                    if v.Name == "HumanoidRootPart" then
                        local BannedPlayer = game.Players:FindFirstChild(v.Parent.Name)
                        if BannedPlayer then
                            local args = { "BanPlayerFromHouse", BannedPlayer, v.Parent }
                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))

                            local argsDelete = { "DeleteAllVehicles" }
                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(argsDelete))
                        end
                    end
                end

                humanoid.Sit = false
                task.wait(0.1)
                root.CFrame = OldPos
            end
        end)
    end
end)

Kill:NewButton("Jet Ban House", function()
    local nome = getgenv().Target
    if not nome then return warn("Nenhum jogador definido.") end

    local alvo = game.Players:FindFirstChild(nome)
    if not alvo then return warn("Jogador não encontrado.") end

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")
    local Houses = workspace:FindFirstChild("001_Lots")
    local OldPos = root.CFrame

    if humanoid.Sit then
        humanoid.Sit = false
        task.wait(0.5)
    end

    -- Clonar o Jet
    local jetButton = workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetCloneButton"].Button
    root.CFrame = jetButton.CFrame
    task.wait(0.4)
    fireclickdetector(jetButton.ClickDetector, 0)
    task.wait(0.4)

    -- Pegar o Jet e sentar
    local jet = workspace.WorkspaceCom["001_Airport"].AirportHanger["001_JetStorage"]:FindFirstChild("JetAirport")
    local seat = jet and jet:FindFirstChild("VehicleSeat")
    if not (jet and seat) then return warn("Jet ou assento não encontrado.") end
    if not jet.PrimaryPart then jet.PrimaryPart = seat end

    local tentativas = 0
    repeat
        char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
        task.wait(0.01)
        seat:Sit(humanoid)
        tentativas += 1
    until humanoid.Sit or tentativas > 100

    if not humanoid.Sit then return warn("Falhou em sentar no Jet.") end

    -- Forçar movimentação até o alvo
    local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
    local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
    local alvoHum = alvoChar:WaitForChild("Humanoid")

    local force = Instance.new("BodyPosition", jet.PrimaryPart)
    force.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    force.P = 1e5
    force.D = 1e3

    local RunService = game:GetService("RunService")
    local ativo = true
    local conn

    conn = RunService.Heartbeat:Connect(function()
        if not ativo or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
            conn:Disconnect()
            force:Destroy()
            return
        end

        force.Position = alvoRoot.Position + Vector3.new(0, 2, 0)

        -- Quando alvo sentar, leva pro ban na casa
        if alvoHum.SeatPart then
            ativo = false
            conn:Disconnect()
            force:Destroy()

            task.wait(0.2)
            local MyHouse = Houses and Houses:FindFirstChild(player.Name.."House")
            if MyHouse then
                jet:SetPrimaryPartCFrame(CFrame.new(MyHouse.HouseSpawnPosition.Position))
            else
                warn("Casa não encontrada.")
                humanoid.Sit = false
                return
            end

            task.wait(0.2)
            local Region = Region3.new(root.Position - Vector3.new(30,30,30), root.Position + Vector3.new(30,30,30))
            local Parts = workspace:FindPartsInRegion3(Region, root, math.huge)

            for _, v in pairs(Parts) do
                if v.Name == "HumanoidRootPart" then
                    local BannedPlayer = game.Players:FindFirstChild(v.Parent.Name)
                    if BannedPlayer then
                        -- Banir o jogador
                        local args = { "BanPlayerFromHouse", BannedPlayer, v.Parent }
                        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))

                        -- Deletar veículos
                        local argsDelete = { "DeleteAllVehicles" }
                        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(argsDelete))
                    end
                end
            end

            humanoid.Sit = false
            task.wait(0.1)
            root.CFrame = OldPos
        end
    end)
end)

Kill:NewButton("Kill Canoe", function()
    do
        local nome = getgenv().Target
        if not nome then warn("Nenhum jogador definido.") return end

        local alvo = game.Players:FindFirstChild(nome)
        if not alvo then warn("Jogador não encontrado.") return end

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")

        if humanoid.Sit then
            humanoid.Sit = false
            task.wait(0.5)
        end

        root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
        task.wait(0.4)
        fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
        task.wait(0.4)

        local canoe = workspace.WorkspaceCom["001_CanoeStorage"].Canoe
        local seat = canoe:FindFirstChild("VehicleSeat")
        if not canoe.PrimaryPart then canoe.PrimaryPart = seat end

        local tentativas = 0
        repeat
            char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
            task.wait(0.01)
            seat:Sit(humanoid)
            tentativas += 1
        until humanoid.Sit or tentativas > 100

        if not humanoid.Sit then warn("Falhou em sentar no barco.") return end

        local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyForce", canoe.PrimaryPart)
        local angular = Instance.new("BodyAngularVelocity", canoe.PrimaryPart)
        angular.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        angular.AngularVelocity = Vector3.new(5000, 25000, 5000)
        angular.P = 1e9

        local RunService = game:GetService("RunService")
        local ativo = true
        local t = 0
        local raioMin, raioMax = 5, 20
        local frenteTrasAmp = 10
        local frenteTrasVel = 8
        local velocidadeAngular = 50

        local conn
        conn = RunService.Heartbeat:Connect(function(dt)
            if not ativo or not humanoid.Sit or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
                conn:Disconnect()
                angular:Destroy()
                force:Destroy()
                return
            end

            t += dt

            -- VOID Kill se alvo estiver em SeatPart
            if alvoHum.SeatPart then
                local cfVoid = CFrame.new(0, -12000, 0)
                for i = 1, 30 do
                    canoe:SetPrimaryPartCFrame(cfVoid)
                    char:SetPrimaryPartCFrame(cfVoid)
                    alvoChar:SetPrimaryPartCFrame(cfVoid)
                    task.wait()
                end

                if seat then
                    seat.Throttle = 0
                    seat.Steer = 0
                end
                if canoe:FindFirstChild("BodyVelocity") then
                    canoe.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
                if canoe:FindFirstChild("BodyAngularVelocity") then
                    canoe.BodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
                end

                game.StarterGui:SetCore("SendNotification", {
                    Title = "HanzoHub",
                    Text = alvo.Name .. " está no void!",
                    Duration = 5
                })

                if root.Position.Y < -1000 then
                    humanoid.Sit = false
                    task.wait(0.2)
                    root.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.2)
                    pcall(function()
                        if canoe and canoe.Parent then
                            canoe:Destroy()
                        end
                    end)
                end

                ativo = false
                conn:Disconnect()
                angular:Destroy()
                force:Destroy()
                return
            end

            -- Movimentação avançada
            local raioAtual = raioMin + (math.sin(t * 10) * (raioMax - raioMin) / 2)
            local angle = velocidadeAngular * t
            local x = math.cos(angle) * raioAtual
            local z = math.sin(angle) * raioAtual
            local y = 5

            local frenteTrasOffset = alvoRoot.CFrame.LookVector * math.sin(t * frenteTrasVel) * frenteTrasAmp
            local targetPos = alvoRoot.Position + Vector3.new(x, y, z) + frenteTrasOffset

            canoe:SetPrimaryPartCFrame(CFrame.new(targetPos, alvoRoot.Position))

            local dir = (alvoRoot.Position - canoe.PrimaryPart.Position).Unit
            force.Force = dir * 1e6 + Vector3.new(0, workspace.Gravity * canoe.PrimaryPart:GetMass(), 0)
        end)
    end
end)

Kill:NewButton("Canoe Ban House", function()
    do
        local nome = getgenv().Target
        if not nome then warn("Nenhum jogador definido.") return end

        local alvo = game.Players:FindFirstChild(nome)
        if not alvo then warn("Jogador não encontrado.") return end

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")
        local Houses = workspace:FindFirstChild("001_Lots")
        local OldPos = root.CFrame

        -- Garante que está fora de Sit
        if humanoid.Sit then
            humanoid.Sit = false
            task.wait(0.5)
        end

        -- Pega a canoa
        root.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
        task.wait(0.4)
        fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
        task.wait(0.4)

        local canoe = workspace.WorkspaceCom["001_CanoeStorage"].Canoe
        local seat = canoe:FindFirstChild("VehicleSeat")
        if not canoe.PrimaryPart then canoe.PrimaryPart = seat end

        -- Senta na canoa
        local tentativas = 0
        repeat
            char:MoveTo(seat.Position + Vector3.new(0, 3, 0))
            task.wait(0.01)
            seat:Sit(humanoid)
            tentativas += 1
        until humanoid.Sit or tentativas > 100

        if not humanoid.Sit then warn("Falhou em sentar no barco.") return end

        -- Força a movimentação da canoa até o alvo
        local alvoChar = alvo.Character or alvo.CharacterAdded:Wait()
        local alvoRoot = alvoChar:WaitForChild("HumanoidRootPart")
        local alvoHum = alvoChar:WaitForChild("Humanoid")

        local force = Instance.new("BodyPosition", canoe.PrimaryPart)
        force.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        force.P = 1e5
        force.D = 1e3

        local RunService = game:GetService("RunService")
        local ativo = true
        local conn

        conn = RunService.Heartbeat:Connect(function()
            if not ativo or not alvoChar or not alvoHum or alvoHum.Health <= 0 then
                conn:Disconnect()
                force:Destroy()
                return
            end

            -- Força a canoa a grudar no alvo
            force.Position = alvoRoot.Position + Vector3.new(0, 2, 0)

            -- Se o alvo sentar, leva pra casa e executa o ban
            if alvoHum.SeatPart then
                ativo = false
                conn:Disconnect()
                force:Destroy()

                task.wait(0.2)
                local MyHouse = Houses:FindFirstChild(player.Name.."House")
                if MyHouse then
                    canoe:SetPrimaryPartCFrame(CFrame.new(MyHouse.HouseSpawnPosition.Position))
                else
                    warn("Casa não encontrada.")
                    humanoid.Sit = false
                    return
                end

                task.wait(0.2)
                local Region = Region3.new(root.Position - Vector3.new(30,30,30), root.Position + Vector3.new(30,30,30))
                local Parts = workspace:FindPartsInRegion3(Region, root, math.huge)

                for _, v in pairs(Parts) do
                    if v.Name == "HumanoidRootPart" then
                        local BannedPlayer = game.Players:FindFirstChild(v.Parent.Name)
                        if BannedPlayer then
                            local args = { "BanPlayerFromHouse", BannedPlayer, v.Parent }
                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))

                            local argsDelete = { "DeleteAllVehicles" }
                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(argsDelete))
                        end
                    end
                end

                humanoid.Sit = false
                task.wait(0.1)
                root.CFrame = OldPos
            end
        end)
    end
end)

Tools:NewLabel("Section Tools")
    
-- Ícones manuais para alguns itens conhecidos (ainda usados como fallback)
local itemIcons = {
    ["Couch"] = "rbxassetid://11977322043",
    ["Crystal"] = "rbxassetid://10444953406",
    -- (... outros ícones conhecidos, se quiser manter)
}

-- Função de callback quando item é selecionado
local function onItemSelected(selectedItem)
    local player = game.Players.LocalPlayer
    local backpack = player:WaitForChild("Backpack")

    -- Pega o item do servidor
    local args = { "PickingTools", selectedItem }
    local remoteFunction = game:GetService("ReplicatedStorage"):FindFirstChild("RE"):FindFirstChild("1Too1l")

    if remoteFunction then
        pcall(function()
            remoteFunction:InvokeServer(unpack(args))
        end)
    end

    -- Aguarda o item aparecer e pega a propriedade TextureId
    task.delay(0.3, function()
        local texture = itemIcons[selectedItem]

        -- Tenta pegar o TextureId do Tool (não do Handle, e sim do próprio Tool)
        if not texture then
            local tool = backpack:FindFirstChild(selectedItem)
            if tool and tool:IsA("Tool") and tool.TextureId and tool.TextureId ~= "" then
                texture = tool.TextureId
            end
        end

        -- Notificação com o ícone encontrado
        game.StarterGui:SetCore("SendNotification", {
            Title = "Item Equipado!",
            Text = "Você pegou: " .. selectedItem,
            Icon = texture or "",
            Duration = 4
        })
    end)
end

-- Dropdown com todos os itens
local ItemDropdown = Tools:NewDropdown("Get Tools", {
    "Couch", "Crystal", "Crystals", "DSLR Camera", "SoccerBall", "EggLauncher", 
    "Cuffs", "FireHose", "AgencyBook", "KeyCardWhite", "DuffleBagDiamonds", 
    "BankGateKey", "SwordGold", "OldKey",

    -- Itens novos
    "Burger Tray", "Bomb", "Laptop", "Paper Bag", "Chips", "Ice Cream", 
    "Taser", "Basketball", "FireX", "Ladder", "Ghost Meter", "Clipboard", 
    "Stretcher", "Glock", "Electric Guitar", "Guitar", "Book", "Box", 
    "Frap Strawberry", "Bank Keycard", "White Keycard", "Mop"
}, function(selectedItem)
    onItemSelected(selectedItem)
end)

local Remote = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l")

Tools:NewLabel("Tools Sets Section")

Tools:NewButton("Get All Guns", function()
    local items = {"Shotgun", "GlockBrown", "Glock", "Assault", "Sniper", "Taser"}
    for _, item in ipairs(items) do
        Remote:InvokeServer("PickingTools", item)
    end
end)

Tools:NewButton("Get All Takeout", function()
    local items = {"TakeOut", "TakeOutHappyBurger", "TakeOutPizza"}
    for _, item in ipairs(items) do
        Remote:InvokeServer("PickingTools", item)
    end
end)

Tools:NewButton("Get All Cards", function()
    local items = {"CreditCardBoy", "CreditCardGirl", "BankKeyCard", "KeyCardWhite", "PowerKeyCard"}
    for _, item in ipairs(items) do
        Remote:InvokeServer("PickingTools", item)
    end
end)

Tools:NewButton("Get All Lighting Tools", function()
    local items = {"Iphone", "Ipad", "Camcorder", "FlashLight", "Laptop", "DSLR Camera"}
    for _, item in ipairs(items) do
        Remote:InvokeServer("PickingTools", item)
    end
end)

Tools:NewButton("Get All Signs", function()
    local items = {"Sign", "SignRed", "SignBlack", "SignPink"}
    for _, item in ipairs(items) do
        Remote:InvokeServer("PickingTools", item)
    end
end)

Tools:NewButton("Get All Guitars", function()
    local items = {"Guitar", "ElectricGuitar"}
    for _, item in ipairs(items) do
        Remote:InvokeServer("PickingTools", item)
    end
end)

Tools:NewButton("Get All Work Tools", function()
    local items = {"Axe", "Hammer", "Wrench"}
    for _, item in ipairs(items) do
        Remote:InvokeServer("PickingTools", item)
    end
end)

Premium:NewLabel("FE Premium Section")
Premium:NewButton("Unlock VIP Pass", function()
game:GetService("StarterGui"):SetCore("SendNotification", { 
 Title = "Unlocked Vip Pass";
 Text = "";
 Icon = "rbxassetid://96510811373389"})
Duration = 5;
 game:GetService("Players").LocalPlayer.PlayersBag.VIP.Value = true
  end)
Premium:NewButton("Unlock Face Pass", function()
game:GetService("StarterGui"):SetCore("SendNotification", { 
 Title = "Unlocked Face Pass";
 Text = "";
 Icon = "rbxassetid://139444782526755"})
Duration = 5;
game:GetService("Players").LocalPlayer.PlayersBag.FacePass.Value = true
  end)
Premium:NewButton("Unlock Premium Avatar Editor", function()
 game:GetService("StarterGui"):SetCore("SendNotification", { 
 Title = "Unlocked Avatar Editor Premium Pass";
 Text = "";
 Icon = "rbxassetid://93100440000032"})
Duration = 5;
game:GetService("Players").LocalPlayer.PlayersBag.SilverPass.Value = true
  end)
Premium:NewButton("Unlock Fire Pass", function()
 game:GetService("StarterGui"):SetCore("SendNotification", { 
 Title = "Unlocked Fire Pass";
 Text = "";
 Icon = "rbxassetid://99197718536544"})
Duration = 5;
game:GetService("Players").LocalPlayer.PlayersBag.FirePass.Value = true
  end)
Premium:NewButton("Unlock Speed Pass", function()
 game:GetService("StarterGui"):SetCore("SendNotification", { 
 Title = "Unlocked Speed Pass";
 Text = "";
 Icon = "rbxassetid://103085811778224"})
Duration = 5;
 game:GetService("Players").LocalPlayer.PlayersBag.SpeedPass200.Value = true
  end)
Premium:NewButton("Unlock Music Pass", function()
game:GetService("StarterGui"):SetCore("SendNotification", { 
 Title = "Unlocked Music Pass";
 Text = "";
 Icon = "rbxassetid://111924853884794"})
Duration = 5;
 game:GetService("Players").LocalPlayer.PlayersBag.MusicPass.Value = true
  end)
  
Map:NewLabel("All Section")
Map:NewButton("Kill All", function()
    local Players = game:GetService("Players")
    local Replicated = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart and RootPart.CFrame
    if not Humanoid or not RootPart or not Vehicles then return end

    local WhitelistName = "Usuario_X1x1x1"
    local FriendWhitelist = {[WhitelistName] = true}
    do
        local WPlayer = Players:FindFirstChild(WhitelistName)
        if WPlayer then
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p:IsFriendsWith(WPlayer.UserId) then
                        FriendWhitelist[p.Name] = true
                    end
                end
            end)
        end
    end

    local Targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Player and not FriendWhitelist[p.Name] then
            table.insert(Targets, p)
        end
    end

    local function SpawnCar()
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)
        Replicated.RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        task.wait(0.75)
        return Vehicles:FindFirstChild(Player.Name .. "Car")
    end

    local function SitInCar(car)
        local Seat = car:FindFirstChild("Body") and car.Body:FindFirstChild("VehicleSeat")
        if Seat then
            local t0 = tick()
            repeat
                RootPart.CFrame = Seat.CFrame * CFrame.new(0, 0.5, 0)
                task.wait(0.2)
            until Humanoid.Sit or tick() - t0 > 5
        end
    end

    local PCar = Vehicles:FindFirstChild(Player.Name .. "Car") or SpawnCar()
    if not PCar then warn("Carro não encontrado.") return end
    SitInCar(PCar)

    local function KillTarget(hrp)
        task.spawn(function()
            local t0 = os.clock()
            local dur = 2.5

            while os.clock() - t0 < dur do
                pcall(function()
                    local angles = CFrame.Angles(
                        math.rad(math.random(-15, 15)),
                        math.rad(math.random(-15, 15)),
                        math.rad(math.random(-15, 15))
                    )
                    local offsets = {
                        Vector3.new(0, 1, 0),
                        Vector3.new(0, -2.25, 5),
                        Vector3.new(0, 2.25, 0.25)
                    }
                    for _, offset in ipairs(offsets) do
                        PCar:SetPrimaryPartCFrame(CFrame.new(hrp.Position + offset) * angles)
                        task.wait(0.05)
                    end
                end)
            end

            -- Mata o player jogando pro void
            PCar:SetPrimaryPartCFrame(CFrame.new(0, -1000, 0))
        end)
    end

    for _, target in ipairs(Targets) do
        local char = target.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                KillTarget(hrp)
                task.wait(0.3)
            end
        end
    end

    -- Limpeza
    task.wait(3.5)
    Replicated.RE["1Ca1r"]:FireServer("DeleteAllVehicles")
    task.wait(0.2)
    if Humanoid then Humanoid.Sit = false end
    if OldPos then RootPart.CFrame = OldPos end
end)
Map:NewButton("Bring All", function()
    local Players = game:GetService("Players")
    local Replicated = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart and RootPart.CFrame
    if not Humanoid or not RootPart or not Vehicles then return end

    local WhitelistName = "Usuario_X1x1x1"
    local FriendWhitelist = {[WhitelistName] = true}
    do
        local WPlayer = Players:FindFirstChild(WhitelistName)
        if WPlayer then
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p:IsFriendsWith(WPlayer.UserId) then
                        FriendWhitelist[p.Name] = true
                    end
                end
            end)
        end
    end

    local Targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Player and not FriendWhitelist[p.Name] then
            table.insert(Targets, p)
        end
    end

    local function SpawnCar()
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)
        Replicated.RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        task.wait(0.75)
        return Vehicles:FindFirstChild(Player.Name .. "Car")
    end

    local function SitInCar(car)
        local Seat = car:FindFirstChild("Body") and car.Body:FindFirstChild("VehicleSeat")
        if Seat then
            local t0 = tick()
            repeat
                RootPart.CFrame = Seat.CFrame * CFrame.new(0, 0.5, 0)
                task.wait(0.2)
            until Humanoid.Sit or tick() - t0 > 5
        end
    end

    local function TombAndBring(hrp)
        local PCar = SpawnCar()
        if not PCar or not PCar:IsDescendantOf(workspace) then return end
        SitInCar(PCar)

        -- Envolve o jogador por ~2 segundos
        local t0 = os.clock()
        while os.clock() - t0 < 2 do
            local ang = CFrame.Angles(
                math.rad(math.random(-15,15)),
                math.rad(math.random(-15,15)),
                math.rad(math.random(-15,15))
            )
            local offsets = {
                Vector3.new(0, 1, 0),
                Vector3.new(0, -2.25, 5),
                Vector3.new(0, 2.25, 0.25)
            }
            for _, offset in ipairs(offsets) do
                pcall(function()
                    PCar:SetPrimaryPartCFrame(CFrame.new(hrp.Position + offset) * ang)
                end)
                task.wait(0.05)
            end
        end

        -- Leva o carro até a sua posição original
        if OldPos then
            PCar:SetPrimaryPartCFrame(OldPos)
            task.wait(0.3)
        end

        -- Apaga o veículo antes do próximo alvo
        Replicated.RE["1Ca1r"]:FireServer("DeleteAllVehicles")
        task.wait(0.3)
        Humanoid.Sit = false
        RootPart.CFrame = OldPos
    end

    for _, target in ipairs(Targets) do
        local char = target.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                TombAndBring(hrp)
            end
        end
    end
end)
Map:NewButton("Pixel All", function()
    local Players = game:GetService("Players")
    local Replicated = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart and RootPart.CFrame
    if not Humanoid or not RootPart or not Vehicles then return end

    local WhitelistName = "Usuario_X1x1x1"
    local FriendWhitelist = {[WhitelistName] = true}

    -- Whitelist com amigos do Usuario_X1x1x1
    do
        local WTarget = Players:FindFirstChild(WhitelistName)
        if WTarget then
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p:IsFriendsWith(WTarget.UserId) then
                        FriendWhitelist[p.Name] = true
                    end
                end
            end)
        end
    end

    -- Filtra jogadores válidos
    local Targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Player and not FriendWhitelist[p.Name] then
            table.insert(Targets, p)
        end
    end

    -- Spawn e sentar no carro
    local function SpawnCar()
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)
        Replicated.RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        task.wait(0.75)
        return Vehicles:FindFirstChild(Player.Name .. "Car")
    end

    local function SitInCar(car)
        local Seat = car:FindFirstChild("Body") and car.Body:FindFirstChild("VehicleSeat")
        if Seat then
            local timeout = tick()
            repeat
                RootPart.CFrame = Seat.CFrame * CFrame.new(0, 0.5, 0)
                task.wait(0.2)
            until Humanoid.Sit or tick() - timeout > 5
        end
    end

    local PCar = Vehicles:FindFirstChild(Player.Name .. "Car") or SpawnCar()
    if not PCar then warn("Carro não encontrado.") return end
    SitInCar(PCar)

    -- Ataque Pixel (carro vai pro limbo)
    local function PixelAttack(hrp)
        task.spawn(function()
            local start = os.clock()
            local duration = 2.5
            while os.clock() - start < duration do
                pcall(function()
                    local angles = CFrame.Angles(
                        math.rad(math.random(-20, 20)),
                        math.rad(math.random(-20, 20)),
                        math.rad(math.random(-20, 20))
                    )
                    local offsets = {
                        Vector3.new(0, 1, 0),
                        Vector3.new(0, -2.25, 5),
                        Vector3.new(0, 2.25, 0.25)
                    }
                    for _, offset in ipairs(offsets) do
                        PCar:SetPrimaryPartCFrame(CFrame.new(hrp.Position + offset) * angles)
                        task.wait(0.05)
                    end
                end)
            end
            -- Envia pro pixel limbo
            PCar:SetPrimaryPartCFrame(CFrame.new(99999, 99999, 99999))
        end)
    end

    for _, target in ipairs(Targets) do
        local char = target.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                PixelAttack(hrp)
                task.wait(0.3)
            end
        end
    end

    -- Finalização segura
    task.wait(3.5)
    Replicated.RE["1Ca1r"]:FireServer("DeleteAllVehicles")
    task.wait(0.2)
    Humanoid.Sit = false
    if OldPos then RootPart.CFrame = OldPos end
end)
Map:NewButton("Toilet All", function()
    local Players = game:GetService("Players")
    local Replicated = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart and RootPart.CFrame
    if not Humanoid or not RootPart or not Vehicles then return end

    local WhitelistName = "Usuario_X1x1x1"
    local FriendWhitelist = {[WhitelistName] = true}

    do -- montar lista de whitelist por amizade
        local TargetW = Players:FindFirstChild(WhitelistName)
        if TargetW then
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p:IsFriendsWith(TargetW.UserId) then
                        FriendWhitelist[p.Name] = true
                    end
                end
            end)
        end
    end

    local Targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Player and not FriendWhitelist[p.Name] then
            table.insert(Targets, p)
        end
    end

    local function SpawnCar()
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)
        Replicated.RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        task.wait(0.75)
        return Vehicles:FindFirstChild(Player.Name .. "Car")
    end

    local function SitInCar(PCar)
        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if Seat then
            local timeout = tick()
            repeat
                RootPart.CFrame = Seat.CFrame * CFrame.new(0, 0.5, 0)
                task.wait(0.2)
            until Humanoid.Sit or tick() - timeout > 5
        end
    end

    local PCar = Vehicles:FindFirstChild(Player.Name .. "Car") or SpawnCar()
    if not PCar then warn("Carro não encontrado.") return end
    SitInCar(PCar)

    local function ToiletEffect(TargetHRP)
        task.spawn(function()
            local dur = 2.5
            local t0 = os.clock()
            while os.clock() - t0 < dur do
                pcall(function()
                    local offsets = {
                        Vector3.new(0, 1, 0),
                        Vector3.new(0, -2.25, 5),
                        Vector3.new(0, 2.25, 0.25)
                    }
                    local angle = CFrame.Angles(
                        math.rad(math.random(-25, 25)),
                        math.rad(math.random(-25, 25)),
                        math.rad(math.random(-25, 25))
                    )
                    for _, offset in ipairs(offsets) do
                        PCar:SetPrimaryPartCFrame(CFrame.new(TargetHRP.Position + offset) * angle)
                        task.wait(0.05)
                    end
                end)
            end

            task.wait(0.2)
            PCar:SetPrimaryPartCFrame(CFrame.new(182, 5, 82))
        end)
    end

    for _, target in ipairs(Targets) do
        local char = target.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                ToiletEffect(hrp)
                task.wait(0.3)
            end
        end
    end

    -- Cleanup após todos processados
    task.wait(3)
    Replicated.RE["1Ca1r"]:FireServer("DeleteAllVehicles")
    task.wait(0.2)
    Humanoid.Sit = false
    if OldPos then RootPart.CFrame = OldPos end
end)
Map:NewButton("Tomb All", function()
    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart and RootPart.CFrame
    if not Humanoid or not RootPart then return end

    local WhitelistUser = "Usuario_X1x1x1"
    local FriendWhitelist = {[WhitelistUser] = true}

    do
        local success, whitelistObj = pcall(function()
            return game.Players:FindFirstChild(WhitelistUser)
        end)

        if success and whitelistObj then
            pcall(function()
                for _, p in ipairs(game.Players:GetPlayers()) do
                    if p ~= Player and p:IsFriendsWith(whitelistObj.UserId) then
                        FriendWhitelist[p.Name] = true
                    end
                end
            end)
        end
    end

    local Targets = {}
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= Player and not FriendWhitelist[p.Name] then
            table.insert(Targets, p)
        end
    end

    local function SpawnCar()
        RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)
        game.ReplicatedStorage.RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        task.wait(0.75)
        return Vehicles:FindFirstChild(Player.Name .. "Car")
    end

    local PCar = Vehicles:FindFirstChild(Player.Name .. "Car") or SpawnCar()
    if not PCar then
        warn("Carro não foi spawnado.")
        return
    end

    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
    if Seat then
        local start = tick()
        repeat
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 0.5, 0)
            task.wait(0.2)
        until Humanoid.Sit or tick() - start > 5
    end

    local function TombTarget(hrp)
        task.spawn(function()
            local startTime = os.clock()
            local duration = 2.5
            while os.clock() - startTime < duration and PCar and PCar.Parent do
                pcall(function()
                    local offsets = {
                        Vector3.new(0, 1, 0),
                        Vector3.new(0, -2.25, 5),
                        Vector3.new(0, 2.25, 0.25)
                    }
                    for _, offset in ipairs(offsets) do
                        local pos = hrp.Position + offset
                        local rot = CFrame.Angles(
                            math.rad(math.random(-30, 30)),
                            math.rad(math.random(-30, 30)),
                            math.rad(math.random(-30, 30))
                        )
                        PCar:SetPrimaryPartCFrame(CFrame.new(pos) * rot)
                    end
                end)
                task.wait(0.075)
            end
        end)
    end

    for _, target in ipairs(Targets) do
        local char = target.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                TombTarget(hrp)
                task.wait(0.4) -- Pequena pausa para estabilidade
            end
        end
    end

    -- Cleanup
    task.wait(3)
    game.ReplicatedStorage.RE["1Ca1r"]:FireServer("DeleteAllVehicles")
    task.wait(0.2)
    Humanoid.Sit = false
    if OldPos then RootPart.CFrame = OldPos end
end)
Map:NewButton("Fling Ball All", function()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local StarterGui = game:GetService("StarterGui")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local localPlayer = Players.LocalPlayer
    local BALL_PATH = "WorkspaceCom/001_SoccerBalls/Soccer" .. localPlayer.Name

    getgenv().Target = nil
    local ball, connection
    local isFlinging = false

    local function getThumbnail(player)
        do
            local id = player.UserId
            local thumb, _ = Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            return thumb
        end
    end

    local function notify(player, text)
        do
            local icon = getThumbnail(player)
            StarterGui:SetCore("SendNotification", {
                Title = "Fling Ball All",
                Text = text,
                Duration = 2,
                Icon = icon
            })
        end
    end

    local function getSoccerBall()
        do
            local argsClear = { "PlayerWantsToDeleteTool", "SoccerBall" }
            local argsTool = { "PickingTools", "SoccerBall" }

            ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(argsClear))
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(argsTool))

            repeat task.wait() until localPlayer.Backpack:FindFirstChild("SoccerBall")

            local tool = localPlayer.Backpack:FindFirstChild("SoccerBall")
            if not tool then return warn("Bola não encontrada.") end

            tool.Parent = localPlayer.Character
            task.wait(0.25)
        end
    end

    local function clearForces(targetBall)
        do
            for _, obj in ipairs(targetBall:GetChildren()) do
                if obj:IsA("BodyForce") or obj:IsA("BodyVelocity") or obj:IsA("BodyAngularVelocity") then
                    obj:Destroy()
                end
            end
        end
    end

    local function ignorePlayerCollision(targetBall, targetCharacter)
        do
            for _, part in ipairs(targetCharacter:GetDescendants()) do
                if part:IsA("BasePart") then
                    local constraint = Instance.new("NoCollisionConstraint")
                    constraint.Part0 = targetBall
                    constraint.Part1 = part
                    constraint.Parent = targetBall
                end
            end
        end
    end

    local function applyFlingForces(targetBall)
        do
            clearForces(targetBall)

            local bodyForce = Instance.new("BodyForce")
            bodyForce.Force = Vector3.new(9e8, 9e8, 9e8)
            bodyForce.Parent = targetBall

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.P = 1e7
            bodyVelocity.Parent = targetBall
        end
    end

    local function setupBall(targetPlayer)
        do
            local character = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
            local torso = character:FindFirstChild("HumanoidRootPart")
            if not torso then return end

            local success, foundBall = pcall(function()
                local obj = workspace
                for _, part in ipairs(BALL_PATH:split("/")) do
                    obj = obj:WaitForChild(part, 5)
                end
                return obj
            end)

            if not success or not foundBall then return end

            ball = foundBall
            ball.Anchored = false
            ball.CanCollide = true
            ball.Massless = false

            clearForces(ball)
            ignorePlayerCollision(ball, character)
            applyFlingForces(ball)

            if connection then connection:Disconnect() end

            local lastPos = torso.Position
            local toggleY = true

            connection = RunService.Heartbeat:Connect(function()
                if not ball or not torso then
                    connection:Disconnect()
                    return
                end

                local currentPos = torso.Position
                local velocity = (currentPos - lastPos).Magnitude
                lastPos = currentPos

                local basePos = torso.Position + Vector3.new(0, -0.5, 0)

                if velocity > 1 then
                    local forward = torso.CFrame.LookVector
                    ball.CFrame = CFrame.new(basePos + forward * 10)
                else
                    local yOffset = toggleY and 3 or -3
                    ball.CFrame = CFrame.new(basePos + Vector3.new(0, yOffset, 0))
                    toggleY = not toggleY
                end
            end)
        end
    end

    local function wasFlinged(targetPlayer)
        do
            local hrp = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            return hrp and math.abs(hrp.Velocity.Y) > 200
        end
    end

    local function startFlingBallAll()
        do
            isFlinging = true
            getSoccerBall()

            local allPlayers = Players:GetPlayers()
            local flingCount = 0
            local totalPlayers = #allPlayers - 1

            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    getgenv().Target = player.Name
                    setupBall(player)
                    notify(player, "Flingando " .. player.Name .. " [" .. flingCount .. "/" .. totalPlayers .. "]")

                    local t = 0
                    while t < 3 and player.Character and player.Character:FindFirstChild("Humanoid") do
                        if wasFlinged(player) then break end
                        task.wait(0.2)
                        t += 0.2
                    end

                    if wasFlinged(player) then
                        flingCount += 1
                        notify(player, "Flingados " .. flingCount .. "/" .. totalPlayers)
                    end
                end
            end

            notify(localPlayer, "Fling Ball ALL Finalizado [" .. flingCount .. "/" .. totalPlayers .. "]")
            isFlinging = false
            if connection then connection:Disconnect() end
        end
    end

    if not isFlinging then
        startFlingBallAll()
    else
        warn("O Fling Ball já está ativo.")
    end
end)
Visual:NewLabel("Esp")
local ESP_Color = Color3.fromRGB(255, 255, 255)
local RainbowEnabled = false
local RainbowColor = Color3.new(1, 1, 1)
local activeDrawings = {}
local activeLabels = {}
local activeHighlights = {}

-- Loop arco-íris
task.spawn(function()
	local hue = 0
	while true do
		task.wait()
		if RainbowEnabled then
			hue = (hue + 0.0025) % 1
			RainbowColor = Color3.fromHSV(hue, 1, 1)

			for _, line in pairs(activeDrawings) do
				if line then line.Color = RainbowColor end
			end
			for _, label in pairs(activeLabels) do
				if label then label.TextColor3 = RainbowColor end
			end
			for _, hl in pairs(activeHighlights) do
				if hl then hl.FillColor = RainbowColor end
			end
		end
	end
end)

-- Dropdown de cor
local Dropdown = Visual:NewDropdown("Cor do ESP", {
    "Branco", "Vermelho", "Verde", "Azul", "Roxo", "Amarelo", "Ciano", "Rainbow"
}, function(selected)
    local colorMap = {
        ["Branco"] = Color3.fromRGB(255, 255, 255),
        ["Vermelho"] = Color3.fromRGB(255, 0, 0),
        ["Verde"] = Color3.fromRGB(0, 255, 0),
        ["Azul"] = Color3.fromRGB(0, 170, 255),
        ["Roxo"] = Color3.fromRGB(170, 0, 255),
        ["Amarelo"] = Color3.fromRGB(255, 255, 0),
        ["Ciano"] = Color3.fromRGB(0, 255, 255)
    }

    if selected == "Rainbow" then
        RainbowEnabled = true
    else
        RainbowEnabled = false
        ESP_Color = colorMap[selected] or Color3.fromRGB(255, 255, 255)

        for _, line in pairs(activeDrawings) do if line then line.Color = ESP_Color end end
        for _, label in pairs(activeLabels) do if label then label.TextColor3 = ESP_Color end end
        for _, hl in pairs(activeHighlights) do if hl then hl.FillColor = ESP_Color end end
    end
end)

-- ESP principal
Visual:NewToggle("ESP", function(state)
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local CoreGui = game:GetService("CoreGui")
	local Camera = workspace.CurrentCamera
	local LocalPlayer = Players.LocalPlayer

	local ESPFolder = CoreGui:FindFirstChild("ESPFolder") or Instance.new("Folder", CoreGui)
	ESPFolder.Name = "ESPFolder"

	local activeConnections = {}

	local function getRoot(char)
		return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
	end

	local function round(num, dec)
		local mult = 10 ^ (dec or 0)
		return math.floor(num * mult + 0.5) / mult
	end

	local function clearESP()
		for _, v in pairs(ESPFolder:GetChildren()) do v:Destroy() end
		for _, d in pairs(activeDrawings) do if d.Remove then d:Remove() end end
		table.clear(activeDrawings)
		table.clear(activeLabels)
		table.clear(activeHighlights)
	end

	local function disconnectConnections()
		for _, conn in ipairs(activeConnections) do pcall(function() conn:Disconnect() end) end
		table.clear(activeConnections)
	end

	local function createESP(plr)
		task.spawn(function()
			repeat task.wait() until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChild("Head")
			local char = plr.Character

			local folder = Instance.new("Folder", ESPFolder)
			folder.Name = plr.Name .. "_ESP"

			local highlight = Instance.new("Highlight", folder)
			highlight.Adornee = char
			highlight.FillColor = RainbowEnabled and RainbowColor or ESP_Color
			highlight.OutlineColor = Color3.new(1, 1, 1)
			highlight.FillTransparency = 0.4
			highlight.OutlineTransparency = 0
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			activeHighlights[plr.Name] = highlight

			local billboard = Instance.new("BillboardGui", folder)
			billboard.Adornee = char:FindFirstChild("Head")
			billboard.Size = UDim2.new(0, 100, 0, 40)
			billboard.StudsOffset = Vector3.new(0, 2, 0)
			billboard.AlwaysOnTop = true

			local label = Instance.new("TextLabel", billboard)
			label.Size = UDim2.new(1, 0, 1, 0)
			label.BackgroundTransparency = 1
			label.TextColor3 = RainbowEnabled and RainbowColor or ESP_Color
			label.TextStrokeTransparency = 0
			label.Font = Enum.Font.SourceSansSemibold
			label.TextScaled = true
			label.Text = ""
			activeLabels[plr.Name] = label

			local tracer = Drawing.new("Line")
			tracer.Thickness = 1.5
			tracer.Transparency = 1
			tracer.Color = RainbowEnabled and RainbowColor or ESP_Color
			tracer.Visible = false
			activeDrawings[plr.Name] = tracer

			local renderConn = RunService.RenderStepped:Connect(function()
				if not state or not char or not getRoot(char) or not LocalPlayer.Character then
					tracer.Visible = false
					return
				end

				local root = getRoot(char)
				local localRoot = getRoot(LocalPlayer.Character)
				if not root or not localRoot then return end

				local hp = round(char:FindFirstChildOfClass("Humanoid").Health, 1)
				local dist = (localRoot.Position - root.Position).Magnitude
				label.Text = string.format("Name: %s\nHP: %s\nDist: %d", plr.Name, hp, dist)

				local screenPos, onScreen = Camera:WorldToViewportPoint(root.Position)
				local origin = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)

				if onScreen then
					tracer.From = origin
					tracer.To = Vector2.new(screenPos.X, screenPos.Y)
					tracer.Visible = true
				else
					tracer.Visible = false
				end
			end)

			table.insert(activeConnections, renderConn)
		end)
	end

	if state then
		clearESP()
		disconnectConnections()

		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer then
				createESP(plr)
			end
		end

		table.insert(activeConnections, Players.PlayerAdded:Connect(function(plr)
			table.insert(activeConnections, plr.CharacterAdded:Connect(function()
				if state then createESP(plr) end
			end))
		end))

		table.insert(activeConnections, Players.PlayerRemoving:Connect(function(plr)
			local tag = ESPFolder:FindFirstChild(plr.Name.."_ESP")
			if tag then tag:Destroy() end
			if activeDrawings[plr.Name] then activeDrawings[plr.Name]:Remove() activeDrawings[plr.Name] = nil end
			activeLabels[plr.Name] = nil
			activeHighlights[plr.Name] = nil
		end))
	else
		clearESP()
		disconnectConnections()
	end
end)
Scripts:NewLabel("Scripts")

Scripts:NewButton("Ant - Lag", function()
 loadstring(game:HttpGet('https://pastebin.com/raw/T3fGDakK'))()
end)

Scripts:NewButton("Goner FE", function()
 loadstring(game:HttpGet('https://gist.githubusercontent.com/GistsPrivate/9ab8f0bdf801ecec9a12c17911b446a9/raw/dd741b970df68f09d2f62880b426b15026145948/GonerByShelby'))()
end)

Scripts:NewButton("CrossArms Tool FE", function()
 loadstring(game:HttpGet('https://gist.githubusercontent.com/GistsPrivate/b78b6e74c22d3c66c54c56bd7294b59b/raw/071953c0b86e1bddcb08731bd300be739b9217c7/CrossArmsByShelby'))()
end)

Scripts:NewButton("Animspeed Down FE", function()
 loadstring(game:HttpGet('https://gist.githubusercontent.com/GistsPrivate/9b57473131f0dfe0ee6bdd6972413da0/raw/238074000ab8e84ba5a9621b521445f1f4cddc50/AnimspeedIdle'))()
end)

Scripts:NewButton("Infinite - Yield", function()
 loadstring(game:HttpGet('https://raw.githubusercontent.com/Shelby-Shn/shnmaxhub-/refs/heads/main/InfYI'))()
end)

Scripts:NewButton("FreeCam FE", function()
 loadstring(game:HttpGet('https://pastebin.com/raw/bRW6EMRZ'))()
end)

Scripts:NewButton("ShiftLock", function()
 loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mobile-Console-20843"))()
end)

Scripts:NewButton("New Shaders Better", function()
 loadstring(game:HttpGet("https://pastebin.com/raw/eaJfM0nX"))()
end)

game.Workspace.FallenPartsDestroyHeight = -math.hugemath.hugee
