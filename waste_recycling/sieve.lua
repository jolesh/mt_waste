local S = minetest.get_translator(minetest.get_current_modname())

function setlootdirt(wastelevel)
	if wastelevel == 2 then
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
	elseif wastelevel == 4 then
		return "default:dirt"
	end
end

function sievedirt(pos, node, clicker, itemstack, pointed_thing, wastelevel)
   if clicker:is_player() then
      local inv = clicker:get_inventory()
      if not inv then
         minetest.add_item(clicker:get_pos(), setlootdirt(wastelevel))
         return
      end
      remaining = inv:add_item("main", setlootdirt(wastelevel))
      if remaining:is_empty() then
      else
         minetest.add_item(clicker:get_pos(), setlootdirt(wastelevel))
         minetest.chat_send_player(clicker:get_player_name(), "Inventory full; item dropped!")
      end
   end
end

--Empty Sieve

minetest.register_node("waste_recycling:sieve_empty", {
	description = S("Sieve"),
	drawtype = "nodebox",
    tiles = {
          "waste_recycling_sieve_empty_td.png",  -- TOP
          "waste_recycling_sieve_empty_td.png",  -- BOTTOM
          "default_wood.png",  -- LEFT
          "default_wood.png",  -- RIGHT
          "default_wood.png",  -- FRONT
          "default_wood.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125,  0.0000, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125,  0.0000, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125,  0.0000,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125,  0.0000,  0.3125}, --Leg NW
         {-0.4375,  0.0000, -0.4375, -0.3125,  0.1250,  0.4375}, --Corpse W
         { 0.4375,  0.0000, -0.4375,  0.3125,  0.1250,  0.4375}, --Corpse E
         { 0.4375,  0.0000, -0.4375, -0.3125,  0.1250, -0.3125}, --Corpse S
         { 0.4375,  0.0000,  0.4375, -0.3125,  0.1250,  0.3125}, --Corpse N
         {-0.3125,  0.0000, -0.3125,  0.3125,  0.0000,  0.3125}, --Grid
		},
	},

	selection_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125,  0.0000, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125,  0.0000, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125,  0.0000,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125,  0.0000,  0.3125}, --Leg NW
         {-0.4375,  0.0000, -0.4375,  0.4375,  0.1250,  0.4375}, --Corpse
		},
	},



	groups = {choppy = 2, oddly_breakable_by_hand = 1},
	--sounds = metal_sounds,

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      if clicker:is_player() then
          local nodename = itemstack:get_name()
          if nodename:match("waste_materials:trashy_dirt") then
               if not minetest.settings:get_bool("creative_mode") then
                   itemstack:take_item()
               end
               minetest.swap_node(pos, { name = "waste_recycling:sieve_trashy_dirt_8" })
          end
      end
   end,
})

minetest.register_craftitem("waste_recycling:grid_stick", {
   description = S("Stick Grid"),
   inventory_image = "waste_recycling_grid_stick.png",
})

minetest.register_craft({
	output = "waste_recycling:grid_stick",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
      {"group:stick", "group:stick", "group:stick"},
	}
})

minetest.register_craft({
	output = "waste_recycling:sieve_empty",
	recipe = {
		{"group:wood", "waste_recycling:grid_stick", "group:wood"},
		{"group:wood", "",                    "group:wood"}
	}
})

--Sieves with Trashy Dirt

minetest.register_node("waste_recycling:sieve_trashy_dirt_8", {
	description = S("Sieve with trashy_dirt"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_sieve_trashy_dirt_t.png",  -- TOP
          "default_wood.png^waste_recycling_sieve_trashy_dirt_b.png",  -- BOTTOM
          "default_wood.png^waste_recycling_sieve_trashy_dirt_8.png",  -- LEFT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_8.png",  -- RIGHT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_8.png",  -- FRONT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_8.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125,  0.0000, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125,  0.0000, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125,  0.0000,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125,  0.0000,  0.3125}, --Leg NW
         {-0.4375,  0.0000, -0.4375,  0.4375,  0.1250,  0.4375}, --Corpse
         {-0.3125,  0.1250, -0.3125,  0.3125,  0.5000,  0.3125}, --Block
		},
	},

	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	--sounds = metal_sounds,

   drop = "waste_recycling:sieve_empty",

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      if clicker:is_player() then
         minetest.swap_node(pos, { name = "waste_recycling:sieve_trashy_dirt_6" })
      end
   end,

})

