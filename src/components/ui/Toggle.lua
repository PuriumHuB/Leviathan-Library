-- Leviathan UI — Toggle
-- Keeps exact original instance hierarchy so elements/Toggle.lua works unchanged
-- Visual improvements: smoother spring, better colours, cleaner track

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

	local Radius    = 24 / 2
	local FrameW    = NewElement and 30 or 20
	local TrackW    = NewElement and (24 + 24 + 4) or math.floor(24 * 1.7)
	local TrackH    = 24

	-- ── Optional icon inside thumb ─────────────────────────────
	local IconToggleFrame
	if Icon and Icon ~= "" then
		IconToggleFrame = New("ImageLabel", {
			Size = UDim2.new(0, 20 - 7, 0, 20 - 7),
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = Creator.Icon(Icon)[1],
			ImageRectOffset = Creator.Icon(Icon)[2].ImageRectPosition,
			ImageRectSize   = Creator.Icon(Icon)[2].ImageRectSize,
			ImageTransparency = 1,
			ImageColor3 = Color3.new(0, 0, 0),
		})
	end

	-- ── Container ──────────────────────────────────────────────
	local ToggleContainer = New("Frame", {
		Size = UDim2.new(0, 2, 0, TrackH + 2),
		BackgroundTransparency = 1,
		Parent = Parent,
	})

	-- ── Track (ToggleFrame) — keeps original name ───────────────
	local ToggleFrame = Creator.NewRoundFrame(Radius, "Squircle", {
		-- Leviathan: slightly brighter track outline
		ImageTransparency = 0.82,
		ThemeTag = { ImageColor3 = "Text" },
		Parent   = ToggleContainer,
		Size     = UDim2.new(0, TrackW, 0, TrackH),
		AnchorPoint = Vector2.new(1, 0.5),
		Position    = UDim2.new(0, 0, 0.5, 0),
		Name     = "ToggleFrame",
	}, {
		-- Layer: toggle-colour fill (shown when ON)  — keeps name "Layer"
		Creator.NewRoundFrame(Radius, "Squircle", {
			Size = UDim2.new(1, 0, 1, 0),
			Name = "Layer",
			ThemeTag = { ImageColor3 = "Toggle" },
			ImageTransparency = 1,
		}),

		-- Stroke ring — keeps name "Stroke"
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

		-- Thumb outer shell — keeps name "Frame"
		Creator.NewRoundFrame(Radius, "Squircle", {
			Size     = UDim2.new(0, FrameW, 0, 20),
			Position = UDim2.new(0, 2, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			ImageTransparency = 1,
			Name = "Frame",
		}, {
			-- Bar — keeps name "Bar"
			Creator.NewRoundFrame(Radius, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position    = UDim2.new(0.5, 0, 0.5, 0),
				Name = "Bar",
			}, {
				-- Highlight frame — keeps name "Highlight"
				New("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					Name = "Highlight",
				}, {
					-- SquircleGlass reflection — keeps name "SquircleGlass"
					Creator.NewRoundFrame(9999, "SquircleGlass", {
						Size = UDim2.new(1, 1, 1, 1),
						ImageColor3 = Color3.new(1, 1, 1),
						Name = "SquircleGlass",
						ImageTransparency = 0.5,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position    = UDim2.new(0.5, 0, 0.5, 0),
					}),

					-- Glass background — keeps name "GlassBackground"
					Creator.NewRoundFrame(Radius, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "GlassBackground",
						ImageTransparency = 0,
						ThemeTag = { ImageColor3 = "ElementBackground" },
						ZIndex = -1,
					}),

					-- Glass spritesheet — keeps name "Glass"
					New("ImageLabel", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Name = "Glass",
						ImageTransparency = 0,
					}, {
						New("UICorner", { CornerRadius = UDim.new(1, 0) }),
					}),

					-- Bar overlay tint — keeps name "BarOverlay"
					Creator.NewRoundFrame(Radius, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "BarOverlay",
						ThemeTag = { ImageColor3 = "ToggleBar" },
						ZIndex = 999,
					}),
				}),

				IconToggleFrame,

				-- UIScale for press squash — keeps as UIScale
				New("UIScale", { Scale = 1 }),
			}),
		}),

		-- Hit target — keeps name "Hitbox"
		New("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Name = "Hitbox",
			Text = "",
		}),
	})

	-- ── Drag state ──────────────────────────────────────────────
	local dragConnection
	local endConnection
	local FrameWidth  = FrameW
	local ToggleWidth = ToggleFrame.Size.X.Offset

	-- ── Set ─────────────────────────────────────────────────────
	function Toggle:Set(Toggled, isCallback, isAnim)
		if not isAnim then
			if Toggled then
				-- Leviathan: Back easing for spring feel
				Tween(ToggleFrame.Frame, 0.32, {
					Position = UDim2.new(0, ToggleWidth - FrameWidth - 2, 0.5, 0),
				}, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
				Creator.SetThemeTag(ToggleFrame.Frame.Bar.Highlight.Glass, { ImageColor3 = "Toggle" }, 0.15)
				Tween(ToggleFrame.Frame.Bar.Highlight.Glass, 0.15,
					{ ImageTransparency = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			else
				Tween(ToggleFrame.Frame, 0.32, {
					Position = UDim2.new(0, 2, 0.5, 0),
				}, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
				Creator.SetThemeTag(ToggleFrame.Frame.Bar.Highlight.Glass, { ImageColor3 = "Text" }, 0.15)
				Tween(ToggleFrame.Frame.Bar.Highlight.Glass, 0.15,
					{ ImageTransparency = 0.85 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			end
		else
			if Toggled then
				ToggleFrame.Frame.Position = UDim2.new(0, ToggleWidth - FrameWidth - 2, 0.5, 0)
			else
				ToggleFrame.Frame.Position = UDim2.new(0, 2, 0.5, 0)
			end
		end

		if Toggled then
			Tween(ToggleFrame.Layer, 0.12, { ImageTransparency = 0 }):Play()
			Creator.SetThemeTag(ToggleFrame.Frame.Bar.Highlight.Glass, { ImageColor3 = "Toggle" }, 0.1)
			Tween(ToggleFrame.Frame.Bar.Highlight.Glass, 0.1,
				{ ImageTransparency = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			if IconToggleFrame then
				Tween(IconToggleFrame, 0.1, { ImageTransparency = 0 }):Play()
			end
			local Id, RectSize, RectOffset = Toggle:GetGlassFrame(1)
			ToggleFrame.Frame.Bar.Highlight.Glass.Image           = Id
			ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectSize   = RectSize
			ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectOffset = RectOffset
		else
			Tween(ToggleFrame.Layer, 0.12, { ImageTransparency = 1 }):Play()
			Creator.SetThemeTag(ToggleFrame.Frame.Bar.Highlight.Glass, { ImageColor3 = "Text" }, 0.1)
			Tween(ToggleFrame.Frame.Bar.Highlight.Glass, 0.1,
				{ ImageTransparency = 0.85 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			if IconToggleFrame then
				Tween(IconToggleFrame, 0.1, { ImageTransparency = 1 }):Play()
			end
			local Id, RectSize, RectOffset = Toggle:GetGlassFrame(0)
			ToggleFrame.Frame.Bar.Highlight.Glass.Image           = Id
			ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectSize   = RectSize
			ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectOffset = RectOffset
		end

		isCallback = isCallback ~= false
		task.spawn(function()
			if Callback and isCallback then
				Creator.SafeCallback(Callback, Toggled)
			end
		end)
	end

	-- ── Animate (drag-to-toggle) ────────────────────────────────
	function Toggle:Animate(input, ToggleObj)
		if not Config.Window.IsToggleDragging then
			Config.Window.IsToggleDragging = true

			local startMouseX  = input.Position.X
			local startMouseY  = input.Position.Y
			local startFrameX  = ToggleFrame.Frame.Position.X.Offset
			local isScrolling  = false
			local hasDragged   = false

			-- Leviathan: slightly stronger squash
			Tween(ToggleFrame.Frame.Bar.UIScale, 0.28,
				{ Scale = 1.5 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			Tween(ToggleFrame.Frame.Bar.Highlight.BarOverlay, 0.28,
				{ ImageTransparency = 0.86 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

			if dragConnection then dragConnection:Disconnect() end
			dragConnection = UserInputService.InputChanged:Connect(function(inputChanged)
				if not Config.Window.IsToggleDragging then return end
				if inputChanged.UserInputType ~= Enum.UserInputType.MouseMovement
				and inputChanged.UserInputType ~= Enum.UserInputType.Touch then return end
				if isScrolling then return end

				local deltaX = math.abs(inputChanged.Position.X - startMouseX)
				if not hasDragged and deltaX > 8 then hasDragged = true end

				local mouseDelta = inputChanged.Position.X - startMouseX
				local newX = math.max(2, math.min(startFrameX + mouseDelta, ToggleWidth - FrameWidth - 2))
				local Percent = math.clamp((newX - 2) / (ToggleWidth - FrameWidth - 4), 0, 1)

				local Id, RectSize, RectOffset = Toggle:GetGlassFrame(Percent)
				ToggleFrame.Frame.Bar.Highlight.Glass.Image           = Id
				ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectSize   = RectSize
				ToggleFrame.Frame.Bar.Highlight.Glass.ImageRectOffset = RectOffset

				Tween(ToggleFrame.Frame, 0.10, {
					Position = UDim2.new(0, newX, 0.5, 0),
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			end)

			if endConnection then endConnection:Disconnect() end
			endConnection = UserInputService.InputEnded:Connect(function(inputEnded)
				if not Config.Window.IsToggleDragging then return end
				if inputEnded.UserInputType ~= Enum.UserInputType.MouseButton1
				and inputEnded.UserInputType ~= Enum.UserInputType.Touch then return end

				Config.Window.IsToggleDragging = false
				if dragConnection then dragConnection:Disconnect(); dragConnection = nil end
				if endConnection  then endConnection:Disconnect();  endConnection  = nil end
				Config.WindUI.CurrentInput = nil
				if isScrolling then return end

				if not hasDragged then
					ToggleObj:Set(not ToggleObj.Value, true, false)
				else
					local currentX  = ToggleFrame.Frame.Position.X.Offset
					local barCenter = currentX + FrameWidth / 2
					ToggleObj:Set(barCenter > ToggleWidth / 2, true, false)
				end

				Tween(ToggleFrame.Frame.Bar.UIScale, 0.24,
					{ Scale = 1 }, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
				Tween(ToggleFrame.Frame.Bar.Highlight.BarOverlay, 0.20,
					{ ImageTransparency = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			end)
		end
	end

	return ToggleContainer, Toggle
end

return Toggle
