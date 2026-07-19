-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Notification                   ║
-- ║   Queue · stack · progress · icon variants      ║
-- ╚══════════════════════════════════════════════════╝
local Creator = require("../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

-- ── Type → accent config ─────────────────────────────────────
local TypeConfig = {
	Info    = { Icon = "info",          Color = Creator.Colors.Info,    ThemeKey = "NotificationInfo"    },
	Success = { Icon = "check-circle",  Color = Creator.Colors.Success, ThemeKey = "NotificationSuccess" },
	Warning = { Icon = "alert-triangle",Color = Creator.Colors.Warning, ThemeKey = "NotificationWarning" },
	Error   = { Icon = "x-circle",      Color = Creator.Colors.Error,   ThemeKey = "NotificationError"   },
}

local NotificationModule = {
	UICorner           = 18,
	UIPadding          = 14,
	Holder             = nil,
	NotificationIndex  = 0,
	Notifications      = {},
	-- Queue: max visible at once
	MaxVisible         = 5,
	_ActiveCount       = 0,
}

-- ── Init: create holder frame ─────────────────────────────────
function NotificationModule.Init(Parent)
	local NotModule = { Lower = false }

	local function getSize()
		return NotModule.Lower
			and UDim2.new(0, 300, 1, -56)
			or  UDim2.new(0, 300, 1, -100 - 56)
	end

	function NotModule.SetLower(val)
		NotModule.Lower = val
		NotModule.Frame.Size = getSize()
	end

	NotModule.Frame = New("Frame", {
		Position           = UDim2.new(1, -116/4, 0, 56),
		AnchorPoint        = Vector2.new(1, 0),
		Size               = getSize(),
		Parent             = Parent,
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			HorizontalAlignment = "Center",
			SortOrder           = "LayoutOrder",
			VerticalAlignment   = "Bottom",
			Padding             = UDim.new(0, 8),
		}),
		New("UIPadding", {
			PaddingBottom = UDim.new(0, 116/4),
		}),
	})

	return NotModule
end

