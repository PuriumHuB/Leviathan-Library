--[[
	╔══════════════════════════════════════════════════════════╗
	║           LEVIATHAN UI  —  Complete Example             ║
	║  Every single element, variant, and feature shown.     ║
	╚══════════════════════════════════════════════════════════╝

	Load:
		local WindUI = loadstring(game:HttpGet("YOUR_RAW_URL/dist/main.lua"))()
		loadstring(game:HttpGet("YOUR_RAW_URL/Example.lua"))()

	Or paste this whole file into your executor.
]]

local WindUI = loadstring(game:HttpGet("https://github.com/Leviafish/Leviathan-Library/releases/download/new/main.lua"))()

-- ───────────────────────────────────────────────────────────
--  Helpers
-- ───────────────────────────────────────────────────────────
local function notify(title, content, ntype, duration)
	WindUI:Notify({
		Title    = title,
		Content  = content,
		Type     = ntype or "Info",
		Duration = duration or 4,
	})
end

local lp  = game.Players.LocalPlayer
local char = function() return lp.Character end
local hum  = function()
	local c = char()
	return c and c:FindFirstChildOfClass("Humanoid")
end

-- ───────────────────────────────────────────────────────────
--  WINDOW
-- ───────────────────────────────────────────────────────────
local Window = WindUI:CreateWindow({
	Title       = "Leviathan UI",
	SubTitle    = "Complete Demo",
	TabWidth    = 160,
	Size        = UDim2.fromOffset(620, 500),
	Acrylic     = true,
	Theme       = "Leviathan",
	Transparent = true,
	Debug       = false,
	Folder      = "LeviathanDemo",
})

--  Topbar tags  (Window:Tag, NOT Tab:Tag)
Window:Tag({ Title = "v1.0",   Color = Color3.fromRGB(79,  128, 255) })
Window:Tag({ Title = "FREE",   Color = Color3.fromRGB(34,  197,  94) })
Window:Tag({ Title = "BETA",   Icon  = "flask-conical", Color = Color3.fromRGB(245, 158, 11) })

-- ═══════════════════════════════════════════════════════════
--  TAB 1 — BUTTONS
-- ═══════════════════════════════════════════════════════════
local T1 = Window:Tab({ Title = "Buttons", Icon = "mouse-pointer-click" })

T1:Paragraph({
	Title = "Button Variants",
	Desc  = "Every built-in style. Hover, press, and disabled states all work.",
})

-- Default (no Variant key = white style in WindUI)
T1:Button({
	Title    = "Default Button",
	Desc     = "Standard element button",
	Icon     = "zap",
	Callback = function()
		notify("Default", "Default button clicked.", "Info")
	end,
})

-- Variant: White
T1:Button({
	Title    = "White Button",
	Desc     = "Ghost / outlined style",
	Icon     = "feather",
	Variant  = "White",
	Callback = function()
		notify("White", "White button clicked.", "Info")
	end,
})

-- Variant: Danger  (red)
T1:Button({
	Title    = "Danger Button",
	Desc     = "For destructive actions",
	Icon     = "trash-2",
	Variant  = "Danger",
	Callback = function()
		notify("Danger!", "Destructive action triggered.", "Error")
	end,
})

-- Variant: Success  (green)
T1:Button({
	Title    = "Success Button",
	Desc     = "Confirms a completed action",
	Icon     = "check-circle",
	Variant  = "Success",
	Callback = function()
		notify("Done", "Action completed.", "Success")
	end,
})

-- Locked button
T1:Button({
	Title        = "Locked Button",
	Desc         = "Cannot be clicked",
	Locked       = true,
	LockedTitle  = "This feature is locked",
	Callback     = function() end,
})

-- Paragraph with inline buttons
T1:Paragraph({
	Title   = "Paragraph with Buttons",
	Desc    = "Paragraphs can embed action buttons inline below the text.",
	Buttons = {
		{ Title = "Accept", Icon = "check",  Callback = function() notify("Accepted", nil, "Success") end },
		{ Title = "Reject", Icon = "x",      Callback = function() notify("Rejected", nil, "Error")   end },
	},
})

-- Divider with label
T1:Divider({ Title = "Layout Primitives" })

-- Space
T1:Space({})

