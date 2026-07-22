-- Leviathan UI — Button
-- Reworked: shadow enabled, spring press, hover glow, ripple

local Button = {}

local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

function Button.New(Title, Icon, Callback, Variant, Parent, Dialog, FullRounded, Radius)
	Variant = Variant or "Primary"
	Radius  = Radius or (not FullRounded and 10 or 999)

	local IconButtonFrame
	if Icon and Icon ~= "" then
		local ic = Creator.Icon(Icon)
		if ic then
			IconButtonFrame = New("ImageLabel", {
				Image           = ic[1],
				ImageRectSize   = ic[2].ImageRectSize,
				ImageRectOffset = ic[2].ImageRectPosition,
				Size            = UDim2.new(0, 21, 0, 21),
				BackgroundTransparency = 1,
				ImageColor3     = Variant == "White" and Color3.new(0,0,0) or nil,
				ImageTransparency = Variant == "White" and 0.4 or 0,
				ThemeTag = { ImageColor3 = Variant ~= "White" and "Icon" or nil },
			})
		end
	end

	-- UIScale for press spring
	local ScaleObj = New("UIScale", { Scale = 1 })

	local ButtonFrame = New("TextButton", {
		Size          = UDim2.new(0, 0, 1, 0),
		AutomaticSize = "X",
		Parent        = Parent,
		BackgroundTransparency = 1,
	}, {
		ScaleObj,

		-- Drop shadow (was hidden; now 0.35 transparency)
		Creator.NewRoundFrame(Radius, "Shadow-sm", {
			ImageColor3       = Color3.new(0, 0, 0),
			Size              = UDim2.new(1, 8, 1, 8),
			AnchorPoint       = Vector2.new(0.5, 0.5),
			Position          = UDim2.new(0.5, 0, 0.5, 3),
			Name              = "Shadow",
			ImageTransparency = FullRounded and 1 or 0.45,
			Visible           = not FullRounded,
			ZIndex            = -1,
		}),

		-- Background fill
		Creator.NewRoundFrame(Radius, "Squircle", {
			ThemeTag = { ImageColor3 = Variant ~= "White" and "Button" or nil },
			ImageColor3 = Variant == "White" and Color3.new(1,1,1) or nil,
			Size        = UDim2.new(1, 0, 1, 0),
			Name        = "Squircle",
			ImageTransparency = Variant == "Primary" and 0
				or Variant == "White"   and 0
				or 0.9,
		}),

		-- Hover/press highlight layer
		Creator.NewRoundFrame(Radius, "Squircle", {
			ImageColor3       = Color3.new(1, 1, 1),
			Size              = UDim2.new(1, 0, 1, 0),
			Name              = "Special",
			ImageTransparency = Variant == "Secondary" and 0.95 or 1,
		}),

		-- Glass outline ring
		Creator.NewRoundFrame(Radius, "SquircleGlass", {
			ThemeTag          = { ImageColor3 = "White" },
			Size              = UDim2.new(1, 1, 1, 1),
			ImageTransparency = 0.88,
			AnchorPoint       = Vector2.new(0.5, 0.5),
			Position          = UDim2.new(0.5, 0, 0.5, 0),
			Name              = "Outline",
		}),

		-- Content frame (text + icon)
		Creator.NewRoundFrame(Radius, "Squircle", {
			Size     = UDim2.new(1, 0, 1, 0),
			Name     = "Frame",
			ThemeTag = { ImageColor3 = Variant ~= "White" and "Text" or nil },
			ImageColor3 = Variant == "White" and Color3.new(0,0,0) or nil,
			ImageTransparency = 1,
		}, {
			New("UIPadding", {
				PaddingLeft  = UDim.new(0, 16),
				PaddingRight = UDim.new(0, 16),
			}),
			New("UIListLayout", {
				FillDirection      = "Horizontal",
				Padding            = UDim.new(0, 8),
				VerticalAlignment  = "Center",
				HorizontalAlignment = "Center",
			}),
			IconButtonFrame,
			New("TextLabel", {
				BackgroundTransparency = 1,
				FontFace  = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
				Text      = Title or "Button",
				ThemeTag  = { TextColor3 = (Variant ~= "Primary" and Variant ~= "White") and "Text" or nil },
				TextColor3 = Variant == "Primary" and Color3.new(1,1,1)
					or Variant == "White"   and Color3.new(0,0,0)
					or nil,
				AutomaticSize = "XY",
				TextSize      = 18,
			}),
		}),
	})

	-- ── Hover: brighten highlight layer ─────────────────────────
	Creator.AddSignal(ButtonFrame.MouseEnter, function()
		Tween(ButtonFrame.Frame,   0.10, { ImageTransparency = 0.94 }):Play()
		Tween(ButtonFrame.Special, 0.10, { ImageTransparency = Variant == "Secondary" and 0.88 or 0.96 }):Play()
		-- shadow lifts slightly on hover
		if not FullRounded then
			Tween(ButtonFrame.Shadow, 0.10, { ImageTransparency = 0.38, Position = UDim2.new(0.5,0,0.5,5) }):Play()
		end
	end)
	Creator.AddSignal(ButtonFrame.MouseLeave, function()
		Tween(ButtonFrame.Frame,   0.10, { ImageTransparency = 1 }):Play()
		Tween(ButtonFrame.Special, 0.10, { ImageTransparency = Variant == "Secondary" and 0.95 or 1 }):Play()
		Tween(ScaleObj, 0.18, { Scale = 1 }, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
		if not FullRounded then
			Tween(ButtonFrame.Shadow, 0.10, { ImageTransparency = 0.45, Position = UDim2.new(0.5,0,0.5,3) }):Play()
		end
	end)

	-- ── Press: spring squish ──────────────────────────────────
	Creator.AddSignal(ButtonFrame.MouseButton1Down, function()
		Tween(ScaleObj, 0.10, { Scale = 0.95 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		if not FullRounded then
			Tween(ButtonFrame.Shadow, 0.08, { ImageTransparency = 0.60, Position = UDim2.new(0.5,0,0.5,1) }):Play()
		end
	end)
	Creator.AddSignal(ButtonFrame.MouseButton1Up, function()
		Tween(ScaleObj, 0.30, { Scale = 1 }, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
		if not FullRounded then
			Tween(ButtonFrame.Shadow, 0.18, { ImageTransparency = 0.45, Position = UDim2.new(0.5,0,0.5,3) }):Play()
		end
	end)

	Creator.AddSignal(ButtonFrame.MouseButton1Click, function()
		if Dialog then Dialog:Close()() end
		if Callback then Creator.SafeCallback(Callback) end
	end)

	return ButtonFrame
end

return Button