-- ── New: create a single notification ────────────────────────
function NotificationModule.New(Config)
	local P    = NotificationModule.UIPadding
	local R    = NotificationModule.UICorner

	local NType   = Config.Type or "Info"
	local TypeCfg = TypeConfig[NType] or TypeConfig.Info

	local Notification = {
		Title      = Config.Title    or "Notification",
		Content    = Config.Content  or nil,
		Icon       = Config.Icon     or TypeCfg.Icon,
		IconThemed = Config.IconThemed,
		Type       = NType,
		Duration   = Config.Duration ~= nil and Config.Duration or 5,
		Buttons    = Config.Buttons  or {},
		CanClose   = Config.CanClose ~= false,
		UIElements = {},
		Closed     = false,
	}

	NotificationModule.NotificationIndex = NotificationModule.NotificationIndex + 1
	NotificationModule.Notifications[NotificationModule.NotificationIndex] = Notification

	-- ── Accent bar (left edge colour) ──────────────────────────
	local AccentBar = New("Frame", {
		Size             = UDim2.new(0, 3, 1, -(P * 2)),
		Position         = UDim2.new(0, P/2, 0, P),
		BackgroundColor3 = Color3.fromHex(TypeCfg.Color),
		BackgroundTransparency = 0,
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, 999) }),
	})

	-- ── Type icon ───────────────────────────────────────────────
	local TypeIconFrame
	do
		local iconKey = Notification.Icon
		local iconData = Creator.Icon(iconKey)
		if iconData then
			TypeIconFrame = New("ImageLabel", {
				Size                   = UDim2.new(0, 20, 0, 20),
				BackgroundTransparency = 1,
				Image                  = iconData[1],
				ImageRectSize          = iconData[2].ImageRectSize,
				ImageRectOffset        = iconData[2].ImageRectPosition,
				ImageColor3            = Color3.fromHex(TypeCfg.Color),
			})
		end
	end

	-- ── Close button ────────────────────────────────────────────
	local CloseButton
	if Notification.CanClose then
		local xIcon = Creator.Icon("x")
		CloseButton = New("ImageButton", {
			Image                  = xIcon and xIcon[1] or "",
			ImageRectSize          = xIcon and xIcon[2].ImageRectSize  or Vector2.new(0,0),
			ImageRectOffset        = xIcon and xIcon[2].ImageRectPosition or Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size                   = UDim2.new(0, 14, 0, 14),
			Position               = UDim2.new(1, -P, 0, P),
			AnchorPoint            = Vector2.new(1, 0),
			ThemeTag               = { ImageColor3 = "Text" },
			ImageTransparency      = 0.5,
		}, {
			New("TextButton", {
				Size                   = UDim2.new(1, 10, 1, 10),
				BackgroundTransparency = 1,
				AnchorPoint            = Vector2.new(0.5, 0.5),
				Position               = UDim2.new(0.5, 0, 0.5, 0),
				Text                   = "",
			}),
		})
	end

	-- ── Progress bar ────────────────────────────────────────────
	local ProgressBar = Creator.NewRoundFrame(R, "Squircle", {
		Size         = UDim2.new(0, 0, 1, 0),
		ImageColor3  = Color3.fromHex(TypeCfg.Color),
		ImageTransparency = 0.65,
	})

	local ProgressClip = New("Frame", {
		Size                   = UDim2.new(1, 0, 0, 3),
		Position               = UDim2.new(0, 0, 1, -3),
		BackgroundTransparency = 1,
		ClipsDescendants       = true,
		Name                   = "ProgressClip",
	}, {
		ProgressBar,
	})

	-- ── Text area ───────────────────────────────────────────────
	local titleRightPad = Notification.CanClose and (14 + P + 6) or 0
	local titleLeftPad  = TypeIconFrame and (20 + 8) or 0

	local TitleLabel = New("TextLabel", {
		AutomaticSize          = "Y",
		Size                   = UDim2.new(1, -(titleRightPad + titleLeftPad), 0, 0),
		TextWrapped            = true,
		TextXAlignment         = "Left",
		RichText               = true,
		BackgroundTransparency = 1,
		TextSize               = Creator.Type.TitleMD,
		ThemeTag               = { TextColor3 = "NotificationTitle", TextTransparency = "NotificationTitleTransparency" },
		Text                   = Notification.Title,
		FontFace               = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
	})

	local TextRows = { TitleLabel }

	if Notification.Content then
		table.insert(TextRows, New("TextLabel", {
			AutomaticSize          = "Y",
			Size                   = UDim2.new(1, 0, 0, 0),
			TextWrapped            = true,
			TextXAlignment         = "Left",
			RichText               = true,
			BackgroundTransparency = 1,
			TextSize               = Creator.Type.BodyMD,
			ThemeTag               = { TextColor3 = "NotificationContent", TextTransparency = "NotificationContentTransparency" },
			Text                   = Notification.Content,
			FontFace               = Font.new(Creator.Font, Enum.FontWeight.Medium),
		}))
	end

	table.insert(TextRows, New("UIListLayout", {
		Padding = UDim.new(0, P/3),
	}))

	local TextContainer = New("Frame", {
		Size                   = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		AutomaticSize          = "Y",
	}, TextRows)

	-- ── Row: icon + text ────────────────────────────────────────
	local ContentRow = New("Frame", {
		Size                   = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		AutomaticSize          = "Y",
	}, {
		TypeIconFrame,
		TextContainer,
		New("UIListLayout", {
			FillDirection      = "Horizontal",
			VerticalAlignment  = "Top",
			Padding            = UDim.new(0, 8),
		}),
	})

	-- ── Main card ───────────────────────────────────────────────
	local Main = Creator.NewRoundFrame(R, "Squircle", {
		Size              = UDim2.new(1, 0, 0, 0),
		Position          = UDim2.new(2, 0, 1, 0),
		AnchorPoint       = Vector2.new(0, 1),
		AutomaticSize     = "Y",
		ImageTransparency = 0.05,
		ThemeTag          = { ImageColor3 = "Notification" },
	}, {
		-- Background layer 2
		Creator.NewRoundFrame(R, "Squircle", {
			Size     = UDim2.new(1, 0, 1, 0),
			ThemeTag = { ImageColor3 = "Notification2", ImageTransparency = "Notification2Transparency" },
		}),
		-- Background image
		New("ImageLabel", {
			Name                   = "Background",
			Image                  = Config.Background or "",
			BackgroundTransparency = 1,
			Size                   = UDim2.new(1, 0, 1, 0),
			ScaleType              = "Crop",
			ImageTransparency      = Config.BackgroundImageTransparency or 1,
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, R) }),
		}),
		-- Content padding wrapper
		New("Frame", {
			Size                   = UDim2.new(1, 0, 0, 0),
			AutomaticSize          = "Y",
			BackgroundTransparency = 1,
			Name                   = "Inner",
		}, {
			AccentBar,
			ContentRow,
			CloseButton,
			New("UIPadding", {
				PaddingTop    = UDim.new(0, P),
				PaddingLeft   = UDim.new(0, P + 3 + P/2),
				PaddingRight  = UDim.new(0, P),
				PaddingBottom = UDim.new(0, P),
			}),
			New("UIListLayout", {
				FillDirection = "Vertical",
				Padding       = UDim.new(0, 6),
			}),
		}),
		ProgressClip,
	})

	local MainContainer = New("Frame", {
		BackgroundTransparency = 1,
		Size                   = UDim2.new(1, 0, 0, 0),
		Parent                 = Config.Holder,
	}, {
		Main,
	})

	-- ── Close logic ─────────────────────────────────────────────
	function Notification:Close()
		if Notification.Closed then return end
		Notification.Closed = true
		Tween(MainContainer, 0.38, { Size = UDim2.new(1, 0, 0, -8) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.45, { Position = UDim2.new(2, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		task.wait(0.45)
		MainContainer:Destroy()
	end

	-- ── Spawn: slide in + progress timer ────────────────────────
	task.spawn(function()
		task.wait()
		local H = Main.AbsoluteSize.Y
		Tween(MainContainer, 0.42, { Size = UDim2.new(1, 0, 0, H) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.42, { Position = UDim2.new(0, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

		if Notification.Duration and Notification.Duration > 0 then
			local barW = Main.ProgressClip.AbsoluteSize.X
			ProgressBar.Size = UDim2.new(0, barW, 1, 0)
			Tween(ProgressBar, Notification.Duration, { Size = UDim2.new(0, 0, 1, 0) },
				Enum.EasingStyle.Linear):Play()
			task.wait(Notification.Duration)
			Notification:Close()
		end
	end)

	if CloseButton then
		Creator.AddSignal(CloseButton.TextButton.MouseButton1Click, function()
			Notification:Close()
		end)
		-- hover on close btn
		CloseButton.MouseEnter:Connect(function()
			Tween(CloseButton, 0.08, { ImageTransparency = 0.1 }):Play()
		end)
		CloseButton.MouseLeave:Connect(function()
			Tween(CloseButton, 0.08, { ImageTransparency = 0.5 }):Play()
		end)
	end

	return Notification
end

return NotificationModule
