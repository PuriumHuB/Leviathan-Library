-- ╔══════════════════════════════════════════════════════════════╗
-- ║          Leviathan UI — Complete Example                    ║
-- ║  Every single element, tab, notification type shown.       ║
-- ╚══════════════════════════════════════════════════════════════╝

local WindUI = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/YourName/LeviathanUI/main/dist/main.lua"
))()

-- ═══════════════════════════════════════════
--  WINDOW
-- ═══════════════════════════════════════════
local Window = WindUI:CreateWindow({
	Title       = "Leviathan UI",
	SubTitle    = "Complete Example",
	TabWidth    = 160,
	Size        = UDim2.fromOffset(600, 480),
	Acrylic     = true,
	Theme       = "Dark",
	Transparent = true,
	Debug       = false,
	Folder      = "LeviathanExample",
})

-- ═══════════════════════════════════════════
--  TAB 1: BUTTONS & TOGGLES
-- ═══════════════════════════════════════════
local TabMain = Window:Tab({ Title = "Buttons", Icon = "mouse-pointer-click" })

TabMain:Paragraph({
	Title = "Button Variants",
	Desc  = "Primary, White, Danger, Success — all with hover and press animations.",
})

TabMain:Button({
	Title    = "Primary Button",
	Desc     = "Default filled accent button",
	Icon     = "zap",
	Variant  = "Primary",
	Callback = function()
		WindUI:Notify({ Title = "Primary", Content = "Primary button clicked.", Type = "Info", Duration = 3 })
	end,
})

TabMain:Button({
	Title    = "White Button",
	Desc     = "Light outlined style",
	Variant  = "White",
	Callback = function()
		WindUI:Notify({ Title = "White", Type = "Info", Duration = 3 })
	end,
})

TabMain:Button({
	Title    = "Danger Button",
	Desc     = "Use for destructive actions",
	Icon     = "trash-2",
	Variant  = "Danger",
	Callback = function()
		WindUI:Notify({ Title = "Danger!", Content = "Destructive action triggered.", Type = "Error", Duration = 4 })
	end,
})

TabMain:Button({
	Title    = "Success Button",
	Desc     = "Confirms a completed action",
	Icon     = "check",
	Variant  = "Success",
	Callback = function()
		WindUI:Notify({ Title = "Success", Content = "Action completed successfully.", Type = "Success", Duration = 4 })
	end,
})

TabMain:Divider({ Title = "Toggles" })

local toggleValue = false
TabMain:Toggle({
	Title    = "Enable Feature",
	Desc     = "Toggles a feature on or off",
	Icon     = "power",
	Default  = false,
	Flag     = "FeatureEnabled",
	Callback = function(val)
		toggleValue = val
		WindUI:Notify({
			Title    = val and "Feature Enabled" or "Feature Disabled",
			Type     = val and "Success" or "Warning",
			Duration = 2,
		})
	end,
})

TabMain:Toggle({
	Title    = "Dark Mode",
	Desc     = "Switch between Dark and Light theme",
	Icon     = "moon",
	Default  = true,
	Callback = function(val)
		WindUI:SetTheme(val and "Dark" or "Frost")
	end,
})

TabMain:Toggle({
	Title    = "Auto Farm",
	Default  = false,
	NewElement = true,
	Callback = function(val)
		print("Auto Farm:", val)
	end,
})

-- ═══════════════════════════════════════════
--  TAB 2: SLIDERS & INPUTS
-- ═══════════════════════════════════════════
local TabSliders = Window:Tab({ Title = "Sliders", Icon = "sliders-horizontal" })

TabSliders:Paragraph({
	Title = "Slider Controls",
	Desc  = "Drag to adjust values. Supports min/max/default/step.",
})

TabSliders:Slider({
	Title    = "Walk Speed",
	Desc     = "Player walk speed",
	Icon     = "footprints",
	Min      = 0,
	Max      = 100,
	Default  = 16,
	Suffix   = " studs/s",
	Flag     = "WalkSpeed",
	Callback = function(val)
		if game.Players.LocalPlayer.Character then
			local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.WalkSpeed = val end
		end
	end,
})

