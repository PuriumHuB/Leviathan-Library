-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Dropdown                       ║
-- ║   Search · smooth scroll · selected indicator   ║
-- ╚══════════════════════════════════════════════════╝
local Dropdown = {}

local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

local cloneref         = (cloneref or clonereference or function(i) return i end)
local UserInputService = cloneref(game:GetService("UserInputService"))

local R     = 12
local ItemH = 34
local MaxH  = 180
local Gap   = 6

function Dropdown.New(Options, Default, Multi, Placeholder, AllowEmpty, Parent, Callback, OpenOnTop, Window, Config)
	Options     = Options     or {}
	Placeholder = Placeholder or "Select..."
	Multi       = Multi       == true

	local DropdownData = {
		Options  = Options,
		Value    = Multi and {} or nil,
		Opened   = false,
		Disabled = false,
	}

	-- normalize Default
	if Default then
		if Multi then
			if type(Default) == "table" then
				for _, v in ipairs(Default) do DropdownData.Value[v] = true end
			else
				DropdownData.Value[Default] = true
			end
		else
			DropdownData.Value = Default
		end
	end

	-- ── Helper: label for current value ─────────────────────────
	local function GetLabel()
		if Multi then
			local parts = {}
			for k, v in pairs(DropdownData.Value) do
				if v then table.insert(parts, tostring(k)) end
			end
			if #parts == 0 then return Placeholder end
			table.sort(parts)
			return table.concat(parts, ", ")
		else
			return DropdownData.Value ~= nil and tostring(DropdownData.Value) or Placeholder
		end
	end

	-- ── Chevron icon ─────────────────────────────────────────────
	local chevron   = Creator.Icon("chevron-down")
	local ChevLabel = New("ImageLabel", {
		Size            = UDim2.new(0, 14, 0, 14),
		BackgroundTransparency = 1,
		Image           = chevron and chevron[1] or "",
		ImageRectSize   = chevron and chevron[2].ImageRectSize   or Vector2.new(0,0),
		ImageRectOffset = chevron and chevron[2].ImageRectPosition or Vector2.new(0,0),
		ThemeTag        = { ImageColor3 = "Icon" },
		ImageTransparency = 0.45,
		Name            = "Chevron",
	})

	-- ── Selected text ────────────────────────────────────────────
	local ValueLabel = New("TextLabel", {
		BackgroundTransparency = 1,
		Size                   = UDim2.new(1, -34, 1, 0),
		TextXAlignment         = "Left",
		ThemeTag               = { TextColor3 = "Text" },
		TextTransparency       = DropdownData.Value ~= nil and 0.15 or 0.5,
		TextSize               = Creator.Type.BodyLG,
		FontFace               = Font.new(Creator.Font, Enum.FontWeight.Medium),
		TextTruncate           = Enum.TextTruncate.AtEnd,
		Text                   = GetLabel(),
		Name                   = "Value",
	})

	-- ── Main header button ───────────────────────────────────────
	local HeaderFrame = Creator.NewRoundFrame(R, "Squircle", {
		Size              = UDim2.new(1, 0, 0, 38),
		ImageTransparency = 0.84,
		ThemeTag          = { ImageColor3 = "ElementBackground" },
		Name              = "Header",
	}, {
		Creator.NewRoundFrame(R, "SquircleOutline", {
			Size              = UDim2.new(1, 1, 1, 1),
			AnchorPoint       = Vector2.new(0.5, 0.5),
			Position          = UDim2.new(0.5, 0, 0.5, 0),
			ThemeTag          = { ImageColor3 = "Outline" },
			ImageTransparency = 0.88,
			Name              = "Outline",
		}),
		New("TextButton", {
			Size                   = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text                   = "",
			Name                   = "HitBox",
		}, {
			ValueLabel,
			ChevLabel,
			New("UIListLayout", {
				FillDirection       = "Horizontal",
				VerticalAlignment   = "Center",
				HorizontalAlignment = "Right",
				SortOrder           = "LayoutOrder",
				Padding             = UDim.new(0, 6),
			}),
			New("UIPadding", {
				PaddingLeft  = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 10),
			}),
		}),
	})

	-- ── Search box (inside popup) ────────────────────────────────
	local SearchBox = New("TextBox", {
		Size                   = UDim2.new(1, 0, 0, 32),
		BackgroundTransparency = 1,
		PlaceholderText        = "Search...",
		Text                   = "",
		TextXAlignment         = "Left",
		ThemeTag               = { TextColor3 = "Text", PlaceholderColor3 = "SubText" },
		TextTransparency       = 0.15,
		TextSize               = Creator.Type.BodyMD,
		FontFace               = Font.new(Creator.Font, Enum.FontWeight.Regular),
		ClearTextOnFocus       = false,
		Name                   = "Search",
	}, {
		New("UIPadding", {
			PaddingLeft  = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
		}),
		Creator.NewRoundFrame(R, "Squircle", {
			Size              = UDim2.new(1, 0, 1, 0),
			ZIndex            = -1,
			ThemeTag          = { ImageColor3 = "ElementBackground" },
			ImageTransparency = 0.78,
		}),
	})

	-- ── Item list ────────────────────────────────────────────────
	local ItemList = New("ScrollingFrame", {
		Size                       = UDim2.new(1, 0, 1, -38),
		BackgroundTransparency     = 1,
		CanvasSize                 = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize        = "Y",
		ScrollBarThickness         = 3,
		ScrollBarImageColor3       = Color3.new(1, 1, 1),
		ScrollBarImageTransparency = 0.7,
		ScrollingDirection         = "Y",
		Name                       = "List",
	}, {
		New("UIListLayout", {
			Padding   = UDim.new(0, 2),
			SortOrder = "LayoutOrder",
		}),
		New("UIPadding", {
			PaddingLeft   = UDim.new(0, 6),
			PaddingRight  = UDim.new(0, 6),
			PaddingTop    = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4),
		}),
	})

	-- ── Popup container ──────────────────────────────────────────
	local PopupFrame = Creator.NewRoundFrame(R, "Squircle", {
		Size              = UDim2.new(1, 0, 0, 0),
		Position          = UDim2.new(0, 0, 1, Gap),
		ThemeTag          = { ImageColor3 = "ElementBackground" },
		ImageTransparency = 0.06,
		ClipsDescendants  = false,
		Visible           = false,
		ZIndex            = 99,
		Name              = "Popup",
	}, {
		Creator.NewRoundFrame(R, "SquircleOutline", {
			Size              = UDim2.new(1, 1, 1, 1),
			AnchorPoint       = Vector2.new(0.5, 0.5),
			Position          = UDim2.new(0.5, 0, 0.5, 0),
			ThemeTag          = { ImageColor3 = "Outline" },
			ImageTransparency = 0.82,
		}),
		New("Frame", {
			Size                   = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Name                   = "Inner",
			ClipsDescendants       = true,
		}, {
			SearchBox,
			ItemList,
			New("UIListLayout", {
				FillDirection = "Vertical",
				Padding       = UDim.new(0, 4),
			}),
			New("UIPadding", {
				PaddingTop    = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 6),
			}),
		}),
	})

	local DropdownContainer = New("Frame", {
		BackgroundTransparency = 1,
		Size                   = UDim2.new(1, 0, 0, 38),
		AutomaticSize          = "None",
		ClipsDescendants       = false,
		Parent                 = Parent,
		Name                   = "Dropdown",
	}, {
		HeaderFrame,
		PopupFrame,
	})

	-- ── Sync value label ─────────────────────────────────────────
	local function SyncLabel()
		local lbl = GetLabel()
		ValueLabel.Text             = lbl
		ValueLabel.TextTransparency = lbl == Placeholder and 0.5 or 0.15
	end

	-- ── Build item row ───────────────────────────────────────────
	local ItemFrames = {}

	local function BuildItems(filter)
		-- destroy old
		for _, f in pairs(ItemFrames) do f:Destroy() end
		ItemFrames = {}

		for i, option in ipairs(DropdownData.Options) do
			local label   = tostring(option)
			local lower   = label:lower()
			local flt     = filter and filter:lower() or ""
			if flt ~= "" and not lower:find(flt, 1, true) then continue end

			-- is selected?
			local function IsSelected()
				if Multi then return DropdownData.Value[option] == true
				else return DropdownData.Value == option end
			end

			local checkIcon = Creator.Icon("check")
			local CheckMark = New("ImageLabel", {
				Size            = UDim2.new(0, 13, 0, 13),
				BackgroundTransparency = 1,
				Image           = checkIcon and checkIcon[1] or "",
				ImageRectSize   = checkIcon and checkIcon[2].ImageRectSize   or Vector2.new(0,0),
				ImageRectOffset = checkIcon and checkIcon[2].ImageRectPosition or Vector2.new(0,0),
				ThemeTag        = { ImageColor3 = "Toggle" },
				ImageTransparency = IsSelected() and 0 or 1,
				Name            = "Check",
				LayoutOrder     = 999,
			})

			local ItemLabel = New("TextLabel", {
				BackgroundTransparency = 1,
				Size                   = UDim2.new(1, -26, 1, 0),
				TextXAlignment         = "Left",
				ThemeTag               = { TextColor3 = "Text" },
				TextTransparency       = IsSelected() and 0.05 or 0.25,
				TextSize               = Creator.Type.BodyMD,
				FontFace               = Font.new(Creator.Font,
					IsSelected() and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium),
				Text                   = label,
				TextTruncate           = Enum.TextTruncate.AtEnd,
			})

			local ItemBg = Creator.NewRoundFrame(R - 4, "Squircle", {
				Size              = UDim2.new(1, 0, 0, ItemH),
				ThemeTag          = { ImageColor3 = "ElementBackground" },
				ImageTransparency = IsSelected() and 0.72 or 1,
				Name              = "Item_" .. i,
			}, {
				New("TextButton", {
					Size                   = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Text                   = "",
					Name                   = "Hit",
				}, {
					ItemLabel,
					CheckMark,
					New("UIListLayout", {
						FillDirection       = "Horizontal",
						VerticalAlignment   = "Center",
						HorizontalAlignment = "Left",
						Padding             = UDim.new(0, 8),
					}),
					New("UIPadding", {
						PaddingLeft  = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 8),
					}),
				}),
			})

			-- hover
			ItemBg.Hit.MouseEnter:Connect(function()
				Tween(ItemBg, Creator.Anim.Fast, {
					ImageTransparency = IsSelected() and 0.60 or 0.82,
				}):Play()
			end)
			ItemBg.Hit.MouseLeave:Connect(function()
				Tween(ItemBg, Creator.Anim.Fast, {
					ImageTransparency = IsSelected() and 0.72 or 1,
				}):Play()
			end)

			-- click
			Creator.AddSignal(ItemBg.Hit.MouseButton1Click, function()
				if DropdownData.Disabled then return end
				if Multi then
					DropdownData.Value[option] = not DropdownData.Value[option]
					local sel = DropdownData.Value[option]
					Tween(CheckMark, Creator.Anim.Fast, { ImageTransparency = sel and 0 or 1 }):Play()
					Tween(ItemBg,    Creator.Anim.Fast, { ImageTransparency = sel and 0.72 or 1 }):Play()
					ItemLabel.TextTransparency = sel and 0.05 or 0.25
					ItemLabel.FontFace = Font.new(Creator.Font,
						sel and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium)
				else
					DropdownData.Value = option
					-- reset all then mark selected
					for _, f in pairs(ItemFrames) do
						if f ~= ItemBg then
							Tween(f, Creator.Anim.Fast, { ImageTransparency = 1 }):Play()
							if f:FindFirstChild("Hit") then
								local lbl2 = f.Hit:FindFirstChildOfClass("TextLabel")
								local chk2 = f.Hit:FindFirstChild("Check")
								if lbl2 then lbl2.TextTransparency = 0.25; lbl2.FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium) end
								if chk2 then Tween(chk2, Creator.Anim.Fast, { ImageTransparency = 1 }):Play() end
							end
						end
					end
					Tween(ItemBg, Creator.Anim.Fast, { ImageTransparency = 0.72 }):Play()
					Tween(CheckMark, Creator.Anim.Fast, { ImageTransparency = 0 }):Play()
					ItemLabel.TextTransparency = 0.05
					ItemLabel.FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold)
				end
				SyncLabel()
				Creator.SafeCallback(Callback, Multi and DropdownData.Value or DropdownData.Value)
			end)

			ItemBg.Parent = ItemList
			table.insert(ItemFrames, ItemBg)
		end
	end

	BuildItems()

	-- Search filter
	SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
		BuildItems(SearchBox.Text)
	end)

	-- ── Open / Close popup ───────────────────────────────────────
	local function CalcPopupH()
		local count = #ItemFrames
		return math.clamp(count * (ItemH + 2) + 38 + 14, 42, MaxH)
	end

	local function OpenPopup()
		if DropdownData.Opened or DropdownData.Disabled then return end
		DropdownData.Opened  = true
		PopupFrame.Visible   = true
		PopupFrame.ZIndex    = 99

		local targetH = CalcPopupH()
		Tween(PopupFrame, Creator.Anim.Normal, {
			Size = UDim2.new(1, 0, 0, targetH),
		}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(PopupFrame, Creator.Anim.Fast, { ImageTransparency = 0.06 }):Play()
		Tween(ChevLabel, Creator.Anim.Normal, {
			Rotation = 180, ImageTransparency = 0.15,
		}):Play()
	end

	local function ClosePopup()
		if not DropdownData.Opened then return end
		DropdownData.Opened = false
		Tween(PopupFrame, Creator.Anim.Normal, {
			Size = UDim2.new(1, 0, 0, 0),
		}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(PopupFrame, Creator.Anim.Fast, { ImageTransparency = 1 }):Play()
		Tween(ChevLabel, Creator.Anim.Normal, {
			Rotation = 0, ImageTransparency = 0.45,
		}):Play()
		task.delay(Creator.Anim.Normal, function()
			if not DropdownData.Opened then
				PopupFrame.Visible = false
			end
		end)
		SearchBox.Text = ""
	end

	Creator.AddSignal(HeaderFrame.HitBox.MouseButton1Click, function()
		if DropdownData.Opened then ClosePopup() else OpenPopup() end
	end)

	-- click outside
	Creator.AddSignal(UserInputService.InputBegan, function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
		if not DropdownData.Opened then return end
		local pos    = input.Position
		local pAbsPos = PopupFrame.AbsolutePosition
		local pAbsSz  = PopupFrame.AbsoluteSize
		if pos.X < pAbsPos.X or pos.X > pAbsPos.X + pAbsSz.X
		or pos.Y < pAbsPos.Y or pos.Y > pAbsPos.Y + pAbsSz.Y then
			ClosePopup()
		end
	end)

	-- hover header
	HeaderFrame.HitBox.MouseEnter:Connect(function()
		Tween(HeaderFrame, Creator.Anim.Fast, { ImageTransparency = 0.72 }):Play()
	end)
	HeaderFrame.HitBox.MouseLeave:Connect(function()
		Tween(HeaderFrame, Creator.Anim.Fast, { ImageTransparency = 0.84 }):Play()
	end)

	-- ── Public API ───────────────────────────────────────────────
	local API = {}

	function API:SetOptions(opts)
		DropdownData.Options = opts or {}
		BuildItems(SearchBox.Text)
	end

	function API:SetValue(v)
		if Multi then
			if type(v) == "table" then
				DropdownData.Value = {}
				for _, k in ipairs(v) do DropdownData.Value[k] = true end
			end
		else
			DropdownData.Value = v
		end
		SyncLabel()
		BuildItems(SearchBox.Text)
	end

	function API:GetValue()
		return DropdownData.Value
	end

	function API:SetDisabled(v)
		DropdownData.Disabled = v
		Tween(HeaderFrame, Creator.Anim.Normal, {
			ImageTransparency = v and 0.55 or 0.84,
		}):Play()
		Tween(ValueLabel, Creator.Anim.Normal, {
			TextTransparency = v and 0.6 or (DropdownData.Value ~= nil and 0.15 or 0.5),
		}):Play()
	end

	function API:Open()  OpenPopup()  end
	function API:Close() ClosePopup() end

	DropdownContainer._API = API
	return DropdownContainer
end

return Dropdown
