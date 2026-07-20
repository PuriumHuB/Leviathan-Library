-- ╔══════════════════════════════════════════════════════════════╗
-- ║              Leviathan UI — Example.lua                     ║
-- ║  Showcases every rewritten component.                      ║
-- ║  Load with: loadstring(game:HttpGet("..."))()              ║
-- ╚══════════════════════════════════════════════════════════════╝

local LeviathanUI = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/YourName/LeviathanUI/main/src/Init.lua"
))()

-- ── Window ───────────────────────────────────────────────────
local Window = LeviathanUI:CreateWindow({
	Title       = "Leviathan UI",
	SubTitle    = "Premium Roblox Interface",
	TabWidth    = 160,
	Size        = UDim2.fromOffset(580, 460),
	Acrylic     = true,
	Theme       = "Dark",
	Transparent = true,
	Debug       = false,
})

-- ── Tab 1: Buttons ───────────────────────────────────────────
local TabMain = Window:Tab({
	Title = "Buttons",
	Icon  = "mouse-pointer-click",
})

local SectionA = TabMain:Section({
	Title    = "Button Variants",
	Subtitle = "Primary · Success · Danger · Loading",
})

SectionA:Button({
	Title    = "Primary Button",
	Variant  = "Primary",
	Callback = function()
		LeviathanUI:Notify({
			Title   = "Primary clicked",
			Type    = "Info",
			Duration = 3,
		})
	end,
})

SectionA:Button({
	Title    = "Success Button",
	Variant  = "Success",
	Callback = function()
		LeviathanUI:Notify({
			Title   = "Action completed",
			Content = "Everything went well.",
			Type    = "Success",
			Duration = 4,
		})
	end,
})

SectionA:Button({
	Title    = "Danger Button",
	Variant  = "Danger",
	Callback = function()
		LeviathanUI:Notify({
			Title   = "Warning",
			Content = "This action is destructive.",
			Type    = "Error",
			Duration = 5,
		})
	end,
})

SectionA:Button({
	Title    = "Loading Button",
	Variant  = "Primary",
	Callback = function(btn)
		if btn and btn._API then
			btn._API:SetLoading(true)
			task.delay(2.5, function()
				btn._API:SetLoading(false)
			end)
		end
	end,
})

-- ── Tab 2: Controls ──────────────────────────────────────────
local TabControls = Window:Tab({
	Title = "Controls",
	Icon  = "sliders-horizontal",
})

local SectionToggles = TabControls:Section({
	Title    = "Toggles",
	Subtitle = "Smooth pill switch",
})

SectionToggles:Toggle({
	Title   = "Enable Feature",
	Default = true,
	Callback = function(value)
		print("Toggle:", value)
	end,
})

SectionToggles:Toggle({
	Title   = "Dark Mode",
	Default = false,
	Callback = function(value)
		LeviathanUI:SetTheme(value and "Dark" or "Light")
	end,
})

local SectionDropdown = TabControls:Section({
	Title = "Dropdown",
})

SectionDropdown:Dropdown({
	Title   = "Select Server Region",
	Options = { "US East", "US West", "EU Central", "Asia Pacific", "South America" },
	Default = "US East",
	Callback = function(value)
		print("Region:", value)
	end,
})

SectionDropdown:Dropdown({
	Title   = "Select Multiple",
	Options = { "Feature A", "Feature B", "Feature C", "Feature D" },
	Multi   = true,
	Callback = function(value)
		print("Multi:", value)
	end,
})

-- ── Tab 3: Display ───────────────────────────────────────────
local TabDisplay = Window:Tab({
	Title = "Display",
	Icon  = "layout",
})

local SectionPara = TabDisplay:Section({
	Title = "Paragraph",
})

SectionPara:Paragraph({
	Title   = "Leviathan UI",
	Content = "A premium modern Roblox UI framework with Apple, Discord, and Fluent Design aesthetics. Built for clarity, speed, and a great developer experience.",
	Mode    = "Title",
})

SectionPara:Paragraph({
	Content = "This paragraph is in Description mode — smaller text, lighter weight, ideal for contextual hints or instructional copy beneath a form.",
	Mode    = "Description",
})

local SectionTags = TabDisplay:Section({
	Title = "Tags",
})

SectionTags:Tag({ Label = "Info",    Variant = "Info"    })
SectionTags:Tag({ Label = "Success", Variant = "Success" })
SectionTags:Tag({ Label = "Warning", Variant = "Warning" })
SectionTags:Tag({ Label = "Error",   Variant = "Error"   })
SectionTags:Tag({ Label = "Removable", Variant = "Solid", Removable = true,
	OnRemove = function(lbl) print("Removed:", lbl) end })

-- ── Tab 4: Viewport ──────────────────────────────────────────
local TabViewport = Window:Tab({
	Title = "Viewport",
	Icon  = "box",
})

local SectionVP = TabViewport:Section({
	Title    = "3D Viewport",
	Subtitle = "Auto-fit camera · auto-rotate",
})

SectionVP:Viewport({
	Width       = 200,
	Height      = 160,
	AutoRotate  = true,
	RotateSpeed = 25,
	Model       = workspace:FindFirstChildOfClass("Model"),
})

-- ── Notification stress test ──────────────────────────────────
task.delay(1, function()
	LeviathanUI:Notify({
		Title   = "Welcome to Leviathan UI",
		Content = "Everything loaded successfully.",
		Type    = "Success",
		Duration = 5,
	})
end)

task.delay(2.5, function()
	LeviathanUI:Notify({
		Title   = "Tip",
		Content = "Try hovering over buttons and toggles.",
		Type    = "Info",
		Duration = 4,
	})
end)
