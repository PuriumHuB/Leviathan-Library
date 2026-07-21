-- Leviathan UI — Notification (fixed progress bar position)
-- Bar is now the LAST child in a vertical layout inside the card,
-- so AutomaticSize never misplaces it.

local Creator = require("../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

local TypeConfig = {
	Info    = { Icon = "info",            Color = Color3.fromHex("#3B82F6") },
	Success = { Icon = "check-circle-2",  Color = Color3.fromHex("#22C55E") },
	Warning = { Icon = "alert-triangle",  Color = Color3.fromHex("#F59E0B") },
	Error   = { Icon = "x-circle",        Color = Color3.fromHex("#EF4444") },
}

local NotificationModule = {
	Size      = UDim2.new(0, 300, 1, -100 - 56),
	SizeLower = UDim2.new(0, 300, 1, -56),
	UICorner  = 16,
	UIPadding = 14,
	NotificationIndex = 0,
	Notifications = {},
}

function NotificationModule.Init(Parent)
	local NotModule = { Lower = false }

	function NotModule.SetLower(val)
		NotModule.Lower = val
		NotModule.Frame.Size = val and NotificationModule.SizeLower or NotificationModule.Size
	end

	NotModule.Frame = New("Frame", {
		Position           = UDim2.new(1, -116 / 4, 0, 56),
		AnchorPoint        = Vector2.new(1, 0),
		Size               = NotificationModule.Size,
		Parent             = Parent,
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			HorizontalAlignment = "Center",
			SortOrder           = "LayoutOrder",
			VerticalAlignment   = "Bottom",
			Padding             = UDim.new(0, 8),
		}),
		New("UIPadding", { PaddingBottom = UDim.new(0, 116 / 4) }),
	})

	return NotModule
end

