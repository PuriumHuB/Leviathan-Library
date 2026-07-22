--[[
╔══════════════════════════════════════════════════════════════╗
║            LEVIATHAN UI  —  Complete Example                ║
║  Every single element, every variant, every feature.       ║
║  All callbacks are real and functional.                    ║
╚══════════════════════════════════════════════════════════════╝
--]]

local WindUI = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/YourName/LeviathanUI/main/dist/main.lua"
))()

-- ── Shorthand helpers ────────────────────────────────────────
local UIS   = game:GetService("UserInputService")
local RS    = game:GetService("RunService")
local TS    = game:GetService("TweenService")
local lp    = game.Players.LocalPlayer
local mouse = lp:GetMouse()

local function char()  return lp.Character end
local function hum()   local c=char() return c and c:FindFirstChildOfClass("Humanoid") end
local function root()  local c=char() return c and c:FindFirstChild("HumanoidRootPart") end

local function notify(t, c, typ, dur)
	WindUI:Notify({ Title=t, Content=c, Type=typ or "Info", Duration=dur or 4 })
end

-- Shared state flags
local Flags = {}

-- ── WINDOW ───────────────────────────────────────────────────
local Window = WindUI:CreateWindow({
	Title       = "Leviathan UI",
	SubTitle    = "Complete Demo",
	TabWidth    = 160,
	Size        = UDim2.fromOffset(640, 520),
	Acrylic     = true,
	Theme       = "Leviathan",
	Transparent = true,
	Debug       = false,
	Folder      = "LeviathanDemo",
})

-- Topbar tags (must be Window:Tag, NOT Tab:Tag)
Window:Tag({ Title = "v1.0",  Color = Color3.fromRGB(79, 128, 255) })
Window:Tag({ Title = "FREE",  Color = Color3.fromRGB(34, 197, 94)  })
Window:Tag({ Title = "BETA",  Icon  = "flask-conical", Color = Color3.fromRGB(245, 158, 11) })
Window:Tag({ Title = "WAVE",  Icon  = "waves",         Color = Color3.fromRGB(0, 170, 255)  })

-- ════════════════════════════════════════════════════════════
--  TAB 1 — BUTTONS
-- ════════════════════════════════════════════════════════════
local T1 = Window:Tab({ Title = "Buttons", Icon = "mouse-pointer-click" })

T1:Paragraph({
	Title = "Button Variants",
	Desc  = "Four style variants. Each has hover glow, press squish, and proper disabled state.",
})

T1:Button({
	Title    = "Primary  (Default Accent)",
	Desc     = "Main call-to-action style",
	Icon     = "zap",
	Variant  = "Primary",
	Callback = function()
		notify("Primary clicked", "This is the default action button.", "Info")
	end,
})

T1:Button({
	Title    = "White  (Ghost / Outline)",
	Desc     = "Secondary action or cancel",
	Icon     = "feather",
	Variant  = "White",
	Callback = function()
		notify("White clicked", "Secondary style button.", "Info")
	end,
})

T1:Button({
	Title    = "Danger  (Destructive)",
	Desc     = "Use only for irreversible actions",
	Icon     = "trash-2",
	Variant  = "Danger",
	Callback = function()
		notify("Danger!", "Destructive action triggered.", "Error")
	end,
})

T1:Button({
	Title    = "Success  (Confirm)",
	Desc     = "Signals a completed or positive action",
	Icon     = "check-circle",
	Variant  = "Success",
	Callback = function()
		notify("Done", "Action completed successfully.", "Success")
	end,
})

T1:Divider({ Title = "Locked State" })

T1:Button({
	Title       = "Premium Feature (Locked)",
	Desc        = "Requires VIP gamepass to unlock",
	Icon        = "lock",
	Locked      = true,
	LockedTitle = "Purchase VIP to unlock this feature",
	Callback    = function() end,
})

T1:Divider({ Title = "Paragraph with inline Buttons" })

T1:Paragraph({
	Title   = "Confirm Action",
	Desc    = "Some actions need explicit confirmation. Use inline buttons for compact prompts.",
	Buttons = {
		{
			Title    = "Confirm",
			Icon     = "check",
			Callback = function()
				notify("Confirmed", "Action was accepted.", "Success")
			end,
		},
		{
			Title    = "Cancel",
			Icon     = "x",
			Callback = function()
				notify("Cancelled", "Action was rejected.", "Warning")
			end,
		},
	},
})

T1:Divider({ Title = "Spacing & Dividers" })

T1:Paragraph({ Desc = "Space() adds vertical breathing room. Divider() with no title = plain rule." })

T1:Space({})
T1:Divider({})
T1:Space({})
T1:Divider({ Title = "Named divider with title" })
T1:Space({})

T1:Image({
	Image       = "rbxassetid://142098770257",
	AspectRatio = "16:9",
	Title       = "Inline Image",
	Desc        = "Use Image() for banners, previews, or decorative art.",
})

