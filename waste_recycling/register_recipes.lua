--Smelting

minetest.register_craft({
   type = "cooking",
   output = "default:glass",
   recipe = "waste_materials:waste_glass_raw",
})

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:tin_nugget",
   recipe = "waste_materials:tin_powder",
})

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:copper_nuggett",
   recipe = "waste_materials:copper_powder",
})

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:steel_nugget",
   recipe = "waste_materials:steel_powder",
})

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:gold_nugget",
   recipe = "waste_materials:gold_powder",
})

---From Object Waste

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:steel_nugget",
   recipe = "waste_materials:waste_steel_object",
	cooktime = 2,
})

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:gold_nugget",
   recipe = "waste_materials:waste_gold_object",
	cooktime = 2,
})

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:copper_nugget",
   recipe = "waste_materials:waste_copper_object",
	cooktime = 2,
})

minetest.register_craft({
   type = "cooking",
   output = "simple_recycle:tin_nugget",
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
   output = "default:diamond",
   recipe = {"waste_materials:waste_diamond_object"},
	replacements = {{"waste_materials:waste_diamond_object", "waste_materials:waste_gold_object"}},
})

--Crafting

---Nuggets

if minetest.get_modpath("simple_recycle") then
	return
else

-- to nugget

	minetest.register_craft({
	   type = "shapeless",
	   output = "simple_recycle:steel_nugget 9",
	   recipe = {"default:steel_ingot"},
	})

	minetest.register_craft({
	   type = "shapeless",
	   output = "simple_recycle:bronze_nugget 9",
	   recipe = {"default:bronze_ingot"},
	})

	minetest.register_craft({
	   type = "shapeless",
	   output = "simple_recycle:gold_nugget 9",
	   recipe = {"default:gold_ingot"},
	})

	minetest.register_craft({
	   type = "shapeless",
	   output = "simple_recycle:tin_nugget 9",
	   recipe = {"default:tin_ingot"},
	})

	minetest.register_craft({
	   type = "shapeless",
	   output = "simple_recycle:copper_nugget 9",
	   recipe = {"default:copper_ingot"},
	})

	--to ingot

	minetest.register_craft({
	   output = "default:steel_ingot",
	   recipe = {
	      {"simple_recycle:steel_nugget", "simple_recycle:steel_nugget", "simple_recycle:steel_nugget"},
	      {"simple_recycle:steel_nugget", "simple_recycle:steel_nugget", "simple_recycle:steel_nugget"},
	      {"simple_recycle:steel_nugget", "simple_recycle:steel_nugget", "simple_recycle:steel_nugget"}
	   }
	})

	minetest.register_craft({
	   output = "default:bronze_ingot",
	   recipe = {
	      {"simple_recycle:bronze_nugget", "simple_recycle:bronze_nugget", "simple_recycle:bronze_nugget"},
	      {"simple_recycle:bronze_nugget", "simple_recycle:bronze_nugget", "simple_recycle:bronze_nugget"},
	      {"simple_recycle:bronze_nugget", "simple_recycle:bronze_nugget", "simple_recycle:bronze_nugget"}
	   }
	})

	minetest.register_craft({
	   output = "default:gold_ingot",
	   recipe = {
	      {"simple_recycle:gold_nugget", "simple_recycle:gold_nugget", "simple_recycle:gold_nugget"},
	      {"simple_recycle:gold_nugget", "simple_recycle:gold_nugget", "simple_recycle:gold_nugget"},
	      {"simple_recycle:gold_nugget", "simple_recycle:gold_nugget", "simple_recycle:gold_nugget"}
	   }
	})

	minetest.register_craft({
	   output = "default:tin_ingot",
	   recipe = {
	      {"simple_recycle:tin_nugget", "simple_recycle:tin_nugget", "simple_recycle:tin_nugget"},
	      {"simple_recycle:tin_nugget", "simple_recycle:tin_nugget", "simple_recycle:tin_nugget"},
	      {"simple_recycle:tin_nugget", "simple_recycle:tin_nugget", "simple_recycle:tin_nugget"}
	   }
	})

	minetest.register_craft({
	   output = "default:copper_ingot",
	   recipe = {
	      {"simple_recycle:copper_nugget", "simple_recycle:copper_nugget", "simple_recycle:copper_nugget"},
	      {"simple_recycle:copper_nugget", "simple_recycle:copper_nugget", "simple_recycle:copper_nugget"},
	      {"simple_recycle:copper_nugget", "simple_recycle:copper_nugget", "simple_recycle:copper_nugget"}
	   }
	})

	minetest.register_craft({
	   output = "default:bronze_ingot",
	   recipe = {
	      {"simple_recycle:copper_nugget", "simple_recycle:copper_nugget", "simple_recycle:copper_nugget"},
	      {"simple_recycle:copper_nugget", "simple_recycle:tin_nugget", "simple_recycle:copper_nugget"},
	      {"simple_recycle:copper_nugget", "simple_recycle:copper_nugget", "simple_recycle:copper_nugget"}
	   }
	})
end
