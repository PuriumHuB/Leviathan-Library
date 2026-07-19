-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Button                         ║
-- ║   Hover · press · disabled · loading · states   ║
-- ╚══════════════════════════════════════════════════╝
local Button = {}

local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

--[[
  Variant values:
    "Primary"   — filled accent button (white text)
    "Secondary" — ghost/outline button
    "White"     — light filled button (dark text)
    "Danger"    — red filled button
    "Success"   — green filled button
  Extra flags:
    Loading  bool  — show spinner, block clicks
    Disabled bool  — grey out, block clicks
]]

local VariantColors = {
	Primary  = { bg = "Button",  text = nil,               textFixed = Color3.new(1,1,1) },
	Secondary= { bg = nil,       text = "Text",             textFixed = nil               },
	White    = { bg = nil,       text = nil,                textFixed = Color3.new(0,0,0) },
	Danger   = { bg = nil,       text = nil,                textFixed = Color3.new(1,1,1) },
	Success  = { bg = nil,       text = nil,                textFixed = Color3.new(1,1,1) },
}

function Button.New(Title, Icon, Callback, Variant, Parent, Dialog, FullRounded, Radius)
	Variant = Variant or "Primary"
	local R = Radius or (FullRounded and 999 or 10)

	-- Resolve solid bg colour for Danger/Success
	local bgColor
	if Variant == "Danger"  then bgColor = Color3.fromHex(Creator.Colors.Error)   end
	if Variant == "Success" then bgColor = Color3.fromHex(Creator.Colors.Success)  end
	if Variant == "White"   then bgColor = Color3.new(1, 1, 1)                     end

	-- ── Icon ────────────────────────────────────────────────────
	local IconBtnFrame
	if Icon and Icon ~= "" then
		local ic = Creator.Icon(Icon)
		if ic then
			IconBtnFrame = New("ImageLabel", {
				Image           = ic[1],
				ImageRectSize   = ic[2].ImageRectSize,
				ImageRectOffset = ic[2].ImageRectPosition,
				Size            = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				ImageColor3     = Variant == "White" and Color3.new(0,0,0) or nil,
				ThemeTag        = Variant ~= "White" and { ImageColor3 = "Icon" } or nil,
			})
		end
	end

	-- ── Loading spinner frame (hidden by default) ───────────────
	local SpinnerFrame = New("Frame", {
		Size                   = UDim2.new(0, 16, 0, 16),
		BackgroundTransparency = 1,
		Visible                = false,
		Name                   = "Spinner",
	}, {
		New("ImageLabel", {
			Size                   = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image                  = "rbxassetid://4965945816",
			ThemeTag               = { ImageColor3 = Variant == "Primary" and "White" or "Text" },
		}),
	})

	-- ── Text label ──────────────────────────────────────────────
	local vc = VariantColors[Variant] or VariantColors.Primary
	local TextLabel = New("TextLabel", {
		BackgroundTransparency = 1,
		FontFace               = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		Text                   = Title or "Button",
		ThemeTag               = vc.text and { TextColor3 = vc.text } or nil,
		TextColor3             = vc.textFixed or nil,
		AutomaticSize          = "XY",
		TextSize               = Creator.Type.TitleMD,
		Name                   = "Label",
	})

	-- ── Visual background squircle ──────────────────────────────
	local BgFrame = Creator.NewRoundFrame(R, "Squircle", {
		Name              = "Squircle",
		Size              = UDim2.new(1, 0, 1, 0),
		ThemeTag          = vc.bg and { ImageColor3 = vc.bg } or nil,
		ImageColor3       = bgColor,
		ImageTransparency = (Variant == "Primary" or bgColor) and 0
			or Variant == "Secondary" and 0.92
			or 0,
	})

	-- Hover overlay layer
	local HoverFrame = Creator.NewRoundFrame(R, "Squircle", {
		Name              = "HoverLayer",
		Size              = UDim2.new(1, 0, 1, 0),
		ImageColor3       = Variant == "White" and Color3.new(0,0,0) or Color3.new(1,1,1),
		ImageTransparency = 1,
	})

	-- Glass highlight
	local GlassFrame = Creator.NewRoundFrame(R, "SquircleGlass", {
		Name              = "Outline",
		Size              = UDim2.new(1, 1, 1, 1),
		AnchorPoint       = Vector2.new(0.5, 0.5),
		Position          = UDim2.new(0.5, 0, 0.5, 0),
		ThemeTag          = { ImageColor3 = "White" },
		ImageTransparency = Variant == "Primary" and 0.82 or 0.92,
	})

	-- Inner content frame (holds icon + text)
	local InnerFrame = Creator.NewRoundFrame(R, "Squircle", {
		Name              = "Frame",
		Size              = UDim2.new(1, 0, 1, 0),
		ThemeTag          = vc.text and { ImageColor3 = vc.text } or nil,
		ImageTransparency = 1,
	}, {
		New("UIPadding", {
			PaddingLeft  = UDim.new(0, 14),
			PaddingRight = UDim.new(0, 14),
		}),
		New("UIListLayout", {
			FillDirection      = "Horizontal",
			Padding            = UDim.new(0, 7),
			VerticalAlignment  = "Center",
			HorizontalAlignment = "Center",
		}),
		IconBtnFrame,
		SpinnerFrame,
		TextLabel,
	})

	-- UIScale for press animation
	local ScaleObj = New("UIScale", { Scale = 1, Name = "BtnScale" })

	local ButtonFrame = New("TextButton", {
		Size              = UDim2.new(0, 0, 1, 0),
		AutomaticSize     = "X",
		Parent            = Parent,
		BackgroundTransparency = 1,
		Name              = "LevButton",
	}, {
		BgFrame,
		HoverFrame,
		GlassFrame,
		InnerFrame,
		ScaleObj,
	})

	-- ── State ───────────────────────────────────────────────────
	local IsLoading  = false
	local IsDisabled = false

	local function setInteractable(v)
		ButtonFrame.Active = v
	end
	setInteractable(true)

	-- ── Animations ──────────────────────────────────────────────
	Creator.AddSignal(ButtonFrame.MouseEnter, function()
		if IsDisabled or IsLoading then return end
		Tween(HoverFrame, Creator.Anim.Fast, { ImageTransparency = 0.90 }):Play()
	end)
	Creator.AddSignal(ButtonFrame.MouseLeave, function()
		Tween(HoverFrame, Creator.Anim.Fast, { ImageTransparency = 1 }):Play()
		Tween(ScaleObj,   Creator.Anim.Fast, { Scale = 1 }):Play()
	end)
	Creator.AddSignal(ButtonFrame.MouseButton1Down, function()
		if IsDisabled or IsLoading then return end
		Tween(ScaleObj, Creator.Anim.Fast, { Scale = 0.96 },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
	end)
	Creator.AddSignal(ButtonFrame.MouseButton1Up, function()
		Creator.SpringTween(ScaleObj, { Scale = 1 }, 0.30):Play()
	end)

	Creator.AddSignal(ButtonFrame.MouseButton1Click, function()
		if IsDisabled or IsLoading then return end
		if Dialog then Dialog:Close()() end
		if Callback then Creator.SafeCallback(Callback) end
	end)

	-- ── Public API ───────────────────────────────────────────────
	local ButtonAPI = {}

	function ButtonAPI:SetLoading(v)
		IsLoading = v
		SpinnerFrame.Visible = v
		if IconBtnFrame then IconBtnFrame.Visible = not v end
		TextLabel.TextTransparency = v and 0.5 or 0
		setInteractable(not v and not IsDisabled)
		if v then
			-- rotate spinner
			local conn
			conn = game:GetService("RunService").Heartbeat:Connect(function(dt)
				if not v or not SpinnerFrame.Parent then conn:Disconnect() return end
				SpinnerFrame.Spinner.Rotation = (SpinnerFrame.Spinner.Rotation + dt * 220) % 360
			end)
		end
	end

	function ButtonAPI:SetDisabled(v)
		IsDisabled = v
		Tween(BgFrame, Creator.Anim.Normal, { ImageTransparency = v and 0.55 or
			((Variant == "Primary" or bgColor) and 0 or Variant == "Secondary" and 0.92 or 0) }):Play()
		Tween(TextLabel, Creator.Anim.Normal, { TextTransparency = v and 0.5 or 0 }):Play()
		setInteractable(not v and not IsLoading)
	end

	function ButtonAPI:SetTitle(text)
		TextLabel.Text = text
	end

	ButtonFrame._API = ButtonAPI
	return ButtonFrame
end

return Button