TabSliders:Slider({
	Title    = "Jump Power",
	Min      = 0,
	Max      = 200,
	Default  = 50,
	Suffix   = " power",
	Callback = function(val)
		if game.Players.LocalPlayer.Character then
			local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.JumpPower = val end
		end
	end,
})

TabSliders:Slider({
	Title    = "Transparency",
	Min      = 0,
	Max      = 100,
	Default  = 0,
	Suffix   = "%",
	Callback = function(val) print("Transparency:", val) end,
})

TabSliders:Divider({ Title = "Input" })

TabSliders:Input({
	Title       = "Player Name",
	Desc        = "Enter a username to find",
	Icon        = "user",
	Placeholder = "Enter username...",
	Flag        = "TargetPlayer",
	Callback    = function(val) print("Input:", val) end,
})

TabSliders:Input({
	Title       = "Custom Script",
	Placeholder = "print('Hello World')",
	Desc        = "Paste any Lua here",
	ClearOnFocus = false,
	Callback    = function(val) print("Script:", val) end,
})

TabSliders:Divider({ Title = "Progress Bars" })

local progressBar = TabSliders:ProgressBar({
	Title   = "Loading...",
	Default = 0,
})

TabSliders:Button({
	Title = "Simulate Loading",
	Callback = function()
		task.spawn(function()
			for i = 0, 100, 5 do
				progressBar:SetValue(i)
				task.wait(0.1)
			end
		end)
	end,
})

-- ═══════════════════════════════════════════
--  TAB 3: DROPDOWNS & KEYBINDS
-- ═══════════════════════════════════════════
local TabDropdowns = Window:Tab({ Title = "Dropdowns", Icon = "list" })

TabDropdowns:Paragraph({
	Title = "Dropdown Controls",
	Desc  = "Single-select and multi-select dropdowns with search.",
})

TabDropdowns:Dropdown({
	Title   = "Server Region",
	Desc    = "Choose your preferred region",
	Icon    = "globe",
	Options = { "US East", "US West", "EU Central", "EU West", "Asia Pacific", "South America", "Australia" },
	Default = "US East",
	Flag    = "ServerRegion",
	Callback = function(val)
		WindUI:Notify({ Title = "Region: " .. val, Type = "Info", Duration = 2 })
	end,
})

TabDropdowns:Dropdown({
	Title    = "Active Hacks (Multi)",
	Desc     = "Select multiple options",
	Options  = { "Speed Hack", "Fly Hack", "No Clip", "Infinite Jump", "God Mode", "ESP" },
	Default  = { "Infinite Jump" },
	Multi    = true,
	Flag     = "ActiveHacks",
	Callback = function(val)
		print("Active hacks:", val)
	end,
})

TabDropdowns:Divider({ Title = "Keybinds" })

TabDropdowns:Keybind({
	Title    = "Toggle Menu",
	Desc     = "Press key to show/hide UI",
	Icon     = "keyboard",
	Default  = Enum.KeyCode.RightShift,
	Flag     = "ToggleKey",
	Callback = function(key)
		print("New keybind:", key)
	end,
})

TabDropdowns:Keybind({
	Title   = "Teleport Key",
	Default = Enum.KeyCode.T,
	Callback = function(key)
		WindUI:Notify({ Title = "Keybind set: " .. tostring(key), Type = "Info", Duration = 2 })
	end,
})

-- ═══════════════════════════════════════════
--  TAB 4: VISUAL ELEMENTS
-- ═══════════════════════════════════════════
local TabVisual = Window:Tab({ Title = "Visual", Icon = "layout" })

-- Paragraph modes
TabVisual:Paragraph({
	Title = "Title Mode",
	Desc  = "Large bold heading with body text below. Use for feature introductions.",
})

TabVisual:Paragraph({
	Title = "Description Only",
	Desc  = "This paragraph has no icon — just a subtle description. Ideal for contextual hints beneath a control.",
})

-- Tags
TabVisual:Divider({ Title = "Tags" })

TabVisual:Paragraph({ Desc = "Tags can carry a color, icon, and optional title." })

