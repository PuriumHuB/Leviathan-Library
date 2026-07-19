-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Paragraph element              ║
-- ║   Title mode · description mode · better type   ║
-- ╚══════════════════════════════════════════════════╝
local Paragraph = {}

local Creator = require("../modules/Creator")
local New     = Creator.New

--[[
  Config:
    Title       string  — bold heading (optional)
    Content     string  — body copy
    Mode        string  — "Title" | "Description" | "Body" (default)
    MaxWidth    number  — optional max width in px
]]

function Paragraph.New(Config, Parent)
	local title   = Config.Title   or nil
	local content = Config.Content or Config.Text or ""
	local mode    = Config.Mode    or "Body"

	-- ── Mode-specific typography ──────────────────────────────
	local titleSize, bodySize, bodyWeight, bodyTransp

	if mode == "Title" then
		titleSize  = Creator.Type.TitleLG
		bodySize   = Creator.Type.BodyMD
		bodyWeight = Enum.FontWeight.Regular
		bodyTransp = 0.30
	elseif mode == "Description" then
		titleSize  = Creator.Type.BodyLG
		bodySize   = Creator.Type.BodySM
		bodyWeight = Enum.FontWeight.Regular
		bodyTransp = 0.40
	else  -- Body
		titleSize  = Creator.Type.TitleMD
		bodySize   = Creator.Type.BodyMD
		bodyWeight = Enum.FontWeight.Regular
		bodyTransp = 0.25
	end

	-- ── Title row ────────────────────────────────────────────
	local TitleLabel
	if title and title ~= "" then
		TitleLabel = New("TextLabel", {
			BackgroundTransparency = 1,
			Size                   = UDim2.new(1, 0, 0, 0),
			AutomaticSize          = "Y",
			TextWrapped            = true,
			TextXAlignment         = "Left",
			RichText               = true,
			Text                   = title,
			TextSize               = titleSize,
			FontFace               = Font.new(Creator.Font, Enum.FontWeight.Bold),
			ThemeTag               = { TextColor3 = "Text" },
			TextTransparency       = 0.05,
			Name                   = "Title",
		})
	end

	-- ── Body text ─────────────────────────────────────────────
	local BodyLabel = New("TextLabel", {
		BackgroundTransparency = 1,
		Size                   = UDim2.new(1, 0, 0, 0),
		AutomaticSize          = "Y",
		TextWrapped            = true,
		TextXAlignment         = "Left",
		RichText               = true,
		Text                   = content,
		TextSize               = bodySize,
		FontFace               = Font.new(Creator.Font, bodyWeight),
		ThemeTag               = { TextColor3 = "Text" },
		TextTransparency       = bodyTransp,
		LineHeight             = 1.4,
		Name                   = "Body",
	})

	-- ── Container ────────────────────────────────────────────
	local children = {
		BodyLabel,
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding       = UDim.new(0, 5),
			SortOrder     = "LayoutOrder",
		}),
	}

	if TitleLabel then
		table.insert(children, 1, TitleLabel)
	end

	local Container = New("Frame", {
		BackgroundTransparency = 1,
		Size                   = UDim2.new(1, 0, 0, 0),
		AutomaticSize          = "Y",
		Parent                 = Parent,
		Name                   = "Paragraph",
	}, children)

	-- MaxWidth constraint
	if Config.MaxWidth then
		local constraint = New("UISizeConstraint", {
			MaxSize = Vector2.new(Config.MaxWidth, math.huge),
		})
		constraint.Parent = Container
	end

	-- ── Public API ────────────────────────────────────────────
	local API = {}

	function API:SetTitle(text)
		if TitleLabel then TitleLabel.Text = text end
	end

	function API:SetContent(text)
		BodyLabel.Text = text
	end

	function API:SetMode(newMode)
		if newMode == "Title" then
			if TitleLabel then TitleLabel.TextSize = Creator.Type.TitleLG end
			BodyLabel.TextSize        = Creator.Type.BodyMD
			BodyLabel.TextTransparency = 0.30
		elseif newMode == "Description" then
			if TitleLabel then TitleLabel.TextSize = Creator.Type.BodyLG end
			BodyLabel.TextSize        = Creator.Type.BodySM
			BodyLabel.TextTransparency = 0.40
		else
			if TitleLabel then TitleLabel.TextSize = Creator.Type.TitleMD end
			BodyLabel.TextSize        = Creator.Type.BodyMD
			BodyLabel.TextTransparency = 0.25
		end
	end

	Container._API = API
	return Container
end

return Paragraph