function NotificationModule.New(Config)
	local P  = NotificationModule.UIPadding
	local R  = NotificationModule.UICorner

	local NType   = Config.Type or "Info"
	local TypeCfg = TypeConfig[NType] or TypeConfig.Info

	local Notification = {
		Title    = Config.Title    or "Notification",
		Content  = Config.Content  or nil,
		Icon     = Config.Icon     or nil,
		IconThemed        = Config.IconThemed,
		Background        = Config.Background,
		BackgroundImageTransparency = Config.BackgroundImageTransparency,
		Type     = NType,
		Duration = Config.Duration ~= nil and Config.Duration or 5,
		Buttons  = Config.Buttons  or {},
		CanClose = Config.CanClose ~= false,
		UIElements = {},
		Closed   = false,
	}

	NotificationModule.NotificationIndex = NotificationModule.NotificationIndex + 1
	NotificationModule.Notifications[NotificationModule.NotificationIndex] = Notification

	-- ── Accent bar — left edge coloured stripe ─────────────────
	local AccentBar = New("Frame", {
		Size             = UDim2.new(0, 3, 1, 0),
		Position         = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = TypeCfg.Color,
		BackgroundTransparency = 0,
		ZIndex           = 5,
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, 999) }),
	})

	-- ── Type icon ───────────────────────────────────────────────
	local TypeIcon
	do
		local iconData = Creator.Icon(TypeCfg.Icon)
		if iconData then
			TypeIcon = New("ImageLabel", {
				Size            = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				Image           = iconData[1],
				ImageRectSize   = iconData[2].ImageRectSize,
				ImageRectOffset = iconData[2].ImageRectPosition,
				ImageColor3     = TypeCfg.Color,
			})
		end
	end

	-- ── User icon ───────────────────────────────────────────────
	local UserIcon
	if Notification.Icon then
		UserIcon = Creator.Image(
			Notification.Icon,
			Notification.Title .. ":" .. Notification.Icon,
			0, Config.Window, "Notification", Notification.IconThemed
		)
		UserIcon.Size = UDim2.new(0, 26, 0, 26)
	end

	-- ── Close button ────────────────────────────────────────────
	local CloseButton
	if Notification.CanClose then
		local xData = Creator.Icon("x")
		CloseButton = New("ImageButton", {
			Image           = xData and xData[1] or "",
			ImageRectSize   = xData and xData[2].ImageRectSize   or Vector2.new(0,0),
			ImageRectOffset = xData and xData[2].ImageRectPosition or Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size            = UDim2.new(0, 14, 0, 14),
			Position        = UDim2.new(1, -P, 0, P),
			AnchorPoint     = Vector2.new(1, 0),
			ThemeTag        = { ImageColor3 = "Text" },
			ImageTransparency = 0.45,
			ZIndex          = 10,
		}, {
			New("TextButton", {
				Size = UDim2.new(1, 10, 1, 10),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position    = UDim2.new(0.5, 0, 0.5, 0),
				Text        = "",
			}),
		})
	end

	-- ── Title row (icon + text) ──────────────────────────────────
	local titlePadRight = CloseButton and (14 + 8) or 0

	local iconRowChildren = {}
	if TypeIcon then table.insert(iconRowChildren, TypeIcon) end
	table.insert(iconRowChildren, New("TextLabel", {
		AutomaticSize   = "Y",
		Size            = UDim2.new(1, -titlePadRight, 0, 0),
		TextWrapped     = true,
		TextXAlignment  = "Left",
		RichText        = true,
		BackgroundTransparency = 1,
		TextSize        = 15,
		ThemeTag        = {
			TextColor3       = "NotificationTitle",
			TextTransparency = "NotificationTitleTransparency",
		},
		Text     = Notification.Title,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		Name     = "Title",
	}))
	table.insert(iconRowChildren, New("UIListLayout", {
		FillDirection     = "Horizontal",
		VerticalAlignment = "Center",
		Padding           = UDim.new(0, 6),
	}))

	local IconRow = New("Frame", {
		Size          = UDim2.new(1, 0, 0, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
	}, iconRowChildren)

	-- ── Body rows ────────────────────────────────────────────────
	local bodyChildren = {
		New("UIPadding", {
			PaddingTop    = UDim.new(0, P),
			PaddingLeft   = UDim.new(0, P + 3 + 6),
			PaddingRight  = UDim.new(0, P),
			PaddingBottom = UDim.new(0, P),
		}),
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding       = UDim.new(0, 6),
			SortOrder     = "LayoutOrder",
		}),
		IconRow,
	}

	if Notification.Content then
		table.insert(bodyChildren, New("TextLabel", {
			AutomaticSize  = "Y",
			Size           = UDim2.new(1, 0, 0, 0),
			TextWrapped    = true,
			TextXAlignment = "Left",
			RichText       = true,
			BackgroundTransparency = 1,
			TextSize       = 13,
			ThemeTag       = {
				TextColor3       = "NotificationContent",
				TextTransparency = "NotificationContentTransparency",
			},
			Text     = Notification.Content,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			LayoutOrder = 1,
		}))
	end

	local BodyFrame = New("Frame", {
		Size          = UDim2.new(1, UserIcon and -(26 + P + 4) or 0, 0, 0),
		Position      = UDim2.new(1, 0, 0, 0),
		AnchorPoint   = Vector2.new(1, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		LayoutOrder   = 1,
	}, bodyChildren)

	-- ── Progress bar ─────────────────────────────────────────────
	-- Sits as the LAST child in a vertical UIListLayout inside the card.
	-- This way its position is determined by the layout engine, not
	-- a manual UDim2.new(0,0,1,-4) which breaks with AutomaticSize.
	local DurationBar = New("Frame", {
		Size             = UDim2.new(1, 0, 1, 0),  -- starts full width
		BackgroundTransparency = 0,
		BackgroundColor3 = TypeCfg.Color,
		Name             = "Bar",
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, 4) }),
		New("UIGradient", {
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0,   0.30),
				NumberSequenceKeypoint.new(0.5, 0.10),
				NumberSequenceKeypoint.new(1,   0.30),
			}),
		}),
	})

	-- 5px tall clip frame — part of the layout, NOT absolutely positioned
	local DurationClip = New("Frame", {
		Size             = UDim2.new(1, 0, 0, 5),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder      = 99,    -- always last
		Name             = "DurationClip",
	}, {
		DurationBar,
	})

	-- ── Card outer frame ─────────────────────────────────────────
	-- Use a vertical UIListLayout to stack BodyFrame + DurationClip.
	-- NO AutomaticSize on the outer squircle — we size it from the
	-- inner layout's AbsoluteContentSize so the position stays fixed.
	local Inner = New("Frame", {
		Size          = UDim2.new(1, 0, 0, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Name          = "Inner",
	}, {
		New("UIListLayout", {
			FillDirection = "Vertical",
			SortOrder     = "LayoutOrder",
			Padding       = UDim.new(0, 0),
		}),
		BodyFrame,
		DurationClip,
	})

	local Main = Creator.NewRoundFrame(R, "Squircle", {
		Size          = UDim2.new(1, 0, 0, 0),
		Position      = UDim2.new(2, 0, 1, 0),
		AnchorPoint   = Vector2.new(0, 1),
		AutomaticSize = "Y",
		ImageTransparency = 0.08,
		ClipsDescendants  = false,
		ThemeTag          = { ImageColor3 = "Notification" },
	}, {
		-- secondary bg
		Creator.NewRoundFrame(R, "Squircle", {
			Size     = UDim2.new(1, 0, 1, 0),
			ThemeTag = {
				ImageColor3       = "Notification2",
				ImageTransparency = "Notification2Transparency",
			},
		}),
		-- background image
		New("ImageLabel", {
			Name  = "Background",
			Image = Notification.Background or "",
			BackgroundTransparency = 1,
			Size  = UDim2.new(1, 0, 1, 0),
			ScaleType = "Crop",
			ImageTransparency = Notification.BackgroundImageTransparency or 1,
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, R) }),
		}),
		AccentBar,
		Inner,
		UserIcon,
		CloseButton,
	})

	local MainContainer = New("Frame", {
		BackgroundTransparency = 1,
		Size   = UDim2.new(1, 0, 0, 0),
		Parent = Config.Holder,
	}, { Main })

	-- ── Close ────────────────────────────────────────────────────
	function Notification:Close()
		if Notification.Closed then return end
		Notification.Closed = true
		Tween(MainContainer, 0.40, { Size = UDim2.new(1, 0, 0, -6) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.48, { Position = UDim2.new(2, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		task.wait(0.48)
		if MainContainer and MainContainer.Parent then MainContainer:Destroy() end
	end

	-- ── Slide in + progress ──────────────────────────────────────
	task.spawn(function()
		task.wait()
		local cardH = Main.AbsoluteSize.Y
		Tween(MainContainer, 0.42, { Size = UDim2.new(1, 0, 0, cardH) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.42, { Position = UDim2.new(0, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

		if Notification.Duration and Notification.Duration > 0 then
			task.wait(0.42)
			if not Notification.Closed then
				-- Shrink bar from full clip width to 0
				local clipW = DurationClip.AbsoluteSize.X
				DurationBar.Size = UDim2.new(0, clipW, 1, 0)
				Tween(DurationBar, Notification.Duration, { Size = UDim2.new(0, 0, 1, 0) },
					Enum.EasingStyle.Linear):Play()
				task.wait(Notification.Duration)
				Notification:Close()
			end
		end
	end)

	if CloseButton then
		Creator.AddSignal(CloseButton.TextButton.MouseButton1Click, function()
			Notification:Close()
		end)
		CloseButton.MouseEnter:Connect(function()
			Tween(CloseButton, 0.08, { ImageTransparency = 0.05 }):Play()
		end)
		CloseButton.MouseLeave:Connect(function()
			Tween(CloseButton, 0.08, { ImageTransparency = 0.45 }):Play()
		end)
	end

	return Notification
end

return NotificationModule
