-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ================= GUI =================
local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
screenGui.Name = "KillStreakGUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 80)
frame.Position = UDim2.new(0.5, -160, 0, 40)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Parent = screenGui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
Instance.new("UIDragDetector", frame)

-- ================= NUMBERS =================
local numberLabel = Instance.new("TextLabel")
numberLabel.Size = UDim2.new(0.3, 0, 1, 0)
numberLabel.BackgroundTransparency = 1
numberLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
numberLabel.Font = Enum.Font.GothamBold
numberLabel.TextScaled = true
numberLabel.Text = "Kill Streak: 0"
numberLabel.Parent = frame

-- +1 messages pop-up
local plusOneMessage = Instance.new("TextLabel")
plusOneMessage.Size = UDim2.new(0.2, 0, 0.5, 0)
plusOneMessage.Position = UDim2.new(0.8, 0, 0.1, 0)
plusOneMessage.BackgroundTransparency = 1
plusOneMessage.TextColor3 = Color3.fromRGB(255, 200, 80)
plusOneMessage.Font = Enum.Font.GothamBold
plusOneMessage.TextScaled = true
plusOneMessage.Text = "+1!"
plusOneMessage.Visible = false
plusOneMessage.Parent = frame

-- ================= MESSAGE =================
local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(0.7, -10, 1, -10)
messageLabel.Position = UDim2.new(0.3, 10, 0, 5)
messageLabel.BackgroundTransparency = 1
messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
messageLabel.Font = Enum.Font.GothamBold
messageLabel.TextScaled = true
messageLabel.TextWrapped = true
messageLabel.TextTransparency = 1
messageLabel.Parent = frame

-- ================= SOUNDS =================
local plusSound = Instance.new("Sound")
plusSound.SoundId = "rbxassetid://77339489209992" -- substitua pelo som que quiser
plusSound.Volume = 0.6
plusSound.Parent = screenGui

local strongestMusic = Instance.new("Sound")
strongestMusic.SoundId = "rbxassetid://120138115344262"
strongestMusic.Volume = 0.8
strongestMusic.Looped = false
strongestMusic.Parent = screenGui

-- ================= SAFE FUNCTION TO PLAY THE SOUND =================
local function playSoundSafe(sound)
    if not sound.IsPlaying then
        sound:Play()
    end
end

-- ================= ANIMATIONS =================
local normalSize = numberLabel.Size
local bigSize = UDim2.new(0.35, 0, 1.15, 0)

-- +1 pop-up
local function playPlusOnePopup(label)
    local s = plusSound:Clone()
    s.Parent = screenGui
    s:Play()
    s.Ended:Connect(function() s:Destroy() end)

    label.Visible = true
    label.TextTransparency = 0
    local originalPos = label.Position

    local tween = TweenService:Create(
        label,
        TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Position = originalPos + UDim2.new(0, 0, -0.3, 0),
            TextTransparency = 1
        }
    )
    tween:Play()
    tween.Completed:Wait()
    label.Position = originalPos
    label.Visible = false
end

-- Mensagens épicas
local function showMessage(text)
    messageLabel.Text = text
    messageLabel.TextTransparency = 0
    TweenService:Create(
        messageLabel,
        TweenInfo.new(0.2),
        {TextTransparency = 0}
    ):Play()

    task.delay(2, function()
        TweenService:Create(
            messageLabel,
            TweenInfo.new(0.5),
            {TextTransparency = 1}
        ):Play()
    end)
end

-- ================= UPDATE KILL LABEL =================
local MAX_FRAME_WIDTH = 500

local function updateKillLabel(value)
    numberLabel.Text = "Kill Streak: " .. value
    local textWidth = numberLabel.TextBounds.X + 20
    if textWidth > frame.Size.X.Offset then
        local newWidth = math.min(textWidth + 20, MAX_FRAME_WIDTH)
        frame.Size = UDim2.new(0, newWidth, frame.Size.Y.Scale, frame.Size.Y.Offset)
        numberLabel.Size = UDim2.new(0, newWidth - 20, 1, 0)
    end
end

