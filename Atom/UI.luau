--[[
ATOM UI LIBRARY [REMASTERED & FIXED]
v3.0.1 (Mobile & PC Touch Support Fixed)
]]

local Atom = {}

-- Services
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Constants & Theme
local WEB_URL = "https://atom-hub.vercel.app/"
local API_URL = "https://atom-hub.vercel.app/api/validate"
local FOLDER = "Atom"
local CONFIG_FOLDER = FOLDER .. "/Configs"

-- Mutable Theme
local Theme = {
    Background = Color3.fromRGB(10, 10, 10),
    Section    = Color3.fromRGB(18, 18, 18),
    Element    = Color3.fromRGB(25, 25, 25),
    Stroke     = Color3.fromRGB(45, 45, 45),
    Text       = Color3.fromRGB(240, 240, 240),
    SubText    = Color3.fromRGB(150, 150, 150),
    Accent     = Color3.fromRGB(255, 255, 255),
    Error      = Color3.fromRGB(200, 50, 50)
}

-- Theme Registry
local ThemeObjects = {}

-- Utility Functions
local function MakeFolder(path)
    if not isfolder(path) then makefolder(path) end
end

local function SaveToPath(path, content)
    if writefile then
        writefile(path, content)
    elseif savefile then
        savefile(path, content)
    end
end

local function ReadFromPath(path)
    if isfile(path) then return readfile(path) end
    return nil
end

local function GetHWID()
    return game:GetService("RbxAnalyticsService"):GetClientId()
end

local function Request(url)
    local req = syn and syn.request or http_request or request or (fluxus and fluxus.request)
    if req then
        return req({Url = url, Method = "GET"})
    else
        return {Body = game:HttpGet(url)}
    end
end

local function Create(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props) do inst[k] = v end
    return inst
end

local function Tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time or 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props):Play()
end

-- Theme System
local function RegisterTheme(obj, prop, type)
    table.insert(ThemeObjects, {Object = obj, Property = prop, Type = type})
end

local function UpdateTheme()
    for _, v in pairs(ThemeObjects) do
        if v.Type == "Accent" then
            Tween(v.Object, {[v.Property] = Theme.Accent})
        elseif v.Type == "Background" then
            Tween(v.Object, {[v.Property] = Theme.Background})
        end
    end
end

-- Dragging Logic (Supports Mobile & PC)
local function EnableDrag(frame, parent)
    parent = parent or frame
    local dragging, dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Tween(parent, {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}, 0.1)
        end
    end)
end

