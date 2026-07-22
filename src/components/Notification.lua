-- Leviathan UI — Notification
-- Near-original WindUI structure, lowered position, 3 max visible,
-- Leviathan additions: type accent colour on progress bar + left stripe

local Creator = require("../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local TypeConfig = {
	Info    = { Color = Color3.fromHex("#3B82F6"), Icon = "info"           },
	Success = { Color = Color3.fromHex("#22C55E"), Icon = "check-circle-2" },
	Warning = { Color = Color3.fromHex("#F59E0B"), Icon = "alert-triangle"  },
	Error   = { Color = Color3.fromHex("#EF4444"), Icon = "x-circle"        },
}

local NotificationModule = {
	-- Lowered: was -100-56, now -56-20 so it sits near the bottom
	Size      = UDim2.new(0, 300, 1, -56 - 20),
	SizeLower = UDim2.new(0, 300, 1, -20),
	UICorner  = 18,
	UIPadding = 14,
	MaxVisible = 3,   -- only 3 at once
	NotificationIndex = 0,
	Notifications = {},
	ActiveCount = 0,
}

function NotificationModule.Init(Parent)
	local NotModule = { Lower = false }

	function NotModule.SetLower(val)
		NotModule.Lower = val
		NotModule.Frame.Size = val and NotificationModule.SizeLower or NotificationModule.Size
	end

	NotModule.Frame = New("Frame", {
		Position   = UDim2.new(1, -116 / 4, 0, 56),
		AnchorPoint = Vector2.new(1, 0),
		Size       = NotificationModule.Size,
		Parent     = Parent,
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			HorizontalAlignment = "Center",
			SortOrder          = "LayoutOrder",
			VerticalAlignment  = "Bottom",
			Padding            = UDim.new(0, 8),
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

	local NType   = Config.Type or "Info"
	local TypeCfg = TypeConfig[NType] or TypeConfig.Info

	local Notification = {
		Title    = Config.Title    or "Notification",
		Content  = Config.Content  or nil,
		Icon     = Config.Icon     or nil,
		IconThemed = Config.IconThemed,
		Background = Config.Background,
		BackgroundImageTransparency = Config.BackgroundImageTransparency,
		Duration = Config.Duration ~= nil and Config.Duration or 5,
		Buttons  = Config.Buttons  or {},
		CanClose = Config.CanClose ~= false,
		UIElements = {},
		Closed   = false,
	}

	NotificationModule.NotificationIndex = NotificationModule.NotificationIndex + 1
	NotificationModule.Notifications[NotificationModule.NotificationIndex] = Notification

	-- If already at max, close the oldest open one
	NotificationModule.ActiveCount = (NotificationModule.ActiveCount or 0) + 1
	if NotificationModule.ActiveCount > NotificationModule.MaxVisible then
		-- find oldest unclosed
		for i = 1, NotificationModule.NotificationIndex - 1 do
			local old = NotificationModule.Notifications[i]
			if old and not old.Closed then
				old:Close()
				break
			end
		end
	end

	-- Icon
	local Icon
	if Notification.Icon then
		Icon = Creator.Image(
			Notification.Icon,
			Notification.Title .. ":" .. Notification.Icon,
			0, Config.Window, "Notification", Notification.IconThemed
		)
		Icon.Size     = UDim2.new(0, 26, 0, 26)
		Icon.Position = UDim2.new(0, P, 0, P)
	end

	-- Close button
	local CloseButton
	if Notification.CanClose then
		CloseButton = New("ImageButton", {
			Image           = Creator.Icon("x")[1],
			ImageRectSize   = Creator.Icon("x")[2].ImageRectSize,
			ImageRectOffset = Creator.Icon("x")[2].ImageRectPosition,
			BackgroundTransparency = 1,
			Size            = UDim2.new(0, 16, 0, 16),
			Position        = UDim2.new(1, -P, 0, P),
			AnchorPoint     = Vector2.new(1, 0),
			ThemeTag        = { ImageColor3 = "Text" },
			ImageTransparency = 0.4,
		}, {
			New("TextButton", {
				Size = UDim2.new(1, 8, 1, 8),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position    = UDim2.new(0.5, 0, 0.5, 0),
				Text        = "",
			}),
		})
	end

	-- Progress bar (same as original: DurationFrame > Frame > Duration)
	local Duration = Creator.NewRoundFrame(R, "Squircle", {
		Size     = UDim2.new(0, 0, 1, 0),
		-- Use the type accent colour for the bar
		ImageColor3 = TypeCfg.Color,
		ImageTransparency = 0.45,
	})

	-- Left accent stripe (Leviathan addition, sits inside card)
	local AccentStripe = New("Frame", {
		Size             = UDim2.new(0, 3, 1, -(P * 2)),
		Position         = UDim2.new(0, 6, 0, P),
		BackgroundColor3 = TypeCfg.Color,
		BackgroundTransparency = 0.15,
		ZIndex           = 5,
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, 999) }),
	})

	-- Text container (original structure preserved exactly)
	local TextContainer = New("Frame", {
		Size          = UDim2.new(1, Notification.Icon and -28 - P or 0, 1, 0),
		Position      = UDim2.new(1, 0, 0, 0),
		AnchorPoint   = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		AutomaticSize = "Y",
	}, {
		New("UIPadding", {
			PaddingTop    = UDim.new(0, P),
			PaddingLeft   = UDim.new(0, P + 3 + 6), -- leave room for stripe
			PaddingRight  = UDim.new(0, P),
			PaddingBottom = UDim.new(0, P),
		}),
		New("TextLabel", {
			AutomaticSize  = "Y",
			Size           = UDim2.new(1, CloseButton and (-30 - P) or 0, 0, 0),
			TextWrapped    = true,
			TextXAlignment = "Left",
			RichText       = true,
			BackgroundTransparency = 1,
			TextSize       = 18,
			ThemeTag       = {
				TextColor3       = "NotificationTitle",
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
			TextSize       = 15,
			ThemeTag       = {
				TextColor3       = "NotificationContent",
				TextTransparency = "NotificationContentTransparency",
			},
			Text     = Notification.Content,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			Parent   = TextContainer,
		})
	end

	-- Main card (original WindUI structure)
	local Main = Creator.NewRoundFrame(R, "Squircle", {
		Size          = UDim2.new(1, 0, 0, 0),
		Position      = UDim2.new(2, 0, 1, 0),
		AnchorPoint   = Vector2.new(0, 1),
		AutomaticSize = "Y",
		ImageTransparency = 0.05,
		ThemeTag      = { ImageColor3 = "Notification" },
	}, {
		Creator.NewRoundFrame(R, "Squircle", {
			Size     = UDim2.new(1, 0, 1, 0),
			ThemeTag = {
				ImageColor3       = "Notification2",
				ImageTransparency = "Notification2Transparency",
			},
		}),
		-- DurationFrame: original name preserved for compatibility
		New("Frame", {
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
		}),
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
		AccentStripe,
		TextContainer,
		Icon,
		CloseButton,
	})

	local MainContainer = New("Frame", {
		BackgroundTransparency = 1,
		Size   = UDim2.new(1, 0, 0, 0),
		Parent = Config.Holder,
	}, { Main })

	function Notification:Close()
		if Notification.Closed then return end
		Notification.Closed = true
		NotificationModule.ActiveCount = math.max(0, (NotificationModule.ActiveCount or 1) - 1)
		Tween(MainContainer, 0.45, { Size = UDim2.new(1, 0, 0, -8) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.55, { Position = UDim2.new(2, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		task.wait(0.45)
		if MainContainer and MainContainer.Parent then
			MainContainer:Destroy()
		end
	end

	task.spawn(function()
		task.wait()
		Tween(MainContainer, 0.45, { Size = UDim2.new(1, 0, 0, Main.AbsoluteSize.Y) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Main, 0.45, { Position = UDim2.new(0, 0, 1, 0) },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

		if Notification.Duration and Notification.Duration > 0 then
			-- Original WindUI timing: tween DurationFrame.Frame size
			Duration.Size = UDim2.new(0, Main.DurationFrame.AbsoluteSize.X, 1, 0)
			Tween(Main.DurationFrame.Frame, Notification.Duration, {
				Size = UDim2.new(0, 0, 1, 0),
			}, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut):Play()
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