-- ================= CHARACTER =================
local function onCharacterAdded(character)
    local killStreak = character:WaitForChild("KillStreak")
    local humanoid = character:WaitForChild("Humanoid")

    local lastValue = killStreak.Value
    updateKillLabel(lastValue)

    local saidDominating, saidUnstoppable, saidMassKill, saidHellYeah, saidStrongest, played100Music =
        false, false, false, false, false, false

    killStreak:GetPropertyChangedSignal("Value"):Connect(function()
        local value = killStreak.Value
        updateKillLabel(value)

        -- +1 popup no canto
        if value == lastValue + 1 then
            playPlusOnePopup(plusOneMessage)
        end

        -- Mensagens épicas
        if value >= 5 and not saidDominating then
            showMessage("DOMINATING")
            saidDominating = true
        end
        if value >= 10 and not saidUnstoppable then
            showMessage("UNSTOPPABLE")
            saidUnstoppable = true
        end
        if value >= 20 and not saidMassKill then
            showMessage(player.DisplayName .. " is creating a mass kill amount!")
            saidMassKill = true
        end
        if value >= 50 and not saidHellYeah then
            showMessage("HELL YEAHH!")
            saidHellYeah = true
        end
        if value >= 100 and not saidStrongest then
            showMessage("THE STRONGEST ALIVE!")
            saidStrongest = true
        end
        if value >= 100 and not played100Music then
            strongestMusic:Play()
            played100Music = true
        end

        -- Reset quando morre ou volta a zero
        if value == 0 then
            saidDominating, saidUnstoppable, saidMassKill, saidHellYeah, saidStrongest, played100Music =
                false, false, false, false, false, false
            strongestMusic:Stop()
        end

        lastValue = value
    end)

    humanoid.Died:Connect(function()
        killStreak.Value = 0
        strongestMusic:Stop()
    end)
end

-- ================= START =================
if player.Character then
    onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)


-- ===================== POPUP ORIGINAL DO HUB =====================

local CreateInstance = function(InstanceType, Properties, Children)
    local Object = Instance.new(InstanceType)

    for Key, Value in next, Properties or {} do
        Object[Key] = Value
    end

    for _, Child in next, Children or {} do
        Child.Parent = Object
    end

    return Object
end

local DisplayPopup = function(Title, Message, UseCoroutine)
    if not getrenv then
        return warn(Message)
    end

    local ErrorModule = getrenv().require(
        game.CoreGui:WaitForChild("RobloxGui")
                    :WaitForChild("Modules")
                    :WaitForChild("ErrorPrompt")
    )

    local Prompt = ErrorModule.new("Default", { HideErrorCode = true })
    local ErrorGui = CreateInstance("ScreenGui", {
        Parent = game.CoreGui,
        ResetOnSpawn = false
    })

    local CurrentCoroutine = UseCoroutine and coroutine.running()

    Prompt:setParent(ErrorGui)
    Prompt:setErrorTitle(Title)
    Prompt:updateButtons({{
        Text = "I agree",
        Callback = function()
            Prompt:_close()
            ErrorGui:Destroy()
            if CurrentCoroutine then
                coroutine.resume(CurrentCoroutine)
            end
        end,
        Primary = true
    }}, "Default")

    Prompt:_open(Message)

    if CurrentCoroutine then
        coroutine.yield()
    end
end

DisplayPopup(
    "Auto Farm | ATTENTION!!",
    "by using Galaxy's Hub | auto farm, you may experience some glitches. (REPORT GLITCHES HERE: https://discord.gg/GalaxysHub/RVuFNJSJGj)",
    true
)

-- ===================== SEU SCRIPT INTEIRO (NÃO ALTERADO) =====================

---CHATGPT MADE---

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

--[ Remotes ]
local EventsFolder = ReplicatedStorage:WaitForChild("Events")
local abilityEvent = EventsFolder:WaitForChild("Ability")
local awakeningEvent = EventsFolder:WaitForChild("Awakening")

-- MouseButton1 Remote
local mouseButtonRemote = nil
if LocalPlayer.Character then
    mouseButtonRemote = LocalPlayer.Character:WaitForChild("Events"):WaitForChild("MouseButton1")
end
LocalPlayer.CharacterAdded:Connect(function(char)
    mouseButtonRemote = char:WaitForChild("Events"):WaitForChild("MouseButton1")
end)

-- ===================== GUI PRINCIPAL =====================
local screenGui = game:GetService("CoreGui"):FindFirstChild("ConfigGUI") or Instance.new("ScreenGui")
screenGui.Name = "GalaxysHubAutoFarm"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