-- Divider no label
T1:Divider({})

-- Image element
T1:Image({
	Image       = "rbxassetid://142098770257",
	AspectRatio = "16:9",
	Title       = "Inline Image",
	Desc        = "Images support AspectRatio and a custom Radius.",
})

-- ═══════════════════════════════════════════════════════════
--  TAB 2 — TOGGLES & CHECKBOXES
-- ═══════════════════════════════════════════════════════════
local T2 = Window:Tab({ Title = "Toggles", Icon = "toggle-left" })

T2:Paragraph({
	Title = "Toggle Controls",
	Desc  = "Smooth pill switch. Drag left/right or tap to flip. Type = 'Checkbox' for box style.",
})

T2:Toggle({
	Title    = "Enable AutoFarm",
	Desc     = "Automatically farms resources every loop",
	Icon     = "cpu",
	Value    = false,
	Flag     = "AutoFarm",
	Callback = function(val)
		notify("AutoFarm " .. (val and "ON" or "OFF"), nil, val and "Success" or "Warning")
	end,
})

T2:Toggle({
	Title    = "God Mode",
	Desc     = "Makes the player invincible",
	Icon     = "shield",
	Value    = false,
	Flag     = "GodMode",
	Callback = function(val)
		notify("God Mode " .. (val and "ON" or "OFF"), nil, val and "Success" or "Warning")
	end,
})

T2:Toggle({
	Title    = "Infinite Jump",
	Desc     = "Press Space any time to jump",
	Icon     = "chevrons-up",
	Value    = false,
	Flag     = "InfJump",
	Callback = function(val)
		if val then
			_G.InfJumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
				if hum() then hum():ChangeState(Enum.HumanoidStateType.Jumping) end
			end)
		else
			if _G.InfJumpConn then _G.InfJumpConn:Disconnect() end
		end
	end,
})

-- NewElement toggle (rounded pill style, wider)
T2:Toggle({
	Title      = "New-Style Toggle",
	Desc       = "NewElement = true gives the wider pill look",
	Value      = true,
	NewElement = true,
	Callback   = function(val) print("NewElement toggle:", val) end,
})

-- Checkbox type
T2:Toggle({
	Title    = "Checkbox Style",
	Desc     = "Type = 'Checkbox' renders a box instead of a pill",
	Type     = "Checkbox",
	Value    = false,
	Flag     = "ChkBox",
	Callback = function(val) print("Checkbox:", val) end,
})

T2:Divider({ Title = "Locked Toggle" })

T2:Toggle({
	Title       = "Premium Feature",
	Desc        = "Requires VIP access",
	Locked      = true,
	LockedTitle = "Purchase VIP to unlock",
	Value       = false,
	Callback    = function() end,
})

-- ═══════════════════════════════════════════════════════════
--  TAB 3 — SLIDERS
--  NOTE: always use Value = { Min=, Max=, Default= }
-- ═══════════════════════════════════════════════════════════
local T3 = Window:Tab({ Title = "Sliders", Icon = "sliders-horizontal" })

T3:Paragraph({
	Title = "Slider Controls",
	Desc  = "Pass Value = { Min, Max, Default }. Add Step for decimals.",
})

T3:Slider({
	Title    = "Walk Speed",
	Desc     = "Adjusts LocalPlayer walk speed",
	Icon     = "footprints",
	Value    = { Min = 0, Max = 100, Default = 16 },
	Suffix   = " studs/s",
	Flag     = "WalkSpeed",
	Callback = function(val)
		if hum() then hum().WalkSpeed = val end
	end,
})

T3:Slider({
	Title    = "Jump Power",
	Desc     = "How high the character jumps",
	Value    = { Min = 0, Max = 300, Default = 50 },
	Suffix   = " power",
	Flag     = "JumpPower",
	Callback = function(val)
		if hum() then hum().JumpPower = val end
	end,
})

T3:Slider({
	Title    = "Camera FOV",
	Desc     = "Field of view in degrees",
	Value    = { Min = 30, Max = 120, Default = 70 },
	Suffix   = "°",
	Flag     = "FOV",
	Callback = function(val)
		workspace.CurrentCamera.FieldOfView = val
	end,
})

