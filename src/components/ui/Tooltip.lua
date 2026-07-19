-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Tooltip                        ║
-- ║   Smart positioning · fade · edge detection     ║
-- ╚══════════════════════════════════════════════════╝
local Tooltip = {}

local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

local cloneref         = (cloneref or clonereference or function(i) return i end)
local RunService       = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))

local R       = 10
local PadH    = 12
local PadV    = 7
local Offset  = 12  -- distance from cursor

-- ── Shared singleton tooltip frame ──────────────────────────
local TooltipFrame, TextLabel, ScreenGui

local function EnsureFrame()
	if TooltipFrame and TooltipFrame.Parent then return end

	ScreenGui = Creator.New and New("ScreenGui", {
		Name          = "LeviathanTooltip",
		ZIndexBehavior = "Sibling",
		DisplayOrder  = 9999,
		ResetOnSpawn  = false,
	}) or nil

	local bg = Creator.NewRoundFrame(R, "Squircle", {
		Size              = UDim2.new(0, 0, 0, 0),
		AutomaticSize     = "XY",
		ImageTransparency = 1,
		ThemeTag          = { ImageColor3 = "TooltipBackground" },
		Visible           = false,
		ZIndex            = 9999,
		Name              = "TooltipFrame",
	}, {
		Creator.NewRoundFrame(R, "SquircleOutline", {
			Size              = UDim2.new(1, 1, 1, 1),
			AnchorPoint       = Vector2.new(0.5, 0.5),
			Position          = UDim2.new(0.5, 0, 0.5, 0),
			ThemeTag          = { ImageColor3 = "Outline" },
			ImageTransparency = 0.82,
			ZIndex            = 9999,
		}),
		New("TextLabel", {
			BackgroundTransparency = 1,
			AutomaticSize          = "XY",
			TextSize               = Creator.Type.BodySM,
			FontFace               = Font.new(Creator.Font, Enum.FontWeight.Medium),
			ThemeTag               = { TextColor3 = "TooltipText" },
			TextTransparency       = 1,
			Text                   = "",
			Name                   = "Label",
			ZIndex                 = 9999,
		}),
		New("UIPadding", {
			PaddingLeft   = UDim.new(0, PadH),
			PaddingRight  = UDim.new(0, PadH),
			PaddingTop    = UDim.new(0, PadV),
			PaddingBottom = UDim.new(0, PadV),
		}),
	})

	if ScreenGui then
		bg.Parent       = ScreenGui
		ScreenGui.Parent = game:GetService("CoreGui")
	end

	TooltipFrame = bg
	TextLabel    = bg.Label
end

-- ── Smart position: avoid screen edges ──────────────────────
local function SmartPosition(mousePos, frameSize, screenSize)
	local x = mousePos.X + Offset
	local y = mousePos.Y - frameSize.Y / 2

	-- right edge
	if x + frameSize.X > screenSize.X - 10 then
		x = mousePos.X - frameSize.X - Offset
	end
	-- bottom edge
	if y + frameSize.Y > screenSize.Y - 10 then
		y = screenSize.Y - frameSize.Y - 10
	end
	-- top edge
	if y < 10 then y = 10 end

	return UDim2.new(0, x, 0, y)
end

-- ── Current move connection ──────────────────────────────────
local _moveConn

-- ── Show ────────────────────────────────────────────────────
function Tooltip.Show(text, sourceFrame)
	EnsureFrame()
	if not text or text == "" then return end

	TextLabel.Text             = text
	TooltipFrame.Visible       = true
	TooltipFrame.ImageTransparency = 1
	TextLabel.TextTransparency = 1

	-- position initially then track mouse
	local function reposition()
		local mouse      = UserInputService:GetMouseLocation()
		local screenSize = workspace.CurrentCamera.ViewportSize
		local sz         = TooltipFrame.AbsoluteSize
		TooltipFrame.Position = SmartPosition(mouse, sz, screenSize)
	end

	task.spawn(function()
		task.wait()
		reposition()
		Tween(TooltipFrame, Creator.Anim.Fast, { ImageTransparency = 0.06 }):Play()
		Tween(TextLabel,    Creator.Anim.Fast, { TextTransparency  = 0.10 }):Play()
	end)

	if _moveConn then _moveConn:Disconnect() end
	_moveConn = RunService.RenderStepped:Connect(reposition)
end

-- ── Hide ─────────────────────────────────────────────────────
function Tooltip.Hide()
	if _moveConn then _moveConn:Disconnect(); _moveConn = nil end
	if not TooltipFrame then return end
	Tween(TooltipFrame, Creator.Anim.Fast, { ImageTransparency = 1 }):Play()
	Tween(TextLabel,    Creator.Anim.Fast, { TextTransparency  = 1 }):Play()
	task.delay(Creator.Anim.Fast + 0.01, function()
		if TooltipFrame then TooltipFrame.Visible = false end
	end)
end

-- ── Attach to a GuiObject ─────────────────────────────────────
function Tooltip.Attach(GuiObject, text)
	local c1 = GuiObject.MouseEnter:Connect(function()
		Tooltip.Show(text, GuiObject)
	end)
	local c2 = GuiObject.MouseLeave:Connect(function()
		Tooltip.Hide()
	end)
	-- return cleanup
	return function()
		c1:Disconnect()
		c2:Disconnect()
		Tooltip.Hide()
	end
end

-- ── New: element-builder compatible entry point ───────────────
function Tooltip.New(Config, Parent)
	local text = Config.Text or Config.Content or ""

	-- Attach to closest parent frame
	local conn
	task.defer(function()
		local target = Parent
		if not target then return end
		conn = Tooltip.Attach(target, text)
	end)

	return {
		Text = text,
		Detach = function()
			if conn then conn() end
		end,
	}
end

return Tooltip
