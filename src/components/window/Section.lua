-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Section (window)               ║
-- ║   Modern header · subtitle · collapse anim      ║
-- ╚══════════════════════════════════════════════════╝
local Section = {}

local Creator = require("../../modules/Creator")
local New     = Creator.New
local Tween   = Creator.Tween

local TabModule = require("./Tab")

function Section.New(SectionConfig, Parent, Folder, UIScale, Window)
	local SectionModule = {
		Title      = SectionConfig.Title    or "Section",
		Subtitle   = SectionConfig.Subtitle or nil,
		Icon       = SectionConfig.Icon,
		IconThemed = SectionConfig.IconThemed,
		Opened     = SectionConfig.Opened   or false,

		HeaderSize  = SectionConfig.Subtitle and 56 or 42,
		IconSize    = 18,

		Expandable  = false,
	}

	-- ── Optional section icon ──────────────────────────────────
	local IconFrame
	if SectionModule.Icon then
		IconFrame = Creator.Image(
			SectionModule.Icon,
			SectionModule.Icon,
			0,
			Folder,
			"Section",
			true,
			SectionModule.IconThemed,
			"TabSectionIcon"
		)
		IconFrame.Size = UDim2.new(0, SectionModule.IconSize, 0, SectionModule.IconSize)
		IconFrame.ImageLabel.ImageTransparency = 0.25
	end

	-- ── Chevron toggle icon ────────────────────────────────────
	local ChevronIconFrame = New("Frame", {
		Size                   = UDim2.new(0, 16, 0, 16),
		BackgroundTransparency = 1,
		Visible                = false,
	}, {
		New("ImageLabel", {
			Size                   = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image                  = Creator.Icon("chevron-down")[1],
			ImageRectSize          = Creator.Icon("chevron-down")[2].ImageRectSize,
			ImageRectOffset        = Creator.Icon("chevron-down")[2].ImageRectPosition,
			ThemeTag               = { ImageColor3 = "Icon" },
			ImageTransparency      = 0.55,
		}),
	})

	-- ── Header text column (title + optional subtitle) ─────────
	local TitleLabel = New("TextLabel", {
		Text             = SectionModule.Title,
		TextXAlignment   = "Left",
		Size             = UDim2.new(1, 0, 0, 18),
		ThemeTag         = { TextColor3 = "Text" },
		FontFace         = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		TextSize         = Creator.Type.BodyLG,
		BackgroundTransparency = 1,
		TextTransparency = 0.35,
		TextWrapped      = false,
		TextTruncate     = Enum.TextTruncate.AtEnd,
	})

	local SubtitleLabel
	if SectionModule.Subtitle then
		SubtitleLabel = New("TextLabel", {
			Text             = SectionModule.Subtitle,
			TextXAlignment   = "Left",
			Size             = UDim2.new(1, 0, 0, 14),
			ThemeTag         = { TextColor3 = "SubText" },
			FontFace         = Font.new(Creator.Font, Enum.FontWeight.Regular),
			TextSize         = Creator.Type.Caption,
			BackgroundTransparency = 1,
			TextTransparency = 0.55,
			TextWrapped      = false,
			TextTruncate     = Enum.TextTruncate.AtEnd,
		})
	end

	local TextColumn = New("Frame", {
		Size                   = UDim2.new(1, -32, 1, 0),
		BackgroundTransparency = 1,
		AutomaticSize          = "Y",
	}, {
		TitleLabel,
		SubtitleLabel,
		New("UIListLayout", {
			FillDirection    = "Vertical",
			Padding          = UDim.new(0, 2),
			VerticalAlignment = "Center",
		}),
	})

	-- ── Separator line beneath header ──────────────────────────
	local Separator = New("Frame", {
		Size                   = UDim2.new(1, -22, 0, 1),
		Position               = UDim2.new(0, 11, 0, SectionModule.HeaderSize - 1),
		BackgroundTransparency = 0.88,
		ThemeTag               = { BackgroundColor3 = "Outline" },
	})

	-- ── Root frame ────────────────────────────────────────────
	local SectionFrame = New("Frame", {
		Size               = UDim2.new(1, 0, 0, SectionModule.HeaderSize),
		BackgroundTransparency = 1,
		Parent             = Parent,
		ClipsDescendants   = true,
	}, {
		-- Header button (entire header is the hit target)
		New("TextButton", {
			Size                   = UDim2.new(1, 0, 0, SectionModule.HeaderSize),
			BackgroundTransparency = 1,
			Text                   = "",
			Name                   = "HeaderButton",
		}, {
			IconFrame,
			TextColumn,
			ChevronIconFrame,
			New("UIListLayout", {
				FillDirection      = "Horizontal",
				VerticalAlignment  = "Center",
				Padding            = UDim.new(0, 10),
			}),
			New("UIPadding", {
				PaddingLeft  = UDim.new(0, 11),
				PaddingRight = UDim.new(0, 11),
			}),
		}),
		Separator,
		-- Content container
		New("Frame", {
			BackgroundTransparency = 1,
			Size                   = UDim2.new(1, 0, 0, 0),
			AutomaticSize          = "Y",
			Name                   = "Content",
			Visible                = true,
			Position               = UDim2.new(0, 0, 0, SectionModule.HeaderSize),
		}, {
			New("UIListLayout", {
				FillDirection      = "Vertical",
				Padding            = UDim.new(0, Window.Gap),
				VerticalAlignment  = "Bottom",
			}),
		}),
	})

	-- ── Hover highlight on header ──────────────────────────────
	local HeaderBtn = SectionFrame.HeaderButton
	HeaderBtn.MouseEnter:Connect(function()
		Tween(TitleLabel, Creator.Anim.Fast, { TextTransparency = 0.15 }):Play()
		if SubtitleLabel then
			Tween(SubtitleLabel, Creator.Anim.Fast, { TextTransparency = 0.35 }):Play()
		end
	end)
	HeaderBtn.MouseLeave:Connect(function()
		Tween(TitleLabel, Creator.Anim.Fast, { TextTransparency = 0.35 }):Play()
		if SubtitleLabel then
			Tween(SubtitleLabel, Creator.Anim.Fast, { TextTransparency = 0.55 }):Play()
		end
	end)

	-- ── Collapse / Expand ──────────────────────────────────────
	function SectionModule:Open()
		if not SectionModule.Expandable then return end
		SectionModule.Opened = true
		local contentH = SectionFrame.Content.AbsoluteSize.Y / UIScale
		Tween(SectionFrame, 0.33, {
			Size = UDim2.new(1, 0, 0, SectionModule.HeaderSize + contentH),
		}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(ChevronIconFrame.ImageLabel, 0.22, {
			Rotation = 180, ImageTransparency = 0.15,
		}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Separator, 0.22, { BackgroundTransparency = 0.72 }):Play()
	end

	function SectionModule:Close()
		if not SectionModule.Expandable then return end
		SectionModule.Opened = false
		Tween(SectionFrame, 0.26, {
			Size = UDim2.new(1, 0, 0, SectionModule.HeaderSize),
		}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(ChevronIconFrame.ImageLabel, 0.18, {
			Rotation = 0, ImageTransparency = 0.55,
		}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(Separator, 0.22, { BackgroundTransparency = 0.88 }):Play()
	end

	-- ── Tab method ─────────────────────────────────────────────
	function SectionModule:Tab(TabConfig)
		if not SectionModule.Expandable then
			SectionModule.Expandable    = true
			ChevronIconFrame.Visible    = true
		end
		TabConfig.Parent = SectionFrame.Content
		return TabModule.New(TabConfig, UIScale)
	end

	-- ── Click handler ──────────────────────────────────────────
	Creator.AddSignal(HeaderBtn.MouseButton1Click, function()
		if not SectionModule.Expandable then return end
		if SectionModule.Opened then
			SectionModule:Close()
		else
			SectionModule:Open()
		end
	end)

	-- Re-measure when content changes size
	Creator.AddSignal(
		SectionFrame.Content.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"),
		function()
			if SectionModule.Opened then SectionModule:Open() end
		end
	)

	-- Auto-open on spawn
	if SectionModule.Opened then
		task.spawn(function()
			task.wait()
			SectionModule:Open()
		end)
	end

	return SectionModule
end

return Section
