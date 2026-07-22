local Toggle = {}

local Creator = require("../../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local UserInputService = game:GetService("UserInputService")

function Toggle.New(Value, Icon, IconSize, Parent, Callback, NewElement, Config)
	local Toggle = {
		GlassSpritesheet = {
			Id        = "rbxassetid://77297718671545",
			MirroredId = "rbxassetid://92258969882244",
			Size      = Vector2.new(102, 128),
			Total     = 80,
			Cols      = 10,
		},
	}

	function Toggle:GetGlassFrame(T)
		local S = Toggle.GlassSpritesheet
		local Frame
		if T <= 0.4 then
			Frame = math.floor((T / 0.4) * (S.Total - 1))
		elseif T < 0.6 then
			Frame = S.Total - 1
		else
			Frame = math.floor(((T - 0.6) / 0.4) * (S.Total - 1))
		end
		Frame = math.clamp(Frame, 0, S.Total - 1)
		local Mirrored = T >= 0.6
		if Mirrored then Frame = (S.Total - 1) - Frame end
		local Id = Mirrored and S.MirroredId or S.Id
		return Id, S.Size, Vector2.new((Frame % S.Cols) * S.Size.X, math.floor(Frame / S.Cols) * S.Size.Y)
	end

	local Radius = 24 / 2

	local IconToggleFrame
	if Icon and Icon ~= "" then
		IconToggleFrame = New("ImageLabel", {
			Size = UDim2.new(0, 20 - 7, 0, 20 - 7),
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position    = UDim2.new(0.5, 0, 0.5, 0),
			Image           = Creator.Icon(Icon)[1],
			ImageRectOffset = Creator.Icon(Icon)[2].ImageRectPosition,
			ImageRectSize   = Creator.Icon(Icon)[2].ImageRectSize,
			ImageTransparency = 1,
			ImageColor3 = Color3.new(0, 0, 0),
		})
	end

	local ToggleContainer = New("Frame", {
		Size = UDim2.new(0, 2, 0, 26),
		BackgroundTransparency = 1,
		Parent = Parent,
	})

	local ToggleFrame = Creator.NewRoundFrame(Radius, "Squircle", {
		ImageTransparency = 0.85,
		ThemeTag = { ImageColor3 = "Text" },
		Parent   = ToggleContainer,
		Size     = UDim2.new(0, NewElement and (24 + 24 + 4) or math.floor(24 * 1.7), 0, 24),
		AnchorPoint = Vector2.new(1, 0.5),
		Position    = UDim2.new(0, 0, 0.5, 0),
		Name     = "ToggleFrame",
	}, {
		-- Layer: toggle-on fill
		Creator.NewRoundFrame(Radius, "Squircle", {
			Size     = UDim2.new(1, 0, 1, 0),
			Name     = "Layer",
			ThemeTag = { ImageColor3 = "Toggle" },
			ImageTransparency = 1,
		}),

		-- Stroke outline
		Creator.NewRoundFrame(Radius, "SquircleOutline", {
			Size = UDim2.new(1, 0, 1, 0),
			Name = "Stroke",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageTransparency = 1,
		}, {
			New("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1),
				}),
			}),
		}),

		-- Thumb outer
		Creator.NewRoundFrame(Radius, "Squircle", {
			Size        = UDim2.new(0, NewElement and 30 or 20, 0, 20),
			Position    = UDim2.new(0, 2, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			ImageTransparency = 1,
			Name        = "Frame",
		}, {
			Creator.NewRoundFrame(Radius, "Squircle", {
				Size        = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position    = UDim2.new(0.5, 0, 0.5, 0),
				Name        = "Bar",
			}, {
				New("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					Name = "Highlight",
				}, {
					-- Glass highlight shimmer
					Creator.NewRoundFrame(9999, "SquircleGlass", {
						Size = UDim2.new(1, 1, 1, 1),
						ImageColor3 = Color3.new(1, 1, 1),
						Name = "SquircleGlass",
						ImageTransparency = 0.5,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position    = UDim2.new(0.5, 0, 0.5, 0),
					}),

					-- FIX: was "ElementBackground" (dark navy on Leviathan = black ring)
					-- Now uses "Notification" (white-tinted neutral) so thumb background
					-- matches the panel surface colour instead of the element card colour
					Creator.NewRoundFrame(Radius, "Squircle", {
						Size     = UDim2.new(1, 0, 1, 0),
						Name     = "GlassBackground",
						ImageTransparency = 0,
						ThemeTag = { ImageColor3 = "PanelBackground" },
						ZIndex   = -1,
					}),

					-- Glass spritesheet overlay
					New("ImageLabel", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Name = "Glass",
						ImageTransparency = 0,
					}, {
						New("UICorner", { CornerRadius = UDim.new(1, 0) }),
					}),

					-- Bar tint overlay
					Creator.NewRoundFrame(Radius, "Squircle", {
						Size     = UDim2.new(1, 0, 1, 0),
						Name     = "BarOverlay",
						ThemeTag = { ImageColor3 = "ToggleBar" },
						ZIndex   = 999,
					}),
				}),

				IconToggleFrame,
				New("UIScale", { Scale = 1 }),
			}),
		}),

		-- Hit target
		New("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Position    = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Name = "Hitbox",
			Text = "",
		}),
	})

	local ToggleWidth = ToggleFrame.Size.X.Offset
	local FrameWidth  = NewElement and 30 or 20
	local dragConnection, endConnection

	function Toggle:Set(Toggled, isCallback, isAnim)
		if not isAnim then
			if Toggled then
				Tween(ToggleFrame.Frame, 0.32, {
					Position = UDim2.new(0, ToggleWidth - FrameWidth - 2, 0.5, 0),
				}, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
			else
				Tween(ToggleFrame.Frame, 0.32, {
					Position = UDim2.new(0, 2, 0.5, 0),
				}, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
			end
		else
			ToggleFrame.Frame.Position = Toggled
				and UDim2.new(0, ToggleWidth - FrameWidth - 2, 0.5, 0)
				or  UDim2.new(0, 2, 0.5, 0)
		end

		if Toggled then
			Tween(ToggleFrame.Layer, 0.12, { ImageTransparency = 0 }):Play()
			Creator.SetThemeTag(ToggleFrame.Frame.Bar.Highlight.Glass, { ImageColor3 = "Toggle" }, 0.1)
			Tween(ToggleFrame.Frame.Bar.Highlight.Glass, 0.1, { ImageTransparency = 0 }):Play()
			if IconToggleFrame then
				Tween(IconToggleFrame, 0.1, { ImageTransparency = 0 }):Play()
			end
		else
			Tween(ToggleFrame.Layer, 0.12, { ImageTransparency = 1 }):Play()
			Creator.SetThemeTag(ToggleFrame.Frame.Bar.Highlight.Glass, { ImageColor3 = "Text" }, 0.1)
			Tween(ToggleFrame.Frame.Bar.Highlight.Glass, 0.1, { ImageTransparency = 0.85 }):Play()
			if IconToggleFrame then
				Tween(IconToggleFrame, 0.1, { ImageTransparency = 1 }):Play()
			end
		end

		local Id, RectSize, RectOffset = Toggle:GetGlassFrame(Toggled and 1 or 0)
		ToggleFrame.Frame.Bar.Highlight.Glass.Image           = Id
		ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectSize   = RectSize
		ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectOffset = RectOffset

		if isCallback ~= false and Callback then
			task.spawn(function() Creator.SafeCallback(Callback, Toggled) end)
		end
	end

	function Toggle:Animate(input, ToggleObj)
		if Config.Window.IsToggleDragging then return end
		Config.Window.IsToggleDragging = true

		local startMouseX = input.Position.X
		local startFrameX = ToggleFrame.Frame.Position.X.Offset
		local hasDragged  = false

		Tween(ToggleFrame.Frame.Bar.UIScale, 0.28, { Scale = 1.5 },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(ToggleFrame.Frame.Bar.Highlight.BarOverlay, 0.28, { ImageTransparency = 0.86 }):Play()

		if dragConnection then dragConnection:Disconnect() end
		dragConnection = UserInputService.InputChanged:Connect(function(inp)
			if not Config.Window.IsToggleDragging then return end
			if inp.UserInputType ~= Enum.UserInputType.MouseMovement
			and inp.UserInputType ~= Enum.UserInputType.Touch then return end

			local dx   = inp.Position.X - startMouseX
			if math.abs(dx) > 5 then hasDragged = true end
			local newX = math.clamp(startFrameX + dx, 2, ToggleWidth - FrameWidth - 2)
			local pct  = (newX - 2) / math.max(ToggleWidth - FrameWidth - 4, 1)

			local Id, Sz, Off = Toggle:GetGlassFrame(pct)
			ToggleFrame.Frame.Bar.Highlight.Glass.Image           = Id
			ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectSize   = Sz
			ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectOffset = Off

			Tween(ToggleFrame.Frame, 0.10, { Position = UDim2.new(0, newX, 0.5, 0) },
				Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		end)

		if endConnection then endConnection:Disconnect() end
		endConnection = UserInputService.InputEnded:Connect(function(inp)
			if not Config.Window.IsToggleDragging then return end
			if inp.UserInputType ~= Enum.UserInputType.MouseButton1
			and inp.UserInputType ~= Enum.UserInputType.Touch then return end

			Config.Window.IsToggleDragging = false
			if dragConnection then dragConnection:Disconnect(); dragConnection = nil end
			if endConnection  then endConnection:Disconnect();  endConnection  = nil end
			Config.WindUI.CurrentInput = nil

			Tween(ToggleFrame.Frame.Bar.UIScale, 0.24, { Scale = 1 },
				Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
			Tween(ToggleFrame.Frame.Bar.Highlight.BarOverlay, 0.20, { ImageTransparency = 0 }):Play()

			if not hasDragged then
				ToggleObj:Set(not ToggleObj.Value, true, false)
			else
				local cx = ToggleFrame.Frame.Position.X.Offset + FrameWidth / 2
				ToggleObj:Set(cx > ToggleWidth / 2, true, false)
			end
		end)
	end

	return ToggleContainer, Toggle
end

return Toggle