-- KEY SYSTEM UI (With Rate Limit)
function Atom:CheckKey(callback)
    MakeFolder(FOLDER)
    local hwid = GetHWID()
    local savedKey = ReadFromPath(FOLDER .. "/key.txt")

    -- Rate Limit Variables
    local failedAttempts = 0
    local lockoutTime = 0

    local function Validate(key)
        local url = API_URL .. "?mode=verify&hwid=" .. HttpService:UrlEncode(hwid) .. "&key=" .. HttpService:UrlEncode(key)
        local success, response = pcall(function() return Request(url) end)
        if success and response.Body then
            local data = HttpService:JSONDecode(response.Body)
            return data.valid
        end
        return false 
    end

    if savedKey and Validate(savedKey) then
        callback()
        return
    end

    local ScreenGui = Create("ScreenGui", {Parent = CoreGui, Name = "AtomKeySystem", IgnoreGuiInset = true})
    local Backdrop = Create("Frame", {
        Parent = ScreenGui, BackgroundColor3 = Color3.fromRGB(0,0,0), BackgroundTransparency = 0.6, Size = UDim2.new(1,0,1,0), ZIndex = 0
    })

    local Main = Create("Frame", {
        Name = "Main", Parent = ScreenGui, BackgroundColor3 = Theme.Background,
        Size = UDim2.new(0, 500, 0, 350), Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5), ClipsDescendants = true
    })
    Create("UICorner", {Parent = Main, CornerRadius = UDim.new(0, 12)})
    Create("UIStroke", {Parent = Main, Color = Theme.Stroke, Thickness = 1.5})

    local DragFrame = Create("Frame", {Parent = Main, BackgroundTransparency = 1, Size = UDim2.new(1,0,0,40)})
    EnableDrag(DragFrame, Main)

    Create("TextLabel", {
        Parent = Main, Text = "AUTHENTICATION", Font = Enum.Font.GothamBold, TextSize = 18, TextColor3 = Theme.Text,
        Size = UDim2.new(1,0,0,50), BackgroundTransparency = 1
    })

    local InputContainer = Create("Frame", {
        Parent = Main, BackgroundColor3 = Theme.Section, Size = UDim2.new(0.8, 0, 0, 45), Position = UDim2.new(0.1, 0, 0.35, 0)
    })
    Create("UICorner", {Parent = InputContainer, CornerRadius = UDim.new(0, 8)})
    Create("UIStroke", {Parent = InputContainer, Color = Theme.Stroke, Thickness = 1})

    local KeyInput = Create("TextBox", {
        Parent = InputContainer, BackgroundTransparency = 1, Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
        Font = Enum.Font.Gotham, TextSize = 14, TextColor3 = Theme.Text, PlaceholderText = "Enter Key...", PlaceholderColor3 = Color3.fromRGB(80,80,80), Text = ""
    })

    local StatusText = Create("TextLabel", {
        Parent = Main, Text = "", Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Theme.Error,
        Size = UDim2.new(1,0,0,20), Position = UDim2.new(0,0,0.55,0), BackgroundTransparency = 1
    })

    local BtnContainer = Create("Frame", {
        Parent = Main, BackgroundTransparency = 1, Size = UDim2.new(0.8, 0, 0, 40), Position = UDim2.new(0.1, 0, 0.75, 0)
    })

    local function CreateButton(text, filled, pos, cb)
        local Btn = Create("TextButton", {
            Parent = BtnContainer, BackgroundColor3 = filled and Theme.Accent or Theme.Section, Size = UDim2.new(0.48, 0, 1, 0),
            Position = pos, Text = text, Font = Enum.Font.GothamBold,
            TextSize = 12, TextColor3 = filled and Theme.Background or Theme.Text, AutoButtonColor = false
        })
        Create("UICorner", {Parent = Btn, CornerRadius = UDim.new(0, 6)})
        if not filled then Create("UIStroke", {Parent = Btn, Color = Theme.Stroke, Thickness = 1}) end
        
        if filled then RegisterTheme(Btn, "BackgroundColor3", "Accent") end
        
        Btn.MouseButton1Down:Connect(cb)
    end

    CreateButton("GET KEY", false, UDim2.new(0,0,0,0), function() setclipboard(WEB_URL .. "#/getkey?hwid=" .. hwid) StatusText.Text = "Link Copied." end)

    CreateButton("ENTER", true, UDim2.new(0.52, 0, 0, 0), function()
        -- Rate Limit Check
        if os.time() < lockoutTime then
            StatusText.Text = "Wait " .. math.ceil(lockoutTime - os.time()) .. "s to try again."
            StatusText.TextColor3 = Theme.Error
            return
        end

        if Validate(KeyInput.Text) then
            SaveToPath(FOLDER .. "/key.txt", KeyInput.Text)
            Tween(Main, {Size = UDim2.new(0,0,0,0)})
            Tween(Backdrop, {BackgroundTransparency = 1})
            wait(0.6)
            ScreenGui:Destroy()
            callback()
        else
            failedAttempts = failedAttempts + 1
            if failedAttempts >= 3 then
                lockoutTime = os.time() + 60 -- 1 Minute Timeout
                failedAttempts = 0
                StatusText.Text = "Too many failed attempts. Wait 1m."
                StatusText.TextColor3 = Theme.Error
            else
                StatusText.Text = "Invalid Key (" .. failedAttempts .. "/3)"
                StatusText.TextColor3 = Theme.Error
            end
        end
    end)
end