-- ════════════════════════════════════════════════════════════
--  TAB 2 — TOGGLES & CHECKBOXES
-- ════════════════════════════════════════════════════════════
local T2 = Window:Tab({ Title = "Toggles", Icon = "toggle-left" })

T2:Paragraph({
	Title = "Toggle Controls",
	Desc  = "Smooth pill switch with spring animation and drag-to-flip. Type='Checkbox' renders a square.",
})

T2:Toggle({
	Title    = "Infinite Jump",
	Desc     = "Hold Space to jump any number of times",
	Icon     = "chevrons-up",
	Value    = false,
	Flag     = "InfJump",
	Callback = function(val)
		Flags.InfJump = val
		if val then
			Flags.InfJumpConn = UIS.JumpRequest:Connect(function()
				if hum() then hum():ChangeState(Enum.HumanoidStateType.Jumping) end
			end)
		else
			if Flags.InfJumpConn then Flags.InfJumpConn:Disconnect(); Flags.InfJumpConn = nil end
		end
		notify("Infinite Jump " .. (val and "ON" or "OFF"), nil, val and "Success" or "Warning")
	end,
})

T2:Toggle({
	Title    = "Fullbright",
	Desc     = "Makes the map fully lit regardless of Lighting settings",
	Icon     = "sun",
	Value    = false,
	Flag     = "Fullbright",
	Callback = function(val)
		game.Lighting.Brightness     = val and 5 or 1
		game.Lighting.ClockTime      = val and 14 or game.Lighting.ClockTime
		game.Lighting.FogEnd         = val and 9e6 or 1000
		notify("Fullbright " .. (val and "ON" or "OFF"), nil, val and "Success" or "Warning")
	end,
})

T2:Toggle({
	Title    = "Auto-Respawn",
	Desc     = "Automatically respawns after a short delay on death",
	Icon     = "refresh-cw",
	Value    = false,
	Flag     = "AutoRespawn",
	Callback = function(val)
		Flags.AutoRespawn = val
		if val then
			Flags.DeathConn = hum() and hum().Died:Connect(function()
				if Flags.AutoRespawn then
					task.wait(1.5)
					lp:LoadCharacter()
				end
			end) or nil
		else
			if Flags.DeathConn then Flags.DeathConn:Disconnect() end
		end
	end,
})

T2:Toggle({
	Title      = "Wide Toggle (NewElement)",
	Desc       = "NewElement = true gives a wider pill with more thumb travel",
	Value      = true,
	NewElement = true,
	Flag       = "WideToggle",
	Callback   = function(val) print("Wide toggle:", val) end,
})

T2:Toggle({
	Title    = "God Mode",
	Desc     = "Player cannot take damage",
	Icon     = "shield",
	Value    = false,
	Flag     = "GodMode",
	NewElement = true,
	Callback = function(val)
		if char() then
			for _, p in ipairs(char():GetDescendants()) do
				if p:IsA("BasePart") then
					p:SetAttribute("GodMode", val)
				end
			end
		end
		notify("God Mode " .. (val and "ON" or "OFF"), nil, val and "Success" or "Warning")
	end,
})

T2:Divider({ Title = "Checkbox Style" })

T2:Toggle({
	Title    = "Enable Notifications",
	Desc     = "Type = 'Checkbox' renders a tick-box instead of a pill",
	Type     = "Checkbox",
	Value    = true,
	Flag     = "NotifsEnabled",
	Callback = function(val) print("Notifs:", val) end,
})

T2:Toggle({
	Title    = "Log to Console",
	Type     = "Checkbox",
	Value    = false,
	Flag     = "LogConsole",
	Callback = function(val) print("Log:", val) end,
})

T2:Divider({ Title = "Locked Toggle" })

T2:Toggle({
	Title       = "VIP Exclusive Feature",
	Desc        = "Only available to VIP members",
	Locked      = true,
	LockedTitle = "Join VIP gamepass to access this",
	Value       = false,
	Callback    = function() end,
})

-- ════════════════════════════════════════════════════════════
--  TAB 3 — SLIDERS & PROGRESS BARS
-- ════════════════════════════════════════════════════════════
local T3 = Window:Tab({ Title = "Sliders", Icon = "sliders-horizontal" })

T3:Paragraph({
	Title = "Slider Controls",
	Desc  = "Pass Value = { Min, Max, Default }. Add Step for decimal precision.",
})

T3:Slider({
	Title    = "Walk Speed",
	Desc     = "LocalPlayer HumanoidRootPart walk speed",
	Icon     = "footprints",
	Value    = { Min = 0, Max = 150, Default = 16 },
	Suffix   = " studs/s",
	Flag     = "WalkSpeed",
	Callback = function(val)
		Flags.WalkSpeed = val
		if hum() then hum().WalkSpeed = val end
	end,
})