local configFrame = Instance.new("Frame")
configFrame.Size = UDim2.new(0, 300, 0, 400)
configFrame.Position = UDim2.new(0, 20, 0, 50)
configFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
configFrame.BorderSizePixel = 2
configFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 15)
frameCorner.Parent = configFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Galaxy's Hub | Auto Farm: farm config"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = configFrame

-- ===================== BOTÃO MINIMIZAR =====================
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -35, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Text = "_"
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 18
minimizeButton.Parent = configFrame

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 10)
minCorner.Parent = minimizeButton

local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    local goalSize = minimized and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 300, 0, 400)
    TweenService:Create(configFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = goalSize}):Play()

    for _, child in pairs(configFrame:GetChildren()) do
        if child ~= title and child ~= minimizeButton then
            child.Visible = not minimized
        end
    end
end)

-- ===================== SCROLLFRAME =====================
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -30)
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 10
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.Parent = configFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, 5)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Parent = scrollFrame

-- ===================== ADICIONANDO O UIDragDetector =====================
local dragDetector = Instance.new("UIDragDetector")
dragDetector.Parent = configFrame

configFrame.Active = true  
configFrame.Draggable = true  

-- ===================== FUNÇÃO CRIAR BOTÃO =====================
local function createButton(name, parent, text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    button.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    task.delay(0.5, function()
        button.Visible = true
    end)

    return button
end

-- ===================== BOTÕES DE HABILIDADES =====================
local function createAbilityButton(abilityName, remoteArg)
    local button = createButton(abilityName, scrollFrame, abilityName .. ": ❌")
    local enabled = false

    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        button.Text = abilityName .. ": " .. (enabled and "✅" or "❌")

        if enabled then
            task.spawn(function()
                while enabled do
                    if remoteArg == "Awakening" then
                        awakeningEvent:FireServer()
                    else
                        abilityEvent:FireServer(remoteArg)
                    end
                    wait(0.1)
                end
            end)
        end
    end)
end

createAbilityButton("Auto ult", "Awakening")
createAbilityButton("Auto first ability", "First")
createAbilityButton("Auto second ability", "Second")
createAbilityButton("Auto third ability", "Third")
createAbilityButton("Auto fourth ability", "Fourth")

-- ===================== AUTO DASH =====================
local dashEnabled = false
local dashButtonToggle = createButton("auto dash", scrollFrame, "auto Dash: ❌")

local args = {
    "Front",
    CFrame.new(-526.9373779296875, 171.39474487304688, -43.58185577392578, 
        0.8592316508293152, 0, -0.5115867257118225, -0, 1, -0, 
        0.5115867257118225, 0, 0.8592316508293152)
}

dashButtonToggle.MouseButton1Click:Connect(function()
    dashEnabled = not dashEnabled
    dashButtonToggle.Text = "auto dash: " .. (dashEnabled and "✅" or "❌")

    if dashEnabled then
        task.spawn(function()
            while dashEnabled do
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dash"):FireServer(unpack(args))
                wait(7)
            end
        end)
    end
end)

-- ===================== AUTO M1 =====================
local m1Enabled = false
local m1ButtonToggle = createButton("Auto M1", scrollFrame, "Auto M1: ❌")

m1ButtonToggle.MouseButton1Click:Connect(function()
    m1Enabled = not m1Enabled
    m1ButtonToggle.Text = "Auto M1: " .. (m1Enabled and "✅" or "❌")

    if m1Enabled then
        task.spawn(function()
            while m1Enabled do
                if mouseButtonRemote then
                    local args = { true }
                    mouseButtonRemote:FireServer(unpack(args))
                end
                wait(0.1)
            end
        end)
    end
end)

-- ===================== FOLLOW =====================
local followEnabled = false
local lateralTime = 0
local OrbitRadius = 6
local OrbitSpeed = 100000
local currentTarget = nil
local hrp
local isOrbiting = false

--ORBIT + TWEEN--

local function updateHRP()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    hrp = char:WaitForChild("HumanoidRootPart")
end
LocalPlayer.CharacterAdded:Connect(updateHRP)
updateHRP()

local followButtonToggle = createButton("Follow", scrollFrame, "Auto Farm: OFF")

