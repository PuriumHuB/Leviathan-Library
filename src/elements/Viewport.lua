-- ╔══════════════════════════════════════════════════╗
-- ║   Leviathan UI — Viewport element               ║
-- ║   Camera fit · auto center · auto rotate ·      ║
-- ║   loading fallback                              ║
-- ╚══════════════════════════════════════════════════╝
local Viewport = {}

local Creator    = require("../modules/Creator")
local New        = Creator.New
local Tween      = Creator.Tween

local cloneref   = (cloneref or clonereference or function(i) return i end)
local RunService = cloneref(game:GetService("RunService"))

-- ── Compute model bounding sphere ───────────────────────────
local function ModelBounds(model)
	local parts = {}
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA("BasePart") then
			table.insert(parts, d)
		end
	end
	if #parts == 0 then
		local cf = model:IsA("Model") and model:GetPivot() or CFrame.new()
		return cf.Position, 2
	end

	local minX, minY, minZ =  math.huge,  math.huge,  math.huge
	local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge

	for _, p in ipairs(parts) do
		local pos  = p.Position
		local half = p.Size / 2
		minX = math.min(minX, pos.X - half.X)
		minY = math.min(minY, pos.Y - half.Y)
		minZ = math.min(minZ, pos.Z - half.Z)
		maxX = math.max(maxX, pos.X + half.X)
		maxY = math.max(maxY, pos.Y + half.Y)
		maxZ = math.max(maxZ, pos.Z + half.Z)
	end

	local center = Vector3.new(
		(minX + maxX) / 2,
		(minY + maxY) / 2,
		(minZ + maxZ) / 2
	)
	local radius = (Vector3.new(maxX, maxY, maxZ) - center).Magnitude

	return center, math.max(radius, 0.5)
end

-- ── Fit camera to model ──────────────────────────────────────
local function FitCamera(vp, model, fovDeg, yOffset)
	local center, radius = ModelBounds(model)
	fovDeg  = fovDeg  or 35
	yOffset = yOffset or 0

	local fovRad  = math.rad(fovDeg)
	local dist    = radius / math.tan(fovRad / 2) * 1.15  -- 15% padding

	local camPos  = center + Vector3.new(0, radius * 0.25 + yOffset, -dist)
	vp.CurrentCamera.CFrame = CFrame.lookAt(camPos, center + Vector3.new(0, yOffset, 0))
	vp.CurrentCamera.FieldOfView = fovDeg
end

-- ── New ──────────────────────────────────────────────────────
function Viewport.New(Config, Parent)
	local vpWidth  = Config.Width    or 100
	local vpHeight = Config.Height   or 100
	local vpR      = Config.Radius   or Creator.Radius.M
	local fov      = Config.FOV      or 35
	local autoRot  = Config.AutoRotate ~= false
	local rotSpeed = Config.RotateSpeed or 30    -- degrees/sec
	local yOffset  = Config.YOffset  or 0
	local lightDir = Config.LightDirection or Vector3.new(-1, -2, -1)

	-- ── Loading skeleton ──────────────────────────────────────
	local LoadingFrame = New("Frame", {
		Size                   = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Name                   = "Loading",
		Visible                = true,
	}, {
		New("UICorner", { CornerRadius = UDim.new(0, vpR) }),
		-- shimmer bar
		New("Frame", {
			AnchorPoint            = Vector2.new(0.5, 0.5),
			Position               = UDim2.new(0.5, 0, 0.5, 0),
			Size                   = UDim2.new(0.45, 0, 0, 3),
			BackgroundTransparency = 0.6,
			ThemeTag               = { BackgroundColor3 = "Outline" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 999) }),
		}),
	})

	-- ── Viewport frame ────────────────────────────────────────
	local VPF = New("ViewportFrame", {
		Size                   = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		LightColor             = Color3.new(1, 1, 1),
		LightDirection         = lightDir,
		ImageTransparency      = 1,  -- fade in after load
		Name                   = "VP",
	})

	-- Soft corner mask
	local Mask = Creator.NewRoundFrame(vpR, "Squircle", {
		Size              = UDim2.new(1, 0, 1, 0),
		ImageColor3       = Color3.new(0, 0, 0),
		ImageTransparency = 1,
		ZIndex            = 10,
	})

	local Container = New("Frame", {
		Size                   = UDim2.new(0, vpWidth, 0, vpHeight),
		BackgroundTransparency = 1,
		ClipsDescendants       = true,
		Parent                 = Parent,
		Name                   = "Viewport",
	}, {
		Creator.NewRoundFrame(vpR, "Squircle", {
			Size              = UDim2.new(1, 0, 1, 0),
			ThemeTag          = { ImageColor3 = "ElementBackground" },
			ImageTransparency = 0.75,
		}),
		LoadingFrame,
		VPF,
		Mask,
	})

	-- Add UICorner to clip children natively
	New("UICorner", { CornerRadius = UDim.new(0, vpR) }).Parent = Container

	-- ── Camera setup ──────────────────────────────────────────
	local Cam = Instance.new("Camera")
	Cam.Parent          = VPF
	VPF.CurrentCamera   = Cam

	-- ── Load model / instance ─────────────────────────────────
	local _rotConn
	local _model

	local API = {}

	function API:Load(instance)
		if not instance then return end

		-- clear previous
		if _rotConn then _rotConn:Disconnect(); _rotConn = nil end
		for _, c in ipairs(VPF:GetChildren()) do
			if c ~= Cam then c:Destroy() end
		end

		-- clone into viewport
		_model = instance:Clone()
		_model.Parent = VPF

		-- wait a frame for AbsoluteSize etc.
		task.spawn(function()
			task.wait()
			FitCamera(VPF, _model, fov, yOffset)

			-- fade in
			LoadingFrame.Visible = false
			Tween(VPF, Creator.Anim.Normal, { ImageTransparency = 0 }):Play()

			-- auto rotation pivot node
			local pivotModel = _model:IsA("Model") and _model
				or (function()
					local m = Instance.new("Model")
					_model.Parent = m
					m.Parent = VPF
					return m
				end)()

			if autoRot then
				local center, _ = ModelBounds(pivotModel)
				local angle = 0
				_rotConn = RunService.RenderStepped:Connect(function(dt)
					angle = angle + dt * rotSpeed
					if pivotModel and pivotModel.Parent then
						pivotModel:PivotTo(
							CFrame.new(center)
							* CFrame.Angles(0, math.rad(angle), 0)
							* CFrame.new(-center)
						)
					end
				end)
			end
		end)
	end

	function API:SetRotateSpeed(speed)
		rotSpeed = speed
	end

	function API:SetAutoRotate(v)
		autoRot = v
		if not v and _rotConn then
			_rotConn:Disconnect()
			_rotConn = nil
		end
	end

	function API:FitCamera()
		if _model then FitCamera(VPF, _model, fov, yOffset) end
	end

	function API:GetViewportFrame()
		return VPF
	end

	-- auto-load from Config
	if Config.Model then
		task.defer(function() API:Load(Config.Model) end)
	end

	Container._API = API
	return Container
end

return Viewport