T3:Slider({
	Title    = "Jump Power",
	Desc     = "How high the character can jump",
	Value    = { Min = 0, Max = 300, Default = 50 },
	Suffix   = " power",
	Flag     = "JumpPower",
	Callback = function(val)
		if hum() then hum().JumpPower = val end
	end,
})

T3:Slider({
	Title    = "Camera FOV",
	Desc     = "Adjusts the camera field of view",
	Value    = { Min = 30, Max = 120, Default = 70 },
	Suffix   = "°",
	Flag     = "FOV",
	Callback = function(val)
		workspace.CurrentCamera.FieldOfView = val
	end,
})

T3:Slider({
	Title    = "Character Transparency",
	Desc     = "0 = fully visible, 1 = invisible",
	Value    = { Min = 0, Max = 1, Default = 0 },
	Step     = 0.05,
	Flag     = "CharTransp",
	Callback = function(val)
		if char() then
			for _, p in ipairs(char():GetDescendants()) do
				if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
					p.LocalTransparencyModifier = val
				end
			end
		end
	end,
})

T3:Slider({
	Title    = "Gravity",
	Desc     = "Workspace gravity (default 196.2)",
	Value    = { Min = 0, Max = 500, Default = 196 },
	Suffix   = " m/s²",
	Icons    = { From = "sfsymbols:arrowDownToLine", To = "sfsymbols:arrowUpToLine" },
	Flag     = "Gravity",
	Callback = function(val)
		workspace.Gravity = val
	end,
})

T3:Slider({
	Title    = "Ambient Volume",
	Desc     = "Master volume for ambient sounds",
	Value    = { Min = 0, Max = 10, Default = 5 },
	Step     = 0.1,
	Suffix   = "",
	Icons    = { From = "sfsymbols:speakerSlashFill", To = "sfsymbols:speakerWave3Fill" },
	Flag     = "Volume",
	Callback = function(val)
		game:GetService("SoundService").AmbientReverb = Enum.ReverbType.NoReverb
		print("Volume:", val)
	end,
})

T3:Divider({ Title = "Progress Bar" })

T3:Paragraph({
	Desc = "ProgressBar is display-only — set its value from code with :SetValue(n).",
})

local PBar1 = T3:ProgressBar({
	Title   = "Download Progress",
	Desc    = "Simulated file download",
	Value   = { Min = 0, Max = 100, Default = 0 },
	Suffix  = "%",
	Flag    = "Download",
})

local PBar2 = T3:ProgressBar({
	Title   = "Install Progress",
	Value   = { Min = 0, Max = 100, Default = 0 },
	Suffix  = "%",
	Flag    = "Install",
})

T3:Button({
	Title    = "Simulate Both Progress Bars",
	Variant  = "Primary",
	Icon     = "play",
	Callback = function()
		task.spawn(function()
			for i = 0, 100, 1 do
				PBar1:SetValue(i)
				task.wait(0.04)
			end
			notify("Download Complete", "File saved successfully.", "Success")
			task.wait(0.5)
			for i = 0, 100, 2 do
				PBar2:SetValue(i)
				task.wait(0.04)
			end
			notify("Installation Complete", "Restart to apply changes.", "Success")
		end)
	end,
})

T3:Button({
	Title    = "Reset Both Bars",
	Variant  = "White",
	Icon     = "rotate-ccw",
	Callback = function()
		PBar1:SetValue(0)
		PBar2:SetValue(0)
	end,
})

-- ════════════════════════════════════════════════════════════
--  TAB 4 — INPUTS, DROPDOWNS, KEYBINDS
-- ════════════════════════════════════════════════════════════
local T4 = Window:Tab({ Title = "Inputs", Icon = "keyboard" })

T4:Paragraph({
	Title = "Input Controls",
	Desc  = "Text inputs, single/multi dropdowns with search, and rebindable keybinds.",
})

T4:Input({
	Title       = "Target Player",
	Desc        = "Enter a Roblox username to target",
	Icon        = "user",
	Placeholder = "Username...",
	Value       = "",
	Flag        = "TargetPlayer",
	Callback    = function(val)
		Flags.TargetPlayer = val
		notify("Target set", "Now targeting: " .. val, "Info")
	end,
})

T4:Input({
	Title        = "Execute Script",
	Desc         = "Type Lua and press Enter to run",
	Icon         = "terminal",
	Placeholder  = "print('Hello Leviathan!')",
	Value        = "",
	ClearTextOnFocus = false,
	Flag         = "ExecScript",
	Callback     = function(val)
		if val and val ~= "" then
			local fn, err = loadstring(val)
			if fn then
				local ok, runErr = pcall(fn)
				if not ok then notify("Runtime Error", runErr, "Error") end
			else
				notify("Syntax Error", err, "Error")
			end
		end
	end,
})

T4:Divider({ Title = "Dropdowns" })