-- Float step
T3:Slider({
	Title    = "Transparency",
	Desc     = "Step = 0.05 for float output",
	Value    = { Min = 0, Max = 1, Default = 0 },
	Step     = 0.05,
	Suffix   = "",
	Callback = function(val)
		if char() then
			for _, p in ipairs(char():GetDescendants()) do
				if p:IsA("BasePart") then p.Transparency = val end
			end
		end
	end,
})

-- With Min/Max icons
T3:Slider({
	Title  = "Volume",
	Value  = { Min = 0, Max = 100, Default = 50 },
	Icons  = { From = "sfsymbols:speakerSlashFill", To = "sfsymbols:speakerWave3Fill" },
	Suffix = "%",
	Callback = function(val)
		-- game.SoundService.AmbientReverb = Enum.ReverbType.NoReverb (example)
		print("Volume:", val)
	end,
})

T3:Divider({ Title = "Progress Bar" })

local PBar = T3:ProgressBar({
	Title   = "Operation Progress",
	Desc    = "Click 'Run' below to animate",
	Value   = { Min = 0, Max = 100, Default = 0 },
	Suffix  = "%",
	Flag    = "ProgBar",
})

T3:Button({
	Title    = "Run Progress",
	Icon     = "play",
	Variant  = "Primary",
	Callback = function()
		task.spawn(function()
			for i = 0, 100, 2 do
				PBar:SetValue(i)
				task.wait(0.04)
			end
			notify("Complete!", "Progress bar finished.", "Success")
		end)
	end,
})

-- ═══════════════════════════════════════════════════════════
--  TAB 4 — INPUTS, DROPDOWNS, KEYBINDS
-- ═══════════════════════════════════════════════════════════
local T4 = Window:Tab({ Title = "Inputs", Icon = "keyboard" })

-- Input
T4:Input({
	Title       = "Target Player",
	Desc        = "Enter a username",
	Icon        = "user",
	Placeholder = "Username...",
	Value       = "",
	Flag        = "TargetName",
	Callback    = function(val)
		notify("Target set", val, "Info")
	end,
})

-- Textarea style
T4:Input({
	Title       = "Execute Script",
	Desc        = "Paste Lua here and press Enter",
	Placeholder = "print('Hello!')",
	Value       = "",
	ClearTextOnFocus = false,
	Callback    = function(val)
		local ok, err = pcall(loadstring(val))
		if not ok then notify("Script Error", err, "Error") end
	end,
})

T4:Divider({ Title = "Dropdowns" })

-- Single-select
T4:Dropdown({
	Title  = "Server Region",
	Desc   = "Pick the closest region",
	Icon   = "globe",
	Values = { "US East", "US West", "EU Central", "EU West", "Asia Pacific", "South America", "Oceania" },
	Value  = "US East",
	Flag   = "Region",
	Callback = function(val)
		notify("Region → " .. val, nil, "Info")
	end,
})

-- Multi-select
T4:Dropdown({
	Title  = "Active Cheats",
	Desc   = "Multi = true, select many",
	Values = { "Speed", "Fly", "No Clip", "Inf Jump", "God Mode", "ESP", "Aimbot" },
	Value  = {},
	Multi  = true,
	Flag   = "ActiveCheats",
	SearchBarEnabled = true,
	Callback = function(val)
		local list = {}
		for k, v in pairs(val) do if v then table.insert(list, k) end end
		print("Active:", table.concat(list, ", "))
	end,
})

-- AllowNone dropdown
T4:Dropdown({
	Title     = "Gamepass Perk",
	Values    = { "Double XP", "VIP Tag", "Extra Lives" },
	Value     = nil,
	AllowNone = true,
	Callback  = function(val)
		print("Perk:", val)
	end,
})

T4:Divider({ Title = "Keybinds" })

local menuOpen = true

T4:Keybind({
	Title    = "Toggle Menu",
	Desc     = "Press key to show/hide the window",
	Icon     = "layout",
	Value    = Enum.KeyCode.RightShift,
	Flag     = "MenuKey",
	Callback = function(key)
		notify("Menu bound to " .. tostring(key), nil, "Info")
	end,
})

T4:Keybind({
	Title    = "Teleport Here",
	Desc     = "Teleport character to mouse hit",
	Value    = Enum.KeyCode.T,
	Flag     = "TpKey",
	Callback = function(key)
		print("Teleport key:", key)
	end,
})

