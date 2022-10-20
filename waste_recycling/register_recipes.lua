--Burning

minetest.register_craft({
	type = "fuel",
	recipe = "waste_materials:waste_useless_powder",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "waste_materials:waste_useless_object",
	burntime = 2,
})

--Smelting

minetest.register_craft({
   type = "cooking",
   output = "default:glass",
   recipe = "waste_materials:waste_glass_raw",
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:tin_nugget",
   recipe = "waste_materials:tin_powder",
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:copper_nuggett",
   recipe = "waste_materials:copper_powder",
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:steel_nugget",
   recipe = "waste_materials:steel_powder",
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:gold_nugget",
   recipe = "waste_materials:gold_powder",
})

---From Object Waste

minetest.register_craft({
   type = "cooking",
   output = "nuggets:steel_nugget",
   recipe = "waste_materials:waste_food_can_empty",
	cooktime = 2,
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:steel_nugget",
   recipe = "waste_materials:waste_steel_object",
	cooktime = 2,
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:gold_nugget",
   recipe = "waste_materials:waste_gold_object",
	cooktime = 2,
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:copper_nugget",
   recipe = "waste_materials:waste_copper_object",
	cooktime = 2,
})

minetest.register_craft({
   type = "cooking",
   output = "nuggets:tin_nugget",
   recipe = "waste_materials:waste_tin_object",
	cooktime = 2,
})

minetest.register_craft({
   type = "shapeless",
   output = "default:mese_crystal_fragment",
   recipe = {"waste_materials:waste_mese_object"},
})

minetest.register_craft({
   type = "shapeless",
   output = "nuggets:diamond_shard",
   recipe = {"waste_materials:waste_diamond_object"},
	replacements = {{"waste_materials:waste_diamond_object", "waste_materials:waste_gold_object"}},
})

--Machines

minetest.register_craft({
	output = "waste_recycling:case_t1",
	recipe = {
		{""                   , "default:steel_ingot", ""},
		{"default:steel_ingot", "group:wood"         , "default:steel_ingot"},
		{""                   , "default:steel_ingot", ""},
	}
})

minetest.register_craft({
	output = "waste_recycling:hammermill_t1",
	recipe = {
		{""                   , "default:steel_ingot"    , ""},
		{"default:steel_ingot", "waste_recycling:case_t1", "default:steel_ingot"},
		{""                   , "default:furnace"        , ""},
	}
})

minetest.register_craft({
	output = "waste_recycling:shaker_table_t1",
	recipe = {
		{""                   , "waste_recycling:sieve_empty"    , ""},
		{"waste_recycling:grid_stick", "waste_recycling:case_t1", "waste_recycling:grid_stick"},
		{""                   , "default:furnace"        , ""},
	}
})