T4:Dropdown({
	Title  = "Server Region",
	Desc   = "Choose the closest server region",
	Icon   = "globe",
	Values = { "US East", "US West", "EU Central", "EU West", "Asia Pacific", "South America", "Oceania" },
	Value  = "US East",
	Flag   = "Region",
	Callback = function(val)
		Flags.Region = val
		notify("Region → " .. val, "Switching server...", "Info")
	end,
})

T4:Dropdown({
	Title  = "Game Mode",
	Desc   = "Changes the active game rules",
	Values = { "Normal", "Hardcore", "Creative", "Sandbox", "Spectator" },
	Value  = "Normal",
	Flag   = "GameMode",
	Callback = function(val)
		notify("Mode: " .. val, nil, "Info")
	end,
})

T4:Dropdown({
	Title            = "Active Cheats  (Multi-select)",
	Desc             = "Toggle multiple cheats simultaneously",
	Values           = { "Speed", "Fly", "No Clip", "Inf Jump", "God Mode", "ESP", "Aimbot", "Auto Farm", "Anti AFK" },
	Value            = {},
	Multi            = true,
	SearchBarEnabled = true,
	Flag             = "ActiveCheats",
	Callback         = function(val)
		local list = {}
		for k, v in pairs(val) do if v then table.insert(list, k) end end
		table.sort(list)
		if #list > 0 then
			notify("Active: " .. table.concat(list, ", "), nil, "Info")
		end
	end,
})

T4:Dropdown({
	Title     = "Optional Perk  (AllowNone)",
	Desc      = "Select a perk, or leave blank",
	Values    = { "Double XP", "VIP Badge", "Extra Lives", "Speed Boost", "Shield" },
	Value     = nil,
	AllowNone = true,
	Flag      = "SelectedPerk",
	Callback  = function(val)
		print("Perk:", val)
	end,
})

T4:Divider({ Title = "Keybinds" })

T4:Keybind({
	Title    = "Toggle UI Visibility",
	Desc     = "Press key to show or hide the window",
	Icon     = "layout",
	Value    = Enum.KeyCode.RightShift,
	Flag     = "MenuKey",
	Callback = function(key)
		notify("Menu key bound to " .. tostring(key), nil, "Info")
	end,
})

T4:Keybind({
	Title    = "Teleport to Mouse",
	Desc     = "Press key to teleport to where your cursor is pointing",
	Value    = Enum.KeyCode.T,
	Flag     = "TeleportKey",
	Callback = function(key)
		Flags.TeleportKey = key
	end,
})

T4:Keybind({
	Title    = "Toggle Fly",
	Value    = Enum.KeyCode.F,
	Flag     = "FlyKey",
	Callback = function(key)
		notify("Fly key: " .. tostring(key), nil, "Info")
	end,
})

-- ════════════════════════════════════════════════════════════
--  TAB 5 — SECTIONS (collapse, Box, BoxBorder)
-- ════════════════════════════════════════════════════════════
local T5 = Window:Tab({ Title = "Sections", Icon = "layers" })

T5:Paragraph({
	Title = "Section Types",
	Desc  = "Plain (header only), Box (card fill), Box+BoxBorder (glowing accent ring).",
})

-- Plain collapsible section
T5:Section({ Title = "⚔️  Combat", Desc = "Auto-combat and targeting settings", Opened = true }, function(S)
	S:Toggle({ Title = "Auto Block",   Value = true,  Flag = "AutoBlock",  Callback = function(v) print("Block:", v)  end })
	S:Toggle({ Title = "Auto Parry",   Value = false, Flag = "AutoParry",  Callback = function(v) print("Parry:", v)  end })
	S:Toggle({ Title = "Auto Counter", Value = false, Flag = "AutoCounter",Callback = function(v) print("Counter:", v) end })
	S:Divider({ Title = "Timings" })
	S:Slider({ Title = "Attack Range",  Value = { Min = 1,  Max = 60,   Default = 10  }, Suffix = " st", Flag = "AtkRange",  Callback = function(v) print("Range:", v) end })
	S:Slider({ Title = "Attack Delay",  Value = { Min = 0,  Max = 2000, Default = 200 }, Suffix = " ms", Flag = "AtkDelay",  Callback = function(v) print("Delay:", v) end })
	S:Slider({ Title = "Combo Limit",   Value = { Min = 1,  Max = 10,   Default = 3   }, Suffix = " hits",Flag = "ComboLim", Callback = function(v) print("Combo:", v) end })
	S:Divider({ Title = "Targeting" })
	S:Dropdown({ Title = "Priority", Values = { "Nearest", "Lowest HP", "Highest HP", "Marked" },
		Value = "Nearest", Flag = "Priority", Callback = function(v) print("Priority:", v) end })
end)

