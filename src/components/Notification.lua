-- Leviathan UI — Notification
-- Fixed: progress bar stays inside card, proper bottom anchor

local Creator = require("../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

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
		Position = UDim2.new(1, -116 / 4, 0, 56),
		AnchorPoint = Vector2.new(1, 0),
		Size = NotificationModule.Size,
		Parent = Parent,
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			HorizontalAlignment = "Center",
			SortOrder = "LayoutOrder",
			VerticalAlignment = "Bottom",
			Padding = UDim.new(0, 8),
		}),
		New("UIPadding", {
			PaddingBottom = UDim.new(0, 116 / 4),
		}),
	})

	return NotModule
end

function NotificationModule.New(Config)
	local P  = NotificationModule.UIPadding
	local R  = NotificationModule.UICorner

	local NType  = Config.Type or "Info"
	local TypeCfg = TypeConfig[NType] or TypeConfig.Info

	local Notification = {
		Title    = Config.Title    or "Notification",
		Content  = Config.Content  or nil,
		Icon     = Config.Icon     or nil,
		IconThemed = Config.IconThemed,
		Background = Config.Background,
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

	-- ── Type icon ──────────────────────────────────────────────
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

	-- ── User-supplied icon ─────────────────────────────────────
	local UserIcon
	if Notification.Icon then
		UserIcon = Creator.Image(
			Notification.Icon,
			Notification.Title .. ":" .. Notification.Icon,
			0, Config.Window, "Notification", Notification.IconThemed
		)
		UserIcon.Size = UDim2.new(0, 26, 0, 26)
		UserIcon.AnchorPoint = Vector2.new(0, 0.5)
		UserIcon.Position    = UDim2.new(0, P, 0.5, 0)
	end

	-- ── Close button ───────────────────────────────────────────
	local CloseButton
	if Notification.CanClose then
		local xData = Creator.Icon("x")
		CloseButton = New("ImageButton", {
			Image           = xData and xData[1] or "",
			ImageRectSize   = xData and xData[2].ImageRectSize or Vector2.new(0,0),
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

	-- ── Progress bar — fixed INSIDE card at bottom ─────────────
	-- DurationBar shrinks from full-width → 0 inside a ClipsDescendants container
	-- The container is 4px tall, pinned to the bottom of the card.
	local DurationBar = Creator.NewRoundFrame(4, "Squircle", {
		Size     = UDim2.new(1, 0, 1, 0),   -- start full width; tweened to 0
		ThemeTag = {
			ImageColor3        = "NotificationDuration",
			ImageTransparency  = "NotificationDurationTransparency",
		},
		Name = "Bar",
	})

	-- Clip frame keeps bar inside rounded corners
	local DurationClip = New("Frame", {
		Size             = UDim2.new(1, 0, 0, 4),
		Position         = UDim2.new(0, 0, 1, -4),   -- pinned to bottom of card
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name             = "DurationFrame",
		ZIndex           = 6,
	}, {
		DurationBar,
	})

	-- ── Accent bar — left edge ──────────────────────────────────
	local AccentBar = New("Frame", {
		Size             = UDim2.new(0, 3, 1, -P * 2),
		Position         = UDim2.new(0, 6, 0, P),
		BackgroundColor3 = TypeCfg.Color,
		BackgroundTransparency = 0,
		ZIndex           = 5,
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, 999) }),
	})

	-- ── Icon + title row ───────────────────────────────────────
	local titlePadRight = CloseButton and (14 + 8) or 0
	local iconRowChildren = {}
	if TypeIcon then table.insert(iconRowChildren, TypeIcon) end
	table.insert(iconRowChildren, New("TextLabel", {
		AutomaticSize  = "Y",
		Size           = UDim2.new(1, -titlePadRight, 0, 0),
		TextWrapped    = true,
		TextXAlignment = "Left",
		RichText       = true,
		BackgroundTransparency = 1,
		TextSize       = 15,
		ThemeTag       = {
			TextColor3       = "NotificationTitle",
			TextTransparency = "NotificationTitleTransparency",
		},
		Text     = Notification.Title,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		Name     = "Title",
	}))
	table.insert(iconRowChildren, New("UIListLayout", {
		FillDirection      = "Horizontal",
		VerticalAlignment  = "Center",
		Padding            = UDim.new(0, 6),
	}))

	local IconRow = New("Frame", {
		Size          = UDim2.new(1, 0, 0, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
	}, iconRowChildren)

	-- ── Content rows ───────────────────────────────────────────
	local textChildren = {
		New("UIPadding", {
			PaddingTop    = UDim.new(0, P),
			PaddingLeft   = UDim.new(0, P + 3 + 6),  -- 3px accent + gap
			PaddingRight  = UDim.new(0, P),
			PaddingBottom = UDim.new(0, P + 4),       -- a bit extra so bar doesn't overlap
		}),
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding       = UDim.new(0, 6),
		}),
		IconRow,
	}

	if Notification.Content then
		table.insert(textChildren, New("TextLabel", {
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
		}))
	end

	local TextContainer = New("Frame", {
		Size          = UDim2.new(1, UserIcon and -(26 + P + 4) or 0, 0, 0),
		Position      = UDim2.new(1, 0, 0, 0),
		AnchorPoint   = Vector2.new(1, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
	}, textChildren)

	-- ── Background image ───────────────────────────────────────
	local BgImage = New("ImageLabel", {
		Name  = "Background",
		Image = Notification.Background or "",
		BackgroundTransparency = 1,
		Size  = UDim2.new(1, 0, 1, 0),
		ScaleType = "Crop",
		ImageTransparency = Notification.BackgroundImageTransparency or 1,
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, R) }),
	})

	-- ── Card ───────────────────────────────────────────────────
	local Main = Creator.NewRoundFrame(R, "Squircle", {
		Size          = UDim2.new(1, 0, 0, 0),
		Position      = UDim2.new(2, 0, 1, 0),
		AnchorPoint   = Vector2.new(0, 1),
		AutomaticSize = "Y",
		ImageTransparency = 0.08,
		ClipsDescendants  = true,    -- ← keeps progress bar clipped to card shape
		ThemeTag          = { ImageColor3 = "Notification" },
	}, {
		-- Secondary bg
		Creator.NewRoundFrame(R, "Squircle", {
			Size     = UDim2.new(1, 0, 1, 0),
			ThemeTag = {
				ImageColor3       = "Notification2",
				ImageTransparency = "Notification2Transparency",
			},
		}),
		BgImage,
		AccentBar,
		TextContainer,
		UserIcon,
		CloseButton,
		DurationClip,    -- ← sits at the bottom, inside ClipsDescendants
	})

	local MainContainer = New("Frame", {
		BackgroundTransparency = 1,
		Size   = UDim2.new(1, 0, 0, 0),
		Parent = Config.Holder,
	}, {
		Main,
	})

	-- ── Close ──────────────────────────────────────────────────
	function Notification:Close()
		if Notification.Closed then return end
		Notification.Closed = true
		Tween(MainContainer, 0.40, { Size = UDim2.new(1, 0, 0, -6) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.48, { Position = UDim2.new(2, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		task.wait(0.48)
		if MainContainer and MainContainer.Parent then
			MainContainer:Destroy()
		end
	end

	-- ── Slide in ───────────────────────────────────────────────
	task.spawn(function()
		task.wait()
		local cardH = Main.AbsoluteSize.Y
		Tween(MainContainer, 0.42, { Size = UDim2.new(1, 0, 0, cardH) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.42, { Position = UDim2.new(0, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

		-- Progress bar
		if Notification.Duration and Notification.Duration > 0 then
			task.wait(0.42)
			if not Notification.Closed then
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