TabVisual:HStack({}, function(Stack)
	Stack:Tag({ Title = "Default",  Color = Color3.fromHex("#52525b") })
	Stack:Tag({ Title = "Blue",     Color = Color3.fromHex("#4F80FF") })
	Stack:Tag({ Title = "Green",    Color = Color3.fromHex("#22C55E") })
	Stack:Tag({ Title = "Red",      Color = Color3.fromHex("#EF4444") })
	Stack:Tag({ Title = "Orange",   Color = Color3.fromHex("#F59E0B") })
	Stack:Tag({ Title = "Purple",   Color = Color3.fromHex("#8B5CF6") })
end)

TabVisual:HStack({}, function(Stack)
	Stack:Tag({ Title = "With Icon", Icon = "star",    Color = Color3.fromHex("#F59E0B") })
	Stack:Tag({ Title = "Admin",     Icon = "shield",  Color = Color3.fromHex("#8B5CF6") })
	Stack:Tag({ Title = "VIP",       Icon = "crown",   Color = Color3.fromHex("#EF4444") })
	Stack:Tag({ Title = "New",       Icon = "sparkles",Color = Color3.fromHex("#4F80FF") })
end)

-- Gradient tag
TabVisual:Tag({
	Title = "Gradient Tag",
	Color = WindUI:Gradient({
		["0"]   = { Color = Color3.fromHex("#8B5CF6"), Transparency = 0 },
		["100"] = { Color = Color3.fromHex("#4F80FF"), Transparency = 0 },
	}, { Rotation = 45 }),
})

-- Dividers
TabVisual:Divider({ Title = "Dividers & Spacing" })
TabVisual:Space({})
TabVisual:Divider({})
TabVisual:Space({})
TabVisual:Divider({ Title = "Back to content" })

-- Image
TabVisual:Image({
	Image  = "rbxassetid://142098770257",
	Height = 80,
	Title  = "Roblox Logo",
	Desc   = "An inline image element",
})

-- ═══════════════════════════════════════════
--  TAB 5: VIEWPORT & CODE
-- ═══════════════════════════════════════════
local TabViewport = Window:Tab({ Title = "3D / Code", Icon = "box" })

TabViewport:Paragraph({
	Title = "Viewport",
	Desc  = "Renders a live 3D model. Supports interactive drag-to-rotate.",
})

-- Build a demo part to view
local demoPart = Instance.new("Part")
demoPart.Size     = Vector3.new(3, 3, 3)
demoPart.Anchored = true
demoPart.BrickColor = BrickColor.new("Bright blue")
demoPart.Material = Enum.Material.SmoothPlastic

local cam = Instance.new("Camera")
cam.CFrame = CFrame.new(Vector3.new(0, 2, 8), Vector3.new(0, 0, 0))

TabViewport:Viewport({
	Object      = demoPart,
	Camera      = cam,
	Height      = 180,
	Interactive = true,
	Focused     = true,
})

TabViewport:Divider({ Title = "Code Display" })

TabViewport:Code({
	Title    = "Example Code",
	Language = "lua",
	Code     = [[local function greet(name)
    print("Hello, " .. name .. "!")
end

greet("Leviathan UI")

-- Supports full syntax highlighting
for i = 1, 10 do
    task.wait(0.1)
    greet("User " .. i)
end]],
})

TabViewport:Divider({ Title = "Colorpicker" })

TabViewport:Colorpicker({
	Title   = "Accent Color",
	Desc    = "Pick your favourite accent colour",
	Default = Color3.fromHex("#4F80FF"),
	Flag    = "AccentColor",
	Callback = function(color)
		print("Color:", color)
	end,
})

-- ═══════════════════════════════════════════
--  TAB 6: SECTIONS (expandable)
-- ═══════════════════════════════════════════
local TabSections = Window:Tab({ Title = "Sections", Icon = "layers" })

TabSections:Paragraph({
	Title = "Collapsible Sections",
	Desc  = "Click a section header to expand or collapse it.",
})