-- ═══════════════════════════════════════════════════════════
--  TAB 5 — SECTIONS (collapsible, Box, BoxBorder)
-- ═══════════════════════════════════════════════════════════
local T5 = Window:Tab({ Title = "Sections", Icon = "layers" })

T5:Paragraph({
	Title = "Collapsible Sections",
	Desc  = "Click a section header to expand/collapse. Box adds a background card. BoxBorder adds a glowing accent ring.",
})

--  Plain section (no Box) — header only, elements inside collapse
T5:Section({ Title = "Combat", Desc = "Auto combat options", Opened = true }, function(S)
	S:Toggle({ Title = "Auto Block",  Value = true,  Callback = function(v) print("AutoBlock:", v) end })
	S:Toggle({ Title = "Auto Parry",  Value = false, Callback = function(v) print("AutoParry:", v) end })
	S:Toggle({ Title = "Auto Dodge",  Value = false, Callback = function(v) print("AutoDodge:", v) end })
	S:Slider({ Title = "Attack Range", Value = { Min = 1, Max = 50, Default = 10 }, Suffix = " studs",
		Callback = function(v) print("Range:", v) end })
	S:Slider({ Title = "Attack Delay", Value = { Min = 0, Max = 1000, Default = 200 }, Suffix = " ms",
		Callback = function(v) print("Delay:", v) end })
	S:Dropdown({ Title = "Priority Target", Values = { "Nearest", "Lowest HP", "Highest HP", "Marked" },
		Value = "Nearest", Callback = function(v) print("Target:", v) end })
end)

--  Section with Desc but no Box
T5:Section({ Title = "Movement", Desc = "Speed, fly, noclip" }, function(S)
	S:Toggle({ Title = "Fly",           Value = false, Callback = function(v) print("Fly:", v) end })
	S:Toggle({ Title = "No Clip",       Value = false, Callback = function(v) print("NoClip:", v) end })
	S:Toggle({ Title = "Speed Hack",    Value = false, Callback = function(v) print("Speed:", v) end })
	S:Slider({ Title = "Fly Speed",     Value = { Min = 0, Max = 500, Default = 80 },  Suffix = " s/s", Callback = function(v) print("FlySpeed:", v) end })
	S:Slider({ Title = "Walk Speed",    Value = { Min = 0, Max = 300, Default = 16 },  Suffix = " s/s", Callback = function(v) if hum() then hum().WalkSpeed = v end end })
end)

--  Box = true  (adds background card, no border ring)
T5:Section({ Title = "Visual  [Box]", Desc = "Box = true", Box = true, Opened = true }, function(S)
	S:Toggle({ Title = "Fullbright", Value = false, Callback = function(v)
		game.Lighting.Brightness = v and 5 or 1
	end })
	S:Toggle({ Title = "ESP Boxes", Value = false, Callback = function(v) print("ESP:", v) end })
	S:Slider({ Title = "Render Distance", Value = { Min = 64, Max = 2048, Default = 512 },
		Suffix = " studs", Callback = function(v)
			workspace.StreamingMinRadius = v
		end })
	S:Dropdown({ Title = "ESP Color", Values = { "Red", "Blue", "Green", "White", "Rainbow" },
		Value = "White", Callback = function(v) print("ESP color:", v) end })
end)

--  Box = true, BoxBorder = true  (glowing accent-coloured border ring)
T5:Section({ Title = "Farming  [Box + Border]", Desc = "Box = true, BoxBorder = true",
	Box = true, BoxBorder = true, Opened = true }, function(S)
	S:Toggle({ Title = "Auto Collect", Value = true,  Callback = function(v) print("Collect:", v) end })
	S:Toggle({ Title = "Auto Sell",    Value = false, Callback = function(v) print("Sell:", v) end })
	S:Toggle({ Title = "Auto Rebirth", Value = false, Callback = function(v) print("Rebirth:", v) end })
	S:Slider({ Title = "Collect Radius", Value = { Min = 1, Max = 200, Default = 30 },
		Suffix = " studs", Callback = function(v) print("Radius:", v) end })
	S:Input({ Title = "Farm Target", Placeholder = "Item name...", Callback = function(v) print("Farm:", v) end })
end)

