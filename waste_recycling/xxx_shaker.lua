--------------------------------------------------------------------------------
--  Shaker  --------------------------------------------------------------------
--------------------------------------------------------------------------------
local item_percent = 50
local fuel_percent = 0

--------------------------------------------------------------------------------
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

--------------------------------------------------------------------------------
local function get_formspec_bench() -- Shaker formspec
	return "size[8,8.25]"..
--        "label[1,0.5;This is shown on right click]" ..
		"list[context;src;4.5,0;2,2]"..
		"image[4.5,1;1,1;gui_furnace_arrow_bg.png^[lowpart:"..(item_percent)..":gui_furnace_arrow_fg.png^[transformR180]]]"..
--		"image[4.5,1;1,1;gui_furnace_arrow_bg.png^[leftpart:"..(item_percent)..":gui_furnace_arrow_fg.png^[transformR180]]]"..
		"list[context;dst;4,2;2,2]"..
		"list[context;fuel;2,1;1,1]"..
		"image[3,1;1,1;default_furnace_fire_bg.png^[lowpart:"..(fuel_percent)..":default_furnace_fire_fg.png]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"--..
--		"listring[context;dst]"..
--		"listring[current_player;main]"..
--		"listring[context;src]"..
--		"listring[current_player;main]"..
--		"listring[context;fuel]"..
--		"listring[current_player;main]"..
--		default.get_hotbar_bg(0, 4.25)
--		"list[current_player;main;0,4.25;8,4;]"
end

--------------------------------------------------------------------------------
local function hammer(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack("src", 1)
	if stack:get_name() == "waste_materials:waste_mixed_node" then
		inv:add_item("dst", setloot()) --add dst
		inv:remove_item("src", stack:get_name()) --reduce src
        if inv:is_empty("src") then --call again if more, else exit
           return
        else
           local timer = minetest.get_node_timer(pos)
           timer:start(1.0)
        end
	end
end

--------------------------------------------------------------------------------
local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv  = meta:get_inventory()

	if listname == "fuel" then
--		if minetest.get_craft_dst({method="fuel", width=1, items={stack}}).time ~= 0 then
--			if inv:is_empty("src") then
--				meta:set_string("infotext", S("Furnace is empty"))
--			end
			return stack:get_count()
--		else
--			return 0
--		end
	elseif listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

--------------------------------------------------------------------------------
local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

--------------------------------------------------------------------------------
local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

--------------------------------------------------------------------------------
minetest.register_node("waste_recycling:shaker", {
--   description = S("Hammermill"),
   description = "Shaker",
   tiles = {
         "waste_recycling_case_t1.png",  -- TOP
         "waste_recycling_case_t1.png",  -- BOTTOM
         "waste_recycling_case_t1.png",  -- LEFT
         "waste_recycling_case_t1.png",  -- RIGHT
         "waste_recycling_case_t1.png",  -- FRONT
         "waste_recycling_case_t1.png",  -- Back
--[[
         { -- BACK
   			image = "waste_recycling_animation_hammermill.png",
   			backface_culling = false,
   			animation = {
   				type = "vertical_frames",
   				aspect_w = 16,
   				aspect_h = 16,
   				length = 0.2
   			},
         },
]]
      },
    paramtype2 = "facedir",
    groups = {oddly_breakable_by_hand = 2},

    on_construct = function(pos, node) --Create Hammermill UI
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      inv:set_size("src", 1)
      inv:set_size("fuel", 1)
      inv:set_size("dst", 4)
      meta:set_string("formspec", get_formspec_bench())
    end,

    on_metadata_inventory_put = function(pos, listname, index, stack, player)
      local timer = minetest.get_node_timer(pos)
      timer:start(1)
    end,

    on_timer = function(pos)
      hammer(pos)
      return false
    end,

   	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,

	on_metadata_inventory_put = function(pos)
		minetest.get_node_timer(pos):start(1.0) -- start timer function, it will sort out whether furnace can burn or not.
	end,

	on_metadata_inventory_take = function(pos)
		minetest.get_node_timer(pos):start(1.0) -- check whether the furnace is empty or not.
	end,

   	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})



--------------------------------------------------------------------------------------
if minetest.get_modpath("waste_recycling") then
    minetest.register_craft({
	    output = "waste_recycling:shaker",
	    recipe = {
		    {"default:mese_crystal",     "",         "default:mese_crystal"},
		    {"default:furnace", "waste_recycling:recycle_table", "default:diamond"},
		    {"group:stone",     "default:chest",                 "group:stone"},
	    }
    })
else
    minetest.register_craft({
	    output = "waste_recycling:shaker",
	    recipe = {
		    {"group:stone", "",            "group:stone"},
		    {"group:stone", "group:stone", "group:stone"},
		    {"group:stone", "group:stone", "group:stone"},
	    }
    })
end

-- test shaker
if minetest.get_modpath("hopper") then
	hopper:add_container({
		{"top",    "waste_recycling:shaker", "dst"},
		{"bottom", "waste_recycling:shaker", "src"},
		{"side",   "waste_recycling:shaker", "fuel"},
	})
end
