-- ╔══════════════════════════════════════════════════╗
-- ║        Leviathan UI — Main (Init.lua)           ║
-- ║  Drop-in replacement for WindUI.               ║
-- ║  All WindUI APIs are preserved 1:1.            ║
-- ╚══════════════════════════════════════════════════╝

local LeviathanUI = {
	Window             = nil,
	Theme              = nil,
	Creator            = require("./modules/Creator"),
	LocalizationModule = require("./modules/Localization"),
	NotificationModule = require("./components/Notification"),
	Themes             = nil,
	Transparent        = false,

	TransparencyValue  = 0.15,
	UIScale            = 1,

	ConfigManager      = nil,
	Version            = "1.0.0",

	Services           = require("./utils/services/Init"),

	OnThemeChangeFunction = nil,

	cloneref    = nil,
	UIScaleObj  = nil,
	CreateWindow = nil,
	CurrentInput = nil,
}

local cloneref = (cloneref or clonereference or function(i) return i end)
LeviathanUI.cloneref = cloneref

local HttpService      = cloneref(game:GetService("HttpService"))
local Players          = cloneref(game:GetService("Players"))
local CoreGui          = cloneref(game:GetService("CoreGui"))
local RunService       = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))

function LeviathanUI.GenerateGUID()
	return HttpService:GenerateGUID(false)
end

local CurInput = LeviathanUI.GenerateGUID()

UserInputService.InputBegan:Connect(function(Input)
	task.defer(function()
		if Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			if LeviathanUI.CurrentInput and LeviathanUI.CurrentInput ~= CurInput then return end
			LeviathanUI.CurrentInput = CurInput
		end
	end)
end)
UserInputService.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch
	then
		if LeviathanUI.CurrentInput and LeviathanUI.CurrentInput ~= CurInput then return end
		LeviathanUI.CurrentInput = nil
	end
end)

local LocalPlayer = Players.LocalPlayer or nil

local KeySystem = require("./components/KeySystem")
local Creator   = LeviathanUI.Creator
local New       = Creator.New
local Acrylic   = require("./utils/Acrylic/Init")

local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end
local GUIParent  = gethui and gethui()
	or (CoreGui or LocalPlayer:WaitForChild("PlayerGui"))

local UIScaleObj = New("UIScale", { Scale = LeviathanUI.UIScale })
LeviathanUI.UIScaleObj = UIScaleObj

-- ── ScreenGuis ───────────────────────────────────────────────
LeviathanUI.ScreenGui = New("ScreenGui", {
	Name           = "LeviathanUI",
	Parent         = GUIParent,
	IgnoreGuiInset = true,
	ScreenInsets   = "None",
	DisplayOrder   = -99999,
}, {
	New("Folder", { Name = "Window"   }),
	New("Folder", { Name = "KeySystem"}),
	New("Folder", { Name = "Popups"   }),
	New("Folder", { Name = "ToolTips" }),
})

LeviathanUI.NotificationGui = New("ScreenGui", {
	Name           = "LeviathanUI/Notifications",
	Parent         = GUIParent,
	IgnoreGuiInset = true,
})
LeviathanUI.DropdownGui = New("ScreenGui", {
	Name           = "LeviathanUI/Dropdowns",
	Parent         = GUIParent,
	IgnoreGuiInset = true,
})
LeviathanUI.TooltipGui = New("ScreenGui", {
	Name           = "LeviathanUI/Tooltips",
	Parent         = GUIParent,
	IgnoreGuiInset = true,
})

ProtectGui(LeviathanUI.ScreenGui)
ProtectGui(LeviathanUI.NotificationGui)
ProtectGui(LeviathanUI.DropdownGui)
ProtectGui(LeviathanUI.TooltipGui)

Creator.Init(LeviathanUI)

-- ── Notifications ────────────────────────────────────────────
local Holder = LeviathanUI.NotificationModule.Init(LeviathanUI.NotificationGui)

function LeviathanUI:Notify(Config)
	Config.Holder = Holder.Frame
	Config.Window = LeviathanUI.Window
	return LeviathanUI.NotificationModule.New(Config)
end

function LeviathanUI:SetNotificationLower(Val)
	Holder.SetLower(Val)
end

-- ── Theme ─────────────────────────────────────────────────────
function LeviathanUI:SetFont(FontId)
	Creator.UpdateFont(FontId)
end

function LeviathanUI:OnThemeChange(func)
	LeviathanUI.OnThemeChangeFunction = func
end

function LeviathanUI:AddTheme(LTheme)
	LeviathanUI.Themes[LTheme.Name] = LTheme
	return LTheme
end

function LeviathanUI:SetTheme(Value)
	if LeviathanUI.Themes[Value] then
		LeviathanUI.Theme = LeviathanUI.Themes[Value]
		Creator.SetTheme(LeviathanUI.Themes[Value])
		if LeviathanUI.OnThemeChangeFunction then
			LeviathanUI.OnThemeChangeFunction(Value)
		end
		return LeviathanUI.Themes[Value]
	end
	return nil
end

function LeviathanUI:GetThemes()       return LeviathanUI.Themes         end
function LeviathanUI:GetCurrentTheme() return LeviathanUI.Theme.Name     end
function LeviathanUI:GetTransparency() return LeviathanUI.Transparent or false end
function LeviathanUI:GetWindowSize()   return LeviathanUI.Window.UIElements.Main.Size end

-- ── Localisation ─────────────────────────────────────────────
function LeviathanUI:Localization(LocalizationConfig)
	return LeviathanUI.LocalizationModule:New(LocalizationConfig, Creator)
end

function LeviathanUI:SetLanguage(Value)
	if Creator.Localization then
		return Creator.SetLanguage(Value)
	end
	return false
end

