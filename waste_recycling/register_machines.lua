local S = minetest.get_translator(minetest.get_current_modname())

function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end

--Hammermill T1

local function get_formspec_bench() -- Hammermill T1 formspec
	return "size[10,10]"..
		"image[4,2;1,1;sfinv_crafting_arrow.png]"..
		"list[context;input;2,2;1,1;1]"..
		"list[context;result;7,2;1,1]"..
		"list[current_player;main;1,5;8,4;]"
end

local function hammer(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack("input", 2)
		if stack:get_name() == "waste_materials:waste_metal_node" or stack:get_name() == "waste_materials:waste_mixed_node" then -- check if correct input
			--Find out which input and set output accordingly
			if stack:get_name() == "waste_materials:waste_metal_node" then
				inv:add_item("result", "waste_materials:waste_metal_fine 4")
			elseif stack:get_name() == "waste_materials:waste_mixed_node" then
				inv:add_item("result", "waste_materials:waste_mixed_fine 4")
			elseif stack:get_name() == "waste_materials:waste_useless_object" then
				inv:add_item("result", "waste_materials:waste_useless_powder")
			end

			--set timer if more
			inv:remove_item("input", stack:get_name()) --reduce input
         if inv:is_empty("input") then --call again if more, else exit
            return
         else
            local timer = minetest.get_node_timer(pos)
            timer:start(1.5)
         end
		end
end

minetest.register_node("waste_recycling:hammermill_t1", {
   description = S("Hammermill T1"),
   tiles = {
         "waste_recycling_case_t1.png",  -- TOP
         "waste_recycling_case_t1.png",  -- BOTTOM
         "waste_recycling_case_t1.png",  -- LEFT
         "waste_recycling_case_t1.png",  -- RIGHT
         "waste_recycling_case_t1.png",  -- FRONT
         { -- BACK
   			image = "waste_recycling_animation_hammermill_t1.png",
   			backface_culling = false,
   			animation = {
   				type = "vertical_frames",
   				aspect_w = 16,
   				aspect_h = 16,
   				length = 0.2
   			},
         },
      },
	paramtype2 = "facedir",
   groups = {oddly_breakable_by_hand = 2},

   on_construct = function(pos, node) --Create Hammermill T1 UI
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      inv:set_size("result", 2*1)
      inv:set_size("input", 2*1)
      meta:set_string("formspec", get_formspec_bench())
   end,

   on_metadata_inventory_put = function(pos, listname, index, stack, player)
      local timer = minetest.get_node_timer(pos)
      timer:start(1.5)
   end,

   on_timer = function(pos)
      hammer(pos)
      return false
   end,
})

--Shaker Table

local function get_formspec_shaker_table() -- Shaker Table T1 formspec
	return "size[10,11]"..
		"image[4,2;1,1;sfinv_crafting_arrow.png]"..
		"list[context;input;2,2;1,1;1]"..
		"list[context;result4;7,1;1,1]"..
		"list[context;result3;7,2;1,1]"..
		"list[context;result2;7,3;1,1]"..
		"list[context;result1;7,4;1,1]"..
		"list[current_player;main;1,6;8,4;]"
end

local function shake_t1(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack("input", 2)
		if stack:get_name() == "waste_materials:waste_metal_fine" or stack:get_name() == "waste_materials:waste_mixed_fine" or stack:get_name() == "waste_materials:waste_useless_fine" then -- check if correct input
			--Find out which input and set output accordingly
			if stack:get_name() == "waste_materials:waste_metal_fine" then
				num = math.random(100) --add result
			   if num <= 4 then inv:add_item("result1", "waste_materials:gold_powder")
			   elseif num <= 30 then inv:add_item("result2", "waste_materials:steel_powder")
			   elseif num <= 34 then inv:add_item("result3", "waste_materials:tin_powder")
			   else inv:add_item("result4", "waste_materials:waste_unrecycleable_fine")
			   end
			elseif stack:get_name() == "waste_materials:waste_mixed_fine" then
				num = math.random(100) --add result
			   if num <= 2 then inv:add_item("result1", "waste_materials:gold_powder")
			   elseif num <= 15 then inv:add_item("result2", "waste_materials:steel_powder")
			   elseif num <= 17 then inv:add_item("result3", "waste_materials:tin_powder")
			   else inv:add_item("result4", "waste_materials:waste_unrecycleable_fine")
			   end
			elseif stack:get_name() == "waste_materials:waste_useless_fine" then
				num = math.random(200) --add result
				if num <= 1 then inv:add_item("result1", "waste_materials:gold_powder")
				elseif num <= 15 then inv:add_item("result2", "waste_materials:steel_powder")
			   elseif num <= 17 then inv:add_item("result3", "waste_materials:tin_powder")
			   else inv:add_item("result4", "waste_materials:waste_unrecycleable_fine")
			   end
			end

		inv:remove_item("input", stack:get_name()) --reduce input
      if inv:is_empty("input") then --call again if more, else exit
         return
      else
         local timer = minetest.get_node_timer(pos)
         timer:start(1.5)
      end
	end
end

minetest.register_node("waste_recycling:shaker_table_t1", {
   description = S("Shaker Table T1"),
   tiles = {{ -- BACK
		image = "waste_recycling_animation_hammermill_t1.png",
		backface_culling = false,
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 0.2
		},
	},
         "waste_recycling_case_t1.png",  -- TOP
         "waste_recycling_case_t1.png",  -- BOTTOM
         "waste_recycling_case_t1.png",  -- LEFT
         "waste_recycling_case_t1.png",  -- RIGHT
         "waste_recycling_case_t1.png",  -- FRONT

      },
	paramtype2 = "facedir",
   groups = {oddly_breakable_by_hand = 2},

   on_construct = function(pos, node) --Create Shaker Table T1 UI
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      inv:set_size("result4", 2*1)
      inv:set_size("result3", 2*1)
      inv:set_size("result2", 2*1)
      inv:set_size("result1", 2*1)
      inv:set_size("input", 2*1)
      meta:set_string("formspec", get_formspec_shaker_table())
   end,

   on_metadata_inventory_put = function(pos, listname, index, stack, player)
      local timer = minetest.get_node_timer(pos)
      timer:start(1.5)
   end,

   on_timer = function(pos)
      shake_t1(pos)
      return false
   end,
})
