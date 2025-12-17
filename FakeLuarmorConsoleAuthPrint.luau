return (function(...)
	local genv = getgenv() or shared or _G or {}
	local cloneref = cloneref or clonereference or function(v)
		return v
	end;
	local RunService = cloneref(game:GetService("RunService"))
	local LogService = cloneref(game:GetService("LogService"))
	local CoreGui = cloneref(game:GetService("CoreGui"))
	if not genv["_console_message_counter"] then
		genv["_console_message_counter"] = 3000
	end;
	local CustomPrintHandler = {}
	function _internal_get_guid()
		genv["_console_message_counter"] = genv["_console_message_counter"] + 1;
		return tostring(genv["_console_message_counter"]) .. tostring(tick())
	end;
	function _internal_get_message_index(guid)
		local messageIndex = -1
		repeat
			task.wait(0.05)
			for i, log in ipairs(LogService:GetLogHistory()) do
				if tostring(log.message) == tostring(guid) then
					messageIndex = i + 1;
					break
				end
			end
		until messageIndex ~= -1
		return messageIndex
	end;
	function _internal_is_console_open()
		local devConsole = CoreGui:FindFirstChild("DevConsoleUI")
		if not devConsole then
			return false
		end;
		local master = devConsole:FindFirstChild("DevConsoleMaster")
		if not master then
			return false
		end;
		local mainView = master:FindFirstChild("MainView")
		if not mainView then
			return false
		end;
		return mainView:FindFirstChild("ClientLog") and mainView.ClientLog:FindFirstChild("Scroller")
	end;
	CustomPrintHandler["custom_print"] = function(...)
		local settings = {
			title = "Image",
			update_text = "Image",
			color = Color3.fromRGB(255, 255, 255),
			timestamp = os.date("%H:%M:%S")
		}
		if typeof(select(1, ...)) == "table" then
			local args = select(1, ...)
			settings.title = args.message or settings.title;
			settings.update_text = args.update_message or settings.update_text;
			settings.color = args.color or settings.color
		else
			settings.title = select(1, ...) or settings.title;
			settings.update_text = select(2, ...) or settings.update_text;
			settings.color = select(3, ...) or settings.color
		end;
		local guid = _internal_get_guid()
		print(guid)
		local messageIndex = _internal_get_message_index(guid)
		local consoleConnection;
		consoleConnection = RunService.RenderStepped:Connect(function()
			if _internal_is_console_open() then
				local logGui = CoreGui.DevConsoleUI.DevConsoleMaster.MainView.ClientLog.Scroller;
				local messageFrame = logGui:FindFirstChild(tostring(messageIndex))
				if not messageFrame then
					return
				end;
				local messageLabel = messageFrame:FindFirstChild("message_")
				local updateLabel = messageFrame:FindFirstChild("update_message")
				if not messageLabel or not updateLabel then
					return
				end;
				messageLabel.Text = settings.timestamp .. " -- " .. settings.title;
				messageLabel.TextColor3 = settings.color;
				messageLabel.TextWrapped = true;
				updateLabel.Text = settings.update_text;
				updateLabel.Visible = (settings.update_text ~= "Image")
			end
		end)
		local controller = {}
		function controller:update(...)
			local update_timestamp = true;
			if typeof(select(1, ...)) == "table" then
				local args = select(1, ...)
				settings.title = args.message or settings.title;
				settings.update_text = args.update_message or settings.update_text;
				settings.color = args.color or settings.color;
				if typeof(args.update_timestamp) == "boolean" then
					update_timestamp = args.update_timestamp
				end
			else
				settings.title = select(1, ...) or settings.title;
				settings.update_text = select(2, ...) or settings.update_text;
				settings.color = select(3, ...) or settings.color;
				if typeof(select(4, ...)) == "boolean" then
					update_timestamp = select(4, ...)
				end
			end;
			if update_timestamp then
				settings.timestamp = os.date("%H:%M:%S")
			end
		end;
		function controller:cleanup()
			if consoleConnection then
				consoleConnection:Disconnect()
			end
		end;
		return controller
	end;
	local script_name = genv["script_name"] or "Untitled"
	local bar_length = 20;
	local start_time = os.clock()
	local message_templates = genv.message_templates or {}
	local ranges = genv.message_ranges or {}
	if #message_templates == 0 then
		message_templates = {
			"Connecting to server",
			"Finalizing..",
			"Done."
		}
		ranges = {
			{
				14,
				32
			},
			{
				32,
				41
			},
			{
				41,
				100
			}
		}
	end;
	for i = #message_templates, 1, -1 do
		if not ranges[i] then
			if i == 1 then
				ranges[i] = {
					0,
					ranges[i + 1] and ranges[i + 1][1] or 33
				}
			elseif i == #message_templates then
				ranges[i] = {
					ranges[i - 1] and ranges[i - 1][2] or 41,
					100
				}
			else
				ranges[i] = {
					ranges[i - 1] and ranges[i - 1][2] or 0,
					ranges[i + 1] and ranges[i + 1][1] or 100
				}
			end
		end
	end;
	local loading_message = genv["Loading Message"] or "Loading..."
	if typeof(loading_message) == "number" then
		loading_message = "Build: " .. loading_message
	end;
	local custom_print_instance = CustomPrintHandler["custom_print"](string.format("[%s]: [%s] (%s%%) - %s", script_name, string.rep(" ", bar_length), 0, message_templates[1]), "Image", Color3.fromRGB(255, 255, 255))
	local progress = 0;
	local current_message = message_templates[1]
	task.spawn(function()
		while progress < 100 do
			local increment = math.random(1, 5)
			progress = math.min(progress + increment, 100)
			for i, template in ipairs(message_templates) do
				local range = ranges[i]
				if progress >= range[1] and progress < range[2] then
					current_message = template;
					break
				end
			end;
			local filled_length = math.ceil((progress / 100) * bar_length)
			local bar = string.rep("#", filled_length) .. string.rep(" ", bar_length - filled_length)
			custom_print_instance:update(string.format("[%s]: [%s] (%d%%) - %s", script_name, bar, progress, current_message), "Image", Color3.fromRGB(255, 255, 255), false)
			local delay = math.random(5, 30) / 100;
			if math.random(1, 100) <= 20 then
				delay = math.random(30, 80) / 100
			end;
			task.wait(delay)
			if progress >= 69 then
				break
			end
		end;
		task.wait(0.2)
		local elapsed_time = os.clock() - start_time;
		custom_print_instance:update(string.format("[%s]: [   SUCCESS   ] (100%%) - Took: %.10f", script_name, elapsed_time), "Image", Color3.fromRGB(51, 255, 85), false)
	end)
	return CustomPrintHandler
end)(...)