--  BoxBorder only (no fill, just the ring)
T5:Section({ Title = "Utilities  [Border only]", Box = true, BoxBorder = true }, function(S)
	S:Button({ Title = "Rejoin Server", Icon = "refresh-cw", Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
	end })
	S:Button({ Title = "Copy Player ID", Icon = "clipboard", Callback = function()
		setclipboard(tostring(lp.UserId))
		notify("Copied", "UserId copied to clipboard.", "Success")
	end })
	S:Button({ Title = "Print Workspace", Icon = "terminal", Callback = function()
		for _, v in ipairs(workspace:GetChildren()) do print(v.Name, v.ClassName) end
	end })
end)

-- ═══════════════════════════════════════════════════════════
--  TAB 6 — STACKS & GROUPS
-- ═══════════════════════════════════════════════════════════
local T6 = Window:Tab({ Title = "Layout", Icon = "columns" })

T6:Paragraph({ Title = "HStack",  Desc  = "Lays children out horizontally." })

T6:HStack({}, function(H)
	H:Button({ Title = "Left",   Variant = "White",   Callback = function() notify("Left",   nil, "Info") end })
	H:Button({ Title = "Center", Variant = "Primary", Callback = function() notify("Center", nil, "Info") end })
	H:Button({ Title = "Right",  Variant = "White",   Callback = function() notify("Right",  nil, "Info") end })
end)

T6:HStack({}, function(H)
	H:Toggle({ Title = "Option A", Value = false, Callback = function(v) print("A", v) end })
	H:Toggle({ Title = "Option B", Value = true,  Callback = function(v) print("B", v) end })
	H:Toggle({ Title = "Option C", Value = false, Callback = function(v) print("C", v) end })
end)

T6:HStack({}, function(H)
	H:Slider({ Title = "Left",  Value = { Min = 0, Max = 100, Default = 25 }, Callback = function(v) print("L", v) end })
	H:Slider({ Title = "Right", Value = { Min = 0, Max = 100, Default = 75 }, Callback = function(v) print("R", v) end })
end)

T6:Divider({ Title = "VStack" })

T6:Paragraph({ Desc = "Lays children out vertically (same as default, but explicit)." })

T6:VStack({}, function(V)
	V:Button({ Title = "Row 1", Variant = "White", Callback = function() print("R1") end })
	V:Button({ Title = "Row 2", Variant = "White", Callback = function() print("R2") end })
	V:Button({ Title = "Row 3", Variant = "White", Callback = function() print("R3") end })
end)

T6:Divider({ Title = "Group" })

T6:Paragraph({ Desc = "Group clusters elements with a horizontal flow layout." })

T6:Group({}, function(G)
	G:Toggle({ Title = "G Toggle", Value = false, Callback = function(v) print("GT", v) end })
	G:Slider({ Title = "G Slider", Value = { Min = 0, Max = 100, Default = 50 }, Callback = function(v) print("GS", v) end })
	G:Input({ Title = "G Input", Placeholder = "text...", Callback = function(v) print("GI", v) end })
end)

-- ═══════════════════════════════════════════════════════════
--  TAB 7 — VIEWPORT, CODE, COLORPICKER
-- ═══════════════════════════════════════════════════════════
local T7 = Window:Tab({ Title = "3D & Code", Icon = "box" })

T7:Paragraph({
	Title = "Viewport",
	Desc  = "Live 3D preview. Interactive = true allows drag-to-rotate and pinch-to-zoom.",
})

-- Build a demo model to view
local demoModel = Instance.new("Model")
local demoBase  = Instance.new("Part")
demoBase.Name      = "Base"
demoBase.Size      = Vector3.new(4, 4, 4)
demoBase.Anchored  = true
demoBase.BrickColor= BrickColor.new("Bright blue")
demoBase.Material  = Enum.Material.SmoothPlastic
demoBase.Parent    = demoModel

local demoOrb = Instance.new("Part")
demoOrb.Shape     = Enum.PartType.Ball
demoOrb.Size      = Vector3.new(2, 2, 2)
demoOrb.Anchored  = true
demoOrb.Position  = Vector3.new(0, 3, 0)
demoOrb.BrickColor= BrickColor.new("Bright yellow")
demoOrb.Material  = Enum.Material.Neon
demoOrb.Parent    = demoModel