TabSections:Section({ Title = "Combat Settings", Desc = "Configure combat-related features", Opened = true }, function(S)
	S:Toggle({ Title = "Auto Block",   Default = true,  Callback = function(v) print("AutoBlock:", v) end })
	S:Toggle({ Title = "Auto Parry",   Default = false, Callback = function(v) print("AutoParry:", v) end })
	S:Slider({ Title = "Attack Delay", Min = 0, Max = 500, Default = 100, Suffix = " ms", Callback = function(v) print("Delay:", v) end })
end)

TabSections:Section({ Title = "Movement Settings", Desc = "Speed, jump, fly controls" }, function(S)
	S:Toggle({ Title = "Fly",           Default = false, Callback = function(v) print("Fly:", v) end })
	S:Toggle({ Title = "No Clip",       Default = false, Callback = function(v) print("NoClip:", v) end })
	S:Slider({ Title = "Fly Speed",     Min = 0, Max = 200, Default = 50, Callback = function(v) print("FlySpeed:", v) end })
end)

TabSections:Section({ Title = "Visual Settings" }, function(S)
	S:Toggle({ Title = "ESP",          Default = false, Callback = function(v) print("ESP:", v) end })
	S:Toggle({ Title = "Fullbright",   Default = false, Callback = function(v)
		game.Lighting.Brightness = v and 2 or 1
	end })
	S:Dropdown({
		Title   = "ESP Color",
		Options = { "Red", "Blue", "Green", "White", "Rainbow" },
		Default = "White",
		Callback = function(v) print("ESP color:", v) end,
	})
end)

-- Box section
TabSections:Section({ Title = "Box Section (border)", Box = true, BoxBorder = true, Opened = true }, function(S)
	S:Button({ Title = "Box Button", Callback = function() print("box!") end })
	S:Toggle({ Title = "Box Toggle", Default = false, Callback = function(v) print(v) end })
end)

-- ═══════════════════════════════════════════
--  TAB 7: NOTIFICATIONS
-- ═══════════════════════════════════════════
local TabNotifs = Window:Tab({ Title = "Notifs", Icon = "bell" })

TabNotifs:Paragraph({
	Title = "Notification Types",
	Desc  = "Click each button to fire the corresponding notification type.",
})

TabNotifs:Button({
	Title = "Info Notification",
	Icon  = "info",
	Variant = "White",
	Callback = function()
		WindUI:Notify({
			Title   = "Information",
			Content = "This is an informational notification with a blue accent.",
			Type    = "Info",
			Duration = 5,
		})
	end,
})

TabNotifs:Button({
	Title = "Success Notification",
	Icon  = "check-circle",
	Variant = "White",
	Callback = function()
		WindUI:Notify({
			Title   = "Success!",
			Content = "The operation completed without errors.",
			Type    = "Success",
			Duration = 5,
		})
	end,
})

TabNotifs:Button({
	Title = "Warning Notification",
	Icon  = "alert-triangle",
	Variant = "White",
	Callback = function()
		WindUI:Notify({
			Title   = "Warning",
			Content = "Something might not be right. Please double-check.",
			Type    = "Warning",
			Duration = 5,
		})
	end,
})

TabNotifs:Button({
	Title   = "Error Notification",
	Icon    = "x-circle",
	Variant = "White",
	Callback = function()
		WindUI:Notify({
			Title   = "Error",
			Content = "Something went wrong. Please try again.",
			Type    = "Error",
			Duration = 5,
		})
	end,
})

TabNotifs:Divider({ Title = "No Duration (manual close)" })

TabNotifs:Button({
	Title = "Persistent Notification",
	Variant = "White",
	Callback = function()
		WindUI:Notify({
			Title    = "Persistent",
			Content  = "This notification stays until you close it manually.",
			Type     = "Info",
			Duration = 0,
			CanClose = true,
		})
	end,
})

TabNotifs:Button({
	Title = "No Close Button",
	Variant = "White",
	Callback = function()
		WindUI:Notify({
			Title    = "Auto-dismiss in 3s",
			Content  = "No close button on this one.",
			Type     = "Success",
			Duration = 3,
			CanClose = false,
		})
	end,
})

-- ═══════════════════════════════════════════
--  TAB 8: THEME SWITCHER
-- ═══════════════════════════════════════════
local TabThemes = Window:Tab({ Title = "Themes", Icon = "palette" })

