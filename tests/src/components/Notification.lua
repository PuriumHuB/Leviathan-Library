-- Leviathan UI — Notification (full rewrite, WindUI API-compatible)
-- Types: Info · Success · Warning · Error
-- Features: accent bar, type icon, progress bar, close button, queue

local Creator = require("../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local TypeConfig = {
	Info    = { Icon = "info",           Color = Color3.fromHex("#3B82F6") },
	Success = { Icon = "check-circle-2", Color = Color3.fromHex("#22C55E") },
	Warning = { Icon = "alert-triangle", Color = Color3.fromHex("#F59E0B") },
	Error   = { Icon = "x-circle",       Color = Color3.fromHex("#EF4444") },
}

local NotificationModule = {
	Size      = UDim2.new(0, 300, 1, -100 - 56),
	SizeLower = UDim2.new(0, 300, 1, -56),
	UICorner  = 18,
	UIPadding = 14,
	Holder    = nil,
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
	local P = NotificationModule.UIPadding
	local R = NotificationModule.UICorner

	-- resolve type
	local NType = Config.Type or "Info"
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

	-- ── Accent bar (left coloured stripe) ─────────────────────
	local AccentBar = New("Frame", {
		Size = UDim2.new(0, 3, 1, 0),
		BackgroundColor3 = TypeCfg.Color,
		BackgroundTransparency = 0,
		ZIndex = 5,
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, 999) }),
	})

	-- ── Type icon (from Creator.Icon / lucide) ─────────────────
	local TypeIcon
	do
		local iconData = Creator.Icon(TypeCfg.Icon)
		if iconData then
			TypeIcon = New("ImageLabel", {
				Size = UDim2.new(0, 18, 0, 18),
				BackgroundTransparency = 1,
				Image = iconData[1],
				ImageRectSize   = iconData[2].ImageRectSize,
				ImageRectOffset = iconData[2].ImageRectPosition,
				ImageColor3 = TypeCfg.Color,
				ZIndex = 5,
			})
		end
	end

	-- ── Custom icon (user-supplied) ────────────────────────────
	local Icon
	if Notification.Icon then
		Icon = Creator.Image(
			Notification.Icon,
			Notification.Title .. ":" .. Notification.Icon,
			0,
			Config.Window,
			"Notification",
			Notification.IconThemed
		)
		Icon.Size = UDim2.new(0, 26, 0, 26)
		Icon.Position = UDim2.new(0, P, 0, P)
	end

	-- ── Close button ───────────────────────────────────────────
	local CloseButton
	if Notification.CanClose then
		CloseButton = New("ImageButton", {
			Image           = Creator.Icon("x")[1],
			ImageRectSize   = Creator.Icon("x")[2].ImageRectSize,
			ImageRectOffset = Creator.Icon("x")[2].ImageRectPosition,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 16, 0, 16),
			Position = UDim2.new(1, -P, 0, P),
			AnchorPoint = Vector2.new(1, 0),
			ThemeTag = { ImageColor3 = "Text" },
			ImageTransparency = 0.4,
			ZIndex = 10,
		}, {
			New("TextButton", {
				Size = UDim2.new(1, 8, 1, 8),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Text = "",
			}),
		})
	end

	-- ── Duration / progress bar ────────────────────────────────
	local Duration = Creator.NewRoundFrame(R, "Squircle", {
		Size = UDim2.new(0, 0, 1, 0),
		ThemeTag = {
			ImageTransparency = "NotificationDurationTransparency",
			ImageColor3 = "NotificationDuration",
		},
	})

	local DurationFrame = New("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Name = "DurationFrame",
	}, {
		New("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, {
			Duration,
		}),
	})

	-- ── Icon + type icon row (top-left of text container) ──────
	local IconRow
	if TypeIcon then
		IconRow = New("Frame", {
			Size = UDim2.new(0, 0, 0, 18),
			AutomaticSize = "X",
			BackgroundTransparency = 1,
		}, {
			TypeIcon,
			New("UIListLayout", {
				FillDirection = "Horizontal",
				VerticalAlignment = "Center",
				Padding = UDim.new(0, 6),
			}),
		})
	end

	-- ── Text container ─────────────────────────────────────────
	local textOffsetX = (Notification.Icon and -28 - P) or 0
	local TextContainer = New("Frame", {
		Size = UDim2.new(1, textOffsetX, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		AutomaticSize = "Y",
	}, {
		New("UIPadding", {
			PaddingTop    = UDim.new(0, P),
			PaddingLeft   = UDim.new(0, P + 3 + 6),   -- 3px accent bar + 6px gap
			PaddingRight  = UDim.new(0, P),
			PaddingBottom = UDim.new(0, P),
		}),
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(0, 5),
		}),
		IconRow,
		New("TextLabel", {
			AutomaticSize  = "Y",
			Size = UDim2.new(1, CloseButton and -(16 + 6) or 0, 0, 0),
			TextWrapped    = true,
			TextXAlignment = "Left",
			RichText       = true,
			BackgroundTransparency = 1,
			TextSize       = 16,
			ThemeTag = {
				TextColor3   = "NotificationTitle",
				TextTransparency = "NotificationTitleTransparency",
			},
			Text     = Notification.Title,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		}),
		New("UIListLayout", {
			Padding = UDim.new(0, P / 3),
		}),
	})

	if Notification.Content then
		New("TextLabel", {
			AutomaticSize  = "Y",
			Size           = UDim2.new(1, 0, 0, 0),
			TextWrapped    = true,
			TextXAlignment = "Left",
			RichText       = true,
			BackgroundTransparency = 1,
			TextSize       = 14,
			ThemeTag = {
				TextColor3   = "NotificationContent",
				TextTransparency = "NotificationContentTransparency",
			},
			Text     = Notification.Content,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			Parent   = TextContainer,
		})
	end

	-- ── Card ───────────────────────────────────────────────────
	local Main = Creator.NewRoundFrame(R, "Squircle", {
		Size          = UDim2.new(1, 0, 0, 0),
		Position      = UDim2.new(2, 0, 1, 0),
		AnchorPoint   = Vector2.new(0, 1),
		AutomaticSize = "Y",
		ImageTransparency = 0.05,
		ThemeTag = { ImageColor3 = "Notification" },
	}, {
		-- bg layer 2
		Creator.NewRoundFrame(R, "Squircle", {
			Size = UDim2.new(1, 0, 1, 0),
			ThemeTag = {
				ImageColor3 = "Notification2",
				ImageTransparency = "Notification2Transparency",
			},
		}),
		DurationFrame,
		-- background image
		New("ImageLabel", {
			Name = "Background",
			Image = Notification.Background or "",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ScaleType = "Crop",
			ImageTransparency = Notification.BackgroundImageTransparency or 1,
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, R) }),
		}),
		-- accent bar sits inside the card on the left
		New("Frame", {
			Size = UDim2.new(0, 3, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			ZIndex = 4,
		}, {
			AccentBar,
			New("UICorner", { CornerRadius = UDim.new(0, R) }),
		}),
		TextContainer,
		Icon,
		CloseButton,
	})

	local MainContainer = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Parent = Config.Holder,
	}, {
		Main,
	})

	-- ── Close ──────────────────────────────────────────────────
	function Notification:Close()
		if not Notification.Closed then
			Notification.Closed = true
			Tween(MainContainer, 0.45, { Size = UDim2.new(1, 0, 0, -8) },
				Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			Tween(Main, 0.55, { Position = UDim2.new(2, 0, 1, 0) },
				Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			task.wait(0.45)
			MainContainer:Destroy()
		end
	end

	-- ── Slide in + timer ───────────────────────────────────────
	task.spawn(function()
		task.wait()
		Tween(MainContainer, 0.45, { Size = UDim2.new(1, 0, 0, Main.AbsoluteSize.Y) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.45, { Position = UDim2.new(0, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

		if Notification.Duration then
			Duration.Size = UDim2.new(0, Main.DurationFrame.AbsoluteSize.X, 1, 0)
			Tween(Main.DurationFrame.Frame, Notification.Duration,
				{ Size = UDim2.new(0, 0, 1, 0) },
				Enum.EasingStyle.Linear, Enum.EasingDirection.InOut):Play()
			task.wait(Notification.Duration)
			Notification:Close()
		end
	end)

	if CloseButton then
		Creator.AddSignal(CloseButton.TextButton.MouseButton1Click, function()
			Notification:Close()
		end)
	end

	return Notification
end

return NotificationModule
