game:GetService("Players").LocalPlayer:Kick()
local getgenv = getgenv or function() return _G end
local config = getgenv().Config
local players = game:GetService("Players")
local lp = players.LocalPlayer
local coreGui = game:GetService("CoreGui")
local teleportService = game:GetService("TeleportService")
local promptGui = coreGui:WaitForChild("RobloxPromptGui")
local promptOverlay = promptGui:WaitForChild("promptOverlay")
local errorPrompt = promptOverlay:WaitForChild("ErrorPrompt")
local titleFrame = errorPrompt:WaitForChild("TitleFrame")
local errorTitle = titleFrame:WaitForChild("ErrorTitle")
local messageArea = errorPrompt:WaitForChild("MessageArea")
local errorFrame = messageArea:WaitForChild("ErrorFrame")
local errorMessage = errorFrame:WaitForChild("ErrorMessage")
local buttonArea = errorFrame:WaitForChild("ButtonArea")
task.spawn(function()
    while task.wait() do
        if errorPrompt.Visible then
            errorTitle.Text = config.Title
            errorMessage.Text = config.Message
            local leaveBtn = buttonArea:FindFirstChild("LeaveButton")
            local reconnectBtn = buttonArea:FindFirstChild("ReconnectButton")
            if leaveBtn then
                local btnText = leaveBtn:FindFirstChild("ButtonText")
                if btnText then btnText.Text = config.Button2 end
            end
            if reconnectBtn then
                local btnText = reconnectBtn:FindFirstChild("ButtonText")
                if btnText then btnText.Text = config.Button1 end
            end
        end
    end
end)
