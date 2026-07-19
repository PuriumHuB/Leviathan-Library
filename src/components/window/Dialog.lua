-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Dialog                         ║
-- ║   Overlay blur · spring anim · keyboard ESC     ║
-- ╚══════════════════════════════════════════════════╝
local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

local cloneref = (cloneref or clonereference or function(i) return i end)
local UserInputService = cloneref(game:GetService("UserInputService"))

local DialogModule = {
	Holder = nil,
	Parent = nil,
}

function DialogModule.Create(Key, Type, Window, WindUI, Parent)
	local Dialog = {
		UICorner  = Key and 26 or 28,
		UIPadding = Key and 0  or 12,

		Window  = Window,
		WindUI  = WindUI,

		UIElements   = {},
		_ESCConn     = nil,
	}

	Type = Type or "Dialog"

	-- ── Full-screen dim overlay (non-Key dialogs only) ──────────
	if not Key then
		Dialog.UIElements.FullScreen = New("Frame", {
			ZIndex               = 999,
			BackgroundTransparency = 1,
			BackgroundColor3     = Color3.fromHex("#000000"),
			Size                 = UDim2.new(1, 0, 1, 0),
			Active               = false,
			Visible              = false,
			Parent               = DialogModule.Parent
				or (Window and Window.UIElements and Window.UIElements.Main and Window.UIElements.Main.Main),
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, Window.UICorner) }),
		})
	end

	-- ── Shadow ──────────────────────────────────────────────────
	local Blur = New("ImageLabel", {
		Name                   = "Blur",
		Image                  = "rbxassetid://8992230677",
		ThemeTag               = { ImageColor3 = "WindowShadow" },
		ImageTransparency      = 1,
		Size                   = UDim2.new(1, 100, 1, 100),
		Position               = UDim2.new(0, -50, 0, -50),
		ScaleType              = "Slice",
		SliceCenter            = Rect.new(99, 99, 99, 99),
		BackgroundTransparency = 1,
		ZIndex                 = -999999999999999,
	})

	-- ── Inner content frame ─────────────────────────────────────
	Dialog.UIElements.Main = New("Frame", {
		Size              = UDim2.new(0, 280, 0, 0),
		ThemeTag          = { BackgroundColor3 = Type .. "Background" },
		AutomaticSize     = "Y",
		BackgroundTransparency = 1,
		Visible           = false,
		ZIndex            = 99999,
	}, {
		New("UIPadding", {
			PaddingTop    = UDim.new(0, Dialog.UIPadding),
			PaddingLeft   = UDim.new(0, Dialog.UIPadding),
			PaddingRight  = UDim.new(0, Dialog.UIPadding),
			PaddingBottom = UDim.new(0, Dialog.UIPadding),
		}),
	})

	-- ── Container with squircle background ─────────────────────
	Dialog.UIElements.MainContainer = Creator.NewRoundFrame(Dialog.UICorner, "Squircle", {
		Visible           = false,
		ImageTransparency = Key and 0.15 or 0,
		Parent            = Parent or (not Key and Dialog.UIElements.FullScreen) or nil,
		Position          = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint       = Vector2.new(0.5, 0.5),
		AutomaticSize     = "XY",
		ThemeTag          = {
			ImageColor3        = Type .. "Background",
			ImageTransparency  = Type .. "BackgroundTransparency",
		},
		ZIndex            = 9999,
	}, {
		Blur,
		Dialog.UIElements.Main,
		-- UIScale for spring pop animation
		New("UIScale", { Scale = 0.92, Name = "DialogScale" }),
	})

	-- ── Open ────────────────────────────────────────────────────
	function Dialog:Open()
		if not Key then
			Dialog.UIElements.FullScreen.Visible = true
			Dialog.UIElements.FullScreen.Active  = true
		end

		Dialog.UIElements.MainContainer.Visible = true

		if not Key then
			Tween(Dialog.UIElements.FullScreen, 0.18,
				{ BackgroundTransparency = 0.55 }):Play()
		end

		-- Spring pop in
		Dialog.UIElements.MainContainer.ImageTransparency = 1
		Tween(Dialog.UIElements.MainContainer, 0.18,
			{ ImageTransparency = Key and 0.15 or 0 }):Play()
		Creator.SpringTween(
			Dialog.UIElements.MainContainer.DialogScale,
			{ Scale = 1 }, 0.38
		):Play()

		task.delay(0.06, function()
			Dialog.UIElements.Main.Visible = true
		end)

		-- ESC to close
		if Dialog._ESCConn then Dialog._ESCConn:Disconnect() end
		Dialog._ESCConn = UserInputService.InputBegan:Connect(function(input, gpe)
			if gpe then return end
			if input.KeyCode == Enum.KeyCode.Escape then
				Dialog:Close()
			end
		end)
	end

	-- ── Close ───────────────────────────────────────────────────
	function Dialog:Close()
		if Dialog._ESCConn then
			Dialog._ESCConn:Disconnect()
			Dialog._ESCConn = nil
		end

		Dialog.UIElements.Main.Visible = false

		-- Spring collapse out
		Creator.SpringTween(
			Dialog.UIElements.MainContainer.DialogScale,
			{ Scale = 0.92 }, 0.22
		):Play()
		Tween(Dialog.UIElements.MainContainer, 0.18,
			{ ImageTransparency = 1 }):Play()

		if not Key then
			Tween(Dialog.UIElements.FullScreen, 0.18,
				{ BackgroundTransparency = 1 }):Play()
			Dialog.UIElements.FullScreen.Active = false
		end

		task.delay(0.22, function()
			if not Key then
				Dialog.UIElements.FullScreen.Visible = false
				Dialog.UIElements.FullScreen:Destroy()
			else
				Dialog.UIElements.MainContainer:Destroy()
			end
		end)

		return function() end
	end

	return Dialog
end

return DialogModule