local vpCam = Instance.new("Camera")
vpCam.CFrame = CFrame.new(Vector3.new(0, 3, 10), Vector3.new(0, 2, 0))

local myViewport = T7:Viewport({
	Object      = demoModel,
	Camera      = vpCam,
	Height      = 200,
	Interactive = true,
	Focused     = true,
})

T7:Button({
	Title    = "Swap Model (Sphere)",
	Variant  = "White",
	Icon     = "rotate-3d",
	Callback = function()
		local sphere = Instance.new("Part")
		sphere.Shape     = Enum.PartType.Ball
		sphere.Size      = Vector3.new(5, 5, 5)
		sphere.Anchored  = true
		sphere.BrickColor= BrickColor.new("Bright red")
		sphere.Material  = Enum.Material.Neon
		myViewport:SetObject(sphere, false)
		myViewport:Focus()
		notify("Viewport updated", "Sphere loaded.", "Success")
	end,
})

T7:Divider({ Title = "Code Block" })

T7:Code({
	Title   = "Leviathan Quick-Start",
	CanCopied = true,
	Code    = [[
-- 1. Load Leviathan UI
local WindUI = loadstring(game:HttpGet("URL/dist/main.lua"))()

-- 2. Create Window
local Window = WindUI:CreateWindow({
    Title = "My Script",
    Theme = "Leviathan",      -- pick any of the 50 themes
    Size  = UDim2.fromOffset(600, 480),
})

-- 3. Add a tab
local Tab = Window:Tab({ Title = "Main", Icon = "home" })

-- 4. Add elements
Tab:Toggle({
    Title    = "Speed Hack",
    Value    = false,
    Flag     = "SpeedHack",
    Callback = function(val)
        game.Players.LocalPlayer
            .Character.Humanoid.WalkSpeed = val and 80 or 16
    end,
})

Tab:Slider({
    Title    = "Walk Speed",
    Value    = { Min = 0, Max = 100, Default = 16 },
    Flag     = "WalkSpeed",
    Callback = function(val)
        game.Players.LocalPlayer
            .Character.Humanoid.WalkSpeed = val
    end,
})
]],
})

T7:Divider({ Title = "Color Picker" })

T7:Colorpicker({
	Title   = "ESP Color",
	Desc    = "Pick the colour for player highlights",
	Default = Color3.fromRGB(79, 128, 255),
	Flag    = "ESPColor",
	Callback = function(color)
		notify("ESP colour set", tostring(color), "Info")
	end,
})

T7:Colorpicker({
	Title   = "Chat Color",
	Default = Color3.fromRGB(255, 200, 60),
	Flag    = "ChatColor",
	Callback = function(color)
		print("Chat color:", color)
	end,
})

-- ═══════════════════════════════════════════════════════════
--  TAB 8 — NOTIFICATIONS (all types + variants)
-- ═══════════════════════════════════════════════════════════
local T8 = Window:Tab({ Title = "Notifs", Icon = "bell" })

T8:Paragraph({
	Title = "Notification Types",
	Desc  = "Info, Success, Warning, Error — each with accent colour, icon, and progress bar.",
})

T8:Button({
	Title    = "Info",
	Icon     = "info",
	Variant  = "White",
	Callback = function()
		WindUI:Notify({ Title = "Information", Content = "Here is some useful info.", Type = "Info", Duration = 5 })
	end,
})

T8:Button({
	Title    = "Success",
	Icon     = "check-circle",
	Variant  = "White",
	Callback = function()
		WindUI:Notify({ Title = "Success!", Content = "The operation completed without errors.", Type = "Success", Duration = 5 })
	end,
})

T8:Button({
	Title    = "Warning",
	Icon     = "alert-triangle",
	Variant  = "White",
	Callback = function()
		WindUI:Notify({ Title = "Warning", Content = "Something might not be right. Check your settings.", Type = "Warning", Duration = 5 })
	end,
})

T8:Button({
	Title    = "Error",
	Icon     = "x-circle",
	Variant  = "White",
	Callback = function()
		WindUI:Notify({ Title = "Error", Content = "Something went wrong. Please try again.", Type = "Error", Duration = 5 })
	end,
})

