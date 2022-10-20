local S = minetest.get_translator(minetest.get_current_modname())

--Waste Nodes

minetest.register_node("waste_materials:waste_mixed_node", {
   description = S("Mixed Waste"),
   tiles = {"waste_materials_waste_mixed_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1, falling_node = 1, crumbly = 3},
})
--[[
minetest.register_node("waste_materials:waste_general_node", {
   description = S("General Waste"),
   tiles = {"waste_materials_waste_general_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1},
})

minetest.register_node("waste_materials:waste_organic_node", {
   description = S("Organic Waste"),
   tiles = {"waste_materials_waste_organic_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1},
})
]]
minetest.register_node("waste_materials:waste_paper_node", {
   description = S("Paper Waste"),
   tiles = {"waste_materials_waste_paper_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1, falling_node = 1, crumbly = 3},
})
--[[
minetest.register_node("waste_materials:waste_plastic_node", {
   description = S("Plastic Waste"),
   tiles = {"waste_materials_waste_plastic_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1},
})
]]
minetest.register_node("waste_materials:waste_metal_node", {
   description = S("Metal Waste"),
   tiles = "waste_materials_dummy_node.png",
   --tiles = {"waste_materials_waste_metal_node.png"}, --missing
   groups = {oddly_breakable_by_hand = 2, waste = 1, falling_node = 1, crumbly = 3},
})

minetest.register_node("waste_materials:waste_glass_node", {
   description = S("Glass Waste"),
   tiles = "waste_materials_dummy_node.png",
   --tiles = {"waste_materials_waste_glass_node.png"}, --missing
   groups = {oddly_breakable_by_hand = 2, waste = 1},
})

--Wasted Soils

minetest.register_node("waste_materials:trashy_dirt", {
	description = S("Trashy Dirt"),
	tiles = {"default_dirt.png^waste_materials_waste_pieces.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("waste_materials:trashy_dirt_with_grass", {
	description = S("Trashy Dirt with Dead Grass"),
	tiles = {"default_dirt.png^waste_materials_waste_pieces.png^waste_materials_dead_grass.png", "default_dirt.png^waste_materials_waste_pieces.png",
		{name = "default_dirt.png^waste_materials_waste_pieces.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = "waste_materials:trashy_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

--Waste Objects

minetest.register_craftitem("waste_materials:waste_steel_object", {
   description = S("Crushed Steel Can"),
   inventory_image = "waste_materials_waste_steel_object.png",
})

minetest.register_craftitem("waste_materials:waste_gold_object", {
   description = S("Gold Ring"),
   inventory_image = "waste_materials_waste_gold_object.png",
})

minetest.register_craftitem("waste_materials:waste_diamond_object", {
   description = S("Diamond Ring"),
   inventory_image = "waste_materials_waste_diamond_object.png",
})

minetest.register_craftitem("waste_materials:waste_mese_object", {
   description = S("Broken Flashlight"),
   inventory_image = "waste_materials_waste_mese_object.png",
})

minetest.register_craftitem("waste_materials:waste_copper_object", {
   description = S("Copper Waste"),
   inventory_image = "waste_materials_waste_copper_object.png",
})

minetest.register_craftitem("waste_materials:waste_tin_object", {
   description = S("Tin Cans"),
   inventory_image = "waste_materials_waste_tin_object.png",
})

minetest.register_craftitem("waste_materials:waste_useless_object", {
   description = S("Useless Waste"),
   inventory_image = "waste_materials_waste_useless_object.png",
})

minetest.register_craftitem("waste_materials:waste_food_can", {
	description = S("Canned Food"),
	inventory_image = "waste_materials_waste_food_can.png",
	groups = {food = 1},
	on_use = minetest.item_eat(4, "waste_materials:waste_food_can_empty")
})

minetest.register_craftitem("waste_materials:waste_food_can_empty", {
	description = S("Empty Food Can"),
	inventory_image = "waste_materials_waste_food_can_empty.png",
})

--Raw waste

minetest.register_craftitem("waste_materials:waste_glass_raw", {
   description = S("Raw Glass Waste"),
   inventory_image = "waste_materials_waste_glass_raw.png",
})

minetest.register_craftitem("waste_materials:waste_metal_raw", {
   description = S("Raw Metal Waste"),
   inventory_image = "waste_materials_dummy_item.png",
   --inventory_image = "waste_materials_waste_metal_raw.png", --missing
})

minetest.register_craftitem("waste_materials:waste_paper_raw", {
   description = S("Raw Paper Waste"),
   inventory_image = "waste_materials_waste_paper_raw.png",
})

minetest.register_craftitem("waste_materials:waste_plastic_raw", {
   description = S("Raw Plastic Waste"),
   inventory_image = "waste_materials_dummy_item.png",
   --inventory_image = "waste_materials_waste_plastic_raw.png", --missing
})

--Fine Waste

minetest.register_craftitem("waste_materials:waste_glass_fine", {
   description = S("Fine Glass Waste"),
   inventory_image = "waste_materials_dummy_item.png",
   --inventory_image = "waste_materials_waste_glass_fine.png", --missing
})

---Metal

minetest.register_craftitem("waste_materials:waste_metal_fine", {
   description = S("Fine Metal Waste"),
   inventory_image = "waste_materials_waste_metal_fine.png",
})
--[[
minetest.register_craftitem("waste_materials:waste_metal_fine_3", {
   description = S("Fine Light Metal Waste"),
   inventory_image = "waste_materials_waste_metal_fine_3.png",
})]]

minetest.register_craftitem("waste_materials:waste_metal_fine_2", {
   description = S("Fine Normal Metal Waste"),
   inventory_image = "waste_materials_waste_metal_fine_2.png",
})
--[[
minetest.register_craftitem("waste_materials:waste_metal_fine_1", {
   description = S("Fine Heavy Metal Waste"),
   inventory_image = "waste_materials_waste_metal_fine_1.png",
})]]

--Metal Powder

minetest.register_craftitem("waste_materials:tin_powder", {
   description = S("Tin Powder"),
   inventory_image = "waste_materials_tin_powder.png",
})

minetest.register_craftitem("waste_materials:copper_powder", {
   description = S("Copper Powder"),
   inventory_image = "waste_materials_copper_powder.png",
})

minetest.register_craftitem("waste_materials:steel_powder", {
   description = S("Steel Powder"),
   inventory_image = "waste_materials_steel_powder.png",
})

minetest.register_craftitem("waste_materials:gold_powder", {
   description = S("Gold Powder"),
   inventory_image = "waste_materials_gold_powder.png",
})


print("Waste loaded")