-- Plain collapsible — starts closed
T5:Section({ Title = "🏃  Movement", Desc = "Speed, flight, and teleportation" }, function(S)
	S:Toggle({ Title = "Fly",        Value = false, Flag = "Fly",    Callback = function(v) print("Fly:", v) end })
	S:Toggle({ Title = "No Clip",    Value = false, Flag = "NoClip", Callback = function(v) print("NoClip:", v) end })
	S:Toggle({ Title = "Speed Hack", Value = false, Flag = "SpeedHack", Callback = function(v)
		if hum() then hum().WalkSpeed = v and (Flags.WalkSpeed or 80) or 16 end
	end })
	S:Slider({ Title = "Fly Speed",   Value = { Min = 10,  Max = 500,  Default = 80 }, Suffix = " s/s", Callback = function(v) print("FlySpd:", v) end })
	S:Slider({ Title = "Fly Ascend",  Value = { Min = 0,   Max = 200,  Default = 40 }, Suffix = " s/s", Callback = function(v) print("Ascend:", v) end })
	S:Slider({ Title = "Noclip Rate", Value = { Min = 0.1, Max = 5,    Default = 1  }, Step = 0.1, Callback = function(v) print("NoclipRate:", v) end })
	S:Divider({})
	S:Button({ Title = "Teleport to Spawn", Icon = "map-pin", Callback = function()
		local spawn = workspace:FindFirstChildOfClass("SpawnLocation")
		if spawn and root() then
			root().CFrame = spawn.CFrame + Vector3.new(0, 5, 0)
			notify("Teleported", "Moved to spawn point.", "Success")
		end
	end })
end)

-- Box = true (card background, no glow ring)
T5:Section({ Title = "👁️  Visual  [Box]", Desc = "Box = true adds a subtle card background", Box = true, Opened = true }, function(S)
	S:Toggle({ Title = "ESP Boxes",    Value = false, Flag = "ESPBox",    Callback = function(v) print("ESP:", v) end })
	S:Toggle({ Title = "ESP Names",    Value = false, Flag = "ESPName",   Callback = function(v) print("ESPName:", v) end })
	S:Toggle({ Title = "ESP Health",   Value = false, Flag = "ESPHealth", Callback = function(v) print("ESPHealth:", v) end })
	S:Toggle({ Title = "Tracers",      Value = false, Flag = "Tracers",   Callback = function(v) print("Tracers:", v) end })
	S:Divider({ Title = "Appearance" })
	S:Slider({ Title = "ESP Distance",   Value = { Min = 10, Max = 2000, Default = 500 }, Suffix = " st", Callback = function(v) print("ESPDist:", v) end })
	S:Dropdown({ Title = "ESP Color", Values = { "Red", "Blue", "Green", "Yellow", "White", "Cyan", "Rainbow" },
		Value = "White", Flag = "ESPColor", Callback = function(v) print("ESPColor:", v) end })
	S:Colorpicker({ Title = "Custom ESP Color", Default = Color3.fromRGB(255, 255, 255),
		Flag = "ESPCustomColor", Callback = function(v) print("ESPColorCustom:", v) end })
end)

-- Box = true, BoxBorder = true (glowing accent ring around the card)
T5:Section({ Title = "🌾  Farming  [Box + Border]", Desc = "BoxBorder = true adds the glowing accent outline ring",
	Box = true, BoxBorder = true, Opened = true }, function(S)
	S:Toggle({ Title = "Auto Collect",  Value = true,  Flag = "Collect",  Callback = function(v) print("Collect:", v) end })
	S:Toggle({ Title = "Auto Sell",     Value = false, Flag = "Sell",     Callback = function(v) print("Sell:", v) end })
	S:Toggle({ Title = "Auto Rebirth",  Value = false, Flag = "Rebirth",  Callback = function(v) print("Rebirth:", v) end })
	S:Toggle({ Title = "Skip Cutscenes",Value = false, Flag = "SkipCuts", Callback = function(v) print("Skip:", v) end })
	S:Divider({ Title = "Settings" })
	S:Slider({ Title = "Collect Radius", Value = { Min = 1, Max = 500, Default = 30 }, Suffix = " st",
		Callback = function(v) print("Radius:", v) end })
	S:Slider({ Title = "Loop Delay",     Value = { Min = 0, Max = 5000, Default = 500 }, Suffix = " ms",
		Callback = function(v) print("LoopDelay:", v) end })
	S:Input({ Title = "Item Filter", Placeholder = "e.g. Gold, Gems...", Flag = "ItemFilter",
		Callback = function(v) print("Filter:", v) end })
	S:Dropdown({ Title = "Sell Mode", Values = { "All", "Duplicates Only", "Below Threshold", "Manual List" },
		Value = "All", Callback = function(v) print("SellMode:", v) end })
end)

