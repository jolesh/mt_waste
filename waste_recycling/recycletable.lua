local S = minetest.get_translator(minetest.get_current_modname())

function setloot()
   num = math.random(100)
	if num <= 1 then return "waste_materials:waste_diamond_object"
	elseif num <= 2 then return "waste_materials:waste_gold_object"
	elseif num <= 4 then return "waste_materials:waste_mese_object"
	elseif num <= 6 then return "waste_materials:waste_tin_object"
	elseif num <= 15 then return "waste_materials:waste_copper_object"
	elseif num <= 20 then return "waste_materials:waste_food_can"
	elseif num <= 30 then return "waste_materials:waste_steel_object"
	else return "waste_materials:waste_useless_object"
   end
end

function recycle(pos, node, clicker, itemstack, pointed_thing, wastelevel)
   if clicker:is_player() then
      --Swap node
      if wastelevel == 2 then minetest.swap_node(pos, {name = "waste_recycling:recycle_table"})
      elseif wastelevel == 4 then minetest.swap_node(pos, {name = "waste_recycling:recycle_table_mixed_2"})
      elseif wastelevel == 6 then minetest.swap_node(pos, {name = "waste_recycling:recycle_table_mixed_4"})
      elseif wastelevel == 8 then minetest.swap_node(pos, {name = "waste_recycling:recycle_table_mixed_6"})
      end
     local inv = clicker:get_inventory()
      if not inv then
          minetest.add_item(clicker:get_pos(), setloot())
          return
      end
      remaining = inv:add_item("main", setloot())
      if remaining:is_empty() then
      else
         minetest.add_item(clicker:get_pos(), setloot())
         minetest.chat_send_player(clicker:get_player_name(), "Inventory full; item dropped!")
      end
   end
end

minetest.register_node("waste_recycling:recycle_table", {
	description = S("Recycle Table"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png",  -- TOP
          "default_wood.png",  -- BOTTOM
          "default_wood.png",  -- LEFT
          "default_wood.png",  -- RIGHT
          "default_wood.png",  -- FRONT
          "default_wood.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125, -0.1250, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125, -0.1250, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125, -0.1250,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125, -0.1250,  0.3125}, --Leg NW
         {-0.4375, -0.1250, -0.4375,  0.4375,  0.0000,  0.4375}, --Corpse
         --{-0.3125,  0.0000, -0.3125,  0.3125,  0.1250,  0.3125}, --Block
		},
	},

	groups = {choppy = 2, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults(),

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		 if clicker:is_player() then
			 local nodename = itemstack:get_name()
			 if nodename:match("waste_mixed_node") then
					if not minetest.settings:get_bool("creative_mode") then
						 itemstack:take_item()
					end
					minetest.swap_node(pos, {name = "waste_recycling:recycle_table_mixed_8"})
		  			minetest.sound_play({name = "default_dig_snappy", gain = 0.25})
			  else
					minetest.chat_send_player(clicker:get_player_name(), S("You need Waste!"))
					return itemstack
			 end
		 end
	end,
})

minetest.register_craft({
	output = "waste_recycling:recycle_table",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:stick", ""         , "group:stick"}
	}
})

minetest.register_node("waste_recycling:recycle_table_mixed_8", {
	description = S("Recycle Table"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_recycletable_mixed_t.png",  -- TOP
          "default_wood.png",  -- BOTTOM
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- LEFT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- RIGHT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- FRONT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125, -0.1250, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125, -0.1250, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125, -0.1250,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125, -0.1250,  0.3125}, --Leg NW
         {-0.4375, -0.1250, -0.4375,  0.4375,  0.0000,  0.4375}, --Corpse
         {-0.3125,  0.0000, -0.3125,  0.3125,  0.5000,  0.3125}, --Block
		},
	},

	drop = "waste_recycling:recycle_table",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      recycle(pos, node, clicker, itemstack, pointed_thing, 8)
		minetest.sound_play({name = "default_dig_snappy", gain = 0.4, pitch = 0.9})
   end,
})

minetest.register_node("waste_recycling:recycle_table_mixed_6", {
	description = S("Recycle Table"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_recycletable_mixed_t.png",  -- TOP
          "default_wood.png",  -- BOTTOM
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- LEFT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- RIGHT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- FRONT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125, -0.1250, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125, -0.1250, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125, -0.1250,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125, -0.1250,  0.3125}, --Leg NW
         {-0.4375, -0.1250, -0.4375,  0.4375,  0.0000,  0.4375}, --Corpse
         {-0.3125,  0.0000, -0.3125,  0.3125,  0.3750,  0.3125}, --Block
		},
	},

	drop = "waste_recycling:recycle_table",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      recycle(pos, node, clicker, itemstack, pointed_thing, 6)
		minetest.sound_play({name = "default_dig_snappy", gain = 0.3})
   end,
})

minetest.register_node("waste_recycling:recycle_table_mixed_4", {
	description = S("Recycle Table"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_recycletable_mixed_t.png",  -- TOP
          "default_wood.png",  -- BOTTOM
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- LEFT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- RIGHT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- FRONT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125, -0.1250, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125, -0.1250, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125, -0.1250,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125, -0.1250,  0.3125}, --Leg NW
         {-0.4375, -0.1250, -0.4375,  0.4375,  0.0000,  0.4375}, --Corpse
         {-0.3125,  0.0000, -0.3125,  0.3125,  0.2500,  0.3125}, --Block
		},
	},

	drop = "waste_recycling:recycle_table",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      recycle(pos, node, clicker, itemstack, pointed_thing, 4)
		minetest.sound_play({name = "default_dig_snappy", gain = 0.35, pitch = 1.1})
   end,
})

minetest.register_node("waste_recycling:recycle_table_mixed_2", {
	description = S("Recycle Table"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_recycletable_mixed_t.png",  -- TOP
          "default_wood.png",  -- BOTTOM
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- LEFT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- RIGHT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- FRONT
          "default_wood.png^waste_recycling_recycletable_mixed_side.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125, -0.1250, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125, -0.1250, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125, -0.1250,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125, -0.1250,  0.3125}, --Leg NW
         {-0.4375, -0.1250, -0.4375,  0.4375,  0.0000,  0.4375}, --Corpse
         {-0.3125,  0.0000, -0.3125,  0.3125,  0.1250,  0.3125}, --Block
		},
	},

	drop = "waste_recycling:recycle_table",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      recycle(pos, node, clicker, itemstack, pointed_thing, 2)
		minetest.sound_play({name = "default_dig_snappy", gain = 0.35, pitch = 0.8})
   end,
})