-- MAIN LIBRARY
function Atom.new(options)
    options = options or {}
    local Library = {
        Flags = {},
        Items = {},
        ToggleKey = Enum.KeyCode.LeftControl -- Default Bind
    }
    local TitleText = options.Title or "Atom"

    MakeFolder(FOLDER)
    MakeFolder(CONFIG_FOLDER)

    local ScreenGui = Create("ScreenGui", {Name = "AtomUI", Parent = CoreGui})

    -- Main Container
    local Main = Create("Frame", {
        Name = "Main", Parent = ScreenGui, BackgroundColor3 = Theme.Background,
        Position = UDim2.new(0.5, -300, 0.5, -200), Size = UDim2.new(0, 600, 0, 420), ClipsDescendants = false
    })
    Create("UICorner", {Parent = Main, CornerRadius = UDim.new(0, 10)})
    Create("UIStroke", {Parent = Main, Color = Theme.Stroke, Thickness = 1.5})

    function Library:Open()
        ScreenGui.Enabled = true
        Main.Visible = true
        Tween(Main, {Size = UDim2.new(0, 600, 0, 420)})
    end

    function Library:Close()
        Tween(Main, {Size = UDim2.new(0, 600, 0, 0)})
        delay(0.3, function() Main.Visible = false end)
    end

    function Library:Toggle()
        if Main.Visible then
            Library:Close()
        else
            Library:Open()
        end
    end

    --------------------------------------------------------------------------------
    -- MOBILE BUTTON / TOGGLE BIND LOGIC
    --------------------------------------------------------------------------------

    -- Toggle Keybind Listener
    UserInputService.InputBegan:Connect(function(input, gpe)
        if not gpe and input.KeyCode == Library.ToggleKey then
            Library:Toggle()
        end
    end)

    -- Mobile Accessibility Frame
    if UserInputService.TouchEnabled then
        local MobileFrame = Create("Frame", {
            Name = "MobileToggle", Parent = ScreenGui, BackgroundTransparency = 1,
            Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(0.1, 0, 0.1, 0),
            ZIndex = 999
        })
        
        local MobileBtn = Create("TextButton", {
            Parent = MobileFrame, BackgroundColor3 = Theme.Section, Size = UDim2.new(1,0,1,0),
            Text = "UI", Font = Enum.Font.GothamBlack, TextSize = 16, TextColor3 = Theme.Accent
        })
        Create("UICorner", {Parent = MobileBtn, CornerRadius = UDim.new(1,0)})
        Create("UIStroke", {Parent = MobileBtn, Color = Theme.Stroke, Thickness = 2})
        RegisterTheme(MobileBtn, "TextColor3", "Accent")

        EnableDrag(MobileBtn, MobileFrame)

        MobileBtn.MouseButton1Down:Connect(function()
            Library:Toggle()
        end)
    end

    --------------------------------------------------------------------------------
    -- UI COMPONENTS
    --------------------------------------------------------------------------------

    -- Sidebar
    local Sidebar = Create("Frame", {Parent = Main, BackgroundColor3 = Theme.Section, Size = UDim2.new(0, 160, 1, 0)})
    Create("UICorner", {Parent = Sidebar, CornerRadius = UDim.new(0, 10)})

    local AppTitle = Create("TextLabel", {
        Parent = Sidebar, Text = TitleText, Font = Enum.Font.GothamBold, TextSize = 20, TextColor3 = Theme.Text,
        Size = UDim2.new(1, -20, 0, 60), Position = UDim2.new(0, 20, 0, 0), TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1, ZIndex = 2
    })

    local TabContainer = Create("Frame", {
        Parent = Sidebar, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, -80), Position = UDim2.new(0, 0, 0, 70), ZIndex = 2
    })
    local TabList = Create("UIListLayout", {Parent = TabContainer, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5)})
    Create("UIPadding", {Parent = TabContainer, PaddingLeft = UDim.new(0, 10)})

    local ContentArea = Create("Frame", {
        Parent = Main, BackgroundTransparency = 1, Size = UDim2.new(1, -170, 1, -20), Position = UDim2.new(0, 170, 0, 10), ClipsDescendants = true
    })

    local DragHandle = Create("Frame", {
        Parent = Sidebar,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 60),  -- Same height as title
        Position = UDim2.new(0, 0, 0, 0),
        ZIndex = 5  -- Higher than everything else
    })

    EnableDrag(Sidebar, Main)

    -- TABS
    local Tabs = {}
    local FirstTab = true

    function Library:AddTab(name)
        local Tab = {}
        
        local TabBtn = Create("TextButton", {
            Parent = TabContainer, BackgroundTransparency = 1, Size = UDim2.new(1, -20, 0, 34), Text = " " .. name,
            Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left, AutoButtonColor = false,
            LayoutOrder = #Tabs + 1, Active = true  -- Add this
        })
        Create("UICorner", {Parent = TabBtn, CornerRadius = UDim.new(0, 6)})

        --[[
        local Indicator = Create("Frame", {
            Parent = TabBtn, BackgroundColor3 = Theme.Accent, Size = UDim2.new(0, 0, 0.6, 0), Position = UDim2.new(0, 0, 0.2, 0)
        })
        Create("UICorner", {Parent = Indicator, CornerRadius = UDim.new(1, 0)})
        RegisterTheme(Indicator, "BackgroundColor3", "Accent")
        --]]
        
        local Page = Create("ScrollingFrame", {
            Parent = ContentArea, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Visible = false, ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Stroke
        })
        
        local PageLayout = Create("UIListLayout", {Name = "UIListLayout", Parent = Page, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)})
        Create("UIPadding", {Parent = Page, PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 5)})

        Tab.Page = Page 

        local function Activate()
            for _, t in pairs(Tabs) do
                Tween(t.Btn, {BackgroundTransparency = 1, TextColor3 = Theme.SubText})
                t.Page.Visible = false
            end
            Tween(TabBtn, {BackgroundTransparency = 0, TextColor3 = Theme.Text})
            Page.Visible = true
        end

        TabBtn.MouseButton1Down:Connect(Activate)
        table.insert(Tabs, {Btn = TabBtn, Page = Page})

        if FirstTab then FirstTab = false Activate() end

        -- COMPONENTS

        function Tab:AddLabel(text)
            local Container = Create("Frame", {Parent = Page, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 26)})
            Create("TextLabel", {
                Parent = Container, Text = text, TextColor3 = Theme.Text, Font = Enum.Font.GothamBold,
                TextSize = 12, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left, TextTransparency = 0.2
            })
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
        end

        function Tab:AddButton(text, callback)
            local Btn = Create("TextButton", {
                Parent = Page, BackgroundColor3 = Theme.Element, Size = UDim2.new(1, 0, 0, 38), Text = text,
                Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = Theme.Text, AutoButtonColor = false
            })
            Create("UICorner", {Parent = Btn, CornerRadius = UDim.new(0, 6)})
            local Stroke = Create("UIStroke", {Parent = Btn, Color = Theme.Stroke, Thickness = 1})

            Btn.MouseButton1Down:Connect(function()
                Tween(Btn, {BackgroundColor3 = Color3.fromRGB(35,35,35)}, 0.1)
                wait(0.1)
                Tween(Btn, {BackgroundColor3 = Theme.Element}, 0.1)
                task.spawn(callback)
            end)
            
            Btn.MouseEnter:Connect(function() Tween(Stroke, {Color = Theme.Accent}) end)
            Btn.MouseLeave:Connect(function() Tween(Stroke, {Color = Theme.Stroke}) end)
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
        end

        function Tab:AddToggle(text, default, callback, flag)
            flag = flag or text
            local enabled = default or false
            Library.Flags[flag] = enabled

            local ToggleFrame = Create("TextButton", {
                Parent = Page, BackgroundColor3 = Theme.Element, Size = UDim2.new(1, 0, 0, 38), Text = "", AutoButtonColor = false
            })
            Create("UICorner", {Parent = ToggleFrame, CornerRadius = UDim.new(0, 6)})
            local Stroke = Create("UIStroke", {Parent = ToggleFrame, Color = Theme.Stroke, Thickness = 1})

            Create("TextLabel", {
                Parent = ToggleFrame, Text = text, Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = Theme.Text,
                BackgroundTransparency = 1, Size = UDim2.new(1, -50, 1, 0), Position = UDim2.new(0, 12, 0, 0), TextXAlignment = Enum.TextXAlignment.Left
            })

            local Switch = Create("Frame", {
                Parent = ToggleFrame, BackgroundColor3 = enabled and Theme.Accent or Theme.Section, Size = UDim2.new(0, 36, 0, 20), Position = UDim2.new(1, -46, 0.5, -10)
            })
            Create("UICorner", {Parent = Switch, CornerRadius = UDim.new(1, 0)})
            RegisterTheme(Switch, "BackgroundColor3", "Accent")

            local Dot = Create("Frame", {
                Parent = Switch, BackgroundColor3 = enabled and Theme.Background or Theme.SubText, Size = UDim2.new(0, 16, 0, 16), Position = enabled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            })
            Create("UICorner", {Parent = Dot, CornerRadius = UDim.new(1, 0)})

            local function Set(val)
                enabled = val
                Library.Flags[flag] = enabled
                Tween(Switch, {BackgroundColor3 = enabled and Theme.Accent or Theme.Section})
                Tween(Dot, {
                    Position = enabled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
                    BackgroundColor3 = enabled and Theme.Background or Theme.SubText
                })
                task.spawn(callback, enabled)
            end

            ToggleFrame.MouseButton1Down:Connect(function() Set(not enabled) end)
            ToggleFrame.MouseEnter:Connect(function() Tween(Stroke, {Color = Theme.Accent}) end)
            ToggleFrame.MouseLeave:Connect(function() Tween(Stroke, {Color = Theme.Stroke}) end)

            Library.Items[flag] = Set
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
            
            Set(enabled)
        end

        function Tab:AddSlider(text, options, callback, flag)
            flag = flag or text
            local min, max, default = options.min or 0, options.max or 100, options.default or 0
            Library.Flags[flag] = default

            local Container = Create("Frame", {
                Parent = Page, BackgroundColor3 = Theme.Element, Size = UDim2.new(1, 0, 0, 50)
            })
            Create("UICorner", {Parent = Container, CornerRadius = UDim.new(0, 6)})
            local Stroke = Create("UIStroke", {Parent = Container, Color = Theme.Stroke, Thickness = 1})

            Create("TextLabel", {
                Parent = Container, Text = text, Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = Theme.Text,
                BackgroundTransparency = 1, Position = UDim2.new(0, 12, 0, 8), Size = UDim2.new(1, -20, 0, 15), TextXAlignment = Enum.TextXAlignment.Left
            })

            local ValueBox = Create("TextBox", {
                Parent = Container, BackgroundTransparency = 1, Text = tostring(default), Font = Enum.Font.GothamBold,
                TextSize = 13, TextColor3 = Theme.Accent, Size = UDim2.new(0, 50, 0, 20), Position = UDim2.new(1, -60, 0, 5), TextXAlignment = Enum.TextXAlignment.Right
            })
            RegisterTheme(ValueBox, "TextColor3", "Accent")

            local SlideBar = Create("Frame", {
                Parent = Container, BackgroundColor3 = Theme.Section, Size = UDim2.new(1, -24, 0, 4), Position = UDim2.new(0, 12, 0, 35)
            })
            Create("UICorner", {Parent = SlideBar, CornerRadius = UDim.new(1, 0)})

            local Fill = Create("Frame", {
                Parent = SlideBar, BackgroundColor3 = Theme.Accent, Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            })
            Create("UICorner", {Parent = Fill, CornerRadius = UDim.new(1, 0)})
            RegisterTheme(Fill, "BackgroundColor3", "Accent")

            local Trigger = Create("TextButton", {
                Parent = SlideBar, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Text = ""
            })

            local function Set(val)
                val = math.clamp(math.floor(val + 0.5), min, max)
                Library.Flags[flag] = val
                ValueBox.Text = tostring(val)
                Tween(Fill, {Size = UDim2.new((val - min) / (max - min), 0, 1, 0)}, 0.08)
                task.spawn(callback, val)
            end

            Trigger.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    local dragging = true
                    local slideConnection
                    local releaseConnection
                    
                    local function UpdateSlide()
                        local mousePos = UserInputService:GetMouseLocation()
                        local percent = math.clamp((mousePos.X - SlideBar.AbsolutePosition.X) / SlideBar.AbsoluteSize.X, 0, 1)
                        local val = min + ((max - min) * percent)
                        Set(val)
                    end
                    
                    UpdateSlide()
                    slideConnection = RunService.RenderStepped:Connect(UpdateSlide)

                    releaseConnection = UserInputService.InputEnded:Connect(function(endInput)
                        if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                            dragging = false
                            slideConnection:Disconnect()
                            releaseConnection:Disconnect()
                        end
                    end)
                end
            end)

            ValueBox.FocusLost:Connect(function(enter)
                local num = tonumber(ValueBox.Text)
                if num then Set(num) end
            end)
            
            Container.MouseEnter:Connect(function() Tween(Stroke, {Color = Theme.Accent}) end)
            Container.MouseLeave:Connect(function() Tween(Stroke, {Color = Theme.Stroke}) end)
            
            Library.Items[flag] = Set
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
            Set(default)
        end

        function Tab:AddInput(text, options, callback, flag)
            flag = flag or text
            if type(options) == "function" then callback = options options = {} end
            local default = options.Default or ""
            local placeholder = options.Placeholder or "Type here..."
            Library.Flags[flag] = default

            local Container = Create("Frame", {
                Parent = Page, BackgroundColor3 = Theme.Element, Size = UDim2.new(1, 0, 0, 45)
            })
            Create("UICorner", {Parent = Container, CornerRadius = UDim.new(0, 6)})
            local Stroke = Create("UIStroke", {Parent = Container, Color = Theme.Stroke, Thickness = 1})

            Create("TextLabel", {
                Parent = Container, Text = text, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Theme.Text,
                BackgroundTransparency = 1, Size = UDim2.new(1, -20, 0, 15), Position = UDim2.new(0, 12, 0, 6), TextXAlignment = Enum.TextXAlignment.Left
            })

            local Box = Create("TextBox", {
                Parent = Container, BackgroundTransparency = 1, Text = default, PlaceholderText = placeholder,
                PlaceholderColor3 = Color3.fromRGB(80, 80, 80), Font = Enum.Font.Gotham, TextSize = 13, TextColor3 = Theme.SubText,
                Size = UDim2.new(1, -24, 0, 20), Position = UDim2.new(0, 12, 0, 22), TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false
            })

            local function Set(val)
                Box.Text = val
                Library.Flags[flag] = val
                task.spawn(callback, val)
            end

            Box.Focused:Connect(function() Tween(Stroke, {Color = Theme.Accent}) end)
            Box.FocusLost:Connect(function(enter)
                Tween(Stroke, {Color = Theme.Stroke})
                if enter or Box.Text ~= "" then Set(Box.Text) end
            end)

            Container.MouseEnter:Connect(function() if not Box:IsFocused() then Tween(Stroke, {Color = Theme.Accent}) end end)
            Container.MouseLeave:Connect(function() if not Box:IsFocused() then Tween(Stroke, {Color = Theme.Stroke}) end end)
            
            Library.Items[flag] = Set
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
            
            if default ~= "" then Set(default) end
        end
        
        function Tab:AddDropdown(text, items, callback, flag)
            flag = flag or text
            local expanded = false
            local DropHeight = 38
            local selected = (items and items[1]) or "..."
            Library.Flags[flag] = selected

            local Container = Create("Frame", {
                Parent = Page, BackgroundColor3 = Theme.Element, Size = UDim2.new(1, 0, 0, DropHeight), ClipsDescendants = true
            })
            Create("UICorner", {Parent = Container, CornerRadius = UDim.new(0, 6)})
            local Stroke = Create("UIStroke", {Parent = Container, Color = Theme.Stroke, Thickness = 1})

            local Header = Create("TextButton", {
                Parent = Container, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 38), Text = "", AutoButtonColor = false
            })
            
            local Label = Create("TextLabel", {
                Parent = Header, Text = text .. ": " .. tostring(selected), 
                Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = Theme.Text,
                BackgroundTransparency = 1, Size = UDim2.new(1, -40, 1, 0), Position = UDim2.new(0, 12, 0, 0), TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local Arrow = Create("TextLabel", {
                Parent = Header, Text = "v", Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Theme.SubText,
                BackgroundTransparency = 1, Size = UDim2.new(0, 30, 1, 0), Position = UDim2.new(1, -30, 0, 0)
            })

            local List = Create("ScrollingFrame", {
                Parent = Container, BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 40), Size = UDim2.new(1, 0, 1, -45),
                ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Stroke, CanvasSize = UDim2.new(0,0,0,0)
            })
            local ListLayout = Create("UIListLayout", {Parent = List, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2)})
            Create("UIPadding", {Parent = List, PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)})

            local function Refresh(newItems)
                if newItems then items = newItems end
                for _, v in pairs(List:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
                
                if items then
                    for _, item in pairs(items) do
                        local ItemBtn = Create("TextButton", {
                            Parent = List, BackgroundColor3 = Theme.Section, Size = UDim2.new(1, 0, 0, 25), Text = tostring(item), Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = Theme.SubText
                        })
                        Create("UICorner", {Parent = ItemBtn, CornerRadius = UDim.new(0, 4)})
                        
                        ItemBtn.MouseButton1Down:Connect(function()
                            expanded = false
                            selected = item
                            Library.Flags[flag] = selected
                            Label.Text = text .. ": " .. tostring(item)
                            Tween(Container, {Size = UDim2.new(1, 0, 0, DropHeight)})
                            Tween(Arrow, {Rotation = 0})
                            task.spawn(callback, item)
                        end)
                    end
                end
                List.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y)
            end
            Refresh()

            local function Set(val)
                if items and table.find(items, val) then
                    selected = val
                    Label.Text = text .. ": " .. tostring(val)
                    Library.Flags[flag] = val
                    task.spawn(callback, val)
                end
            end

            Header.MouseButton1Down:Connect(function()
                expanded = not expanded
                Tween(Container, {Size = expanded and UDim2.new(1, 0, 0, 150) or UDim2.new(1, 0, 0, DropHeight)})
                Tween(Arrow, {Rotation = expanded and 180 or 0})
                delay(0.3, function() Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y) end)
            end)

            Container.MouseEnter:Connect(function() Tween(Stroke, {Color = Theme.Accent}) end)
            Container.MouseLeave:Connect(function() Tween(Stroke, {Color = Theme.Stroke}) end)
            
            Library.Items[flag] = Set
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
            Set(selected)

            return {Refresh = Refresh, Set = Set}
        end
        
        return Tab
    end

    --------------------------------------------------------------------------------
    -- SETTINGS TAB
    --------------------------------------------------------------------------------
    local ConfigTab = Library:AddTab("Settings")
    Tabs[#Tabs].Btn.LayoutOrder = 9999 

    ConfigTab:AddLabel("Interface Theme")

    local r, g, b = math.floor(Theme.Accent.R * 255), math.floor(Theme.Accent.G * 255), math.floor(Theme.Accent.B * 255)

    local function UpdateColor()
        Theme.Accent = Color3.fromRGB(r, g, b)
        UpdateTheme()
    end

    ConfigTab:AddSlider("Accent Red", {min = 0, max = 255, default = r}, function(v) r = v UpdateColor() end)
    ConfigTab:AddSlider("Accent Green", {min = 0, max = 255, default = g}, function(v) g = v UpdateColor() end)
    ConfigTab:AddSlider("Accent Blue", {min = 0, max = 255, default = b}, function(v) b = v UpdateColor() end)

    ConfigTab:AddLabel("Keybinds")

    -- Custom Keybind Button
    local BindBtn = Create("TextButton", {
        Parent = ConfigTab.Page, BackgroundColor3 = Theme.Element, Size = UDim2.new(1, 0, 0, 38), Text = "  Toggle Key: " .. Library.ToggleKey.Name,
        Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = Theme.Text, AutoButtonColor = false, TextXAlignment = Enum.TextXAlignment.Left
    })
    Create("UICorner", {Parent = BindBtn, CornerRadius = UDim.new(0, 6)})
    local BindStroke = Create("UIStroke", {Parent = BindBtn, Color = Theme.Stroke, Thickness = 1})
    ConfigTab.Page.CanvasSize = UDim2.new(0, 0, 0, ConfigTab.Page.UIListLayout.AbsoluteContentSize.Y)

    BindBtn.MouseButton1Down:Connect(function()
        BindBtn.Text = "  Press any key..."
        Tween(BindStroke, {Color = Theme.Accent})
        local input = UserInputService.InputBegan:Wait()
        if input.UserInputType == Enum.UserInputType.Keyboard then
            Library.ToggleKey = input.KeyCode
            BindBtn.Text = "  Toggle Key: " .. Library.ToggleKey.Name
        else
            BindBtn.Text = "  Toggle Key: " .. Library.ToggleKey.Name
        end
        Tween(BindStroke, {Color = Theme.Stroke})
    end)

    ConfigTab:AddLabel("Configuration")

    local configName = ""
    local selectedConfig = nil

    local function GetConfigList()
        local list = {}
        if listfiles then
            for _, file in pairs(listfiles(CONFIG_FOLDER)) do
                local name = file:match("([^/]+)%.json$")
                if name then table.insert(list, name) end
            end
        end
        return list
    end

    ConfigTab:AddInput("Config Name", {Placeholder = "Create new config..."}, function(v) configName = v end)

    local ConfigDropdown = ConfigTab:AddDropdown("Select Config", GetConfigList(), function(v) selectedConfig = v end)

    ConfigTab:AddButton("Save Config", function()
        local name = (configName ~= "" and configName) or selectedConfig
        if not name then return end
        
        local saveData = {
            Theme = {R = r, G = g, B = b},
            Flags = Library.Flags,
            ToggleKey = Library.ToggleKey.Name
        }
        
        SaveToPath(CONFIG_FOLDER .. "/" .. name .. ".json", HttpService:JSONEncode(saveData))
        
        if ConfigDropdown then
            ConfigDropdown.Refresh(GetConfigList())
        end
    end)

    ConfigTab:AddButton("Load Config", function()
        if not selectedConfig then return end
        local content = ReadFromPath(CONFIG_FOLDER .. "/" .. selectedConfig .. ".json")
        if content then
            local data = HttpService:JSONDecode(content)
            
            if data.Theme then
                r, g, b = data.Theme.R, data.Theme.G, data.Theme.B
                UpdateColor()
            end
            
            if data.ToggleKey then
                local success, key = pcall(function() return Enum.KeyCode[data.ToggleKey] end)
                if success then 
                    Library.ToggleKey = key 
                    BindBtn.Text = "  Toggle Key: " .. Library.ToggleKey.Name
                end
            end

            if data.Flags then
                for flag, val in pairs(data.Flags) do
                    if Library.Items[flag] then
                        Library.Items[flag](val)
                    end
                end
            end
        end
    end)

    if options.KeySystem then
        ScreenGui.Enabled = false
        Atom:CheckKey(function() Library:Open() end)
    else
        ScreenGui.Enabled = true
        Main.Size = UDim2.new(0, 600, 0, 420) 
    end

    return Library
end

return Atom