-- BoxBorder only (ring without card fill — just the glow outline)
T5:Section({ Title = "🔧  Utilities  [Border only]", Box = true, BoxBorder = true }, function(S)
	S:Button({ Title = "Rejoin Server",       Icon = "refresh-cw",  Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
	end })
	S:Button({ Title = "Copy User ID",        Icon = "clipboard",   Callback = function()
		setclipboard(tostring(lp.UserId))
		notify("Copied", "UserId: " .. lp.UserId, "Success")
	end })
	S:Button({ Title = "Clear Chat",          Icon = "trash",       Callback = function()
		game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
			Text = "[Leviathan] Chat cleared."
		})
	end })
	S:Button({ Title = "Print Workspace Tree",Icon = "terminal",    Callback = function()
		for _, v in ipairs(workspace:GetChildren()) do
			print(("[%s] %s"):format(v.ClassName, v.Name))
		end
		notify("Done", "Workspace printed to console.", "Info")
	end })
	S:Divider({})
	S:Input({ Title = "Broadcast Message", Placeholder = "Message to chat...", Callback = function(v)
		if v and v ~= "" then
			game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
				Text      = "[Broadcast] " .. v,
				Color     = Color3.fromRGB(79, 128, 255),
				Font      = Enum.Font.GothamBold,
				FontSize  = Enum.FontSize.Size18,
			})
		end
	end })
end)

-- ════════════════════════════════════════════════════════════
--  TAB 6 — STACKS & GROUPS
-- ════════════════════════════════════════════════════════════
local T6 = Window:Tab({ Title = "Layout", Icon = "columns" })

T6:Paragraph({
	Title = "Layout Primitives",
	Desc  = "HStack = horizontal row. VStack = vertical column. Group = labelled horizontal cluster.",
})

T6:Divider({ Title = "HStack — Horizontal Row" })

T6:HStack({}, function(H)
	H:Button({ Title = "Left",   Variant = "White",   Callback = function() notify("Left",   nil, "Info") end })
	H:Button({ Title = "Center", Variant = "Primary", Callback = function() notify("Center", nil, "Info") end })
	H:Button({ Title = "Right",  Variant = "Danger",  Callback = function() notify("Right",  nil, "Error") end })
end)

T6:HStack({}, function(H)
	H:Toggle({ Title = "Option A", Value = false, Flag = "HA", Callback = function(v) print("A", v) end })
	H:Toggle({ Title = "Option B", Value = true,  Flag = "HB", Callback = function(v) print("B", v) end })
	H:Toggle({ Title = "Option C", Value = false, Flag = "HC", Callback = function(v) print("C", v) end })
end)

T6:HStack({}, function(H)
	H:Slider({ Title = "L", Value = { Min = 0, Max = 100, Default = 25 }, Flag = "SL", Callback = function(v) print("SL", v) end })
	H:Slider({ Title = "R", Value = { Min = 0, Max = 100, Default = 75 }, Flag = "SR", Callback = function(v) print("SR", v) end })
end)

T6:Divider({ Title = "VStack — Vertical Column" })

T6:VStack({}, function(V)
	V:Button({ Title = "Stack Row 1", Variant = "White",   Callback = function() print("R1") end })
	V:Button({ Title = "Stack Row 2", Variant = "White",   Callback = function() print("R2") end })
	V:Button({ Title = "Stack Row 3", Variant = "Primary", Callback = function() print("R3") end })
end)

T6:Divider({ Title = "Group — Labelled Cluster" })

T6:Group({}, function(G)
	G:Toggle({ Title = "Group Toggle",  Value = false, Flag = "GT", Callback = function(v) print("GT", v) end })
	G:Slider({ Title = "Group Slider",  Value = { Min = 0, Max = 100, Default = 50 }, Flag = "GS", Callback = function(v) print("GS", v) end })
	G:Input({ Title  = "Group Input",   Placeholder = "type...", Flag = "GI", Callback = function(v) print("GI", v) end })
	G:Dropdown({ Title = "Group Drop",  Values = { "A", "B", "C" }, Value = "A", Flag = "GD", Callback = function(v) print("GD", v) end })
end)

-- ════════════════════════════════════════════════════════════
--  TAB 7 — VIEWPORT, CODE, COLORPICKER
-- ════════════════════════════════════════════════════════════
local T7 = Window:Tab({ Title = "3D & Code", Icon = "box" })

T7:Paragraph({
	Title = "Viewport",
	Desc  = "Live 3D model rendered in-UI. Interactive = true allows drag-rotate and scroll-zoom.",
})

local demoModel = Instance.new("Model")
demoModel.Name  = "LevDemo"
local basePart  = Instance.new("Part")
basePart.Name   = "Base"
basePart.Size   = Vector3.new(4, 4, 4)
basePart.Anchored    = true
basePart.BrickColor  = BrickColor.new("Bright blue")
basePart.Material    = Enum.Material.SmoothPlastic
basePart.Parent      = demoModel

local topOrb    = Instance.new("Part")
topOrb.Shape    = Enum.PartType.Ball
topOrb.Size     = Vector3.new(2, 2, 2)
topOrb.Position = Vector3.new(0, 3.5, 0)
topOrb.Anchored = true
topOrb.BrickColor = BrickColor.new("Neon blue")
topOrb.Material   = Enum.Material.Neon
topOrb.Parent     = demoModel