followButtonToggle.MouseButton1Click:Connect(function()
    followEnabled = not followEnabled
    followButtonToggle.Text = "Auto Farm: " .. (followEnabled and "ON" or "OFF")

    if followEnabled then
        task.spawn(function()
            while followEnabled do
                if not currentTarget or not currentTarget.Parent then
                    local possibleTargets = {}
                    if Workspace:FindFirstChild("Characters") then
                        for _, obj in pairs(Workspace.Characters:GetChildren()) do
                            if obj ~= hrp.Parent and obj:FindFirstChild("HumanoidRootPart") then
                                table.insert(possibleTargets, obj)
                            end
                        end
                    end
                    if #possibleTargets > 0 then
                        currentTarget = possibleTargets[math.random(1, #possibleTargets)]
                    end
                end

                if currentTarget then
                    local targetHRP = currentTarget:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        local distance = (hrp.Position - targetHRP.Position).Magnitude
                        
                        if distance > 10 then
                            TweenService:Create(hrp, TweenInfo.new(0.1), {Position = targetHRP.Position}):Play()
                        else
                            isOrbiting = true
                        end
                    end
                end

                if isOrbiting and currentTarget then
                    local targetHRP = currentTarget:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        lateralTime += (OrbitSpeed * 0.03) / OrbitRadius
                        local targetPos = targetHRP.Position
                        local offset = Vector3.new(math.cos(lateralTime), 0, math.sin(lateralTime)) * OrbitRadius
                        hrp.CFrame = CFrame.new(targetPos + offset, targetPos)
                    end
                end

                wait(0.03)
            end
        end)
    end
end)

--------------------- CAMERA ANTI-CUTSCENE ---------------------
local Camera = Workspace.CurrentCamera
local RunService = game:GetService("RunService")

-- força a câmera a cada frame
local function forceCameraUpdate()
    if followEnabled and currentTarget and currentTarget.Parent then
        
        local targetHRP =
            currentTarget:FindFirstChild("HumanoidRootPart")
            or currentTarget:FindFirstChild("Torso")
            or currentTarget:FindFirstChild("Head")

        if targetHRP then
            -- Força SEMPRE o follow
            Camera.CameraType = Enum.CameraType.Follow
            Camera.CameraSubject = targetHRP
        end

    else
        -- força o retorno da câmera ao player
        local humanoid = LocalPlayer.Character
            and LocalPlayer.Character:FindFirstChild("Humanoid")

        if humanoid then
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = humanoid
        end
    end
end

-- Atualiza em TODOS os eventos possíveis
RunService.RenderStepped:Connect(forceCameraUpdate)
RunService.Heartbeat:Connect(forceCameraUpdate)
RunService.Stepped:Connect(forceCameraUpdate)

-- Atualiza quando a câmera é recriada
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    Camera = Workspace.CurrentCamera
end)

--------------------------------Orbit--------------------------------

local RunService = game:GetService("RunService")

local startTime = os.clock() -- tempo inicial para calcular o ângulo
local lastTarget = nil       -- para detectar mudança de target
local lateralOffset = 0      -- ângulo da órbita

RunService.Heartbeat:Connect(function()
    if not followEnabled then return end
    if not hrp then return end
    if not currentTarget then return end
    if not currentTarget.Parent then return end

    local targetHRP

    -- Primeiro tenta achar o HumanoidRootPart
    targetHRP = currentTarget:FindFirstChild("HumanoidRootPart")
    
    -- Se não encontrar o HumanoidRootPart, tenta achar o Torso
    if not targetHRP then
        targetHRP = currentTarget:FindFirstChild("Torso")
    end

    -- Se também não encontrar o Torso, tenta achar a Head
    if not targetHRP then
        targetHRP = currentTarget:FindFirstChild("Head")
    end

    -- Se ainda assim não encontrar, retorna
    if not targetHRP then return end

    -- Detecta mudança de target
    if lastTarget ~= currentTarget then
        lastTarget = currentTarget
        lateralOffset = lateralOffset
        startTime = os.clock()
    end

    local elapsed = os.clock() - startTime
    lateralOffset = (elapsed * OrbitSpeed) / OrbitRadius

    -- Calcula o offset para órbita
    local offset = Vector3.new(
        math.cos(lateralOffset) * OrbitRadius,
        0,
        math.sin(lateralOffset) * OrbitRadius
    )

    -- Aplica a órbita
    hrp.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
end)

-- ===================== TARGET FRAME =====================
local targetStatusTitle = Instance.new("TextLabel")
targetStatusTitle.Size = UDim2.new(1, -10, 0, 25)
targetStatusTitle.BackgroundTransparency = 1
targetStatusTitle.Text = "- - - TARGET INFO - - -"
targetStatusTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
targetStatusTitle.Font = Enum.Font.SourceSansBold
targetStatusTitle.TextSize = 16
targetStatusTitle.Parent = scrollFrame
targetStatusTitle.TextScaled = true


local targetFrame = Instance.new("Frame")
targetFrame.Size = UDim2.new(1, -10, 0, 250)
targetFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
targetFrame.BorderSizePixel = 2
targetFrame.Visible = true
targetFrame.Parent = scrollFrame

local targetCorner = Instance.new("UICorner")
targetCorner.CornerRadius = UDim.new(0, 15)
targetCorner.Parent = targetFrame

local playerImage = Instance.new("ImageLabel")
playerImage.Size = UDim2.new(0, 150, 0, 150)
playerImage.Position = UDim2.new(0.5, 0, 0, 5)
playerImage.AnchorPoint = Vector2.new(0.5, 0)
playerImage.BackgroundTransparency = 1
playerImage.Parent = targetFrame

local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(0, 15)
imgCorner.Parent = playerImage

local targetName = Instance.new("TextLabel")
targetName.Size = UDim2.new(1, -10, 0, 25)
targetName.Position = UDim2.new(0.5, 0, 0, 160)
targetName.AnchorPoint = Vector2.new(0.5, 0)
targetName.BackgroundTransparency = 1
targetName.TextColor3 = Color3.fromRGB(255, 255, 255)
targetName.Font = Enum.Font.SourceSansBold
targetName.TextSize = 16 
targetName.Text = "name: no targets being farmed!"
targetName.Parent = targetFrame

local targetHP = Instance.new("TextLabel")
targetHP.Size = UDim2.new(1, -10, 0, 25)
targetHP.Position = UDim2.new(0.5, 0, 0, 185)
targetHP.AnchorPoint = Vector2.new(0.5, 0)
targetHP.BackgroundTransparency = 1
targetHP.TextColor3 = Color3.fromRGB(255, 255, 255)
targetHP.Font = Enum.Font.SourceSansBold
targetHP.TextSize = 16
targetHP.Text = "HP: 0"
targetHP.Parent = targetFrame

-- ===================== UPDATE TARGET =====================
task.spawn(function()
    while true do
        if currentTarget and currentTarget.Parent then
            local humanoid = currentTarget:FindFirstChild("Humanoid")
            targetName.Text = "name: "..currentTarget.Name

            if currentTarget:IsA("Model") and currentTarget:FindFirstChild("Humanoid") then
                if currentTarget.Name == "RespawnableDummy" then
                    targetName.Text = "name: RespawnableDummy"
                    targetHP.Text = "HP: " .. (humanoid and math.floor(humanoid.Health) or 0)
                    playerImage.Image = "rbxassetid://121229537586840"
                else
                    targetHP.Text = "HP: " .. (humanoid and math.floor(humanoid.Health) or 0)

                    if Players:FindFirstChild(currentTarget.Name) then
                        local userId = Players[currentTarget.Name].UserId
                        playerImage.Image = "rbxthumb://type=AvatarHeadShot&id="..userId.."&w=150&h=150"
                    else
                        playerImage.Image = "rbxassetid://121229537586840"
                    end
                end
            end
        else
            targetName.Text = "name: no targets being farmed!"
            targetHP.Text = "Target's HP: 0"
            playerImage.Image = ""
        end

        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y)
        task.wait(0.2)
    end
end)

-- ===================== AUTO SUICIDE AO FICAR COM 20% DE VIDA =====================
local function monitorHealth()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    humanoid:GetPropertyChangedSignal("Health"):Connect(function()
        local healthPercent = humanoid.Health / humanoid.MaxHealth * 100
        
        -- Se a vida chegar a 20% ou menos, morre automaticamente
        if healthPercent <= 20 then
            humanoid.Health = 0
        end
    end)
end

-- Atualiza quando renasce
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    monitorHealth()
end)

-- Executa imediatamente
monitorHealth()