T8:Divider({ Title = "Special Cases" })

T8:Button({
	Title    = "Persistent (no timer)",
	Variant  = "White",
	Callback = function()
		WindUI:Notify({ Title = "Persistent", Content = "No timer. Close me with the X.", Type = "Info",
			Duration = 0, CanClose = true })
	end,
})

T8:Button({
	Title    = "No Close Button",
	Variant  = "White",
	Callback = function()
		WindUI:Notify({ Title = "Auto-dismiss in 3s", Content = "No X shown.",
			Type = "Success", Duration = 3, CanClose = false })
	end,
})

T8:Button({
	Title    = "Rapid Fire (4 at once)",
	Variant  = "Primary",
	Callback = function()
		local types = { "Info", "Success", "Warning", "Error" }
		for i, t in ipairs(types) do
			task.delay((i - 1) * 0.25, function()
				WindUI:Notify({ Title = t, Content = "Notification " .. i .. " of 4", Type = t, Duration = 4 })
			end)
		end
	end,
})

-- ═══════════════════════════════════════════════════════════
--  TAB 9 — THEMES (all 50)
-- ═══════════════════════════════════════════════════════════
local T9 = Window:Tab({ Title = "Themes", Icon = "palette" })

T9:Paragraph({
	Title = "50 Themes",
	Desc  = "Original WindUI themes + Leviathan exclusives. The dropdown has all of them.",
})

local allThemes = {
	-- WindUI originals (16)
	"Dark","Light","Rose","Plant","Red","Indigo","Sky","Violet",
	"Amber","Emerald","Midnight","Crimson","MonokaiPro","CottonCandy","Mellowsi","Rainbow",
	-- Leviathan set 1 (17)
	"Ocean","Blurple","Matrix","Frost","Vampire","Sand",
	"Cyberpunk","Pastel","Abyss","Slate","Sunset","Nord",
	"Dracula","Solarized","TokyoNight","Catppuccin","OneDark",
	-- Leviathan set 2 (17)
	"Leviathan","LeviathanAurora","LeviathanVoid","LeviathanRainbow",
	"Lava","Mint","Sakura","Gold","Titanium","Forest",
	"NeonCity","Coffee","Arctic","Grape","Obsidian","Terminal","Holographic",
}

T9:Dropdown({
	Title    = "Select Theme  (" .. #allThemes .. " available)",
	Desc     = "Changes the whole UI instantly",
	Values   = allThemes,
	Value    = "Leviathan",
	SearchBarEnabled = true,
	Flag     = "ActiveTheme",
	Callback = function(val)
		WindUI:SetTheme(val)
		notify("Theme → " .. val, nil, "Info", 2)
	end,
})

T9:Divider({ Title = "Quick Picks" })

local quickPicks = {
	{ "Leviathan",      "🌊" },
	{ "LeviathanVoid",  "⬛" },
	{ "LeviathanRainbow","🌈" },
	{ "Dark",           "🌑" },
	{ "Frost",          "❄️"  },
	{ "Blurple",        "💜" },
	{ "Catppuccin",     "🐱" },
	{ "Dracula",        "🧛" },
	{ "Matrix",         "💚" },
	{ "Cyberpunk",      "⚡" },
	{ "TokyoNight",     "🗼" },
	{ "Nord",           "🏔️" },
	{ "Holographic",    "✨" },
	{ "Terminal",       "💻" },
	{ "Abyss",          "🌑" },
}

for _, pick in ipairs(quickPicks) do
	local name, emoji = pick[1], pick[2]
	T9:Button({
		Title    = emoji .. " " .. name,
		Variant  = "White",
		Callback = function()
			WindUI:SetTheme(name)
			notify("Theme → " .. name, nil, "Info", 2)
		end,
	})
end

-- ═══════════════════════════════════════════════════════════
--  WELCOME NOTIFICATION
-- ═══════════════════════════════════════════════════════════
task.delay(0.8, function()
	WindUI:Notify({
		Title    = "Leviathan UI",
		Content  = "Loaded. " .. #allThemes .. " themes · every element type · BoxBorder sections.",
		Type     = "Success",
		Duration = 7,
	})
end)
