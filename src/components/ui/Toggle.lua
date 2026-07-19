-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Toggle                         ║
-- ║   Modern pill switch · smooth thumb · drag      ║
-- ╚══════════════════════════════════════════════════╝
local Toggle = {}

local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

local cloneref       = (cloneref or clonereference or function(i) return i end)
local UserInputService = cloneref(game:GetService("UserInputService"))

function Toggle.New(Value, Icon, IconSize, Parent, Callback, NewElement, Config)
	local Toggle = {
		-- Glass spritesheet for thumb reflection
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
		return Id, S.Size,
			Vector2.new((Frame % S.Cols) * S.Size.X, math.floor(Frame / S.Cols) * S.Size.Y)
	end

	-- Dimensions
	local TrackW     = NewElement and (24 + 24 + 4) or 44
	local TrackH     = 26
	local ThumbW     = NewElement and 30 or 22
	local ThumbH     = 22
	local ThumbPad   = 2  -- gap from track edge
	local ThumbR     = 999

	-- ── Optional icon inside thumb ──────────────────────────────
	local IconThumbFrame
	if Icon and Icon ~= "" then
		local ic = Creator.Icon(Icon)
		if ic then
			IconThumbFrame = New("ImageLabel", {
				Size                   = UDim2.new(0, 13, 0, 13),
				BackgroundTransparency = 1,
				AnchorPoint            = Vector2.new(0.5, 0.5),
				Position               = UDim2.new(0.5, 0, 0.5, 0),
				Image                  = ic[1],
				ImageRectOffset        = ic[2].ImageRectPosition,
				ImageRectSize          = ic[2].ImageRectSize,
				ImageTransparency      = 1,
				ImageColor3            = Color3.new(0, 0, 0),
			})
		end
	end

	-- ── Thumb internals ─────────────────────────────────────────
	local GlassLabel = New("ImageLabel", {
		Name                   = "Glass",
		Size                   = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ImageTransparency      = 0.85,
	})

	local GlassBg = Creator.NewRoundFrame(ThumbR, "Squircle", {
		Name                   = "GlassBackground",
		Size                   = UDim2.new(1, 0, 1, 0),
		ImageTransparency      = 0,
		ThemeTag               = { ImageColor3 = "ElementBackground" },
		ZIndex                 = -1,
	})

	local BarOverlay = Creator.NewRoundFrame(ThumbR, "Squircle", {
		Name     = "BarOverlay",
		Size     = UDim2.new(1, 0, 1, 0),
		ThemeTag = { ImageColor3 = "ToggleBar" },
		ZIndex   = 999,
	})

	local GlassHighlight = Creator.NewRoundFrame(ThumbR, "SquircleGlass", {
		Name              = "SquircleGlass",
		Size              = UDim2.new(1, 1, 1, 1),
		ImageColor3       = Color3.new(1, 1, 1),
		ImageTransparency = 0.5,
		AnchorPoint       = Vector2.new(0.5, 0.5),
		Position          = UDim2.new(0.5, 0, 0.5, 0),
	})

	local Highlight = New("Frame", {
		Name             = "Highlight",
		Size             = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
	}, {
		GlassHighlight,
		GlassBg,
		GlassLabel,
		BarOverlay,
	})

	local ThumbBar = Creator.NewRoundFrame(ThumbR, "Squircle", {
		Size              = UDim2.new(1, 0, 1, 0),
		ImageTransparency = 0,
		AnchorPoint       = Vector2.new(0.5, 0.5),
		Position          = UDim2.new(0.5, 0, 0.5, 0),
		Name              = "Bar",
	}, {
		Highlight,
		IconThumbFrame,
		New("UIScale", { Scale = 1, Name = "ThumbScale" }),
	})

	local Thumb = Creator.NewRoundFrame(ThumbR, "Squircle", {
		Size      = UDim2.new(0, ThumbW, 0, ThumbH),
		Position  = UDim2.new(0, ThumbPad, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		ImageTransparency = 1,
		Name      = "Frame",
	}, {
		ThumbBar,
	})

	-- ── Track layers ────────────────────────────────────────────
	local TrackLayer = Creator.NewRoundFrame(ThumbR, "Squircle", {
		Size              = UDim2.new(1, 0, 1, 0),
		Name              = "Layer",
		ThemeTag          = { ImageColor3 = "Toggle" },
		ImageTransparency = 1,
	})

	local TrackStroke = Creator.NewRoundFrame(ThumbR, "SquircleOutline", {
		Size              = UDim2.new(1, 0, 1, 0),
		Name              = "Stroke",
		ImageColor3       = Color3.new(1, 1, 1),
		ImageTransparency = 1,
	}, {
		New("UIGradient", {
			Rotation     = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1),
			}),
		}),
	})

	local HitBox = New("TextButton", {
		Size                   = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Position               = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint            = Vector2.new(0.5, 0.5),
		Name                   = "Hitbox",
		Text                   = "",
	})

	local ToggleFrame = Creator.NewRoundFrame(ThumbR, "Squircle", {
		ImageTransparency = 0.82,
		ThemeTag          = { ImageColor3 = "Text" },
		Parent            = Parent,
		Size              = UDim2.new(0, TrackW, 0, TrackH),
		AnchorPoint       = Vector2.new(1, 0.5),
		Position          = UDim2.new(0, 0, 0.5, 0),
		Name              = "ToggleFrame",
	}, {
		TrackLayer,
		TrackStroke,
		Thumb,
		HitBox,
	})

	local ToggleContainer = New("Frame", {
		Size                   = UDim2.new(0, 2, 0, TrackH + 2),
		BackgroundTransparency = 1,
		Parent                 = Parent,
	})

	ToggleFrame.Parent = ToggleContainer

	-- ── Glass frame helper ───────────────────────────────────────
	local function ApplyGlass(T)
		local Id, Sz, Off = Toggle:GetGlassFrame(T)
		GlassLabel.Image           = Id
		GlassLabel.ImageRectSize   = Sz
		GlassLabel.ImageRectOffset = Off
	end

	-- ── Set state ────────────────────────────────────────────────
	local OnPos  = TrackW - ThumbW - ThumbPad
	local OffPos = ThumbPad

	function Toggle:Set(Toggled, isCallback, isAnim)
		local thumbTarget = Toggled and OnPos or OffPos

		if not isAnim then
			-- Animated transition
			Tween(Thumb, 0.32, {
				Position = UDim2.new(0, thumbTarget, 0.5, 0),
			}, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
		else
			-- Instant
			Thumb.Position = UDim2.new(0, thumbTarget, 0.5, 0)
		end

		if Toggled then
			Tween(TrackLayer, 0.12, { ImageTransparency = 0 }):Play()
			Creator.SetThemeTag(GlassLabel, { ImageColor3 = "Toggle" }, 0.12)
			Tween(GlassLabel, 0.12, { ImageTransparency = 0 }):Play()
			if IconThumbFrame then
				Tween(IconThumbFrame, 0.12, { ImageTransparency = 0 }):Play()
			end
			ApplyGlass(1)
		else
			Tween(TrackLayer, 0.12, { ImageTransparency = 1 }):Play()
			Creator.SetThemeTag(GlassLabel, { ImageColor3 = "Text" }, 0.12)
			Tween(GlassLabel, 0.12, { ImageTransparency = 0.82 }):Play()
			if IconThumbFrame then
				Tween(IconThumbFrame, 0.12, { ImageTransparency = 1 }):Play()
			end
			ApplyGlass(0)
		end

		isCallback = isCallback ~= false
		if Callback and isCallback then
			task.spawn(function()
				Creator.SafeCallback(Callback, Toggled)
			end)
		end
	end

	-- ── Drag/swipe interaction ───────────────────────────────────
	local dragConn, endConn

	function Toggle:Animate(input, ToggleObj)
		if Config.Window.IsToggleDragging then return end
		Config.Window.IsToggleDragging = true

		local startMouseX  = input.Position.X
		local startFrameX  = Thumb.Position.X.Offset
		local hasDragged   = false

		-- Thumb squash on press
		Tween(ThumbBar.ThumbScale, 0.22, { Scale = 1.45 },
			Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(BarOverlay, 0.22, { ImageTransparency = 0.82 }):Play()

		if dragConn then dragConn:Disconnect() end
		dragConn = UserInputService.InputChanged:Connect(function(inp)
			if not Config.Window.IsToggleDragging then return end
			if inp.UserInputType ~= Enum.UserInputType.MouseMovement
			and inp.UserInputType ~= Enum.UserInputType.Touch then return end

			local dx   = inp.Position.X - startMouseX
			if math.abs(dx) > 5 then hasDragged = true end

			local newX = math.clamp(startFrameX + dx, OffPos, OnPos)
			local pct  = (newX - OffPos) / (OnPos - OffPos)
			ApplyGlass(pct)

			Tween(Thumb, 0.10, {
				Position = UDim2.new(0, newX, 0.5, 0),
			}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		end)

		if endConn then endConn:Disconnect() end
		endConn = UserInputService.InputEnded:Connect(function(inp)
			if not Config.Window.IsToggleDragging then return end
			if inp.UserInputType ~= Enum.UserInputType.MouseButton1
			and inp.UserInputType ~= Enum.UserInputType.Touch then return end

			Config.Window.IsToggleDragging = false
			if dragConn then dragConn:Disconnect(); dragConn = nil end
			if endConn  then endConn:Disconnect();  endConn  = nil end
			Config.WindUI.CurrentInput = nil

			-- Restore thumb size
			Tween(ThumbBar.ThumbScale, 0.20, { Scale = 1 },
				Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
			Tween(BarOverlay, 0.20, { ImageTransparency = 0 }):Play()

			if not hasDragged then
				ToggleObj:Set(not ToggleObj.Value, true, false)
			else
				local curX    = Thumb.Position.X.Offset
				local center  = curX + ThumbW / 2
				ToggleObj:Set(center > TrackW / 2, true, false)
			end
		end)
	end

	return ToggleContainer, Toggle
end

return Toggle