TabThemes:Paragraph({
	Title = "Leviathan Themes",
	Desc  = "33 themes total. Click any button to preview.",
})

local themes = {
	-- Original WindUI
	"Dark", "Light", "Rose", "Plant", "Red", "Indigo", "Sky", "Violet",
	"Amber", "Emerald", "Midnight", "Crimson", "MonokaiPro", "CottonCandy",
	"Mellowsi", "Rainbow",
	-- Leviathan exclusive
	"Ocean", "Blurple", "Matrix", "Frost", "Vampire", "Sand",
	"Cyberpunk", "Pastel", "Abyss", "Slate", "Sunset", "Nord",
	"Dracula", "Solarized", "TokyoNight", "Catppuccin", "OneDark",
}

TabThemes:Dropdown({
	Title   = "Select Theme",
	Options = themes,
	Default = "Dark",
	Callback = function(val)
		WindUI:SetTheme(val)
		WindUI:Notify({
			Title   = "Theme: " .. val,
			Type    = "Info",
			Duration = 2,
		})
	end,
})

TabThemes:Divider({ Title = "Quick Picks" })

local quickThemes = {
	{ name = "Dark",       icon = "moon"    },
	{ name = "Frost",      icon = "sun"     },
	{ name = "Blurple",    icon = "discord" },
	{ name = "Catppuccin", icon = "cat"     },
	{ name = "Dracula",    icon = "skull"   },
	{ name = "Nord",       icon = "snowflake" },
}
for _, t in ipairs(quickThemes) do
	TabThemes:Button({
		Title    = t.name,
		Variant  = "White",
		Callback = function()
			WindUI:SetTheme(t.name)
		end,
	})
end

-- ═══════════════════════════════════════════
--  TAB 9: STACKS (HStack / VStack / Group)
-- ═══════════════════════════════════════════
local TabStacks = Window:Tab({ Title = "Stacks", Icon = "columns" })

TabStacks:Paragraph({
	Title = "Layout Primitives",
	Desc  = "HStack, VStack, and Group allow flexible element layouts.",
})

TabStacks:Divider({ Title = "HStack — Horizontal" })

TabStacks:HStack({}, function(H)
	H:Button({ Title = "Left",   Variant = "White",   Callback = function() print("L") end })
	H:Button({ Title = "Center", Variant = "Primary", Callback = function() print("C") end })
	H:Button({ Title = "Right",  Variant = "White",   Callback = function() print("R") end })
end)

TabStacks:HStack({}, function(H)
	H:Toggle({ Title = "Toggle A", Default = false, Callback = function(v) print("A", v) end })
	H:Toggle({ Title = "Toggle B", Default = true,  Callback = function(v) print("B", v) end })
end)

TabStacks:Divider({ Title = "VStack — Vertical" })

TabStacks:VStack({}, function(V)
	V:Button({ Title = "Stack Item 1", Variant = "White", Callback = function() end })
	V:Button({ Title = "Stack Item 2", Variant = "White", Callback = function() end })
	V:Button({ Title = "Stack Item 3", Variant = "White", Callback = function() end })
end)

TabStacks:Divider({ Title = "Group" })

TabStacks:Group({ Title = "Grouped Controls" }, function(G)
	G:Toggle({ Title = "Group Toggle 1", Default = false, Callback = function(v) print(v) end })
	G:Slider({ Title = "Group Slider",   Min = 0, Max = 100, Default = 50, Callback = function(v) print(v) end })
	G:Input({ Title = "Group Input", Placeholder = "Type here...", Callback = function(v) print(v) end })
end)

-- ═══════════════════════════════════════════
--  WELCOME NOTIFICATION
-- ═══════════════════════════════════════════
task.delay(0.8, function()
	WindUI:Notify({
		Title   = "Leviathan UI Loaded",
		Content = "All " .. #themes .. " themes and every element type are ready.",
		Type    = "Success",
		Duration = 6,
	})
end)

task.delay(2.5, function()
	WindUI:Notify({
		Title   = "Tip",
		Content = "Open the Themes tab to preview all 33 themes.",
		Type    = "Info",
		Duration = 5,
	})
end)