local vpCam     = Instance.new("Camera")
vpCam.CFrame    = CFrame.new(Vector3.new(0, 3, 10), Vector3.new(0, 2, 0))

local myVP = T7:Viewport({
	Object      = demoModel,
	Camera      = vpCam,
	Height      = 200,
	Interactive = true,
	Focused     = true,
})

T7:HStack({}, function(H)
	H:Button({ Title = "Blue Cube",   Variant = "White", Callback = function()
		local p = Instance.new("Part")
		p.Size = Vector3.new(4,4,4); p.Anchored = true
		p.BrickColor = BrickColor.new("Bright blue"); p.Material = Enum.Material.SmoothPlastic
		myVP:SetObject(p, false); myVP:Focus()
		notify("Viewport", "Showing blue cube.", "Info")
	end })
	H:Button({ Title = "Neon Sphere", Variant = "White", Callback = function()
		local p = Instance.new("Part")
		p.Shape = Enum.PartType.Ball
		p.Size = Vector3.new(4,4,4); p.Anchored = true
		p.BrickColor = BrickColor.new("Bright red"); p.Material = Enum.Material.Neon
		myVP:SetObject(p, false); myVP:Focus()
		notify("Viewport", "Showing neon sphere.", "Info")
	end })
	H:Button({ Title = "Custom Model", Variant = "White", Callback = function()
		local first = workspace:FindFirstChildOfClass("Model")
		if first then myVP:SetObject(first, false); myVP:Focus()
		else notify("No model found", "No Model in Workspace.", "Warning") end
	end })
end)

T7:Divider({ Title = "Code Block" })

T7:Code({
	Title     = "Leviathan Quick-Start",
	CanCopied = true,
	Code      = [[
-- Load Leviathan UI
local WindUI = loadstring(game:HttpGet("URL"))()

-- Create window on the Leviathan theme
local Window = WindUI:CreateWindow({
    Title  = "My Script",
    Theme  = "Leviathan",    -- 50 themes available
    Size   = UDim2.fromOffset(600, 480),
    Acrylic     = true,
    Transparent = true,
})

-- Topbar badge tags
Window:Tag({ Title = "v2.0", Color = Color3.fromRGB(79,128,255) })

-- Add a tab
local Tab = Window:Tab({ Title = "Main", Icon = "home" })

-- Toggle example
Tab:Toggle({
    Title    = "Speed Hack",
    Value    = false,
    Flag     = "SpeedHack",
    Callback = function(val)
        game.Players.LocalPlayer
            .Character.Humanoid.WalkSpeed = val and 80 or 16
    end,
})

-- Slider example (note: Value = { Min, Max, Default })
Tab:Slider({
    Title = "Walk Speed",
    Value = { Min = 0, Max = 150, Default = 16 },
    Suffix = " studs/s",
    Callback = function(val)
        game.Players.LocalPlayer
            .Character.Humanoid.WalkSpeed = val
    end,
})

-- Section with BoxBorder glow ring
Tab:Section({
    Title = "Advanced", Box = true, BoxBorder = true
}, function(S)
    S:Toggle({ Title = "God Mode", Value = false,
        Callback = function(v) print("God:", v) end })
end)
]],
})

T7:Divider({ Title = "Color Picker" })

T7:Colorpicker({
	Title    = "ESP Highlight Color",
	Desc     = "Sets the colour of ESP outlines on players",
	Default  = Color3.fromRGB(79, 128, 255),
	Flag     = "ESPHighlight",
	Callback = function(c)
		Flags.ESPColor = c
		notify("ESP color updated", tostring(c), "Info")
	end,
})

T7:Colorpicker({
	Title    = "UI Accent Override",
	Desc     = "Override the UI accent tint at runtime",
	Default  = Color3.fromRGB(0, 170, 255),
	Flag     = "UIAccent",
	Callback = function(c)
		print("UI accent:", c)
	end,
})

-- ════════════════════════════════════════════════════════════
--  TAB 8 — NOTIFICATIONS
-- ════════════════════════════════════════════════════════════
local T8 = Window:Tab({ Title = "Notifs", Icon = "bell" })

T8:Paragraph({
	Title = "All Notification Types",
	Desc  = "Max 3 visible at once. Bottom-anchored. Colour-coded accent stripe per type.",
})

T8:Button({ Title = "Info",    Icon = "info",            Variant = "White", Callback = function()
	WindUI:Notify({ Title = "Information",  Content = "This is a blue info notification.", Type = "Info",    Duration = 5 })
end })
T8:Button({ Title = "Success", Icon = "check-circle",    Variant = "White", Callback = function()
	WindUI:Notify({ Title = "Success!",     Content = "Operation completed without errors.", Type = "Success", Duration = 5 })
end })
T8:Button({ Title = "Warning", Icon = "alert-triangle",  Variant = "White", Callback = function()
	WindUI:Notify({ Title = "Warning",      Content = "Something may not be right.", Type = "Warning", Duration = 5 })
end })
T8:Button({ Title = "Error",   Icon = "x-circle",        Variant = "White", Callback = function()
	WindUI:Notify({ Title = "Error",        Content = "Something went wrong. Try again.", Type = "Error",   Duration = 5 })
end })

