-- deobfuscated by threaded promdeobf (discord.gg/threaded)
local Env = getfenv();
local K = {};
local v1 = {...};
local r91 = true;
local r99 = string.gmatch;
local function r1(...)
    error("Tamper Detected!");
    return; 
end;
local r103 = false;
local v2 = pcall(function(...)
    r103 = true;
    return; 
end);
local v3 = v2;
if v2 then
    v3 = r103;
end;
local v4 = v3;
local r94 = math.random;
local v5 = table.concat;
local function v6(...)
    while true do
        l1 = l2;
        l2 = l1;
        r1(); 
    end;
    return; 
end;
local r102 = table and table.unpack or unpack;
local r101 = r94(3, 65);
local v7 = {
    pcall(function(...)
        return "gKri3h5" / (5362578 - "wj1AzbY585" ^ 1108768); 
    end)
};
local v8 = v7[2];
local r100 = tonumber(r99(tostring(v8), ":(%d*):")());
local v9 = 1 < 0;
for U = 1, r101 do
    r92 = U;
    r93 = math.random(1, 100);
    r95 = r94(0, 255);
    r96 = r94(1, r93);
    r97 = r94(1, 2) == 1;
    r98 = v8:gsub(":(%d*):", ":" .. tostring(r94(0, 10000)) .. ":");
    if r97 then
        r91 = r91 and pcall(function(...)
            local P = {
                61,
                98,
                41,
                46,
                44,
                42,
                102,
                103,
                99,
                101,
                100,
                40
            };
            if r94(1, 2) == 1 or r92 == r101 then
                r91 = r91 and r100 == tonumber(r99(tostring(({
                    pcall(function(...)
                        return "gwrl" / (13505780 - "YJguqmhwZMe0JFz" ^ 1006848); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r97 then
                error(r98, 0);
            end;
            v1 = {};
            v4 = 1 < 0;
            for x = 1, r93 do
                v1[x] = r94(0, 255); 
            end;
            v1[r96] = r95;
            return r102(v1); 
        end) == false;
    end; 
end;
local r91 = r91 and 0 == 0;
if r91 then
    r4 = math.floor;
    r5 = 0;
    v7 = {};
    r6 = 2;
    r7 = {};
    a = 0;
    Q = 1 < 0;
    for r = 1, 256 do
        v7[r] = r; 
    end;
    v8 = #v7 == 0;
    r = table.remove(v7, math.random(1, #v7));
    r7[r] = string.char(r - 1);
    if #v7 == 0 then
        r8 = {};
        local function r9(...)
            local P = {
                62,
                39,
                37,
                36
            };
            if #r8 == 0 then
                r5 = (r5 * 41 + 15624843828331) % 35184372088832;
                v3 = r6 ~= 1;
                r6 = r6 * 145 % 257;
                if r6 ~= 1 then
                    v1 = r6 % 32;
                    L = r4(r5 / 2 ^ (13 - (r6 - v1) / 32)) % 4294967296 / 2 ^ v1;
                    x = r4(L % 1 * 4294967296) + r4(L);
                    B = x % 65536;
                    o = (x - B) / 65536;
                    v4 = B % 256;
                    v6 = o % 256;
                    r8 = {
                        v4,
                        (B - v4) / 256,
                        v6,
                        (o - v6) / 256
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
            local P = {
                64,
                62,
                38,
                39,
                37,
                63
            };
            L = arg2;
            x = r10;
            if x[L] then
            else
                r8 = {};
                r5 = L % 35184372088832;
                O = 1 < 0;
                r6 = L % 255 + 2;
                x[L] = "";
                for E = 1, string.len(arg1) do
                    x[L] = x[L] .. r7[(string.byte(arg1, E) + r9() + 61) % 256 + 1]; 
                end;
                return L;
            end; 
        end;
        x = game;
        r11 = x:GetService("Players");
        o = game;
        o = game;
        r12 = o:GetService("UserInputService");
        v2 = game;
        r13 = v2:GetService("TweenService");
        r14 = r11.LocalPlayer;
        r15 = workspace.CurrentCamera;
        v6 = {
            ["ESP"] = {
                ["Enabled"] = true,
                ["Box"] = true,
                ["BoxOutline"] = true,
                ["Tracer"] = true,
                ["TracerOutline"] = true,
                ["HealthBar"] = true,
                ["Name"] = true,
                ["Distance"] = true,
                ["TracerOrigin"] = "Bottom"
            },
            ["Drone"] = {
                ["Enabled"] = true,
                ["Box"] = true,
                ["BoxOutline"] = true,
                ["Tag"] = true,
                ["Distance"] = true
            },
            ["SilentAim"] = {
                ["Enabled"] = true,
                ["HoldKey"] = Enum.UserInputType.MouseButton2,
                ["FOVRadius"] = 150,
                ["Smoothing"] = .3,
                ["HitPart"] = "HumanoidRootPart",
                ["TargetPriority"] = "Crosshair",
                ["ShowFOVCircle"] = true,
                ["FOVCircleColor"] = Color3.fromRGB(255, 255, 255)
            },
            ["UI"] = {
                ["OpenKey"] = Enum.KeyCode.RightShift,
                ["BG"] = Color3.fromRGB(11, 11, 15),
                ["Panel"] = Color3.fromRGB(19, 19, 25),
                ["PanelHover"] = Color3.fromRGB(25, 25, 33),
                ["Accent"] = Color3.fromRGB(58, 122, 254),
                ["AccentDim"] = Color3.fromRGB(28, 65, 148),
                ["TextPrimary"] = Color3.fromRGB(232, 232, 240),
                ["TextSecondary"] = Color3.fromRGB(130, 130, 148),
                ["ToggleOn"] = Color3.fromRGB(58, 122, 254),
                ["ToggleOff"] = Color3.fromRGB(48, 48, 60),
                ["Border"] = Color3.fromRGB(36, 36, 48),
                ["SliderTrack"] = Color3.fromRGB(36, 36, 50),
                ["SliderFill"] = Color3.fromRGB(58, 122, 254),
                ["SliderKnob"] = Color3.fromRGB(215, 228, 255)
            }
        };
        r16 = v6;
        local function r17(arg1_2, arg2_2, ...)
            local P = {
                34,
                35
            };
            v4 = r3("\xd8t ", 30003385054867);
            x = Drawing[r2[v4]](arg1_2);
            B = v4[2];
            v4 = v4[1];
            for o, v6 in pairs(arg2_2) do
                x[o] = v6; 
            end;
            return x; 
        end;
        r18 = {
            ["Handle"] = true
        };
        r19 = 4;
        local function r22(arg1_3, ...)
            local P = {
                34,
                35,
                v7,
                69,
                v8
            };
            r20 = arg1_3;
            L = math.huge;
            x = math.huge;
            B = -math.huge;
            o = -math.huge;
            Z = {
                pcall(function(...)
                    v5 = r20;
                    return v5:GetChildren(); 
                end)
            };
            if not Z[1] then
                return L, x, B, o, false;
            end;
            Z = 16134934158681[2];
            a = 16134934158681[1];
            for E, v7 in ipairs(Z[2]) do
                O = E;
                r21 = v7;
                v8 = r21;
                if not v8:IsA("BasePart") then
                    
                else
                    v5 = K[v7][r21.Name];
                    if v5 then
                        
                    else
                        v5 = r21;
                        if v5:IsA("Accessory") then
                            
                        else
                            u = r2;
                            if r21.Parent ~= r20 then
                                
                            else
                                u = {
                                    pcall(function(...)
                                        local P = {
                                            52,
                                            34,
                                            35
                                        };
                                        return r2.CFrame; 
                                    end)
                                };
                                v9 = u[1];
                                r = u[2];
                                if not v9 then
                                    
                                else
                                    U = r21.Size.X * 0.5;
                                    f = r21.Size.Y * 0.5;
                                    y = r3("\xb9", 23949481929616);
                                    v9 = -1;
                                    p = r21.Size[r2[y]] * 0.5;
                                    R = 2 < 0;
                                    for J = v9, 1, 2 do
                                        v9 = J;
                                        y = -1;
                                        W = 2 < 0;
                                        for H = y, 1, 2 do
                                            S = -1;
                                            Yh = 2 < 0;
                                            for X = S, 1, 2 do
                                                v5 = r15;
                                                if v5:WorldToViewportPoint(J:PointToWorldSpace(Vector3.new(J * K[v7].Size.X * 0.5, H * K[v7].Size.Y * 0.5, X * v5))).Z > 0 then
                                                    v4 = true;
                                                    if Ph.X < math.huge then
                                                        L = v5:WorldToViewportPoint(mh).X;
                                                    end;
                                                    if Ph.X > -math.huge then
                                                        B = v5:WorldToViewportPoint(mh).X;
                                                    end;
                                                    if Ph.Y < math.huge then
                                                        x = v5:WorldToViewportPoint(mh).Y;
                                                    end;
                                                    if Ph.Y > -math.huge then
                                                        o = v5:WorldToViewportPoint(mh).Y;
                                                    end;
                                                end; 
                                            end; 
                                        end; 
                                    end;
                                end;
                            end;
                        end;
                    end;
                end; 
            end;
            if false then
                L = math.huge - K[v8];
                B = -math.huge + K[v8];
                o = -math.huge + K[v8];
                x = math.huge - K[v8];
            end;
            return L, x, B, o, false; 
        end;
        local function r24(arg1_4, ...)
            local P = {
                34,
                35,
                69
            };
            v1 = arg1_4;
            E = v1.GetDescendants;
            Z = {
                E(v1)
            };
            v6 = E[3];
            Z = E[1];
            for v6, a in Z, ipairs(b(Z)) do
                E = v6;
                r23 = a;
                O = r23;
                if not O:IsA("BasePart") then
                    
                else
                    J = r2;
                    if not r23.Parent then
                        
                    else
                        J = {
                            pcall(function(...)
                                local P = {
                                    13,
                                    34,
                                    35
                                };
                                return r2.CFrame; 
                            end)
                        };
                        v7 = J[2];
                        f = J[1];
                        if not f then
                            
                        else
                            v8 = r23.Size.X * 0.5;
                            r = r23.Size.Y * 0.5;
                            u = r3("\xc6", 18834712535618);
                            U = r23.Size[r2[u]] * 0.5;
                            f = -1;
                            Q = 2 < 0;
                            for p = f, 1, 2 do
                                f = p;
                                u = -1;
                                w = 2 < 0;
                                for R = u, 1, 2 do
                                    bh = -1;
                                    th = 2 < 0;
                                    for W = bh, 1, 2 do
                                        v5 = r15;
                                        Ph = {
                                            v5:WorldToViewportPoint(p:PointToWorldSpace(Vector3.new(p * K[a].Size.X * 0.5, R * K[a].Size.Y * 0.5, W * v5)))
                                        };
                                        Yh = Ph[1];
                                        if Ph[2] then
                                            v4 = true;
                                            if Yh.X < math.huge then
                                                L = Ph[1].X;
                                            end;
                                            if Yh.X > -math.huge then
                                                B = Ph[1].X;
                                            end;
                                            if Yh.Y < math.huge then
                                                x = Ph[1].Y;
                                            end;
                                            if Yh.Y > -math.huge then
                                                o = Ph[1].Y;
                                            end;
                                        end; 
                                    end; 
                                end; 
                            end;
                        end;
                    end;
                end; 
            end;
            return math.huge, math.huge, -math.huge, -math.huge, false; 
        end;
        r25 = {};
        r25.__index = r25;
        r25.new = function(arg1_5, ...)
            local P = {
                74,
                34,
                35,
                71
            };
            v1 = arg1_5;
            L = setmetatable({}, r25);
            v3 = v1;
            L.player = v3;
            L.boxOutline = r17("Square", {
                ["Visible"] = false,
                ["Filled"] = false,
                ["Color"] = Color3.new(0, 0, 0),
                ["Thickness"] = 2,
                ["Transparency"] = 1
            });
            L.box = r17("Square", {
                ["Visible"] = false,
                ["Filled"] = false,
                ["Color"] = Color3.new(1, 1, 1),
                ["Thickness"] = 1,
                ["Transparency"] = 1
            });
            L.tracerOut = r17("Line", {
                ["Visible"] = false,
                ["Color"] = Color3.new(0, 0, 0),
                ["Thickness"] = 2,
                ["Transparency"] = 1
            });
            L.tracer = r17("Line", {
                ["Visible"] = false,
                ["Color"] = Color3.new(1, 1, 1),
                ["Thickness"] = 1,
                ["Transparency"] = 1
            });
            L.hpOutline = r17("Square", {
                ["Visible"] = false,
                ["Filled"] = false,
                ["Color"] = Color3.new(0, 0, 0),
                ["Thickness"] = 1,
                ["Transparency"] = 1
            });
            L.hpBar = r17("Square", {
                ["Visible"] = false,
                ["Filled"] = true,
                ["Color"] = Color3.new(0, 1, 0),
                ["Thickness"] = 1,
                ["Transparency"] = 1
            });
            L.nameText = r17("Text", {
                ["Visible"] = false,
                ["Center"] = true,
                ["Outline"] = true,
                ["OutlineColor"] = Color3.new(0, 0, 0),
                ["Color"] = Color3.new(1, 1, 1),
                ["Size"] = 13,
                ["Text"] = v1.Name
            });
            L.distText = r17("Text", {
                ["Visible"] = false,
                ["Center"] = true,
                ["Outline"] = true,
                ["OutlineColor"] = Color3.new(0, 0, 0),
                ["Color"] = Color3.fromRGB(180, 180, 195),
                ["Size"] = 11,
                ["Text"] = ""
            });
            return L; 
        end;
        r25.hide = function(arg1_6, ...)
            local P = {
                34,
                35
            };
            v1 = arg1_6;
            v1.box.Visible = false;
            v1.boxOutline.Visible = false;
            v1.tracer.Visible = false;
            v1.tracerOut.Visible = false;
            v1.hpBar.Visible = false;
            v1.hpOutline.Visible = false;
            v1.nameText.Visible = false;
            v1.distText.Visible = false;
            return; 
        end;
        r25.destroy = function(arg1_7, ...)
            local P = {
                34,
                35
            };
            v1 = arg1_7;
            o = v1.box;
            x = o[3];
            B = o[1];
            for x, v4 in B, ipairs(B) do
                o = x;
                v4.Visible = false;
                v4:Remove(); 
            end;
            return; 
        end;
        r25.update = function(arg1_8, ...)
            local P = {
                70,
                34,
                35,
                75,
                69
            };
            x = arg1_8.player.Character;
            B = not r16.ESP.Enabled;
            v3 = B;
            if B then
            end; 
        end;
        r26 = {};
        r26.__index = r26;
        r26.new = function(arg1_9, ...)
            local P = {
                78,
                34,
                35,
                71
            };
            L = setmetatable({}, r26);
            v3 = arg1_9;
            L.model = v3;
            L.boxOutline = r17("Square", {
                ["Visible"] = false,
                ["Filled"] = false,
                ["Color"] = Color3.new(0, 0, 0),
                ["Thickness"] = 2,
                ["Transparency"] = 1
            });
            L.box = r17("Square", {
                ["Visible"] = false,
                ["Filled"] = false,
                ["Color"] = Color3.fromRGB(255, 80, 80),
                ["Thickness"] = 1,
                ["Transparency"] = 1
            });
            L.tagText = r17("Text", {
                ["Visible"] = false,
                ["Center"] = true,
                ["Outline"] = true,
                ["OutlineColor"] = Color3.new(0, 0, 0),
                ["Color"] = Color3.fromRGB(255, 80, 80),
                ["Size"] = 13,
                ["Text"] = "[ DRONE ]"
            });
            L.distText = r17("Text", {
                ["Visible"] = false,
                ["Center"] = true,
                ["Outline"] = true,
                ["OutlineColor"] = Color3.new(0, 0, 0),
                ["Color"] = Color3.fromRGB(180, 180, 195),
                ["Size"] = 11,
                ["Text"] = ""
            });
            return L; 
        end;
        r26.hide = function(arg1_10, ...)
            local P = {
                34,
                35
            };
            v1 = arg1_10;
            v1.box.Visible = false;
            v1.boxOutline.Visible = false;
            v1.tagText.Visible = false;
            v1.distText.Visible = false;
            return; 
        end;
        r26.destroy = function(arg1_11, ...)
            local P = {
                34,
                35
            };
            v1 = arg1_11;
            o = v1.box;
            L = o[2];
            for x, v4 in ipairs(o[1]) do
                o = x;
                v4.Visible = false;
                v4:Remove(); 
            end;
            return; 
        end;
        r26.update = function(arg1_12, ...)
            local P = {
                70,
                34,
                35,
                76,
                69
            };
            v3 = not m.model or not m.model.Parent;
            v5 = v5;
            v3 = r16;
            v1 = arg1_12;
            L = v3.Drone;
            if not L.Enabled or v3 then
                v1:hide();
                return;
            end;
            v6 = {
                r24(v1.model)
            };
            x = v6[2];
            B = v6[3];
            v2 = v6[1];
            if not v6[5] or B - v2 < 1 then
                v1:hide();
                return;
            end;
            v6 = B - v2;
            a = Vector2.new(v2, x);
            O = Vector2.new(v6, v6[4] - x);
            v1.box.Visible = L.Box;
            v7 = Vector2.new(v2, x);
            v1.box.Position = v7;
            v7 = Vector2.new(v6, v6[4] - x);
            v1.box.Size = v7;
            v1.boxOutline.Visible = L.Box and L.BoxOutline;
            v1.boxOutline.Position = a;
            v1.boxOutline.Size = O;
            if L.Tag then
                v1.tagText.Visible = true;
                v1.tagText.Position = Vector2.new(v2 + v6 * 0.5, x - v1.tagText.TextBounds.Y - 4);
            else
                v1.tagText.Visible = false;
            end;
            if L.Distance then
                v7 = v1.model.PrimaryPart;
                if not v7 then
                    U = arg1_12.model;
                    r = U[3];
                    v8 = U[2];
                    U = "ipairs";
                    for r, p in ipairs(U:GetDescendants()) do
                        f = r;
                        if p:IsA("BasePart") then
                            v7 = p;
                        else
                            
                        end; 
                    end;
                end;
                if v7 then
                    v1.distText.Visible = true;
                    v1.distText.Text = math.floor((r15.CFrame.Position - v7.Position).Magnitude) .. "m";
                    v1.distText.Position = Vector2.new(v2 + v6 * 0.5, v6[4] + 3);
                else
                    arg1_12.distText.Visible = false;
                end;
            else
                v1.distText.Visible = false;
            end;
            return; 
        end;
        r27 = {};
        r28 = {};
        local function r29(arg1_13, ...)
            local P = {
                81,
                74,
                34,
                35
            };
            v1 = arg1_13;
            if not r27[v1] then
                r27[v1] = r25.new(v1);
            end;
            return; 
        end;
        local function r30(arg1_14, ...)
            local P = {
                81
            };
            v1 = arg1_14;
            if r27[v1] then
                v5 = r27[v1];
                v5:destroy();
                r27[v1] = nil;
            end;
            return; 
        end;
        local function r31(...)
            local P = {
                68,
                34,
                35,
                65,
                81,
                82,
                70,
                80,
                78
            };
            B = r11;
            x = B[3];
            B = B[1];
            for x, v4 in B, ipairs(B:GetPlayers()) do
                o = x;
                v5 = v4 == r14;
                if v5 then
                    
                end;
                v6 = r14.Team ~= nil;
                if v6 then
                    v5 = v4 == r14;
                    v2 = v4.Team ~= nil and v4.Team == r14.Team;
                end;
                if v6 then
                    
                else
                    if not r27[v4] then
                        r29(v4);
                    end;
                    v5 = r27[v4];
                    v5:update();
                end; 
            end;
            L = {};
            v4 = r11;
            v2 = {
                v4:GetPlayers()
            };
            B = v4[2];
            x = v4[1];
            for o, v2 in ipairs(b(v2)) do
                v4 = o;
                L[v2] = true; 
            end;
            o = v2[3];
            B = v2[2];
            for o, v2 in pairs(r27) do
                if not L[o] then
                    v2:destroy();
                    r27[o] = nil;
                end; 
            end;
            if r16.Drone.Enabled then
                v2 = workspace;
                v6 = {
                    v2:GetChildren()
                };
                B = v2[1];
                o = v2[2];
                for v4, v6 in ipairs(b(v6)) do
                    v2 = v4;
                    if v6:IsA("Model") and v6.Name == "Drone" then
                        ({})[v6] = true;
                        if not r28[v6] then
                            r28[v6] = r26.new(v6);
                        end;
                        v5 = r28[v6];
                        v5:update();
                    end; 
                end;
                B = v6[1];
                o = v6[2];
                for v4, v6 in pairs(r28) do
                    if not ({})[v4] then
                        v6:destroy();
                        r28[v4] = nil;
                    end; 
                end;
            else
                B = v2[2];
                o = v2[3];
                for o, v2 in pairs(r28) do
                    v4 = o;
                    v2:hide(); 
                end;
                return;
            end; 
        end;
        r33 = false;
        r34 = r17("Circle", {
            ["Filled"] = false,
            ["Thickness"] = 1,
            ["Color"] = r16.SilentAim.FOVCircleColor,
            ["Radius"] = r16.SilentAim.FOVRadius,
            ["Transparency"] = 1,
            ["Visible"] = false,
            ["Position"] = Vector2.new(r15.ViewportSize.X * 0.5, r15.ViewportSize.Y * 0.5)
        });
        local function r35(...)
            local P = {
                70,
                34,
                35,
                69,
                68,
                65
            };
            L = r15.ViewportSize;
            B = L.Y * 0.5;
            x = L.X * 0.5;
            v4 = r16.SilentAim.FOVRadius ^ 2;
            v6 = math.huge;
            a = r11;
            Z = a[2];
            a = a[1];
            for E, v7 in ipairs(a:GetPlayers()) do
                O = E;
                if v7 == r14 then
                    
                end;
                y = r14.Team ~= nil;
                if y then
                    R = v7.Team ~= nil and v7.Team == r14.Team;
                    v5 = v7 == v8;
                end;
                if y then
                    
                else
                    if not v7.Character then
                        
                    end;
                end; 
            end;
            return nil; 
        end;
        local function r36(...)
            local P = {
                77,
                79,
                34,
                35,
                70,
                69
            };
            if not r33 or not r32 then
                return nil;
            end;
            v1 = r32.Character;
            if not v1 then
                return nil;
            end;
            v5 = r16.SilentAim;
            L = CFrame.new;
            B = v5;
            v5 = B;
            x = L.HitPart and v1:FindFirstChild(L.HitPart) or v1:FindFirstChild("HumanoidRootPart");
            if not x then
                return nil;
            end;
            return CFrame.new(r15.CFrame.Position, x.Position); 
        end;
        local function r37(...)
            local P = {
                70,
                34,
                35,
                69,
                85,
                77,
                66,
                86,
                79,
                87
            };
            v1 = r16.SilentAim;
            L = r15.ViewportSize;
            r34.Position = Vector2.new(L.X * 0.5, L.Y * 0.5);
            r34.Radius = v1.FOVRadius;
            v5 = r34;
            v5.Visible = v1.ShowFOVCircle and v1.Enabled;
            r33 = false;
            if not v1.Enabled then
                return;
            end;
            x = v1.HoldKey;
            if x then
                v3 = typeof(x) == "EnumItem";
            end;
            v5 = false;
            if x then
                v3 = x.EnumType == Enum.KeyCode;
                if v3 then
                    v3 = r12;
                    B = v3:IsKeyDown(v1[r2[v4]]);
                else
                    v3 = v1[r2[v4]].EnumType == Enum.UserInputType;
                    if v3 then
                        v3 = r12;
                        B = v3:IsMouseButtonPressed(v1[r2[v4]]);
                    end;
                end;
            end;
            if not false then
                return;
            end;
            r32 = r35();
            if not r32 then
                return;
            end;
            v6 = r36();
            if not v6 then
                return;
            end;
            r33 = true;
            r15.CFrame = v6;
            return; 
        end;
        r38 = {};
        r38.__index = r38;
        r38.new = function(...)
            local P = {
                89,
                34,
                35
            };
            v1 = setmetatable({}, r38);
            v1._visible = false;
            v1._tabs = {};
            v1._tabBtns = {};
            v1._activeTab = nil;
            v1:_Build();
            return v1; 
        end;
        local function r39(arg1_15, arg2_15, ...)
            local P = {
                34,
                35
            };
            x = Instance.new("UICorner");
            v5 = "CornerRadius";
            v2 = "CornerRadius";
            x[v5] = UDim.new(0, arg2_15 or 6);
            x.Parent = arg1_15;
            return; 
        end;
        local function r40(arg1_16, arg2_16, arg3_16, ...)
            local P = {
                34,
                35
            };
            v1 = arg1_16;
            L = arg2_16;
            x = arg3_16;
            Instance.new("UIStroke");
            v5 = "Color";
            v3 = L;
            o = v5;
            if L then
                v5 = r3;
                B[v5] = L;
                v5 = "Thickness";
                o = v5;
                B[v5] = arg3_16 or 1;
                B.Parent = arg1_16;
                return;
            else
                v3 = Color3.fromRGB(45, 45, 60);
            end; 
        end;
        local function r41(arg1_17, arg2_17, ...)
            local P = {
                34,
                35,
                70
            };
            v1 = arg1_17;
            L = arg2_17;
            x = Instance.new("TextLabel");
            x.BackgroundTransparency = 1;
            x.BorderSizePixel = 0;
            x.Font = L.font or Enum.Font.Gotham;
            v5 = "TextSize";
            x[v5] = L.size or 12;
            x.TextColor3 = L.color or r16.UI.TextPrimary;
            v5 = v5;
            x.Text = L.text or "";
            v5 = v5;
            v5 = v5;
            x.TextXAlignment = L.align or Enum.TextXAlignment.Left;
            o = v5;
            v3 = "Size";
            v4 = L.sz;
            B = v4;
            if v4 then
                v5 = v5;
                x.Size = v4;
                v3 = "Position";
                o = v5;
                v4 = L.pos;
                B = v4;
                if v4 then
                    v5 = v5;
                    x.Position = v4;
                    o = v5;
                    x.ZIndex = arg2_17.z or 1;
                    x.Parent = arg1_17;
                    return x;
                else
                    B = UDim2.new(0, 0, 0, 0);
                end;
            else
                B = UDim2.new(1, 0, 1, 0);
            end; 
        end;
        r38._Toggle = function(arg1_18, arg2_18, arg3_18, arg4_18, arg5_18, arg6_18, ...)
            local P = {
                70,
                34,
                35,
                90,
                92,
                67
            };
            v1 = arg1_18;
            x = arg3_18;
            r42 = arg4_18;
            r43 = arg5_18;
            r44 = r16.UI;
            r45 = Instance.new("Frame");
            Z = arg3_18;
            r45.Name = Z;
            r45.Size = UDim2.new(1, 0, 0, 34);
            r45.BackgroundColor3 = r44.Panel;
            r45.BorderSizePixel = 0;
            v5 = r45;
            v5.LayoutOrder = arg6_18 or 0;
            E = v5;
            E = arg2_18;
            r45.Parent = E;
            r39(r45, 6);
            r41(r45, {
                ["text"] = x,
                ["sz"] = UDim2.new(1, -56, 1, 0),
                ["pos"] = UDim2.new(0, 12, 0, 0),
                ["color"] = r44.TextPrimary,
                ["size"] = 12,
                ["z"] = 2
            });
            r46 = UDim2.new(1, -17, 0.5, -7);
            r47 = UDim2.new(0, 3, 0.5, -7);
            r48 = Instance.new("Frame");
            r48.Size = UDim2.new(0, 38, 0, 20);
            r48.Position = UDim2.new(1, -50, 0.5, -10);
            p = r42();
            if p then
                r = r44.ToggleOn;
            end;
            r48.BackgroundColor3 = p or r44.ToggleOff;
            r48.BorderSizePixel = 0;
            r48.ZIndex = 2;
            r48.Parent = r45;
            r39(r48, 10);
            r49 = Instance.new("Frame");
            r49.Size = UDim2.new(0, 14, 0, 14);
            v3 = r49;
            Z = "Position";
            r = v5;
            U = r42();
            v8 = U and r46;
            v5 = v5;
            if U then
                K[v7].Position = U and K[E];
                v5 = v5;
                r49.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                r49.BorderSizePixel = 0;
                r49.ZIndex = 3;
                r49.Parent = r48;
                r39(r49, 7);
                Z = Instance.new("TextButton");
                Z.Size = UDim2.new(1, 0, 1, 0);
                Z.BackgroundTransparency = 1;
                Z.Text = "";
                Z.ZIndex = 10;
                Z.Parent = r45;
                r50 = TweenInfo.new(.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                v3 = Z.MouseButton1Click;
                v3:Connect(function(...)
                    local P = {
                        14,
                        15,
                        67,
                        20,
                        33,
                        34,
                        35,
                        16,
                        53,
                        18,
                        19
                    };
                    r16(not r2());
                    v5 = r3;
                    v1 = r2();
                    if v1 then
                        v6 = r44.ToggleOn;
                    end;
                    v5 = v5;
                    v5 = v5;
                    v3 = v5:Create(r39, r41, {
                        ["BackgroundColor3"] = v1 or r44.ToggleOff
                    });
                    v3:Play();
                    v5 = r3;
                    if v1 then
                        v6 = r46;
                    end;
                    v5 = v5;
                    v5 = v5;
                    v3 = v5:Create(r49, r41, {
                        ["Position"] = v1 or r47
                    });
                    v3:Play();
                    return; 
                end);
                v3 = Z.MouseEnter;
                v3:Connect(function(...)
                    local P = {
                        67,
                        17,
                        34,
                        35,
                        16
                    };
                    v5 = r16;
                    v3 = v5:Create(r2, TweenInfo.new(.1), {
                        ["BackgroundColor3"] = r41.PanelHover
                    });
                    v3:Play();
                    return; 
                end);
                v3 = Z.MouseLeave;
                v3:Connect(function(...)
                    local P = {
                        67,
                        17,
                        34,
                        35,
                        16
                    };
                    v5 = r16;
                    v3 = v5:Create(r2, TweenInfo.new(.1), {
                        ["BackgroundColor3"] = r41.Panel
                    });
                    v3:Play();
                    return; 
                end);
                return;
            else
                v8 = r47;
            end; 
        end;
        r38._Slider = function(arg1_19, arg2_19, arg3_19, arg4_19, arg5_19, arg6_19, arg7_19, arg8_19, arg9_19, ...)
            local P = {
                70,
                34,
                35,
                90,
                92,
                66,
                67
            };
            v1 = arg1_19;
            r51 = arg4_19;
            r52 = arg5_19;
            v2 = arg7_19;
            r53 = arg6_19;
            x = arg3_19;
            r54 = arg8_19;
            v5 = r16.UI;
            r55 = v5;
            r53 = r53 or 1;
            r56 = Instance.new("Frame");
            v8 = arg3_19;
            r56.Name = v8;
            r56.Size = UDim2.new(1, 0, 0, 52);
            r56.BackgroundColor3 = r55.Panel;
            r56.BorderSizePixel = 0;
            r = v5;
            r56.LayoutOrder = arg9_19 or 0;
            v8 = arg2_19;
            r56.Parent = v8;
            r39(r56, 6);
            r41(r56, {
                ["text"] = x,
                ["sz"] = UDim2.new(.62, 0, 0, 20),
                ["pos"] = UDim2.new(0, 12, 0, 8),
                ["color"] = r55.TextPrimary,
                ["size"] = 12,
                ["z"] = 2
            });
            r57 = Instance.new("TextLabel");
            r57.Size = UDim2.new(.38, -12, 0, 20);
            r57.Position = UDim2.new(.62, 0, 0, 8);
            r57.BackgroundTransparency = 1;
            r57.Text = tostring(v2());
            r57.TextColor3 = r55.Accent;
            r57.Font = Enum.Font.GothamBold;
            r57.TextSize = 12;
            r57.TextXAlignment = Enum.TextXAlignment.Right;
            r57.ZIndex = 2;
            r57.Parent = r56;
            r58 = Instance.new("Frame");
            r58.Size = UDim2.new(1, -24, 0, 5);
            r58.Position = UDim2.new(0, 12, 0, 36);
            r58.BackgroundColor3 = r55.SliderTrack;
            r58.BorderSizePixel = 0;
            r58.ZIndex = 2;
            r58.Parent = r56;
            r39(r58, 3);
            r = math.clamp((v2() - r51) / (r52 - r51), 0, 1);
            r59 = Instance.new("Frame");
            r59.Size = UDim2.new(r, 0, 1, 0);
            r59.BackgroundColor3 = r55.SliderFill;
            r59.BorderSizePixel = 0;
            r59.ZIndex = 3;
            r59.Parent = r58;
            r39(r59, 3);
            r60 = Instance.new("Frame");
            r60.Size = UDim2.new(0, 13, 0, 13);
            r60.AnchorPoint = Vector2.new(0.5, 0.5);
            r60.Position = UDim2.new(r, 0, 0.5, 0);
            r60.BackgroundColor3 = r55.SliderKnob;
            r60.BorderSizePixel = 0;
            r60.ZIndex = 5;
            r60.Parent = r58;
            r39(r60, 7);
            p = Instance.new("TextButton");
            p.Size = UDim2.new(1, 0, 0, 28);
            p.Position = UDim2.new(0, 0, 0.5, -14);
            p.BackgroundTransparency = 1;
            p.Text = "";
            p.ZIndex = 6;
            p.Parent = r58;
            r61 = false;
            local function r62(arg1_20, ...)
                local P = {
                    8,
                    34,
                    35,
                    2,
                    1,
                    3,
                    4,
                    7,
                    9,
                    10
                };
                L = r16.AbsoluteSize.X;
                if L <= 0 then
                    return;
                end;
                B = math.clamp(math.floor((r39 + math.clamp((arg1_20 - r16.AbsolutePosition.X) / L, 0, 1) * (r41 - r39)) / r12 + 0.5) * r12, r39, r41);
                r13(B);
                r57.Text = tostring(B);
                o = (B - r39) / (r41 - r39);
                r59.Size = UDim2.new(o, 0, 1, 0);
                r60.Position = UDim2.new(o, 0, 0.5, 0);
                return; 
            end;
            J = p.InputBegan;
            J:Connect(function(arg1_21, ...)
                local P = {
                    34,
                    35,
                    11,
                    12
                };
                v1 = arg1_21;
                if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                    r3 = true;
                    r39(v1.Position.X);
                end;
                return; 
            end);
            J = p.InputEnded;
            J:Connect(function(arg1_22, ...)
                local P = {
                    34,
                    35,
                    11
                };
                v1 = arg1_22;
                if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                    r3 = false;
                end;
                return; 
            end);
            J = r12.InputChanged;
            J:Connect(function(arg1_23, ...)
                local P = {
                    11,
                    34,
                    35,
                    12
                };
                v1 = arg1_23;
                L = r16;
                if L then
                    v3 = v1.UserInputType == Enum.UserInputType.MouseMovement or v1.UserInputType == Enum.UserInputType.Touch;
                    v5 = r16.UI;
                end;
                if L then
                    r39(v1.Position.X);
                end;
                return; 
            end);
            J = r56.MouseEnter;
            J:Connect(function(...)
                local P = {
                    67,
                    6,
                    34,
                    35,
                    5
                };
                v5 = r16;
                v3 = v5:Create(r2, TweenInfo.new(.1), {
                    ["BackgroundColor3"] = r41.PanelHover
                });
                v3:Play();
                return; 
            end);
            J = r56.MouseLeave;
            J:Connect(function(...)
                local P = {
                    67,
                    6,
                    34,
                    35,
                    5
                };
                v5 = r16;
                v3 = v5:Create(r2, TweenInfo.new(.1), {
                    ["BackgroundColor3"] = r41.Panel
                });
                v3:Play();
                return; 
            end);
            return; 
        end;
        r38._Keybind = function(arg1_24, arg2_24, arg3_24, arg4_24, arg5_24, arg6_24, ...)
            local P = {
                70,
                34,
                35,
                90,
                92,
                67,
                66
            };
            v1 = arg1_24;
            x = arg3_24;
            r63 = arg4_24;
            r64 = arg5_24;
            r65 = r16.UI;
            r66 = Instance.new("Frame");
            Z = arg3_24;
            r66.Name = Z;
            r66.Size = UDim2.new(1, 0, 0, 34);
            r66.BackgroundColor3 = r65.Panel;
            r66.BorderSizePixel = 0;
            v5 = r66;
            E = v5;
            v5.LayoutOrder = arg6_24 or 0;
            E = arg2_24;
            r66.Parent = E;
            r39(r66, 6);
            r41(r66, {
                ["text"] = x,
                ["sz"] = UDim2.new(.55, 0, 1, 0),
                ["pos"] = UDim2.new(0, 12, 0, 0),
                ["color"] = r65.TextPrimary,
                ["size"] = 12,
                ["z"] = 2
            });
            local function r67(arg1_25, ...)
                local P = {
                    34,
                    35
                };
                v1 = arg1_25;
                if not v1 then
                    return "None";
                end;
                if v1 == Enum.UserInputType.MouseButton2 then
                    return "RMB";
                end;
                if v1 == Enum.UserInputType.MouseButton1 then
                    return "LMB";
                end;
                if typeof(v1) == "EnumItem" then
                    return v1.Name;
                end;
                return tostring(v1); 
            end;
            r68 = Instance.new("Frame");
            r68.Size = UDim2.new(0, 72, 0, 22);
            r68.Position = UDim2.new(1, -82, 0.5, -11);
            r68.BackgroundColor3 = r65.AccentDim;
            r68.BorderSizePixel = 0;
            r68.ZIndex = 2;
            r68.Parent = r66;
            r39(r68, 5);
            r69 = r41(r68, {
                ["text"] = r67(r63()),
                ["color"] = Color3.fromRGB(200, 220, 255),
                ["font"] = Enum.Font.GothamBold,
                ["size"] = 11,
                ["z"] = 3,
                ["align"] = Enum.TextXAlignment.Center
            });
            E = Instance.new("TextButton");
            E.Size = UDim2.new(1, 0, 1, 0);
            E.BackgroundTransparency = 1;
            E.Text = "";
            E.ZIndex = 10;
            E.Parent = r68;
            r70 = false;
            local function r72(...)
                local P = {
                    28,
                    29,
                    27,
                    34,
                    35,
                    25,
                    22,
                    67,
                    26,
                    23
                };
                if r16 then
                    v5 = r16;
                    v5:Disconnect();
                end;
                r2 = false;
                r3.Text = r13(r12());
                v1 = r13;
                L = v1:Create(r68, TweenInfo.new(.1), {
                    ["BackgroundColor3"] = r65.AccentDim
                });
                L:Play();
                return; 
            end;
            v3 = E.MouseButton1Click;
            v3:Connect(function(...)
                local P = {
                    29,
                    30,
                    27,
                    34,
                    35,
                    67,
                    26,
                    23,
                    66,
                    21,
                    25,
                    28
                };
                if r16 then
                    r2();
                    return;
                end;
                r16 = true;
                r3.Text = "[ ? ]";
                v3 = r13;
                v1 = v3:Create(r12, TweenInfo.new(.1), {
                    ["BackgroundColor3"] = r65.Accent
                });
                v1:Play();
                task.wait();
                v3 = r12.InputBegan;
                r71 = v3:Connect(function(arg1_26, arg2_26, ...)
                    local P = {
                        90,
                        92,
                        34,
                        21,
                        35,
                        25,
                        67,
                        66,
                        23,
                        70,
                        28
                    };
                    v1 = arg1_26;
                    if arg2_26 then
                        return;
                    end;
                    if v1.UserInputType == Enum.UserInputType.Keyboard then
                        if v1.KeyCode == Enum.KeyCode.Escape then
                            r2();
                            return;
                        end;
                        x = v1.KeyCode;
                    else
                        if arg1_26.UserInputType == Enum.UserInputType.MouseButton2 then
                            x = Enum.UserInputType.MouseButton2;
                        end;
                        if nil then
                            r39(nil);
                            r41.Text = r13(nil);
                            B = r12;
                            o = B:Create(r65, TweenInfo.new(.1), {
                                ["BackgroundColor3"] = r12.AccentDim
                            });
                            o:Play();
                            r64 = false;
                            o = r67;
                            o:Disconnect();
                        end;
                        return;
                    end; 
                end);
                task.delay(6, function(...)
                    local P = {
                        70,
                        34
                    };
                    if r16 then
                        r2();
                    end;
                    return; 
                end);
                return; 
            end);
            v3 = r68.MouseEnter;
            v3:Connect(function(...)
                local P = {
                    29,
                    67,
                    26,
                    34,
                    35,
                    23
                };
                v3 = r16;
                if not v3 then
                    v5 = r2;
                    v3 = v5:Create(r3, TweenInfo.new(.1), {
                        ["BackgroundColor3"] = r13.Accent
                    });
                    v3:Play();
                end;
                return; 
            end);
            v3 = r68.MouseLeave;
            v3:Connect(function(...)
                local P = {
                    29,
                    67,
                    26,
                    34,
                    35,
                    23
                };
                v3 = r16;
                if not v3 then
                    v5 = r2;
                    v3 = v5:Create(r3, TweenInfo.new(.1), {
                        ["BackgroundColor3"] = r13.AccentDim
                    });
                    v3:Play();
                end;
                return; 
            end);
            v3 = r66.MouseEnter;
            v3:Connect(function(...)
                local P = {
                    67,
                    24,
                    34,
                    35,
                    23
                };
                v5 = r16;
                v3 = v5:Create(r2, TweenInfo.new(.1), {
                    ["BackgroundColor3"] = r41.PanelHover
                });
                v3:Play();
                return; 
            end);
            v3 = r66.MouseLeave;
            v3:Connect(function(...)
                local P = {
                    67,
                    24,
                    34,
                    35,
                    23
                };
                v5 = r16;
                v3 = v5:Create(r2, TweenInfo.new(.1), {
                    ["BackgroundColor3"] = r41.Panel
                });
                v3:Play();
                return; 
            end);
            return; 
        end;
        r38._Hdr = function(arg1_27, arg2_27, arg3_27, arg4_27, ...)
            local P = {
                70,
                34,
                35,
                92
            };
            v1 = arg1_27;
            x = arg3_27;
            o = r16.UI;
            v4 = Instance.new("Frame");
            v4.Size = UDim2.new(1, 0, 0, 24);
            v4.BackgroundTransparency = 1;
            v5 = "LayoutOrder";
            v2 = v5;
            v4[v5] = arg4_27 or 0;
            v2 = arg2_27;
            v4.Parent = v2;
            r41(v4, {
                ["text"] = x:upper(),
                ["color"] = o.Accent,
                ["font"] = Enum.Font.GothamBold,
                ["size"] = 10,
                ["z"] = 2
            });
            v2 = Instance.new("Frame");
            v2.Size = UDim2.new(1, 0, 0, 1);
            v2.Position = UDim2.new(0, 0, 1, -1);
            v2.BackgroundColor3 = o.AccentDim;
            v2.BorderSizePixel = 0;
            v2.Parent = v4;
            return; 
        end;
        r38._Radio = function(arg1_28, arg2_28, arg3_28, arg4_28, arg5_28, arg6_28, arg7_28, ...)
            v2 = arg7_28;
            v1 = arg1_28;
            L = arg2_28;
            r73 = arg5_28;
            r74 = arg6_28;
            v1:_Hdr(L, arg3_28, v2);
            v6 = 69[2];
            E = 69[1];
            for Z, O in ipairs(arg4_28) do
                r75 = O;
                v1:_Toggle(L, r75, function(...)
                    local P = {
                        95,
                        47
                    };
                    return r73() == r75; 
                end, function(arg1_29, ...)
                    local P = {
                        96,
                        47,
                        95
                    };
                    if arg1_29 then
                        r74(r75);
                    else
                        if r73() == r75 then
                            K[v4](nil);
                        end;
                        return;
                    end; 
                end, v2 + Z); 
            end;
            return; 
        end;
        r38._BuildVisuals = function(arg1_30, arg2_30, ...)
            local P = {
                34,
                35,
                70
            };
            v1 = arg1_30;
            L = arg2_30;
            v1:_Hdr(L, "Player ESP", 10);
            v1:_Toggle(L, "ESP Enabled", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.Enabled; 
            end, function(arg1_31, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.Enabled = arg1_31;
                return; 
            end, 20);
            v1:_Toggle(L, "Box", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.Box; 
            end, function(arg1_32, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.Box = arg1_32;
                return; 
            end, 30);
            v1:_Toggle(L, "Box Outline", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.BoxOutline; 
            end, function(arg1_33, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.BoxOutline = arg1_33;
                return; 
            end, 40);
            v1:_Toggle(L, "Health Bar", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.HealthBar; 
            end, function(arg1_34, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.HealthBar = arg1_34;
                return; 
            end, 50);
            v1:_Toggle(L, "Name", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.Name; 
            end, function(arg1_35, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.Name = arg1_35;
                return; 
            end, 60);
            v1:_Toggle(L, "Distance", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.Distance; 
            end, function(arg1_36, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.Distance = arg1_36;
                return; 
            end, 70);
            v1:_Toggle(L, "Tracer", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.Tracer; 
            end, function(arg1_37, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.Tracer = arg1_37;
                return; 
            end, 80);
            v1:_Toggle(L, "Tracer Outline", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.TracerOutline; 
            end, function(arg1_38, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.TracerOutline = arg1_38;
                return; 
            end, 90);
            v1:_Hdr(L, "Drone ESP", 100);
            v1:_Toggle(L, "Drone Enabled", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.Drone.Enabled; 
            end, function(arg1_39, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.Drone.Enabled = arg1_39;
                return; 
            end, 110);
            v1:_Toggle(L, "Drone Tag", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.Drone.Tag; 
            end, function(arg1_40, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.Drone.Tag = arg1_40;
                return; 
            end, 120);
            v1:_Toggle(L, "Drone Distance", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.Drone.Distance; 
            end, function(arg1_41, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.Drone.Distance = arg1_41;
                return; 
            end, 130);
            return; 
        end;
        r38._BuildSilentAim = function(arg1_42, arg2_42, ...)
            local P = {
                34,
                35,
                70
            };
            L = arg2_42;
            v1 = arg1_42;
            v1:_Hdr(L, "Silent Aim", 10);
            v1:_Toggle(L, "Enabled", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.SilentAim.Enabled; 
            end, function(arg1_43, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.SilentAim.Enabled = arg1_43;
                return; 
            end, 20);
            v1:_Toggle(L, "Show FOV Circle", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.SilentAim.ShowFOVCircle; 
            end, function(arg1_44, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.SilentAim.ShowFOVCircle = arg1_44;
                return; 
            end, 30);
            v1:_Hdr(L, "Activation Key", 40);
            v1:_Keybind(L, "Hold to use", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.SilentAim.HoldKey; 
            end, function(arg1_45, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.SilentAim.HoldKey = arg1_45;
                return; 
            end, 50);
            v1:_Hdr(L, "Settings", 60);
            v1:_Slider(L, "FOV Radius", 20, 500, 5, function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.SilentAim.FOVRadius; 
            end, function(arg1_46, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.SilentAim.FOVRadius = arg1_46;
                return; 
            end, 70);
            v1:_Slider(L, "Smoothing", 1, 50, 1, function(...)
                local P = {
                    34,
                    35,
                    70
                };
                return math.floor(r16.SilentAim.Smoothing * 100 + 0.5); 
            end, function(arg1_47, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.SilentAim.Smoothing = arg1_47 / 100;
                return; 
            end, 80);
            v1:_Radio(L, "Hit Part", {
                "Head",
                "HumanoidRootPart",
                "UpperTorso"
            }, function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.SilentAim.HitPart; 
            end, function(arg1_48, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.SilentAim.HitPart = arg1_48;
                return; 
            end, 90);
            v1:_Radio(L, "Target Priority", {
                "Crosshair",
                "Distance"
            }, function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.SilentAim.TargetPriority; 
            end, function(arg1_49, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.SilentAim.TargetPriority = arg1_49;
                return; 
            end, 100);
            return; 
        end;
        r38._BuildMisc = function(arg1_50, arg2_50, ...)
            local P = {
                34,
                35,
                70
            };
            v1 = arg1_50;
            L = arg2_50;
            v1:_Radio(L, "Tracer Origin", {
                "Bottom",
                "Center",
                "Top"
            }, function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.ESP.TracerOrigin; 
            end, function(arg1_51, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.ESP.TracerOrigin = arg1_51;
                return; 
            end, 10);
            v1:_Hdr(L, "Interface", 50);
            v1:_Keybind(L, "Open / Close UI", function(...)
                local P = {
                    70,
                    34,
                    35
                };
                return r2.UI.OpenKey; 
            end, function(arg1_52, ...)
                local P = {
                    70,
                    34,
                    35
                };
                r2.UI.OpenKey = arg1_52;
                return; 
            end, 60);
            return; 
        end;
        r38._Build = function(arg1_53, ...)
            local P = {
                34,
                35,
                70,
                68,
                90,
                91,
                92
            };
            r76 = arg1_53;
            v5 = r76._gui;
            if v5 then
                v5 = r76._gui;
                v5:Destroy();
            end;
            r77 = r16.UI;
            x = Instance.new("ScreenGui");
            x.Name = "DIEGO_UI";
            x.ResetOnSpawn = false;
            x.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            x.DisplayOrder = 200;
            x.IgnoreGuiInset = true;
            v3 = r14;
            x.Parent = v3:WaitForChild("PlayerGui");
            r76._gui = x;
            r78 = Instance.new("Frame");
            r78.Name = "Window";
            r78.Size = UDim2.new(0, 360, 0, 500);
            r78.Position = UDim2.new(0.5, -180, 0.5, -250);
            r78.BackgroundColor3 = r77.BG;
            r78.BorderSizePixel = 0;
            r78.ClipsDescendants = true;
            r78.Active = true;
            r78.Parent = x;
            r39(r78, 8);
            r40(r78, r77.Border, 1);
            r76._window = r78;
            o = Instance.new("Frame");
            o.Size = UDim2.new(1, 0, 0, 50);
            o.BackgroundColor3 = r77.Panel;
            o.BorderSizePixel = 0;
            o.ZIndex = 2;
            o.Parent = r78;
            v4 = Instance.new("Frame");
            v4.Size = UDim2.new(0, 3, 1, -16);
            v4.Position = UDim2.new(0, 0, 0, 8);
            v4.BackgroundColor3 = r77.Accent;
            v4.BorderSizePixel = 0;
            v4.ZIndex = 3;
            v4.Parent = o;
            r39(v4, 2);
            r41(o, {
                ["text"] = "DIEGO",
                ["font"] = Enum.Font.GothamBlack,
                ["size"] = 20,
                ["color"] = r77.TextPrimary,
                ["sz"] = UDim2.new(0, 90, 0, 28),
                ["pos"] = UDim2.new(0, 14, 0, 8),
                ["z"] = 3
            });
            r41(o, {
                ["text"] = ".",
                ["font"] = Enum.Font.GothamBlack,
                ["size"] = 28,
                ["color"] = r77.Accent,
                ["sz"] = UDim2.new(0, 14, 0, 28),
                ["pos"] = UDim2.new(0, 73, 0, 6),
                ["z"] = 4
            });
            r41(o, {
                ["text"] = "Operation One  v1.0",
                ["font"] = Enum.Font.Gotham,
                ["size"] = 10,
                ["color"] = r77.TextSecondary,
                ["sz"] = UDim2.new(0, 180, 0, 14),
                ["pos"] = UDim2.new(0, 14, 0, 32),
                ["z"] = 3
            });
            v2 = Instance.new("TextButton");
            v2.Size = UDim2.new(0, 26, 0, 26);
            v2.Position = UDim2.new(1, -36, 0.5, -13);
            v2.BackgroundColor3 = Color3.fromRGB(55, 28, 28);
            v2.Text = "X";
            v2.TextColor3 = Color3.fromRGB(210, 85, 85);
            v2.Font = Enum.Font.GothamBold;
            v2.TextSize = 11;
            v2.BorderSizePixel = 0;
            v2.ZIndex = 5;
            v2.Parent = o;
            r39(v2, 5);
            v5 = v2.MouseButton1Click;
            v5:Connect(function(...)
                v5 = r76;
                v5:Toggle();
                return; 
            end);
            r79 = Instance.new("TextButton");
            r79.Size = UDim2.new(0, 26, 0, 26);
            r79.Position = UDim2.new(1, -68, 0.5, -13);
            r79.BackgroundColor3 = Color3.fromRGB(30, 50, 80);
            r79.Text = "\xe2\x80\x94";
            r79.TextColor3 = Color3.fromRGB(100, 160, 255);
            r79.Font = Enum.Font.GothamBold;
            r79.TextSize = 13;
            r79.BorderSizePixel = 0;
            r79.ZIndex = 5;
            r79.Parent = o;
            r39(r79, 5);
            r80 = false;
            v5 = r79.MouseButton1Click;
            v5:Connect(function(...)
                local P = {
                    51,
                    49,
                    34,
                    35,
                    50
                };
                r2 = not r2;
                if r2 then
                    v3 = r3;
                    v3:TweenSize(UDim2.new(0, 360, 0, 50), Enum.EasingDirection.In, Enum.EasingStyle.Quart, .18, true);
                    r39.Text = "+";
                else
                    v3 = r3;
                    v3:TweenSize(UDim2.new(0, 360, 0, 500), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .18, true);
                    r39.Text = "\xe2\x80\x94";
                end;
                return; 
            end);
            v5 = r76;
            v5:_MakeDraggable(o, r78);
            E = Instance.new("Frame");
            E.Size = UDim2.new(1, 0, 0, 38);
            E.Position = UDim2.new(0, 0, 0, 50);
            E.BackgroundColor3 = r77.Panel;
            E.BorderSizePixel = 0;
            E.ZIndex = 2;
            E.Parent = r78;
            a = Instance.new("Frame");
            a.Size = UDim2.new(1, 0, 0, 1);
            a.Position = UDim2.new(0, 0, 1, -1);
            a.BackgroundColor3 = r77.Border;
            a.BorderSizePixel = 0;
            a.ZIndex = 3;
            a.Parent = E;
            O = Instance.new("Frame");
            O.Size = UDim2.new(1, 0, 1, -88);
            O.Position = UDim2.new(0, 0, 0, 88);
            O.BackgroundTransparency = 1;
            O.BorderSizePixel = 0;
            O.Parent = r78;
            r76._tabs = {};
            U = r3("\x86\xcc\xe8\xc8%>2\x1c", 19803073766405);
            r76[r2[U]] = {};
            v5 = ipairs;
            r = U[3];
            U = U[1];
            for r, p in U, v5({
                {
                    ["name"] = "Visuals",
                    ["fn"] = function(arg1_54, ...)
                        v5 = r76;
                        v5:_BuildVisuals(arg1_54);
                        return; 
                    end
                },
                {
                    ["name"] = "Silent Aim",
                    ["fn"] = function(arg1_55, ...)
                        v5 = r76;
                        v5:_BuildSilentAim(arg1_55);
                        return; 
                    end
                },
                {
                    ["name"] = "Misc",
                    ["fn"] = function(arg1_56, ...)
                        v5 = r76;
                        v5:_BuildMisc(arg1_56);
                        return; 
                    end
                }
            }) do
                r81 = Instance.new("TextButton");
                r81.Size = UDim2.new(.33333333333333, 0, 1, 0);
                r81.BackgroundTransparency = 1;
                r81.Text = p.name;
                r81.TextColor3 = r77.TextSecondary;
                r81.Font = Enum.Font.GothamMedium;
                r81.TextSize = 12;
                r81.BorderSizePixel = 0;
                r81.ZIndex = 4;
                r81.Position = UDim2.new((r - 1) / 3, 0, 0, 0);
                Q = Instance.new("Frame");
                r81.Parent = Q;
                v9 = Instance.new("Frame");
                v9.Size = UDim2.new(0.5, 0, 0, 2);
                v9.Position = UDim2.new(0.25, 0, 1, -2);
                v9.BackgroundColor3 = r77.Accent;
                v9.BorderSizePixel = 0;
                v9.Visible = false;
                v9.ZIndex = 5;
                v9.Parent = r81;
                Q = Instance.new("ScrollingFrame");
                Q.Name = p.name;
                Q.Size = UDim2.new(1, 0, 1, 0);
                Q.BackgroundTransparency = 1;
                Q.BorderSizePixel = 0;
                Q.ScrollBarThickness = 4;
                Q.ScrollBarImageColor3 = r77.AccentDim;
                Q.CanvasSize = UDim2.new(0, 0, 0, 0);
                Q.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                Q.Visible = false;
                u = Instance.new("Frame");
                Q.Parent = u;
                u = Instance.new("UIPadding");
                u.PaddingLeft = UDim.new(0, 10);
                u.PaddingRight = UDim.new(0, 10);
                u.PaddingTop = UDim.new(0, 10);
                u.PaddingBottom = UDim.new(0, 14);
                u.Parent = Q;
                R = Instance.new("UIListLayout");
                R.FillDirection = Enum.FillDirection.Vertical;
                R.Padding = UDim.new(0, 6);
                R.SortOrder = Enum.SortOrder.LayoutOrder;
                R.Parent = Q;
                p.fn(Q);
                r82 = p.name;
                r76._tabs[r82] = {
                    ["page"] = Q,
                    ["ind"] = v9
                };
                r76._tabBtns[r82] = r81;
                v5 = r81.MouseButton1Click;
                v5:Connect(function(...)
                    local P = {
                        97,
                        59
                    };
                    v5 = r2;
                    v5:_SelectTab(r3);
                    return; 
                end);
                v5 = r81.MouseEnter;
                v5:Connect(function(...)
                    local P = {
                        97,
                        34,
                        35,
                        59,
                        58,
                        48
                    };
                    if r2._activeTab ~= r14 then
                        r39.TextColor3 = r40.TextPrimary;
                    end;
                    return; 
                end);
                v5 = r81.MouseLeave;
                v5:Connect(function(...)
                    local P = {
                        97,
                        34,
                        35,
                        59,
                        58,
                        48
                    };
                    if r2._activeTab ~= r14 then
                        r39.TextColor3 = r40.TextSecondary;
                    end;
                    return; 
                end); 
            end;
            v5 = r76;
            v5:_SelectTab("Visuals");
            r78.Visible = false;
            r76._visible = false;
            return; 
        end;
        r38._SelectTab = function(arg1_57, arg2_57, ...)
            local P = {
                70,
                34,
                35
            };
            L = arg2_57;
            v1 = arg1_57;
            x = r16.UI;
            v2 = "_tabs";
            v4 = v1[v2];
            o = v2[3];
            B = v2[2];
            for o, v6 in pairs(v3) do
                v6.page.Visible = false;
                v6.ind.Visible = false;
                v1._tabBtns[o].TextColor3 = x.TextSecondary; 
            end;
            if v1._tabs[L] then
                v1._tabs[L].page.Visible = true;
                v1._tabs[L].ind.Visible = true;
                v1._tabBtns[L].TextColor3 = x.TextPrimary;
            end;
            v1._activeTab = L;
            return; 
        end;
        r38._MakeDraggable = function(arg1_58, arg2_58, arg3_58, ...)
            local P = {
                34,
                35,
                66
            };
            v1 = arg1_58;
            L = arg2_58;
            r83 = arg3_58;
            v5 = L.InputBegan;
            v5:Connect(function(arg1_59, ...)
                local P = {
                    34,
                    35,
                    55,
                    57,
                    54,
                    56
                };
                v1 = arg1_59;
                if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                    r12 = true;
                    r85 = v1.Position;
                    r86 = r83.Position;
                end;
                return; 
            end);
            v5 = L.InputEnded;
            v5:Connect(function(arg1_60, ...)
                local P = {
                    34,
                    35,
                    55
                };
                v1 = arg1_60;
                if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                    r12 = false;
                end;
                return; 
            end);
            v5 = r12.InputChanged;
            v5:Connect(function(arg1_61, ...)
                local P = {
                    55,
                    34,
                    35,
                    57,
                    54,
                    56
                };
                v1 = arg1_61;
                L = r2;
                if L then
                    v3 = v1.UserInputType == Enum.UserInputType.MouseMovement or v1.UserInputType == Enum.UserInputType.Touch;
                    v5 = v3[B];
                end;
                if L then
                    L = v1.Position - r85;
                    r83.Position = UDim2.new(r86.X.Scale, r86.X.Offset + L.X, r86.Y.Scale, r86.Y.Offset + L.Y);
                end;
                return; 
            end);
            return; 
        end;
        r38.Toggle = function(arg1_62, ...)
            local P = {
                34,
                35
            };
            v1 = arg1_62;
            v1._visible = not v1._visible;
            r87 = v1._window;
            v5 = v1._visible;
            if v5 then
                r87.Visible = true;
                v5 = r87;
                v5:TweenSize(UDim2.new(0, 360, 0, 500), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .18, true);
            else
                v5 = r87;
                v5:TweenSize(UDim2.new(0, 360, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quart, .14, true, function(...)
                    local P = {
                        60,
                        34,
                        35
                    };
                    r2.Visible = false;
                    return; 
                end);
            end;
            return; 
        end;
        r88 = r38.new();
        Nh = r88;
        Nh:Toggle();
        local function r90(arg1_63, ...)
            local P = {
                34,
                35,
                83,
                82,
                81
            };
            r89 = arg1_63;
            v5 = r89.CharacterAdded;
            v5:Connect(function(arg1_64, ...)
                local P = {
                    83,
                    32,
                    34,
                    35,
                    82,
                    81
                };
                v1 = arg1_64;
                r2(r3);
                task.wait(.1);
                r27(r3);
                v5 = v1:WaitForChild("Humanoid", 5);
                if v5 then
                    v5 = v5.Died;
                    v5:Connect(function(...)
                        local P = {
                            81,
                            35
                        };
                        if r2[r3] then
                            v5 = r2[r3];
                            v5:destroy();
                            r2[r3] = nil;
                        end;
                        return; 
                    end);
                end;
                return; 
            end);
            if r89.Character then
                v5 = r89.Character;
                L = v5:FindFirstChildOfClass("Humanoid");
                if L then
                    v5 = L.Died;
                    v5:Connect(function(...)
                        local P = {
                            R,
                            32
                        };
                        if r2[r3] then
                            v5 = r2[r3];
                            v5:destroy();
                            r2[r3] = nil;
                        end;
                        return; 
                    end);
                end;
            end;
            return; 
        end;
        Bh = r11;
        Lh = Bh[1];
        nh = Bh[2];
        for xh, Bh in ipairs(Bh:GetPlayers()) do
            Mh = xh;
            if Bh ~= r14 then
                r29(Bh);
                r90(Bh);
            end; 
        end;
        Mh = r11.PlayerAdded;
        Mh:Connect(function(arg1_65, ...)
            local P = {
                68,
                82,
                94
            };
            v1 = arg1_65;
            if v1 ~= r14 then
                r29(v1);
                r90(v1);
            end;
            return; 
        end);
        Mh = r11.PlayerRemoving;
        Mh:Connect(function(arg1_66, ...)
            r30(arg1_66);
            return; 
        end);
        Mh = r12.InputBegan;
        Mh:Connect(function(arg1_67, arg2_67, ...)
            local P = {
                34,
                35,
                70,
                93
            };
            if arg2_67 then
                return;
            end;
            v5 = arg1_67.KeyCode == r16.UI.OpenKey;
            if v5 then
                v5 = r88;
                v5:Toggle();
            end;
            return; 
        end);
        Mh = o:GetService("RunService").RenderStepped;
        Mh:Connect(function(...)
            local P = {
                84,
                88
            };
            r31();
            r37();
            return; 
        end);
        _G.DIEGO = {
            ["Config"] = r16,
            ["UI"] = r88,
            ["GetShotDirection"] = function(...)
                local P = {
                    87,
                    34,
                    35,
                    69
                };
                v5 = r36;
                v1 = v5();
                if v1 then
                    L = v1.LookVector;
                end;
                v5 = v5;
                if v1 then
                    return v1;
                else
                    v3 = r15.CFrame.LookVector;
                end; 
            end,
            ["Destroy"] = function(...)
                local P = {
                    81,
                    80,
                    85,
                    93,
                    34,
                    35
                };
                x = r27;
                L = 34[3];
                v1 = 34[2];
                for L, o in pairs(v3) do
                    o:destroy(); 
                end;
                L = o[2];
                v1 = o[1];
                for x, o in pairs(r28) do
                    B = x;
                    o:destroy(); 
                end;
                v5 = r34;
                v5:Remove();
                v5 = r88._gui;
                v5:Destroy();
                _G.DIEGO = nil;
                print("[DIEGO] Unloaded.");
                return; 
            end
        };
        print(string.format("[DIEGO v1] Loaded | %s = toggle UI", r16.UI.OpenKey.Name));
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