minetest.register_node("waste_recycling:sieve_trashy_dirt_6", {
	description = S("Sieve with trashy_dirt"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_sieve_trashy_dirt_t.png",  -- TOP
          "default_wood.png^waste_recycling_sieve_trashy_dirt_b.png",  -- BOTTOM
          "default_wood.png^waste_recycling_sieve_trashy_dirt_6.png",  -- LEFT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_6.png",  -- RIGHT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_6.png",  -- FRONT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_6.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125,  0.0000, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125,  0.0000, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125,  0.0000,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125,  0.0000,  0.3125}, --Leg NW
         {-0.4375,  0.0000, -0.4375,  0.4375,  0.1250,  0.4375}, --Corpse
         {-0.3125,  0.1250, -0.3125,  0.3125,  0.3750,  0.3125}, --Block
		},
	},

	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	--sounds = metal_sounds,

   drop = "waste_recycling:sieve_empty",

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      if clicker:is_player() then
         minetest.swap_node(pos, { name = "waste_recycling:sieve_trashy_dirt_4" })
      end
   end,
})

minetest.register_node("waste_recycling:sieve_trashy_dirt_4", {
	description = S("Sieve with trashy_dirt"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_sieve_trashy_dirt_t.png",  -- TOP
          "default_wood.png^waste_recycling_sieve_trashy_dirt_b.png",  -- BOTTOM
          "default_wood.png^waste_recycling_sieve_trashy_dirt_4.png",  -- LEFT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_4.png",  -- RIGHT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_4.png",  -- FRONT
          "default_wood.png^waste_recycling_sieve_trashy_dirt_4.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125,  0.0000, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125,  0.0000, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125,  0.0000,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125,  0.0000,  0.3125}, --Leg NW
         {-0.4375,  0.0000, -0.4375,  0.4375,  0.1250,  0.4375}, --Corpse
         {-0.3125,  0.1250, -0.3125,  0.3125,  0.2500,  0.3125}, --Block
		},
	},

	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	--sounds = metal_sounds,

   drop = "waste_recycling:sieve_empty",

   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      if clicker:is_player() then
         minetest.swap_node(pos, { name = "waste_recycling:sieve_trashy_dirt_2" })
			sievedirt(pos, node, clicker, itemstack, pointed_thing, 4)
      end
   end,
})

minetest.register_node("waste_recycling:sieve_trashy_dirt_2", {
	description = S("Sieve with trashy_dirt"),
	drawtype = "nodebox",
    tiles = {
          "default_wood.png^waste_recycling_sieve_trashy_dirt_t.png",  -- TOP
          "default_wood.png^waste_recycling_sieve_trashy_dirt_b.png",  -- BOTTOM
          "default_wood.png",  -- LEFT
          "default_wood.png",  -- RIGHT
          "default_wood.png",  -- FRONT
          "default_wood.png",  -- BACK
        },

	node_box = {
		type = "fixed",
		fixed = {
         {-0.4375, -0.5000, -0.4375, -0.3125,  0.0000, -0.3125}, --Leg SW
         { 0.4375, -0.5000, -0.4375,  0.3125,  0.0000, -0.3125}, --Leg SE
         { 0.4375, -0.5000,  0.4375,  0.3125,  0.0000,  0.3125}, --Leg NE
         {-0.4375, -0.5000,  0.4375, -0.3125,  0.0000,  0.3125}, --Leg NW
         {-0.4375,  0.0000, -0.4375,  0.4375,  0.1250,  0.4375}, --Corpse
         {-0.3125,  0.1250, -0.3125,  0.3125,  0.1250,  0.3125}, --Block
		},
	},

	groups = {choppy = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
	--sounds = metal_sounds,
   drop = {
      max_items = 3,
      items = {
         {
            rarity = 100,
            items = {"default:diamond"}
         },
         {
            rarity = 50,
            items = {"default:mese_crystal"}
         },
         {
            rarity = 20,
            items = {"waste_recycling:lump_small_gold"}
         },
         {
            rarity = 10,
            items = {"waste_recycling:lump_small_iron"}
         },
         {
            rarity = 10,
            items = {"default:coal_lump"}
         },
         {
            rarity = 5,
            items = {"waste_recycling:lump_small_tin"}
         },
         {
            rarity = 5,
            items = {"waste_recycling:lump_small_copper"}
         },
         {
            rarity = 5,
            items = {"default:flint"}
         },
      },
   },

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		if clicker:is_player() then
	      sievedirt(pos, node, clicker, itemstack, pointed_thing, 2)
	   	minetest.swap_node(pos, {name = "waste_recycling:sieve_empty"})
		end
   end,

	--[[
   on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      if clicker:is_player() then
         minetest.dig_node(pos) -- to get drops
         minetest.place_node(pos, {name = "waste_recycling:sieve_empty"})
      end
   end,]]
})
