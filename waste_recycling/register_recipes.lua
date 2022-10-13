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
