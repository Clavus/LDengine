------------------------
-- LevelData class.
-- Base class for level data to pass to your @{Level} instance.
-- 
-- Derived from @{Object}.
-- @cl LevelData

local LevelData = class('LevelData')

function LevelData:initialize()
	
	self.level_width = 100
	self.level_height = 100
	self.level_tilewidth = 32
	self.level_tileheight = 32
	self.properties = {}
	self.physics = {}
	self.physics.active = true
	self.physics.pixels_per_meter = 30
	
	-- Example formats for the below tables
	self.layers = {
		--[[
		{
			name = "layername",
			type = <layer type>, -- LAYER_TYPE.IMAGES, LAYER_TYPE.BATCH, LAYER_TYPE.BACKGROUND, LAYER_TYPE.CUSTOM
			opacity = 1,
			x = 0,
			y = 0,
			scale = Vector(1,1),
			angle = 0,
			parallax = 1,
			properties = {},
			
			-- LAYER_TYPE.CUSTOM only:
			drawFunc = function(layer, camera) end -- draw function
			
			-- LAYER_TYPE.BACKGROUND only:
			background_image = image = Image(),
			background_view_w = img:getWidth(), -- quad size on image
			background_view_h = img:getHeight(),
			background_cam_scalar = 0 -- how much it scales with the camera scale, 0 means independent, 1 means same scale
			
			-- LAYER_TYPE.IMAGES only:
			images = {
				{
					x = 0,
					y = 0,
					angle = 0,
					scale = Vector(1,1),
					origin = Vector(0,0),
					image = Image(),
					quad = Quad()
				},
				...
			}
			
			-- LAYER_TYPE.BATCH only:
			batches = { SpriteBatch(), ... }
			tiles = {
				{ 
					tileset = { [tileset table (self.tilesets[x])] },
					draw_quad = Quad(),
					x = 0,
					y = 0
				},
				...
			}
			
		},
		...
		]]--
	}
	self.objects = {
		--[[
		{
			type = "Object",
			x = 320,
			y = 288,
			w = 32, -- if polygon not defined
			h = 32,
			polygon = { { x = 0, y = 0 }, { x = 16, y = 0 }, ... }, -- if w and h not defined
			properties = {}
		},
		...
		]]--
	}
	self.tilesets = {
		--[[
		{
			name = "",
			properties = {},
			image = Image(),
			imagewidth = 320,
			imagheight = 320,
			tilewidth = 32,
			tileheight = 32,
			tilemargin = 0,
			tilespacing = 0
		},
		...
		]]--
	}

end

function LevelData:getLayers()
	return self.layers
end

function LevelData:getObjects()
	return self.objects
end

return LevelData