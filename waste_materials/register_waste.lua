local S = minetest.get_translator(minetest.get_current_modname())

--Waste Nodes

minetest.register_node("waste_materials:waste_mixed_node", {
   description = S("Mixed Waste"),
   tiles = {"waste_materials_waste_mixed_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1},
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
   groups = {oddly_breakable_by_hand = 2, waste = 1},
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
   tiles = {"waste_materials_waste_metal_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1},
})

minetest.register_node("waste_materials:waste_glass_node", {
   description = S("Glass Waste"),
   tiles = {"waste_materials_waste_glass_node.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1},
})

--Raw waste

minetest.register_craftitem("waste_materials:waste_glass_raw", {
   description = S("Raw Glass Waste"),
   inventory_image = "waste_materials_waste_glass_raw.png",
})

minetest.register_craftitem("waste_materials:waste_metal_raw", {
   description = S("Raw Metal Waste"),
   inventory_image = "waste_materials_waste_metal_raw.png",
})

minetest.register_craftitem("waste_materials:waste_paper_raw", {
   description = S("Raw Paper Waste"),
   inventory_image = "waste_materials_waste_paper_raw.png",
})

minetest.register_craftitem("waste_materials:waste_plastic_raw", {
   description = S("Raw Plastic Waste"),
   inventory_image = "waste_materials_waste_plastic_raw.png",
})

--Fine Waste

minetest.register_craftitem("waste_materials:waste_glass_fine", {
   description = S("Fine Glass Waste"),
   inventory_image = "waste_materials_waste_glass_fine.png",
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