-- ── Acrylic ──────────────────────────────────────────────────
function LeviathanUI:ToggleAcrylic(Value)
	if LeviathanUI.Window and LeviathanUI.Window.AcrylicPaint
		and LeviathanUI.Window.AcrylicPaint.Model
	then
		LeviathanUI.Window.Acrylic = Value
		LeviathanUI.Window.AcrylicPaint.Model.Transparency = Value and 0.98 or 1
		if Value then Acrylic.Enable() else Acrylic.Disable() end
	end
end

-- ── Gradient ─────────────────────────────────────────────────
function LeviathanUI:Gradient(stops, props)
	local colorSeq, transSeq = {}, {}
	for posStr, stop in next, stops do
		local pos = tonumber(posStr)
		if pos then
			pos = math.clamp(pos / 100, 0, 1)
			local c = stop.Color
			if typeof(c) == "string" and string.sub(c,1,1) == "#" then c = Color3.fromHex(c) end
			table.insert(colorSeq, ColorSequenceKeypoint.new(pos, c))
			table.insert(transSeq, NumberSequenceKeypoint.new(pos, stop.Transparency or 0))
		end
	end
	table.sort(colorSeq, function(a,b) return a.Time < b.Time end)
	table.sort(transSeq, function(a,b) return a.Time < b.Time end)
	if #colorSeq < 2 then
		table.insert(colorSeq, ColorSequenceKeypoint.new(1, colorSeq[1].Value))
		table.insert(transSeq, NumberSequenceKeypoint.new(1, transSeq[1].Value))
	end
	local data = {
		Color        = ColorSequence.new(colorSeq),
		Transparency = NumberSequence.new(transSeq),
	}
	if props then for k,v in pairs(props) do data[k] = v end end
	return data
end

-- ── Popup ────────────────────────────────────────────────────
function LeviathanUI:Popup(PopupConfig)
	PopupConfig.WindUI = LeviathanUI
	return require("./components/popup/Init").new(
		PopupConfig,
		LeviathanUI.ScreenGui.Popups
	)
end

-- ── Parent ───────────────────────────────────────────────────
function LeviathanUI:SetParent(parent)
	if LeviathanUI.ScreenGui      then LeviathanUI.ScreenGui.Parent      = parent end
	if LeviathanUI.NotificationGui then LeviathanUI.NotificationGui.Parent = parent end
	if LeviathanUI.DropdownGui     then LeviathanUI.DropdownGui.Parent     = parent end
	if LeviathanUI.TooltipGui      then LeviathanUI.TooltipGui.Parent      = parent end
end

-- ── Boot themes ──────────────────────────────────────────────
LeviathanUI.Themes  = require("./themes/Init")(LeviathanUI, Creator)
Creator.Themes      = LeviathanUI.Themes

LeviathanUI:SetTheme("Dark")
LeviathanUI:SetLanguage(Creator.Language)

-- ── CreateWindow ─────────────────────────────────────────────
function LeviathanUI:CreateWindow(Config)
	local CreateWindow = require("./components/window/Init")

	if not RunService:IsStudio() and writefile then
		if not isfolder("LeviathanUI") then makefolder("LeviathanUI") end
		if Config.Folder then makefolder(Config.Folder)
		else makefolder(Config.Title) end
	end

	Config.WindUI = LeviathanUI
	Config.Window = LeviathanUI.Window
	Config.Parent = LeviathanUI.ScreenGui.Window

	if LeviathanUI.Window then
		warn("[ LeviathanUI ] Cannot create more than one window.")
		return
	end

	local CanLoadWindow = true

	local Theme = LeviathanUI.Themes[Config.Theme or "Dark"]
	Creator.SetTheme(Theme)

	local hwid     = gethwid or function() return Players.LocalPlayer.UserId end
	local Filename = hwid()

	if Config.KeySystem then
		CanLoadWindow = false

		local function loadKeysystem()
			KeySystem.new(Config, Filename, function(c)
				CanLoadWindow = c
			end)
		end

		local keyPath = (Config.Folder or "Temp") .. "/" .. Filename .. ".key"

		if Config.KeySystem.KeyValidator then
			if Config.KeySystem.SaveKey and isfile(keyPath) then
				local savedKey = readfile(keyPath)
				CanLoadWindow  = Config.KeySystem.KeyValidator(savedKey)
				if not CanLoadWindow then loadKeysystem() end
			else
				loadKeysystem()
			end
		elseif not Config.KeySystem.API then
			if Config.KeySystem.SaveKey and isfile(keyPath) then
				local savedKey = readfile(keyPath)
				local isKey    = (type(Config.KeySystem.Key) == "table")
					and table.find(Config.KeySystem.Key, savedKey)
					or  tostring(Config.KeySystem.Key) == tostring(savedKey)
				CanLoadWindow = isKey
				if not isKey then loadKeysystem() end
			else
				loadKeysystem()
			end
		else
			if isfile(keyPath) then
				local fileKey   = readfile(keyPath)
				local isSuccess = false
				for _, i in next, Config.KeySystem.API do
					local serviceData = LeviathanUI.Services[i.Type]
					if serviceData then
						local args = {}
						for _, argName in next, serviceData.Args do
							table.insert(args, i[argName])
						end
						local service = serviceData.New(table.unpack(args))
						if service.Verify(fileKey) then
							isSuccess = true
							break
						end
					end
				end
				CanLoadWindow = isSuccess
				if not isSuccess then loadKeysystem() end
			else
				loadKeysystem()
			end
		end

		repeat task.wait() until CanLoadWindow
	end

	local Window = CreateWindow(Config)

	LeviathanUI.Transparent = Config.Transparent
	LeviathanUI.Window      = Window

	if Config.Acrylic then Acrylic.init() end

	return Window
end

return LeviathanUI