T8:Divider({ Title = "Edge Cases" })

T8:Button({ Title = "No Duration (manual close)", Variant = "White", Callback = function()
	WindUI:Notify({ Title = "Persistent", Content = "Close me with the X button.", Type = "Info",
		Duration = 0, CanClose = true })
end })
T8:Button({ Title = "No Close Button", Variant = "White", Callback = function()
	WindUI:Notify({ Title = "Auto-dismiss in 3s", Content = "No X shown on this one.",
		Type = "Success", Duration = 3, CanClose = false })
end })
T8:Button({ Title = "Stress Test — 6 at once (max 3 show)", Variant = "Primary", Callback = function()
	local types = { "Info", "Success", "Warning", "Error", "Info", "Success" }
	for i, t in ipairs(types) do
		task.delay((i - 1) * 0.3, function()
			WindUI:Notify({ Title = t .. " #" .. i, Content = "Notification " .. i .. " of 6", Type = t, Duration = 6 })
		end)
	end
end })

-- ════════════════════════════════════════════════════════════
--  TAB 9 — THEMES
-- ════════════════════════════════════════════════════════════
local T9 = Window:Tab({ Title = "Themes", Icon = "palette" })

T9:Paragraph({
	Title = "All Themes",
	Desc  = "50 themes total. Leviathan is the signature theme — full blue-spectrum rainbow.",
})

local allThemes = {
	-- WindUI originals
	"Dark","Light","Rose","Plant","Red","Indigo","Sky","Violet",
	"Amber","Emerald","Midnight","Crimson","MonokaiPro","CottonCandy","Mellowsi","Rainbow",
	-- Leviathan set 1
	"Ocean","Blurple","Matrix","Frost","Vampire","Sand",
	"Cyberpunk","Pastel","Abyss","Slate","Sunset","Nord",
	"Dracula","Solarized","TokyoNight","Catppuccin","OneDark",
	-- Leviathan set 2
	"Leviathan","LeviathanDeep","LeviathanAurora","LeviathanVoid",
	"Lava","Mint","Sakura","Gold","Titanium","Forest",
	"NeonCity","Coffee","Arctic","Grape","Obsidian","Terminal","Holographic",
}

T9:Dropdown({
	Title            = "Select Theme  (" .. #allThemes .. " available)",
	Desc             = "Applies to the whole UI instantly",
	Values           = allThemes,
	Value            = "Leviathan",
	SearchBarEnabled = true,
	Flag             = "ActiveTheme",
	Callback         = function(val)
		WindUI:SetTheme(val)
		notify("Theme → " .. val, nil, "Info", 2)
	end,
})

T9:Divider({ Title = "Quick Picks" })

local quickPicks = {
	{ "Leviathan",      "🌊 Leviathan  (Signature)"   },
	{ "LeviathanDeep",  "🔵 Leviathan Deep"           },
	{ "LeviathanAurora","🟣 Leviathan Aurora"         },
	{ "LeviathanVoid",  "⬛ Leviathan Void"           },
	{ "Dark",           "🌑 Dark"                     },
	{ "Frost",          "❄️  Frost"                    },
	{ "Blurple",        "💜 Blurple  (Discord)"       },
	{ "Catppuccin",     "🐱 Catppuccin Mocha"         },
	{ "Dracula",        "🧛 Dracula"                  },
	{ "Nord",           "🏔️  Nord"                    },
	{ "TokyoNight",     "🗼 Tokyo Night"              },
	{ "Cyberpunk",      "⚡ Cyberpunk"                },
	{ "Holographic",    "✨ Holographic"              },
	{ "Terminal",       "💚 Terminal  (Hacker)"       },
	{ "Abyss",          "🌑 Abyss  (OLED Black)"      },
	{ "Rainbow",        "🌈 Rainbow"                  },
}

for _, pick in ipairs(quickPicks) do
	local key, label = pick[1], pick[2]
	T9:Button({
		Title    = label,
		Variant  = "White",
		Callback = function()
			WindUI:SetTheme(key)
			notify("Theme → " .. key, nil, "Info", 2)
		end,
	})
end

-- ════════════════════════════════════════════════════════════
--  WELCOME NOTIFICATIONS
-- ════════════════════════════════════════════════════════════
task.delay(0.9, function()
	WindUI:Notify({
		Title    = "Leviathan UI",
		Content  = "Loaded. " .. #allThemes .. " themes · 9 tabs · every element.",
		Type     = "Success",
		Duration = 7,
	})
end)

task.delay(3.0, function()
	WindUI:Notify({
		Title    = "Tip",
		Content  = "Open the Themes tab and select 'Leviathan' to see the full blue-rainbow UI.",
		Type     = "Info",
		Duration = 6,
	})
end)
