local function loadArgs()
	return {
		FOV = getgenv().FOV or 150,
		SMOOTH = getgenv().SMOOTHNESS or 0.3,
		THICKNESS = getgenv().THICKNESS or 2,
		COLOR = getgenv().FOVCOLOR or Color3.new(1, 0, 0),
		WALLCHECK = getgenv().WALLCHECK or false,
		TEAMCHECK = getgenv().TEAMCHECK or false
	}
end
local args = loadArgs()
local SMOOTH = args.SMOOTH;
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer;
local Camera = workspace.CurrentCamera;
local aimCircle = Drawing.new("Circle")
aimCircle.Radius = args.FOV;
aimCircle.Color = args.COLOR
aimCircle.Thickness = args.THICKNESS;
aimCircle.Filled = false;
aimCircle.Visible = true;
local function applyArgs()
	aimCircle.Radius = args.FOV
	aimCircle.Color = args.COLOR
	aimCircle.Thickness = args.THICKNESS
	SMOOTH = args.SMOOTH
end
task.spawn(function()
	while true do
		task.wait(3)
		local newArgs = loadArgs()
		args = newArgs
		task.wait(0.1)
		applyArgs()
	end
end)
local aiming = false;
local wallCheck = function(from, to, character)
	if not args.WALLCHECK then
		return true
	end
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = {
		LocalPlayer.Character,
		character
	}
	local result = workspace:Raycast(from, to - from, params)
	return not result
end
local function teamCheck(player)
	if not args.TEAMCHECK then
		return true
	end
	return player.Team ~= LocalPlayer.Team
end
local function updateAimCircle()
	local mouseLocation = UIS:GetMouseLocation()
	aimCircle.Position = mouseLocation
end;
local aimAtTarget = function(targetPos)
	local mouse = UIS:GetMouseLocation()
	local newX = mouse.X + (targetPos.X - mouse.X) * SMOOTH;
	local newY = mouse.Y + (targetPos.Y - mouse.Y) * SMOOTH;
	mousemoveabs(newX, newY)
end
local findTarget = function()
	local closestTarget = nil;
	local closestDistance = math.huge;
	for _, player in pairs(Players:GetPlayers()) do
		pcall(function()
			if player ~= LocalPlayer and teamCheck(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local rootPart = player.Character.HumanoidRootPart
				local screenPos, onScreen = Camera:WorldToScreenPoint(rootPart.Position)
				if onScreen then
					if wallCheck(Camera.CFrame.Position, rootPart.Position, player.Character) then
						local dist = (Vector2.new(screenPos.X, screenPos.Y) - UIS:GetMouseLocation()).Magnitude
						if dist < closestDistance and dist <= aimCircle.Radius then
							closestDistance = dist
							closestTarget = rootPart
						end
					end
				end
			end
		end)
	end;
	return closestTarget
end
UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		aiming = true
	end
end)
UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		aiming = false
	end
end)
game:GetService("RunService").RenderStepped:Connect(function()
	updateAimCircle()
	if aiming then
		local target = findTarget()
		if target then
			local screenPos, onScreen = Camera:WorldToScreenPoint(target.Position)
			if onScreen then
				aimAtTarget(Vector2.new(screenPos.X, screenPos.Y))
			end
		end
	end
end)
