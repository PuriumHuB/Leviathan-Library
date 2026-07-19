-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Tag                            ║
-- ║   Variants · icon support · removable           ║
-- ╚══════════════════════════════════════════════════╝
local Tag = {}

local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

--[[
  Variants:
    "Default"  — theme-tinted subtle pill
    "Solid"    — filled with accent colour
    "Outline"  — transparent bg, coloured border
    "Success"  / "Warning" / "Error" / "Info"
      — semantic status pills
]]

local VariantColor = {
	Default = nil,
	Solid   = Creator.Colors.Accent,
	Outline = Creator.Colors.Accent,
	Success = Creator.Colors.Success,
	Warning = Creator.Colors.Warning,
	Error   = Creator.Colors.Error,
	Info    = Creator.Colors.Info,
}

local R   = 999   -- pill shape
local PH  = 10    -- padding horizontal
local PV  = 4     -- padding vertical
local H   = 24    -- height

function Tag.New(Config, Parent, OnRemove)
	local label    = Config.Label   or Config.Text or "Tag"
	local variant  = Config.Variant or "Default"
	local icon     = Config.Icon
	local removable = Config.Removable == true

	local hexColor = VariantColor[variant]
	local solidColor = hexColor and Color3.fromHex(hexColor) or nil

	-- ── Optional icon ─────────────────────────────────────────
	local IconFrame
	if icon and icon ~= "" then
		local ic = Creator.Icon(icon)
		if ic then
			IconFrame = New("ImageLabel", {
				Size            = UDim2.new(0, 12, 0, 12),
				BackgroundTransparency = 1,
				Image           = ic[1],
				ImageRectSize   = ic[2].ImageRectSize,
				ImageRectOffset = ic[2].ImageRectPosition,
				ImageColor3     = solidColor or nil,
				ThemeTag        = not solidColor and { ImageColor3 = "Text" } or nil,
				ImageTransparency = not solidColor and 0.3 or 0,
			})
		end
	end

	-- ── Remove ×  button ──────────────────────────────────────
	local RemoveBtn
	if removable then
		local xIcon = Creator.Icon("x")
		RemoveBtn = New("ImageButton", {
			Size            = UDim2.new(0, 10, 0, 10),
			BackgroundTransparency = 1,
			Image           = xIcon and xIcon[1] or "",
			ImageRectSize   = xIcon and xIcon[2].ImageRectSize   or Vector2.new(0,0),
			ImageRectOffset = xIcon and xIcon[2].ImageRectPosition or Vector2.new(0,0),
			ImageColor3     = solidColor or nil,
			ThemeTag        = not solidColor and { ImageColor3 = "Text" } or nil,
			ImageTransparency = 0.35,
			Name            = "Remove",
		})
	end

	-- ── Text label ────────────────────────────────────────────
	local TextLabel = New("TextLabel", {
		BackgroundTransparency = 1,
		AutomaticSize          = "X",
		Size                   = UDim2.new(0, 0, 1, 0),
		TextXAlignment         = "Center",
		TextSize               = Creator.Type.Caption,
		FontFace               = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		Text                   = label,
		ImageColor3            = solidColor or nil,
		ThemeTag               = not solidColor and { TextColor3 = "Text" } or nil,
		TextColor3             = variant == "Solid" and Color3.new(1, 1, 1)
			or solidColor or nil,
		TextTransparency       = 0.1,
		Name                   = "Label",
	})

	-- ── Background ────────────────────────────────────────────
	local BgTransp
	if variant == "Solid" then
		BgTransp = 0
	elseif variant == "Outline" then
		BgTransp = 1
	else
		BgTransp = 0.85
	end

	local Bg = Creator.NewRoundFrame(R, "Squircle", {
		Size              = UDim2.new(0, 0, 0, H),
		AutomaticSize     = "X",
		ImageTransparency = BgTransp,
		ImageColor3       = solidColor,
		ThemeTag          = (not solidColor) and { ImageColor3 = "ElementBackground" } or nil,
		Parent            = Parent,
		Name              = "Tag",
	}, {
		-- Outline ring for Outline variant
		variant == "Outline" and Creator.NewRoundFrame(R, "SquircleOutline", {
			Size              = UDim2.new(1, 1, 1, 1),
			AnchorPoint       = Vector2.new(0.5, 0.5),
			Position          = UDim2.new(0.5, 0, 0.5, 0),
			ImageColor3       = solidColor,
			ImageTransparency = 0.45,
		}) or nil,
		-- Content row
		New("Frame", {
			BackgroundTransparency = 1,
			Size                   = UDim2.new(1, 0, 1, 0),
			AutomaticSize          = "X",
		}, {
			IconFrame,
			TextLabel,
			RemoveBtn,
			New("UIListLayout", {
				FillDirection      = "Horizontal",
				VerticalAlignment  = "Center",
				HorizontalAlignment = "Center",
				Padding            = UDim.new(0, 5),
			}),
			New("UIPadding", {
				PaddingLeft  = UDim.new(0, PH),
				PaddingRight = UDim.new(0, PH),
				PaddingTop   = UDim.new(0, PV),
				PaddingBottom = UDim.new(0, PV),
			}),
		}),
	})

	-- ── Remove animation ──────────────────────────────────────
	local TagAPI = {}

	function TagAPI:Remove()
		Tween(Bg, Creator.Anim.Normal, {
			Size = UDim2.new(0, 0, 0, 0),
			ImageTransparency = 1,
		}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		task.delay(Creator.Anim.Normal + 0.02, function()
			Bg:Destroy()
		end)
		if OnRemove then Creator.SafeCallback(OnRemove, label) end
	end

	function TagAPI:SetLabel(text)
		TextLabel.Text = text
	end

	if RemoveBtn then
		RemoveBtn.MouseEnter:Connect(function()
			Tween(RemoveBtn, Creator.Anim.Fast, { ImageTransparency = 0.05 }):Play()
		end)
		RemoveBtn.MouseLeave:Connect(function()
			Tween(RemoveBtn, Creator.Anim.Fast, { ImageTransparency = 0.35 }):Play()
		end)
		Creator.AddSignal(RemoveBtn.MouseButton1Click, function()
			TagAPI:Remove()
		end)
	end

	Bg._API = TagAPI
	return Bg, TagAPI
end

return Tag
